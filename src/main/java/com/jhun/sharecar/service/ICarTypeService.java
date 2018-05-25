package com.jhun.sharecar.service;

import com.jhun.sharecar.common.Result;
import com.jhun.sharecar.pojo.CarType;

/**
 * @author chencong
 * @date 2018/5/22 16:53
 * 汽车类别
 */
public interface ICarTypeService {

    Result getCarTypeList(int pageNum, int PageSize);

    /**
     *
     * @param carId
     * @return
     */
    CarType getCarTypeById(int carId);
}
