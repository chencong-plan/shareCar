/*
* Author:chencong
* Date:2018-5-18 17:18:45
* 工具类
* */

var util = {

    /**
     * 字段的验证，支持非空，手机，邮箱的判断
     * value:将要验证的字符串
     * type：验证的类型，是否为空，是否为手机号，是否为邮箱
     */
    validate: function (value, type) {
        var value = $.trim(value);
        //非空验证
        if ("require" === type) {
            return !!value;
        }
        //手机号验证
        if ("phone" === type) {
            return /^1\d{10}$/.test(value);
        }
        //邮箱验证
        if ("email" === type) {
            return /^(\w)+(\.\w+)*@(\w)+((\.\w{2,3}){1,3})$/.test(value);
        }
        /*身份证校验 出生日期1800-2099 6位地址编码+8位出生日期+3位顺序号+1位校验位*/
        if ("idCard" === type) {
            return /^\d{6}(18|19|20)?\d{2}(0[1-9]|1[012])(0[1-9]|[12]\d|3[01])\d{3}(\d|[xX])$/.test(value);
        }
    },


    /**
     * 通用的网络请求工具类，封装ajax
     * @param param
     */
    request: function (param) {
        //   因为在ajax当中无法访问this对象，因此在这定义一下
        var __this = this;
        $.ajax({
            type: param.method || "get",
            url: param.url || "",
            dataType: param.type || "json",
            data: param.data || "",
            success: function (res) {
                //   请求成功
                if (0 === res.code) {
                    typeof param.success === "function" &&
                    param.success(res.data, res.msg);

                }
                //   没有登录状态，需要强制登录
                else if (10 === res.code) {
                    // 登录
                    __this.doLogin();
                }
                // 请求的数据错误
                else if (1 === res.code) {
                    typeof param.error === "function" && param.error(res.msg);
                }
            },
            error: function (error) {
                typeof param.error === "function" &&
                param.error(error.statusText);
            }
        });
    },
    /**
     * 统一登录处理
     */
    doLogin: function () {
        window.location.href =
            "./user-login.html?redirect=" +
            encodeURIComponent(window.location.href);
    },
    /**
     * 跳转回首页
     */
    goHome: function () {
        window.location.href = "./index";
    },
    addTime: function (m) {
        return m < 10 ? '0' + m : m
    },
    getDate: function (uinx, format) {
        //shijianchuo是整数，否则要parseInt转换
        var time = new Date(uinx);
        var y = time.getFullYear();
        var m = time.getMonth() + 1;
        var d = time.getDate();
        var h = time.getHours();
        var mm = time.getMinutes();
        var s = time.getSeconds();
        if (format) {
            return y + '-' + this.addTime(m) + '-' + this.addTime(d) + ' ' + this.addTime(h) + ':' + this.addTime(mm) + ':' + this.addTime(s);
        }
        return y + '-' + this.addTime(m) + '-' + this.addTime(d);

    }


};