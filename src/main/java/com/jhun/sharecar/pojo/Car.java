package com.jhun.sharecar.pojo;

import java.math.BigDecimal;
import java.util.Date;

/**
 * @author chencong
 * @date 2018/5/16 21:32
 */
public class Car {

    private Integer id;
    private Integer carTypeId;
    private String name;
    private String productName;
    private String imageUrl;
    private String operation;
    private Integer status;
    private BigDecimal pay;
    private Date createTime;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCarTypeId() {
        return carTypeId;
    }

    public void setCarTypeId(Integer carTypeId) {
        this.carTypeId = carTypeId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public BigDecimal getPay() {
        return pay;
    }

    public void setPay(BigDecimal pay) {
        this.pay = pay;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Car(Integer id, Integer carTypeId, String name, String productName, String imageUrl, String operation, Integer status, BigDecimal pay, Date createTime) {
        this.id = id;
        this.carTypeId = carTypeId;
        this.name = name;
        this.productName = productName;
        this.imageUrl = imageUrl;
        this.operation = operation;
        this.status = status;
        this.pay = pay;
        this.createTime = createTime;
    }

    public Car() {
    }
}
