package com.jhun.sharecar.controller;

import com.jhun.sharecar.common.Const;
import com.jhun.sharecar.common.Result;
import com.jhun.sharecar.pojo.User;
import com.jhun.sharecar.service.IUserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

/**
 * @author chencong
 * @date 2018/5/16 12:45
 */

@Controller
@RequestMapping("/user")
public class UserController {


    @Autowired
    private IUserService iUserService;


    @RequestMapping("/login")
    public String toLogin() {
        return "login";
    }

    @RequestMapping("/login2")
    public String toLogin2() {
        return "login2";
    }

    @RequestMapping("register")
    public String toRegister() {
        return "register";
    }

    /**
     * 检查字段是否存在于库中<br>
     * type:username,表示检查用户名是否存在<br>
     * type:phone ,表示电话号码phone是否存在 <br>
     * type:email 表示邮箱email是否存在 <br>
     *
     * @param msg  受检查的字段
     * @param type 该字段类型
     * @return 返回json
     */
    @RequestMapping("/check_validate")
    @ResponseBody
    public Result checkUsername(
            @RequestParam(name = "msg") String msg,
            @RequestParam(name = "type") String type) {
        Result result;
        if (StringUtils.isBlank(msg) || StringUtils.isBlank(type)) {
            return new Result(Const.ResponseCode.ERROR, "参数异常");
        }
        int count = iUserService.check(msg, type);
        /*判断受检查的属性是否存在*/
        if (count > 0) {
            result = new Result(Const.ResponseCode.ERROR, msg + "已存在");
        } else {
            result = new Result(Const.ResponseCode.SUCCESS, msg + "可以使用");
        }
        return result;

    }

    @RequestMapping(value = "/doRegister", method = RequestMethod.GET)
    @ResponseBody
    public Result doRegister(User user) {
        Result result;
        if (user == null) {
            return new Result(Const.ResponseCode.ERROR, "参数错误,请求错误");
        }
        int count = iUserService.register(user);
        if (count > 0) {
            result = new Result(Const.ResponseCode.SUCCESS, "注册成功");
        } else {
            result = new Result(Const.ResponseCode.ERROR, "注册失败");
        }
        return result;
    }

    @RequestMapping("/doLogin")
    public String login(String username, String password, Integer role, String checkcode, Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        String picCode = (String) session.getAttribute(Const.PIC_CODE);
        if (!picCode.equalsIgnoreCase(checkcode)) {
            model.addAttribute("msg", "验证码错误");
            return "login";
        }
        /*登录成功，将用户信息放入session*/
        User user = iUserService.login(username, password, role);
        if (user == null) {
            model.addAttribute("msg", "用户名或密码错误");
            return "login";
        }
        session.setAttribute(Const.CURRENT_USER, user);
        /*放入session成功，跳转到menu主页面*/
        return "redirect:/";
    }


    @RequestMapping("/logout")
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.removeAttribute(Const.CURRENT_USER);
        return "redirect:login";
    }

    @RequestMapping("/register2")
    public String register2() {
        return "register2";
    }


    /**
     * /user/后面接上正确的userId 用户存在
     *
     * @param userId
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("{userId}")
    public String userInfo(@PathVariable("userId") Integer userId, HttpServletRequest request, Model model) {
        /*用户未登录，无法请求个人中心*/
        User currentUser = (User) request.getSession().getAttribute(Const.CURRENT_USER);
        if (currentUser == null) {
            return "redirect:/index";
        }
        /*访问用户存在*/
        User user = iUserService.getUserById(userId);
        if (user == null) {
            return "redirect:/index";
        }
        /*用户登录，访问其他人个人中心时 需要进行拦截*/
        if (!user.getId().equals(currentUser.getId())) {
            return "redirect:/index";
        }
        model.addAttribute("user", user);
        return "userInfo";
    }

    /**
     * 如果/user/后面没有接上userId或者userId错误都返回到首页
     *
     * @return
     */
    @RequestMapping({"/", ""})
    public String goHone() {
        return "redirect:/index";
    }

    @RequestMapping("/checkPassword")
    @ResponseBody
    public Result checkPayPassword(HttpServletRequest request, String password) {
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute(Const.CURRENT_USER);
        if (currentUser == null) {
            return new Result(Const.ResponseCode.NEED_LOGIN, "用户未登录");
        }
        if (!(currentUser.getPassword()).equals(password)) {
            return new Result(Const.ResponseCode.ERROR, "支付密码错误");
        }
        return new Result(Const.ResponseCode.SUCCESS, "支付密码校验成功");
    }

    @RequestMapping("/code")
    public void getCode(HttpServletRequest request, HttpServletResponse response) {
        BufferedImage bi = new BufferedImage(68, 20, 1);
        Graphics g = bi.getGraphics();
        Color c = new Color(200, 150, 255);
        g.setColor(c);
        g.fillRect(0, 0, 68, 20);
        char[] ch = "qwertyuipasdfghjkzxcvbnmABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".toCharArray();
        Random r = new Random();
        int len = ch.length, index;
        StringBuffer sb = new StringBuffer();
        String code = null;
        for (int i = 0; i < 4; i++) {
            index = r.nextInt(len);
            g.setColor(new Color(r.nextInt(88), r.nextInt(188), r.nextInt(255)));
            g.drawString(ch[index] + "", (i * 15) + 3, 18);
            code = code + ch[index];
            g.setFont(new Font("宋体", 2, 18));
            sb.append(ch[index]);
        }
        g.drawLine(r.nextInt(20), r.nextInt(10), r.nextInt(100) + 2, r.nextInt(80) - 3);
        g.drawLine(r.nextInt(50), r.nextInt(10), r.nextInt(20) + 2, r.nextInt(40) - 3);
        request.getSession().setAttribute(Const.PIC_CODE, sb.toString());
        try {
            ImageIO.write(bi, "JPG", response.getOutputStream());
        } catch (IOException e) {
            e.printStackTrace();
        }

    }


}
