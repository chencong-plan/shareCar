package com.jhun.sharecar.pojo;

import java.math.BigDecimal;

/**
 * @author chencong
 * @date 2018/5/16 21:36
 */
public class CarType {

    private Integer id;
    private String carType;
    private BigDecimal price;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCarType() {
        return carType;
    }

    public void setCarType(String carType) {
        this.carType = carType;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public CarType(Integer id, String carType, BigDecimal price) {
        this.id = id;
        this.carType = carType;
        this.price = price;
    }

    public CarType() {
    }
}
