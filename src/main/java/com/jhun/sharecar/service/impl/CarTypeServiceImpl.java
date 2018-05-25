package com.jhun.sharecar.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jhun.sharecar.common.Const;
import com.jhun.sharecar.common.Result;
import com.jhun.sharecar.dao.CarMapper;
import com.jhun.sharecar.dao.CarTypeMapper;
import com.jhun.sharecar.pojo.Car;
import com.jhun.sharecar.pojo.CarType;
import com.jhun.sharecar.service.ICarTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author chencong
 * @date 2018/5/22 16:54
 */

@Service
public class CarTypeServiceImpl implements ICarTypeService {

    @Autowired
    private CarTypeMapper carTypeMapper;

    @Autowired
    private CarMapper carMapper;

    @Override
    public Result getCarTypeList(int pageNum, int PageSize) {
        PageHelper.offsetPage(pageNum, PageSize);
        List<CarType> carTypeList = carTypeMapper.selectCarType();
        PageInfo<CarType> pageResult = new PageInfo<>(carTypeList);
        pageResult.setList(carTypeList);
        return new Result<>(Const.ResponseCode.SUCCESS, "请求成功", pageResult);
    }

    @Override
    public CarType getCarTypeById(int carId) {
        Car car = carMapper.selectCarById(carId);
        if (car == null){
            return  null;
        }
        CarType carType = carTypeMapper.selectCarTypeById(car.getCarTypeId());
        return carType;
    }
}
