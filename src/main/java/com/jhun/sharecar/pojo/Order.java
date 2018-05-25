package com.jhun.sharecar.pojo;

import java.math.BigDecimal;
import java.util.Date;

/**
 * @author chencong
 * @date 2018/5/16 21:37
 */
public class Order {

    private Integer id;
    private Integer userId;
    private String orderNumber;
    private String carType;
    private Date orderTime;
    private BigDecimal realPay;
    private BigDecimal prePay;
    private String orderPlace;
    private String returnPlace;
    private String orderStatus;
    private Date createTime;
    private Date endTime;

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

    public String getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber;
    }

    public String getCarType() {
        return carType;
    }

    public void setCarType(String carType) {
        this.carType = carType;
    }

    public Date getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Date orderTime) {
        this.orderTime = orderTime;
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

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Order() {
    }

    public Order(Integer id, Integer userId, String orderNumber, String carType, Date orderTime, BigDecimal realPay, BigDecimal prePay, String orderPlace, String returnPlace, String orderStatus, Date createTime, Date endTime) {
        this.id = id;
        this.userId = userId;
        this.orderNumber = orderNumber;
        this.carType = carType;
        this.orderTime = orderTime;
        this.realPay = realPay;
        this.prePay = prePay;
        this.orderPlace = orderPlace;
        this.returnPlace = returnPlace;
        this.orderStatus = orderStatus;
        this.createTime = createTime;
        this.endTime = endTime;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", userId=" + userId +
                ", orderNumber='" + orderNumber + '\'' +
                ", carType='" + carType + '\'' +
                ", orderTime=" + orderTime +
                ", realPay=" + realPay +
                ", prePay=" + prePay +
                ", orderPlace='" + orderPlace + '\'' +
                ", returnPlace='" + returnPlace + '\'' +
                ", orderStatus='" + orderStatus + '\'' +
                ", createTime=" + createTime +
                ", endTime=" + endTime +
                '}';
    }
}
