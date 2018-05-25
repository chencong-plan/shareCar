package com.jhun.sharecar.controller.backend;

import com.jhun.sharecar.common.Const;
import com.jhun.sharecar.pojo.Car;
import com.jhun.sharecar.pojo.vo.CarVo;
import com.jhun.sharecar.service.ICarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * @author chencong
 * @date 2018/5/17 22:39
 */
@Controller
public class MainController {


    @Autowired
    private ICarService iCarService;

    @RequestMapping({"/", "index"})
    public String main(@RequestParam(value = "page", required = false, defaultValue = "1") int pageNum,
                       @RequestParam(value = "pageSize", required = false, defaultValue = "20") int pageSize,
                       Model model) {

        List<CarVo> carVoList = iCarService.getCarList(pageNum, pageSize, Const.CarStatus.ON_LINE.getCode());
        model.addAttribute("carVoList", carVoList);
        return "menu";
    }

}
