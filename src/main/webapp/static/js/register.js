/*
* Author:chencong
* Date: 2018-5-18 14:52:38
* */
$(function () {

    /**
     * 加载地图
     */
    map.initMap();

    /**
     * 异步校验用户名是否存在
     */
    $('.username').blur(function () {
        var username = $.trim($('.username').val());
        // 如果用户名为空，则不做验证
        if (!username) {
            formError.show("用户名不能为空");
            return;
        }
        // 异步验证用户名是否存在
        check(username, "username",
            function (res) {
                formError.hide();
            }, function (errMsg) {
                formError.show(errMsg);
            });
    });
    /**
     * 提交表单数据
     * @param formData
     */
    var submit = function () {
        /**
         * 初始化表单数据
         * @type {{username: *|string, password: *|string, rePassword: *|string, idCard: *|string, bornDate: *|string}}
         */
        /*因为使用的是datatimepicker插件 获取时间的方式不能直接val*/
        var date = $("#born-date").data("datetimepicker").getDate();
        var formData = {
            username: $.trim($('.username').val()),
            password: $.trim($('.password').val()),
            rePassword: $.trim($('.re-password').val()),
            email: $.trim($('.email').val()),
            realname: $.trim($('.realname').val()),
            idCard: $.trim($('.id-card').val()),
            homeAddress : $.trim($('.home-address').val()),
            bornDate: $.trim(date)
        };
        /*表单验证结果*/
        var validateResult = formValidate(formData);
        if (validateResult.status) {
            /*验证成功，开始发送注册请求*/
            register(formData,
                function (res) {
                    window.location.href = "/user/login";
                },
                function (errMsg) {
                    formError.show(errMsg);
                }
            );
        } else {
            /*验证失败，显示提示信息*/
            formError.show(validateResult.msg);
        }

    };
    /**
     * 检验用户名
     */
    var check = function (msg, type, resolve, reject) {
        util.request({
            url: '/user/check_validate',
            data: {
                type: type,
                msg: msg
            },
            method: "GET",
            success: resolve,
            error: reject
        });
    };

    /**
     * 注册
     */
    var register = function (formData, resolve, reject) {
        util.request({
            url: '/user/doRegister',
            data: {
                username: formData.username,
                password: formData.password,
                idCard: formData.idCard,
                born: formData.bornDate,
                realName: formData.realname,
                email: formData.email,
                homeAddress : formData.homeAddress
            },
            method: "GET",
            success: resolve,
            error: reject
        });

    };

    /*点击立即注册*/
    $('#btn-register').click(function () {
        submit();
    });

    $('#form-register').keyup(function (e) {
        // keyCode === 13 表述回车
        if (e.keyCode === 13) {
            submit();
        }
    });


});

/**
 * 表单错误提示
 * @type {{show: formError.show, hide: formError.hide}}
 */
var formError = {
    show: function (errMsg) {
        $(".error-item")
            .show()
            .find(".error-msg")
            .text(errMsg);
    },
    hide: function () {
        $(".error-item")
            .hide()
            .find(".error-msg")
            .text("");
    }
};

/**
 * 表单校验
 * @param formData 表单数据
 * @returns {{status: boolean, msg: string}}
 */
var formValidate = function (formData) {
    /*返回值*/
    var result = {
        status: false,
        msg: ""
    };
    /*用户名异步校验不在这里*/
    /*密码不能为空*/
    if (!util.validate(formData.username, "require")) {
        result.msg = "用户名不能为空";
        return result;
    }
    /*密码不能为空*/
    if (!util.validate(formData.password, "require")) {
        result.msg = "密码不能为空";
        return result;
    }
    /*两次密码不一致*/
    if (formData.password !== formData.rePassword) {
        result.msg = "两次密码不一致";
        return result;
    }
    if (!util.validate(formData.email, 'email')) {
        result.msg = "邮箱格式错误";
        return result;
    }
    if (!util.validate(formData.realname, 'require')) {
        result.msg = "真实姓名不能为空";
        return result;
    }
    /*身份证号验证*/
    if (!util.validate(formData.idCard, "idCard")) {
        result.msg = "身份证号格式错误";
        return result;
    }
    /*家庭地址不能为空*/
    if(!util.validate(formData.homeAddress,'require')){
        result.msg = "家庭地址不能为空";
        return result;
    }
    /*出生年月日*/
    if (!util.validate(formData.bornDate, "require")) {
        result.msg = "出生年月日不能为空";
        return result;
    }
    result.status = true;
    result.msg = "验证通过";
    return result;
};

var map={
    /**
     * 加载地图信息
     */
    initMap: function () {
        var windowsArr = [];
        var marker = [];
        AMap.plugin(['AMap.Autocomplete', 'AMap.PlaceSearch'], function () {
            var autoOptions = {
                city: "北京", //城市，默认全国
                input: "homeAddress"//使用联想输入的input的id
            };
            autocomplete = new AMap.Autocomplete(autoOptions);
            var placeSearch = new AMap.PlaceSearch({
                city: '北京',
                map: map
            });
            AMap.event.addListener(autocomplete, "select", function (e) {
                //TODO 针对选中的poi实现自己的功能
                placeSearch.setCity(e.poi.adcode);
                placeSearch.search(e.poi.name)
            });
        });
    }
};
