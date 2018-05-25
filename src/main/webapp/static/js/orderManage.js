/**
 * 订单列表
 * @author liuquanhui
 * @Date 2018-5-25 15:58:24
 * */

var page = {
    /**
     * 初始化系列参数
     */
    pageInfo: {
        pageNum: 1,
        pageSize: 1,
        orderNumber: ''
    },
    /**
     * 方法入口
     */
    init: function () {
        this.bindEvent();
        this.reloadOrderList(this.pageInfo);
    },
    /**
     * 各个时间绑定
     */
    bindEvent: function () {
        var _this = this;

        $('.orderBody').on('click', '.order-detail', function () {
            /*获取该tr当中的订单编号*/
            var orderNumber = $(this).parent().siblings('.order-number').text();
            /*获取订单编号后，再去后台查询该订单编号所对应的订单详情*/
            _this.pageInfo.orderNumber = orderNumber;
            /*通过订单编号orderNumber到后台查询该条订单*/
            _this.reloadOrderDetailList(_this.pageInfo);
            /*显示模态框*/
            _this.showModal('show');
        });
    },

    /**
     * 加载订单详情
     * @param pageInfo
     */
    reloadOrderDetailList: function (pageInfo) {
        var _this = this;
        $.ajax({
            url: '/orderCar/list',
            dataType: 'json',
            type: 'get',
            data: {
                /*此处一定不要传 pageNum pageSize 因为根据orderNumber查询 结果集只有一个无法分页选取第二页  就是用默认pageNum=1 pageSize=10*/
                // pageNum: pageInfo.pageNum,
                // pageSize: pageInfo.pageSize,
                orderNumber: pageInfo.orderNumber
            },
            success: function (res) {
                console.log(res);
                /*渲染模态框当中的订单详情*/
                _this.renderOrderDetailHtml(res.data);
            },
            error: function (error) {
                console.log(error);
            }
        });
    },

    /**
     * 显示模态框
     * @param type
     */
    showModal: function (type) {
        $('#order-item-modal').modal('show');
    },
    /**
     * 加载页面信息
     * @param pageInfo
     */
    reloadOrderList: function (pageInfo) {
        var _this = this;
        $.ajax({
            url: '/orderCar/list',
            dataType: 'json',
            type: 'get',
            data: {
                pageNum: pageInfo.pageNum,
                pageSize: pageInfo.pageSize,
                orderNumber: pageInfo.orderNumber
            },
            success: function (res) {
                // console.log(res);
                /*渲染html*/
                _this.renderOrderHtml(res.data);
                /*加载分页*/
                _this.loadPagination(res.data);
            },
            error: function (error) {
                console.log(error);
            }
        });
    },
    /**
     * 根据返回的json数据，进行组装成html代码，显示在订单列表当中
     */
    renderOrderHtml: function (data) {
        var $orderBody = $('.orderBody');
        $orderBody.html('');
        var length = data.list.length;
        for (var i = 0; i < length; i++) {
            var orderVo = data.list[i];
            var $tr = "<tr>" +
                "<td class='order-number'>" + orderVo.orderNumber + "</td>" +
                "<td>" + orderVo.realName + "</td>" +
                "<td>" +
                "<span class='label label-info'><i class='fa fa-rmb'></i>" + orderVo.realPay + "</span>" +
                "</td>" +
                "<td>" + orderVo.orderTime + "</td>" +
                "<td title='" + orderVo.orderPlace + "'>" + orderVo.orderPlace + "</td>" +
                "<td>" + orderVo.endTime + "</td>" +
                "<td title='" + orderVo.returnPlace + "'>" + orderVo.returnPlace + "</td>" +
                "<td>" +
                "<span class='label label-success'>" + orderVo.orderStatus + "</span>" +
                "</td>" +
                "<td>" +
                "<a class='btn btn-sm btn-primary order-detail'>详情</a>" +
                "</td>" +
                "</tr>";
            $orderBody.append($tr);
        }
    },
    /**
     * 根据返回的json数据，组装模态框当中的订单详情
     * @param data
     */
    renderOrderDetailHtml: function (data) {
         // console.log(data);
        var $odBody = $('.order-detail-body');
        $odBody.html('');
        /*因为这里是组装orderItemVo 因此应该是json数据当中list里面的orderItemVoList的大小*/
        /*这里使用data.list[0]是由于，根据订单编号查询订单只会有一个*/
        var orderDetailArr = data.list[0].orderItemVoList; //这里得到orderItemVoList这个数组
        var length = orderDetailArr.length;
        var totalPrice = 0;
        // console.log(orderDetailArr);
        for (var i = 0; i < length; i++) {
            var orderDetail = orderDetailArr[i];
            var $tr = "<tr class='active'>" +
                "<td>"+orderDetail.id+"</td>" +
                "<td title='"+orderDetail.carName+"'>"+orderDetail.carName+"</td>" +
                "<td>" +
                "<span class='label label-info'><i class='fa fa-rmb'>"+orderDetail.pay+"</i></span>" +
                "</td>" +
                "<td title='"+orderDetail.orderPlace+"'>"+orderDetail.orderPlace+"</td>" +
                "<td title='"+orderDetail.returnPlace+"'>"+orderDetail.returnPlace+"</td>" +
                "</tr>";
            $odBody.append($tr);
            totalPrice = totalPrice + orderDetail.pay;
        }
        $('.order-detail-pay-price').html(totalPrice);
        console.log($odBody);

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
                page.reloadOrderList(_this.pageInfo);
            }
        });
    }
};

$(function () {
    page.init();
});