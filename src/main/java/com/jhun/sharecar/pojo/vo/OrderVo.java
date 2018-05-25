package com.jhun.sharecar.pojo.vo;

import java.math.BigDecimal;
import java.util.List;

/**
 * 订单vo
 *
 * @author chencong
 * @date 2018/5/25 14:50
 */
public class OrderVo {

    /**
     * 订单
     */
    private Integer id;
    private Integer userId;
    private String realName;
    private String orderNumber;
    private BigDecimal realPay;
    private BigDecimal prePay;
    private String orderPlace;
    private String returnPlace;
    private String orderStatus;
    private String orderTime;
    private String endTime;

    /**
     * 订单详情
     */
    private List<OrderItemVo> orderItemVoList;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber;
    }

    public BigDecimal getRealPay() {
        return realPay;
    }

    public void setRealPay(BigDecimal realPay) {
        this.realPay = realPay;
    }

    public BigDecimal getPrePay() {
        return prePay;
    }

    public void setPrePay(BigDecimal prePay) {
        this.prePay = prePay;
    }

    public String getOrderPlace() {
        return orderPlace;
    }

    public void setOrderPlace(String orderPlace) {
        this.orderPlace = orderPlace;
    }

    public String getReturnPlace() {
        return returnPlace;
    }

    public void setReturnPlace(String returnPlace) {
        this.returnPlace = returnPlace;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public String getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(String orderTime) {
        this.orderTime = orderTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public List<OrderItemVo> getOrderItemVoList() {
        return orderItemVoList;
    }

    public void setOrderItemVoList(List<OrderItemVo> orderItemVoList) {
        this.orderItemVoList = orderItemVoList;
    }

    public OrderVo(Integer id, Integer userId, String realName, String orderNumber, BigDecimal realPay, BigDecimal prePay, String orderPlace, String returnPlace, String orderStatus, String orderTime, String endTime, List<OrderItemVo> orderItemVoList) {
        this.id = id;
        this.userId = userId;
        this.realName = realName;
        this.orderNumber = orderNumber;
        this.realPay = realPay;
        this.prePay = prePay;
        this.orderPlace = orderPlace;
        this.returnPlace = returnPlace;
        this.orderStatus = orderStatus;
        this.orderTime = orderTime;
        this.endTime = endTime;
        this.orderItemVoList = orderItemVoList;
    }

    public OrderVo() {
    }
}
