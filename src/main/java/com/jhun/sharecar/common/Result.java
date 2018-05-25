package com.jhun.sharecar.common;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;

/**
 * controller当中返回json数据时的通用结构。
 *
 * @author chencong
 * @date 2018/5/16 12:47
 */
@JsonSerialize(include = JsonSerialize.Inclusion.NON_DEFAULT)
public class Result<T> {

    private Integer code;
    private String msg;
    private T data;

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public Result(Integer code, String msg, T data) {
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    public Result(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public Result(Integer code, T data) {
        this.code = code;
        this.data = data;
    }

    public Result() {
    }
}
