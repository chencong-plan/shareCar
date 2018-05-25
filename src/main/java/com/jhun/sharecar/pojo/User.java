package com.jhun.sharecar.pojo;

import java.util.Date;

/**
 * @author chencong
 * @date 2018/5/16 11:53
 */
public class User {
    private Integer id;
    private String username;
    private String password;
    private String phone;
    private String email;
    private Integer role;
    private String realName;
    private String gender;
    private Date born;
    private String idCard;
    private String driverCardType;
    private String homeAddress;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getRole() {
        return role;
    }

    public void setRole(Integer role) {
        this.role = role;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Date getBorn() {
        return born;
    }

    public void setBorn(Date born) {
        this.born = born;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public String getDriverCardType() {
        return driverCardType;
    }

    public void setDriverCardType(String driverCardType) {
        this.driverCardType = driverCardType;
    }

    public String getHomeAddress() {
        return homeAddress;
    }

    public void setHomeAddress(String homeAddress) {
        this.homeAddress = homeAddress;
    }

    public User() {
    }

    public User(Integer id, String username, String password, String phone, String email, Integer role, String realName, String gender, Date born, String idCard, String driverCardType, String homeAddress) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.phone = phone;
        this.email = email;
        this.role = role;
        this.realName = realName;
        this.gender = gender;
        this.born = born;
        this.idCard = idCard;
        this.driverCardType = driverCardType;
        this.homeAddress = homeAddress;
    }
}
