package com.jhun.sharecar.service;

import com.jhun.sharecar.common.Result;
import com.jhun.sharecar.pojo.Order;
import com.jhun.sharecar.pojo.User; /**
 * @author chencong
 * @date 2018/5/25 10:23
 */
public interface IOrderService {
    Result addOrder(Order order, Integer carId,String name, User user);

    Result getOrderList(Integer pageNum, Integer pageSize, String orderNumber,Integer userId);

    int updateOrderStatus(String orderNumber, Integer userId, Integer orderStatus);
}
