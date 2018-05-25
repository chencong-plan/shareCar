package com.jhun.sharecar.pojo;

import java.math.BigDecimal;

/**
 * @author chencong
 * @date 2018/5/16 21:41
 */
public class OrderItem {

    private Integer id;
    private String orderNumber;
    private Integer carId;
    private String type;
    private String name;
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

    public Integer getCarId() {
        return carId;
    }

    public void setCarId(Integer carId) {
        this.carId = carId;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public OrderItem() {
    }

    public OrderItem(Integer id, String orderNumber, Integer carId, String type, String name, BigDecimal pay, String orderPlace, String returnPlace) {
        this.id = id;
        this.orderNumber = orderNumber;
        this.carId = carId;
        this.type = type;
        this.name = name;
        this.pay = pay;
        this.orderPlace = orderPlace;
        this.returnPlace = returnPlace;
    }

    @Override
    public String toString() {
        return "OrderItem{" +
                "id=" + id +
                ", orderNumber='" + orderNumber + '\'' +
                ", carId=" + carId +
                ", type='" + type + '\'' +
                ", name='" + name + '\'' +
                ", pay=" + pay +
                ", orderPlace='" + orderPlace + '\'' +
                ", returnPlace='" + returnPlace + '\'' +
                '}';
    }
}
