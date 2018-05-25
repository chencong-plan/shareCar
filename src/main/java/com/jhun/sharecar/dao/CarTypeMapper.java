package com.jhun.sharecar.dao;

import com.jhun.sharecar.pojo.CarType;

import java.util.List;

/**
 * @author chencong
 * @date 2018/5/16 21:48
 */


public interface CarTypeMapper {
    List<CarType> selectCarType();

    CarType selectCarTypeById(Integer id);

}
