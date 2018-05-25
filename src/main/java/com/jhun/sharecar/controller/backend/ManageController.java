package com.jhun.sharecar.controller.backend;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author chencong
 * @date 2018/5/18 21:14
 */

@Controller
@RequestMapping("/manage")
public class ManageController {


    @RequestMapping({"/index",""})
    public String manage(Model model){
        return "manage/index";
    }



}
