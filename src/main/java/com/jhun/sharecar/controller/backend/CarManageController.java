package com.jhun.sharecar.controller.backend;

import com.jhun.sharecar.common.Const;
import com.jhun.sharecar.common.Result;
import com.jhun.sharecar.pojo.Car;
import com.jhun.sharecar.service.ICarService;
import com.jhun.sharecar.service.ICarTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author chencong
 * @date 2018/5/19 21:17
 */
@Controller
@RequestMapping("/manage/car")
public class CarManageController {


    @Autowired
    private ICarTypeService iCarTypeService;

    @Autowired
    private ICarService iCarService;

    @RequestMapping({"", "/"})
    public String index(Model model) {
        return "manage/carListManage";
    }

    @RequestMapping("/add")
    public String addCar(Model model) {
        return "manage/addCar";
    }

    @RequestMapping("/addCar")
    @ResponseBody
    public Result addCar(Car car) {
        int count = iCarService.addCar(car);
        if (count > 0) {
            return new Result(Const.ResponseCode.SUCCESS, "添加成功");
        } else {
            return new Result(Const.ResponseCode.ERROR, "添加失败");
        }
    }

    /**
     * 获取汽车列表
     *
     * @param pageNum  分页pageNum
     * @param pageSize 分页pageSize
     * @param keyword  搜索关键字
     * @param type     搜索类型，按照name.productName operation 搜索
     * @param status   汽车状态
     * @return 返回result
     */
    @RequestMapping("/list")
    @ResponseBody
    public Result carList(@RequestParam(name = "pageNum", required = false, defaultValue = "0") int pageNum,
                          @RequestParam(name = "pageSize", required = false, defaultValue = "10") int pageSize,
                          @RequestParam(name = "keyword", required = false, defaultValue = "") String keyword,
                          @RequestParam(name = "type", required = false, defaultValue = "name") String type,
                          @RequestParam(name = "status", required = false) String status,
                          @RequestParam(name = "orderBy", required = false, defaultValue = "price_desc") String orderBy) {
        Result result = iCarService.selectCarList(pageNum, pageSize, keyword, type, status, orderBy);
        return result;

    }

    @RequestMapping("/cartype/list")
    @ResponseBody
    public Result getCarType(@RequestParam(name = "pageNum", required = false, defaultValue = "0") int pageNum,
                             @RequestParam(name = "pageSize", required = false, defaultValue = "10") int pageSize) {
        return iCarTypeService.getCarTypeList(pageNum, pageSize);
    }


    @RequestMapping("/update")
    @ResponseBody
    public Result updateCarStatus(@RequestParam(name = "id") int id,
                                  @RequestParam(name = "status") int status) {
        int count = iCarService.updateCarStatus(id, status);
        if (count > 0) {
            return new Result(Const.ResponseCode.SUCCESS, "更新成功");
        } else {
            return new Result(Const.ResponseCode.ERROR, "更新失败");
        }
    }
}
