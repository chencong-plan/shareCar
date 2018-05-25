package com.jhun.sharecar.dao;

import com.jhun.sharecar.pojo.Car;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author chencong
 * @date 2018/5/16 21:48
 */
public interface CarMapper {
    int insertCar(Car car);

    List<Car> selectCar(@Param("keyword") String keyword, @Param("type") String type, @Param("status") String status, @Param("orderBy") String orderBy);

    List<Car> selectCarByStatus(int status);

    int updateCarStatus(@Param("id") int id, @Param("status") int status);

    Car selectCarById(int id);
}
