package com.jhun.sharecar.controller.backend;

import com.jhun.sharecar.common.Const;
import com.jhun.sharecar.common.Result;
import com.jhun.sharecar.pojo.User;
import com.jhun.sharecar.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


/**
 * 用户管理模块
 *
 * @author chencong
 * @date 2018/5/18 21:41
 */
@Controller
@RequestMapping("/manage")
public class UserManageController {

    @Autowired
    private IUserService iUserService;

    @RequestMapping("/user")
    public String userList(Model model) {
        return "manage/userManage";
    }

    @RequestMapping("/admin")
    public String toAdmin(Model model) {
        return "manage/adminAddManage";
    }

    /**
     * 加载管理员信息
     *
     * @param pageNum
     * @param pageSize
     * @return
     */
    @RequestMapping("/list")
    @ResponseBody
    public Result list(
            @RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
            @RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize,
            @RequestParam(value = "role") int role,
            @RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
            @RequestParam(value = "type", required = false, defaultValue = "username") String type) {
        Result userList = iUserService.getUserList(role, pageNum, pageSize, keyword,type);
        return userList;
    }

    /**
     * 跟新密码，切换成默认密码123456
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/reset", method = RequestMethod.POST)
    @ResponseBody
    public Result resetPassword(int id) {
        int count = iUserService.resetPassword(id, Const.UserStatus.ADMIN);
        if (count > 0) {
            return new Result(Const.ResponseCode.SUCCESS, "更新密码成功");
        } else {
            return new Result(Const.ResponseCode.ERROR, "更新密码失败");
        }
    }

    /**
     * 新增管理员信息
     *
     * @param user
     * @return
     */
    @RequestMapping("/add")
    @ResponseBody
    public Result addAdmin(User user) {
        int count = iUserService.addAdmin(user);
        if (count > 0) {
            return new Result(Const.ResponseCode.SUCCESS, "新增成功");
        } else {
            return new Result(Const.ResponseCode.ERROR, "新增失败");
        }
    }

    @RequestMapping("/del/{id}")
    @ResponseBody
    public Result del(@PathVariable("id") int id) {
        int count = iUserService.delUser(id, Const.UserStatus.ADMIN);
        if (count > 0) {
            return new Result(Const.ResponseCode.SUCCESS, "删除成功");
        } else {
            return new Result(Const.ResponseCode.ERROR, "删除失败");
        }
    }


}
