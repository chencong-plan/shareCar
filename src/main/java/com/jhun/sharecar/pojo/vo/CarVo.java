package com.jhun.sharecar.pojo.vo;

import java.math.BigDecimal;

/**
 * @author chencong
 * @date 2018/5/22 21:47
 */
public class CarVo {

    private Integer id;
    private String name;
    private String carType;
    private String productName;
    private String imageUrl;
    private String operation;
    private String status;
    private BigDecimal pay;
    private String createTime;

    private String imageHost;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCarType() {
        return carType;
    }

    public void setCarType(String carType) {
        this.carType = carType;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getOperation() {
        return operation;
    }

    public void setOperation(String operation) {
        this.operation = operation;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public BigDecimal getPay() {
        return pay;
    }

    public void setPay(BigDecimal pay) {
        this.pay = pay;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getImageHost() {
        return imageHost;
    }

    public void setImageHost(String imageHost) {
        this.imageHost = imageHost;
    }

    public CarVo(Integer id, String name, String carType, String productName, String imageUrl, String operation, String status, BigDecimal pay, String createTime, String imageHost) {
        this.id = id;
        this.name = name;
        this.carType = carType;
        this.productName = productName;
        this.imageUrl = imageUrl;
        this.operation = operation;
        this.status = status;
        this.pay = pay;
        this.createTime = createTime;
        this.imageHost = imageHost;
    }

    public CarVo() {
    }
}
