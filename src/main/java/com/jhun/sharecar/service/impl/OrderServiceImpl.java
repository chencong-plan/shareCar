package com.jhun.sharecar.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jhun.sharecar.common.Const;
import com.jhun.sharecar.common.Result;
import com.jhun.sharecar.dao.*;
import com.jhun.sharecar.pojo.*;
import com.jhun.sharecar.pojo.vo.OrderItemVo;
import com.jhun.sharecar.pojo.vo.OrderVo;
import com.jhun.sharecar.service.IOrderService;
import com.jhun.sharecar.util.DateTimeUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

/**
 * @author chencong
 * @date 2018/5/25 10:23
 */
@Service
public class OrderServiceImpl implements IOrderService {

    @Autowired
    private OrderMapper orderMapper;

    @Autowired
    private CarMapper carMapper;

    @Autowired
    private CarTypeMapper carTypeMapper;

    @Autowired
    private OrderItemMapper orderItemMapper;

    @Autowired
    private UserMapper userMapper;


    @Override
    public Result addOrder(Order order, Integer carId, String name, User user) {
        Order orderResult = assertOrder(order, carId);
        OrderItem orderItemResult = assertOrderItem(order, carId, name);
        int orderCount = orderMapper.insertOrder(orderResult);
        int orderItemCount = orderItemMapper.insertOrderItem(orderItemResult);
        if (orderCount > 0 && orderItemCount > 0) {
            return new Result<>(Const.ResponseCode.SUCCESS, "下单成功", user);
        }
        return new Result(Const.ResponseCode.ERROR, "下单失败");
    }


    /**
     * 如果订单编号不能为空则通过订单编号查询<br>
     * 如果订单编号为空，则查询所有订单，并分页
     *
     * @param pageNum
     * @param pageSize
     * @param orderNum
     * @return
     */
    @Override
    public Result getOrderList(Integer pageNum, Integer pageSize, String orderNumber) {
        PageHelper.startPage(pageNum, pageSize);
        List<Order> orderList = orderMapper.selectOrderList(orderNumber);
        List<OrderVo> orderVoList = assertOrderVo(orderList);
        PageInfo pageResult = new PageInfo<>(orderList);
        pageResult.setList(orderVoList);
        return  new Result<>(Const.ResponseCode.SUCCESS,"查询成功",pageResult);
    }

    /**
     * 拼接orderVoList
     *
     * @param orderList
     * @return
     */
    private List<OrderVo> assertOrderVo(List<Order> orderList) {
        List<OrderVo> orderVoList = new ArrayList<>();
        for (Order order : orderList) {
            OrderVo orderVo = new OrderVo();

            orderVo.setId(order.getId());
            orderVo.setUserId(order.getUserId());
            User user = userMapper.selectById(order.getUserId());
            orderVo.setRealName(user.getRealName());
            orderVo.setOrderNumber(order.getOrderNumber());
            orderVo.setRealPay(order.getRealPay());
            orderVo.setPrePay(order.getPrePay());
            orderVo.setOrderPlace(order.getOrderPlace());
            orderVo.setReturnPlace(order.getReturnPlace());
            orderVo.setOrderTime(DateTimeUtil.dateToStr(order.getOrderTime()));
            orderVo.setEndTime(DateTimeUtil.dateToStr(order.getEndTime()));
            /*订单状态*/
            orderVo.setOrderStatus(assertOrderStatus(order.getOrderStatus()));

            /*订单项*/
            orderVo.setOrderItemVoList(assertOrderItemVo(order.getOrderNumber()));

            /*放入list*/
            orderVoList.add(orderVo);
        }
        return orderVoList;
    }

    /**
     * 根据订单编号查询该订单下所有的订单项，并且组装成orderItemVo
     *
     * @param orderNumber
     * @return
     */
    private List<OrderItemVo> assertOrderItemVo(String orderNumber) {
        List<OrderItem> orderItemList = orderItemMapper.selectOrderItemByOrderNumber(orderNumber);
        List<OrderItemVo> orderItemVoList = new ArrayList<>();
        for (OrderItem orderItem : orderItemList) {
            OrderItemVo orderItemVo = new OrderItemVo();
            orderItemVo.setId(orderItem.getId());
            orderItemVo.setCarName(orderItem.getName());
            orderItemVo.setCarType(orderItem.getType());
            orderItemVo.setPay(orderItem.getPay());
            orderItemVo.setOrderNumber(orderNumber);
            orderItemVo.setOrderPlace(orderItem.getOrderPlace());
            orderItemVo.setReturnPlace(orderItem.getReturnPlace());

            orderItemVoList.add(orderItemVo);
        }
        return orderItemVoList;
    }

    /**
     * 根据订单状态码，定义订单状态码所属含义
     *
     * @param param
     * @return
     */
    private String assertOrderStatus(String param) {
        String result = null;
        Integer code = null;
        if (StringUtils.isBlank(param)) {
            result = "订单状态码异常";
        }
        try {
            code = Integer.parseInt(param);
        } catch (NumberFormatException e) {
            result = "订单状态码异常";
        }
        if (Const.OrderStatus.PAY.getCode() == code) {
            result = Const.OrderStatus.PAY.getMsg();
        } else if (Const.OrderStatus.NO_PAY.getCode() == code) {
            result = Const.OrderStatus.NO_PAY.getMsg();
        } else if (Const.OrderStatus.NORMAL.getCode() == code) {
            result = Const.OrderStatus.NORMAL.getMsg();
        } else if (Const.OrderStatus.ABNORMAL.getCode() == code) {
            result = Const.OrderStatus.ABNORMAL.getMsg();
        } else {
            result = "订单状态码异常";
        }
        return result;
    }


    /**
     * 根据订单编号orderNumber生成响应的订单详情
     *
     * @param order 订单
     * @param carId 汽车编号
     * @param name  汽车名称
     * @return 返回订单详情
     */
    private OrderItem assertOrderItem(Order order, int carId, String name) {
        OrderItem orderItem = new OrderItem();
        orderItem.setOrderNumber(order.getOrderNumber());
        orderItem.setCarId(carId);
        orderItem.setType(order.getCarType());
        orderItem.setName(name);
        orderItem.setPay(order.getPrePay());
        orderItem.setOrderPlace(order.getOrderPlace());
        orderItem.setReturnPlace(order.getReturnPlace());
        return orderItem;
    }

    /**
     * 组装一个将要生成的订单，包括订单编号，订单时间等信息
     *
     * @param order
     * @return
     */
    private Order assertOrder(Order order, int carId) {
        Car car = carMapper.selectCarById(carId);
        CarType carType = carTypeMapper.selectCarTypeById(car.getCarTypeId());
        order.setCarType(carType.getCarType());
        order.setOrderNumber(generateOrderNo() + "");
        order.setOrderStatus(Const.OrderStatus.NORMAL.getCode() + "");
        return order;
    }

    private long generateOrderNo() {
        long currentTime = System.currentTimeMillis();
        return currentTime + new Random().nextInt(100);
    }
}
