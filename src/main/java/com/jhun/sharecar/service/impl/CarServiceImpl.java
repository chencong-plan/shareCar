package com.jhun.sharecar.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jhun.sharecar.common.Const;
import com.jhun.sharecar.common.Result;
import com.jhun.sharecar.dao.CarMapper;
import com.jhun.sharecar.dao.CarTypeMapper;
import com.jhun.sharecar.pojo.Car;
import com.jhun.sharecar.pojo.CarType;
import com.jhun.sharecar.pojo.vo.CarVo;
import com.jhun.sharecar.service.ICarService;
import com.jhun.sharecar.util.DateTimeUtil;
import com.jhun.sharecar.util.PropertiesUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @author chencong
 * @date 2018/5/22 19:27
 */
@Service
public class CarServiceImpl implements ICarService {


    @Autowired
    private CarMapper carMapper;

    @Autowired
    private CarTypeMapper carTypeMapper;

    @Override
    public int addCar(Car car) {
        car.setStatus(Const.CarStatus.ON_LINE.getCode());
        return carMapper.insertCar(car);
    }

    @Override
    public Result selectCarList(int pageNum, int pageSize, String keyword, String type, String status, String orderBy) {
        PageHelper.startPage(pageNum, pageSize);
        List<Car> carList = carMapper.selectCar(keyword, type, status, orderBy);
        List<CarVo> carVoList = assertCarVo(carList);
        PageInfo pageResult = new PageInfo<>(carList);
        pageResult.setList(carVoList);
        return new Result<>(Const.ResponseCode.SUCCESS, "查询成功", pageResult);
    }

    @Override
    public List<CarVo> getCarList(int pageNum, int pageSize, int status) {
        PageHelper.startPage(pageNum, pageSize);
        List<Car> carList = carMapper.selectCarByStatus(status);
        List<CarVo> carVoList = assertCarVo(carList);
        return carVoList;
    }

    @Override
    public int updateCarStatus(int id, int status) {
        return carMapper.updateCarStatus(id, status);
    }

    @Override
    public CarVo getCarById(int id) {
        Car car = carMapper.selectCarById(id);
        return this.assertCar(car);
    }


    /**
     * 拼接单个carVo
     *
     * @param car
     * @return
     */
    private CarVo assertCar(Car car) {
        String imageHost = PropertiesUtil.getProperty("image_host", "www.lqh.com");
        CarVo carVo = new CarVo();
        carVo.setId(car.getId());
        carVo.setName(car.getName());
        CarType carType = carTypeMapper.selectCarTypeById(car.getCarTypeId());
        carVo.setCarType(carType.getCarType());
        carVo.setProductName(car.getProductName());
        carVo.setImageUrl(car.getImageUrl());
        carVo.setOperation(car.getOperation());
        if (Const.CarStatus.ON_LINE.getCode() == car.getStatus()) {
            carVo.setStatus(Const.CarStatus.ON_LINE.getValue());
        } else if (Const.CarStatus.DOWN_LINE.getCode() == car.getStatus()) {
            carVo.setStatus(Const.CarStatus.DOWN_LINE.getValue());
        } else {
            carVo.setStatus(Const.CarStatus.UN_KNOWN.getValue());
        }
        carVo.setImageHost(imageHost);
        carVo.setPay(car.getPay());
        carVo.setCreateTime(DateTimeUtil.dateToStr(car.getCreateTime(), "yyyy-MM-dd HH:mm"));
        return carVo;
    }

    /**
     * 由carList 组装成 carVoList
     *
     * @param carList
     * @return
     */
    private List<CarVo> assertCarVo(List<Car> carList) {
        String imageHost = PropertiesUtil.getProperty("image_host", "www.lqh.com");
        List<CarVo> carVoList = new ArrayList<>();
        for (Car car : carList) {
            CarVo carVo = assertCar(car);
            carVoList.add(carVo);
        }
        return carVoList;
    }
}
