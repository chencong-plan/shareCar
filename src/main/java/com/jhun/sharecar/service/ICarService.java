package com.jhun.sharecar.service;

import com.jhun.sharecar.common.Result;
import com.jhun.sharecar.pojo.Car;
import com.jhun.sharecar.pojo.vo.CarVo;

import java.util.List;

/**
 * @author chencong
 * @date 2018/5/22 19:27
 */
public interface ICarService {

    int addCar(Car car);

    Result selectCarList(int pageNum, int pageSize, String keyword, String type, String status,String orderBy);

    List<CarVo> getCarList(int pageNum,int pageSize,int status);

    int updateCarStatus(int id, int status);

    CarVo getCarById(int id);
}
