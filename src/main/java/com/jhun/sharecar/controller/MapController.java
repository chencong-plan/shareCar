package com.jhun.sharecar.controller;

import com.jhun.sharecar.common.Const;
import com.jhun.sharecar.common.Result;
import com.jhun.sharecar.util.CusAccessObjectUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * @author chencong
 * @date 2018/5/23 21:37
 */
@Controller
@RequestMapping("/map")
public class MapController {

    @RequestMapping("/ip")
    @ResponseBody
    public Result<String> getIp(HttpServletRequest request){
        return new Result<>(Const.ResponseCode.SUCCESS,"请求成功", CusAccessObjectUtil.getIpAddress(request));
    }

    @RequestMapping("/index")
    public String  index (){
        return "map/index";
    }
}
