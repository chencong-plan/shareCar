package com.jhun.sharecar.controller;

import com.jhun.sharecar.common.Const;
import com.jhun.sharecar.common.Result;
import com.jhun.sharecar.pojo.CarType;
import com.jhun.sharecar.pojo.Order;
import com.jhun.sharecar.pojo.User;
import com.jhun.sharecar.pojo.vo.CarVo;
import com.jhun.sharecar.service.ICarService;
import com.jhun.sharecar.service.ICarTypeService;
import com.jhun.sharecar.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;


/**
 * @author chencong
 * @date 2018/5/23 11:48
 */

@Controller
@RequestMapping("/orderCar")
public class OrderCarController {

    @Autowired
    private ICarService iCarService;

    @Autowired
    private ICarTypeService iCarTypeService;


    @Autowired
    private IOrderService iOrderService;

    @RequestMapping({"", "/"})
    public String goHome(Model model) {
        return "redirect:/index";
    }

    @RequestMapping("{id}")
    public String carInfo(@PathVariable("id") int id, Model model) {
        CarVo carVo = iCarService.getCarById(id);
        if (carVo == null) {
            return "redirect:/index";
        }
        /*这里的id是汽车id，通过汽车id去找汽车 然后 通过汽车找所属cartype*/
        CarType carType = iCarTypeService.getCarTypeById(id);
        model.addAttribute("carType", carType);
        model.addAttribute("carVo", carVo);
        return "ordercar";
    }


    @RequestMapping("/add")
    @ResponseBody
    public Result addCar(Order order,Integer carId,String name, HttpServletRequest request) {
        User currentUser = (User) request.getSession().getAttribute(Const.CURRENT_USER);
        if (currentUser == null) {
            return new Result(Const.ResponseCode.NEED_LOGIN, "用户未登录");
        }
        order.setUserId(currentUser.getId());
//        System.out.println(order);
//        System.out.println(carId);
        Result result = iOrderService.addOrder(order,carId,name,currentUser);
        return result;
    }

    @RequestMapping("/list")
    @ResponseBody
    public Result list(
            @RequestParam(value = "orderNumber",required = false,defaultValue = "") String orderNumber,
            @RequestParam(value = "pageNum",required = false,defaultValue = "1")Integer pageNum,
            @RequestParam(value = "pageSize",required = false,defaultValue = "10") Integer pageSize){
        Result result = iOrderService.getOrderList(pageNum,pageSize, orderNumber);
        return result;

    }


}
