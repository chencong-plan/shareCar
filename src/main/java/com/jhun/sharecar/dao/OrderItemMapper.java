package com.jhun.sharecar.dao;

import com.jhun.sharecar.pojo.OrderItem;

import java.util.List;

/**
 * @author chencong
 * @date 2018/5/16 21:47
 */
public interface OrderItemMapper {
    int insertOrderItem(OrderItem orderItemResult);

    List<OrderItem> selectOrderItemByOrderNumber(String orderNumber);
}
