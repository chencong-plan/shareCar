package com.jhun.sharecar.pojo.vo;

import java.math.BigDecimal;

/**
 * 订单详情vo
 * @author chencong
 * @date 2018/5/25 14:54
 */
public class OrderItemVo {

    private Integer id;
    private String orderNumber;
    private String carName;
    private String carType;
    private BigDecimal pay;
    private String orderPlace;
    private String returnPlace;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber;
    }

    public String getCarName() {
        return carName;
    }

    public void setCarName(String carName) {
        this.carName = carName;
    }

    public String getCarType() {
        return carType;
    }

    public void setCarType(String carType) {
        this.carType = carType;
    }

    public BigDecimal getPay() {
        return pay;
    }

    public void setPay(BigDecimal pay) {
        this.pay = pay;
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

    public OrderItemVo() {
    }

    public OrderItemVo(Integer id, String orderNumber, String carName, String carType, BigDecimal pay, String orderPlace, String returnPlace) {
        this.id = id;
        this.orderNumber = orderNumber;
        this.carName = carName;
        this.carType = carType;
        this.pay = pay;
        this.orderPlace = orderPlace;
        this.returnPlace = returnPlace;
    }
}
