package com.jhun.sharecar.controller.backend;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author chencong
 * @date 2018/5/19 10:02
 */

@Controller
@RequestMapping("/manage")
public class OrderController {

    @RequestMapping("/order")
    public String order(Model model) {
        return "manage/orderManage";
    }
}
