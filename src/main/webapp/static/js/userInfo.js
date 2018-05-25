/**
 * 用户中心
 * @author chencong
 * @Date 2018-5-25 18:27:57
 * */

var page = {
    pageInfo: {
        pageNum: 1,
        pageSize: 1,
        userId: '',
        orderStatus: 0,
        orderNumber: ''
    },
    init: function () {
        this.bindEvent();
        this.reloadOrder(page.pageInfo);

    },
    /**
     * 事件绑定
     */
    bindEvent: function () {
        var _this = this;
        /**
         * 撤销按钮，点击事件冒泡上浮
         */
        $('.userInfo-order').on('click', '.btn-order-cancel', function () {
            var $td = $(this).parent().siblings('.order-status');
            var $orderStatus = $(this).parent().siblings('.order-number');
            var userId = $.trim($('.userInfo-id').val());
            var orderNumber = $orderStatus.text();
            var $span = $td.find('span');
            /*将其颜色修改成红色*/
            $span.removeClass("label-info").addClass("label-danger");
            /*将其文字修改成 已关闭*/
            $span.text("已关闭");
            /*该【撤销】按钮修改成功不可点击*/
            $(this).attr("disabled", true);
            /*【撤销】按钮修改成【已撤销】*/
            $(this).html("已撤销");
            _this.pageInfo.orderStatus = 10;
            _this.pageInfo.orderNumber = orderNumber;
            _this.pageInfo.userId = userId;
            /*修改订单状态*/
            _this.updateOrderStatus(_this.pageInfo);
        });
    },
    /**
     * 修改订单状态
     */
    updateOrderStatus: function (pageInfo) {
        $.ajax({
            url: '/orderCar/update',
            dataType: 'json',
            type: 'get',
            data: {
                orderNumber: pageInfo.orderNumber,
                userId: pageInfo.userId,
                status: pageInfo.orderStatus
            },
            success: function (res) {
                console.log(res);
            },
            error: function (error) {
                console.log(error);
            }
        });
    },
    /**
     * 加载用户订单列表信息
     * @param pageInfo
     */
    reloadOrder: function (pageInfo) {
        this.pageInfo.userId = $.trim($('.userInfo-id').val());
        var _this = this;
        $.ajax({
            url: '/orderCar/list',
            dataType: 'json',
            type: 'get',
            data: {
                pageNum: pageInfo.pageNum,
                pageSize: pageInfo.pageSize,
                userId: pageInfo.userId
            },
            success: function (res) {
                console.log(res);
                /*渲染模态框当中的订单详情*/
                _this.renderUserInfoOrderHtml(res.data);
                /*初始化分页*/
                _this.loadPagination(res.data);
            },
            error: function (error) {
                console.log(error);
            }
        });
    },
    /**
     * 渲染html信息
     * @param data
     */
    renderUserInfoOrderHtml: function (data) {
        var $uOrder = $('.userInfo-order');
        /*渲染之前 一定要清空*/
        $uOrder.html('');
        var length = data.list.length;
        for (var i = 0; i < length; i++) {
            var orderVo = data.list[i];
            var $tr = "<tr>" +
                "<td class='order-number'>" + orderVo.orderNumber + "</td>" +
                "<td>" + orderVo.orderTime + "</td>" +
                "<td>" + orderVo.orderPlace + "</td>" +
                "<td>" + orderVo.returnPlace + "</td>" +
                "<td>" +
                "<span><i class=‘fa fa-rmb’></i>" + orderVo.prePay + "</span>" +
                "</td>" +
                "<td class='order-status'>" +
                "<span class='label label-info'>" + orderVo.orderStatus + "</span>" +
                "</td>" +
                "<td>" +
                "<a class='btn btn-sm btn-warning btn-order-cancel'>撤销</a>" +
                "</td>" +
                "</tr>";
            $uOrder.append($tr);
        }
    },
    /**
     * 加载分页信息
     * @param data
     */
    loadPagination: function (data) {
        // console.log(data);
        var _this = this;
        $("#myPagination").pagination({
            currentPage: data.pageNum,
            totalPage: data.pages,
            callback: function (current) {
                _this.pageInfo.pageNum = current;
                page.reloadOrder(_this.pageInfo);
            }
        });
    }
};

$(function () {
    page.init();
});