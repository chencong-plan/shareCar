/**
 * @author liuquanhui
 * @Date 2018-5-22 21:14:28
 * */

var page = {
    pageInfo: {
        pageNum: 1,
        pageSize: 6,
        keyword: '',
        type: '',
        status: '',
        orderBy: ''
    },
    carStatus: {
        onLine: 0,
        downLine: 1
    },
    init: function () {
        this.bindEvent();
        this.reloadCarList(this.pageInfo);
    },
    bindEvent: function () {
        var _this = this;
        /**
         * 搜索
         */
        $('.btn-car-search').click(function () {
            var keyword = $.trim($('#keyword').val());
            page.pageInfo.keyword = keyword;
            page.reloadCarList(page.pageInfo);
        });

        /**
         * 停运
         */
        $('.car-info-body').on('click', '.btn-car-on-line', function () {
            var id = $(this).siblings('input').val();
            /*将其变为停用*/
            var $tr = $(this).parent().parent('tr');
            var $status = $tr.find('.car-status');
            $status.removeClass('label-info').removeClass('label-success').addClass('label-danger')
            $status.text('已停运');
            _this.updateCarStatus(id, _this.carStatus.downLine);
        });

        /**
         * 上线
         */
        $('.car-info-body').on('click', '.btn-car-down-line', function () {
            var id = $(this).siblings('input').val();
            /*将其变为停用*/
            var $tr = $(this).parent().parent('tr');
            var $status = $tr.find('.car-status');
            $status.removeClass('label-info').removeClass('label-danger').addClass('label-success')
            $status.text('在线');
            _this.updateCarStatus(id, _this.carStatus.onLine);
        });
    },
    /**
     * 更新汽车状态
     * @param id
     * @param status
     */
    updateCarStatus: function (id, status) {
        console.log(id + " : "+status);
        var _this = this;
        $.ajax({
            url: '/manage/car/update',
            data: {
                id: id,
                status: status
            },
            dataType: 'json',
            type: 'get',
            success: function (res) {
                // _this.reloadCarList(_this.pageInfo);
                console.log(res);
            },
            error: function (errorMsg) {
                console.log(errorMsg);
            }
        });
    },
    /**
     * 填充html
     * @param data
     */
    renderHtml: function (data) {
        var $tbody = $('.car-info-body');
        var length = data.list.length;
        $tbody.html('');
        for (var i = 0; i < length; i++) {
            var $tr = "<tr><td>" +
                "<div class='car-info'>" +
                "<img class='img-rounded' src='" + data.list[i].imageUrl + "' alt='" + data.list[i].name + "'>" +
                "</div>" +
                "</td>" +
                "<td>" +
                "<div class='car-info'>" +
                "<span class='car-type'>" + data.list[i].carType + "</span>" +
                "<span class='car-name'>" + data.list[i].name + "</span>" +
                "</div>" +
                "</td>" +
                "<td>" + data.list[i].productName + "</td>" +
                "<td>" + data.list[i].operation + "</td>" +
                "<td>￥" + data.list[i].pay + "</td>" +
                "<td><span class='label label-info car-status'>" + data.list[i].status + "</span></td>" +
                "<td>" + data.list[i].createTime + "</td>" +
                "<td>" +
                "<input class='car-id' value='" + data.list[i].id + "' type='text' hidden>" +
                "<a class='btn btn-warning btn-sm  btn-car-status btn-car-on-line'>停运</a>" +
                "<a class='btn btn-success btn-sm  btn-car-status btn-car-down-line'>上线</a>" +
                "</td>" +
                "</tr>";
            $tbody.append($tr);
        }
    },
    reloadCarList: function (pageInfo) {
        /*这里一定要定义一个this变量，因为在ajax中无法使用this*/
        var _this = this;
        // console.log(pageInfo);
        $.ajax({
            url: '/manage/car/list',
            data: {
                pageNum: pageInfo.pageNum,
                pageSize: pageInfo.pageSize,
                keyword: pageInfo.keyword,
                type: pageInfo.type,
                status: pageInfo.status,
                orderBy: pageInfo.orderBy
            },
            dataType: 'json',
            type: 'get',
            success: function (res) {
                console.log(res);
                /*这里调用renderHtml进行动态生成表单节点*/
                _this.pageInfo.pageNum = res.data.pageNum;
                _this.pageInfo.pageSize = res.data.pageSize;
                _this.renderHtml(res.data);
                _this.loadPagination(res.data);
            },
            error: function (error) {
                console.log(error);
            }
        });
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
                // console.log(current);
                console.log(current);
                page.reloadCarList(_this.pageInfo);
            }
        });
    }

};

$(function () {
    page.init();
});
