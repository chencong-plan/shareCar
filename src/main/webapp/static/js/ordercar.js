/**
 * @author chencong
 * @Date 2018-5-24 10:58:50
 * */

var page = {
    /**
     * 订单信息
     */
    orderInfo: {
        carId: 0,
        type: '',
        name: '',
        pay: 0,
        prePay: 0,
        realPay: 0,
        orderPlace: '',
        returnPlace: '',
        createTime: '',
        endTime: ''

    },
    init: function () {
        this.initMap();
        this.bindEvent();
    },
    initMap: function () {
        var windowsArr = [];
        var marker = [];
        var map = new AMap.Map("mapContainer", {
            resizeEnable: true,
            center: [114.298572, 30.584355],//地图中心点
            zoom: 13,//地图显示的缩放级别
            keyboardEnable: false
        });
        AMap.plugin(['AMap.Autocomplete', 'AMap.PlaceSearch'], function () {
            var autoOptions = {
                city: "北京", //城市，默认全国
                input: "keyword-get-car"//使用联想输入的input的id
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

            /*还车地点*/
            var autoOptionsReturnCar = {
                city: "北京", //城市，默认全国
                input: "keyword-return-car"//使用联想输入的input的id
            };
            autocomplete = new AMap.Autocomplete(autoOptionsReturnCar);
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
    },
    bindEvent: function () {
        var _this = this;

        /**
         * 点击预约按钮
         */
        $('.btn-order-car').click(function () {
            /*因为使用的是datatimepicker插件 获取时间的方式不能直接val*/
            var orderCarBeginTime = $(".order-car-begin-time").data("datetimepicker").getDate();
            var orderCarEndTime = $(".order-car-end-time").data("datetimepicker").getDate();
            var formData = {
                carId: $.trim($('#car-id').val()),
                carName: $.trim($('#car-info').val()),
                keywordGetCar: $.trim($('#keyword-get-car').val()),
                keywordReturnCar: $.trim($('#keyword-return-car').val()),
                orderCarBeginTime: $.trim(orderCarBeginTime),
                orderCarEndTime: $.trim(orderCarEndTime),
                carPay: $.trim($('.order-car-pay').val()),
                orderCarTypePrice: $.trim($('.order-car-type-price').val())
            };
            var validateResult = _this.validateForm(formData);
            if (validateResult.status) {
                _this.showModal('show');
                _this.initModalData(formData);
                _this.initOrderInfo(formData);
            } else {
                alert(validateResult.msg);
            }
        });
        /**
         * 点击[确认预约]按钮
         */
        $('.btn-confirm-order').click(function () {
            var _this = this;
            var payInfo = {
                carPay: $.trim($('.order-car-pay').val()),
                payMoney: $.trim($('.pay-money').val()),
                payPassword: $.trim($('.pay-password').val())
            };
            var validateResult = page.validatePayInfo(payInfo);
            if (validateResult.status) {
                /*提交预约订单信息*/
                formError.hide();
                /*再次填充orderInfo信息=》预支付、实际支付均为订单金额*/
                page.orderInfo.realPay = payInfo.payMoney;
                page.orderInfo.prePay = payInfo.payMoney;
                /*提交信息*/
                page.insertOrderInfo(page.orderInfo);
            } else {
                /*验证不通过  显示校验信息*/
                formError.show(validateResult.msg);
            }
        });
        $('.btn-order-reset').click(function () {
            alert("重置");
        });
    },

    /**
     * 根据获取的表单信息初始化订单信息
     * @param formData
     */
    initOrderInfo: function (formData) {
        this.orderInfo.carId = formData.carId;
        this.orderInfo.name = formData.carName;
        this.orderInfo.pay = formData.carPay;
        this.orderInfo.orderPlace = formData.keywordGetCar;
        this.orderInfo.returnPlace = formData.keywordReturnCar;
        this.orderInfo.createTime = formData.orderCarBeginTime;
        this.orderInfo.endTime = formData.orderCarEndTime;
    },

    insertOrderInfo: function (orderInfo) {
        // console.log(orderInfo);
        var _this = this;
        $.ajax({
            url: '/orderCar/add',
            dataType: 'json',
            type: 'post',
            data: {
                carId: orderInfo.carId,
                name: orderInfo.name,
                realPay: orderInfo.realPay,
                prePay: orderInfo.prePay,
                orderPlace: orderInfo.orderPlace,
                returnPlace: orderInfo.returnPlace,
                orderTime: orderInfo.createTime,
                endTime: orderInfo.endTime
            },
            success: function (res) {
                console.log(res);
                if (10 === res.code) {
                    window.location.href = "/index";
                } else if (1 === res.code) {
                    window.location.href = "/index";
                } else {
                    window.location.href = "/user/" + res.data.id;
                }
            },
            error: function (errorMsg) {
                alert(errorMsg);
                console.log(errorMsg);
            }
        });
    },
    /**
     * 显示模态框
     * @param type
     */
    showModal: function (type) {
        $('#orderModal').modal(type);
    },
    /**
     * 点击预约填充模态框数据
     * @param formData
     */
    initModalData: function (formData) {
        /*汽车信息*/
        $('.car-info-name').html(formData.carName);
        /*汽车起始地点*/
        $('.car-info-begin-place').html(formData.keywordGetCar);
        /*汽车起始时间*/
        $('.car-info-begin-time').html(util.getDate(formData.orderCarBeginTime, 'yyyy-mm-dd hh:mm'));

        /*汽车还车地点*/
        $('.car-info-end-place').html(formData.keywordReturnCar);
        /*汽车还车时间*/
        $('.car-info-end-time').html(util.getDate(formData.orderCarEndTime, 'yyyy-mm-dd hh:mm'));
        /*押金*/
        $('.car-info-pay-money').html(formData.carPay);
        /*计费方式*/
        $('.car-info-car-type-price').html(formData.orderCarTypePrice);
    },
    /**
     * 表单信息验证
     * @param formData
     * @returns {{msg: string, status: boolean}}
     */
    validateForm: function (formData) {
        var result = {
            msg: '校验通过',
            status: true
        };
        return result;
    },
    /**
     * 支付信息验证，验证押金是否正确，支付密码是否正确
     * @param payInfo
     */
    validatePayInfo: function (payInfo) {
        var _this = this;
        var result = {
            status: false,
            msg: '校验通过'
        };
        if (!util.validate(payInfo.payMoney, 'require')) {
            result.msg = '押金不能为空';
            return result;
        }
        /*填写金额必须大于押金*/
        if (parseInt(payInfo.carPay) > parseInt(payInfo.payMoney)) {
            result.msg = '支付金额必须大于押金';
            return result;
        }
        if (!util.validate(payInfo.payPassword, 'require')) {
            result.msg = '支付密码不能为空';
            return result;
        }
        var checkResult = _this.checkPayPassword(payInfo.payPassword);
        if (!checkResult.status) {
            result.msg = checkResult.msg;
            return result;
        }
        result.status = true;
        return result;
    },
    /**
     * 检验支付密码是否正确
     * @param password
     */
    checkPayPassword: function (password) {
        var result = {
            status: false,
            msg: ''
        };
        $.ajax({
            url: '/user/checkPassword',
            dataType: 'json',
            type: 'get',
            data: {
                password: password
            },
            /*一定要是同步的，不然无法加载result信息*/
            async: false,
            success: function (res) {
                console.log(res);
                if (res.code === 1) {
                    result.msg = res.msg;
                } else if (res.code === 10) {
                    result.msg = res.msg;
                    window.location.href = "/index";
                } else {
                    result.msg = res.msg;
                    result.status = true;
                }
            },
            error: function (error) {

            }
        });
        return result;
    }
};

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

$(function () {
    page.init();
});