package com.jhun.sharecar.dao;

import com.jhun.sharecar.pojo.Order;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author chencong
 * @date 2018/5/16 21:48
 */
public interface OrderMapper {
    int insertOrder(Order orderResult);

    List<Order> selectOrderList(@Param("orderNumber") String orderNumber, @Param("userId") Integer userId);

    int updateOrderStatus(@Param("orderNumber") String orderNumber, @Param("userId") Integer userId, @Param("orderStatus") Integer orderStatus);
}
