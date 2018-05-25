/*
* 用户管理模块，提供用户查询，重置密码，分页等功能
* @author liuquanhui
* @Date 2018-5-22 09:46:03
* */

var page = {
    pageInfo: {
        pageNum: 1,
        pageSize: 2,
        role: 1,
        type: 'username'
    },
    /*初始化*/
    init: function () {
        this.reloadList(this.pageInfo);
        this.bindEvent();
    },
    reloadList: function (pageInfo) {
        this.requestData(pageInfo);

    },
    requestData: function (pageInfo) {
        var _this = this;
        var keyword = $.trim($('#username').val());
        $.ajax({
            url: "/manage/list",
            type: "post",
            data: {
                pageNum: pageInfo.pageNum,
                pageSize: pageInfo.pageSize,
                role: pageInfo.role,
                keyword: keyword
            },
            dataType: 'json',
            success: function (res) {
                _this.pageInfo.pageNum = res.data.pageNum;
                _this.pageInfo.pageSize = res.data.pageSize;
                _this.renderHtml(res.data);
                _this.loadPagination(res.data);
            },
            error: function (error) {
                alert(error);
            }
        });
    },
    renderHtml: function (data) {
        var $tbody = $('.user-tbody');
        $tbody.html('');
        var length = data.list.length;
        for (var i = 0; i < length; i++) {
            var $tr = "<tr><td>" + data.list[i].id + "</td>" +
                "<td>" + data.list[i].username + "</td>" +
                "<td>" + data.list[i].realName + "</td>" +
                "<td>" + data.list[i].idCard + "</td>" +
                "<td>" + data.list[i].email + "</td>" +
                "<td>" + util.getDate(data.list[i].born) + "</td>" +
                "<td>" +
                "<a class='btn btn-info btn-sm'>重置密码</a>" +
                "</td>" +
                "</tr>";
            $tbody.append($tr);
        }
        // console.log($tbody);

    },
    /**
     * 绑定页面事件
     */
    bindEvent: function () {
        var _this = this;
        $('.btn-search').click(function () {
            var keyword = $.trim($('#username').val());
            $.ajax({
                url: '/manage/list',
                data: {
                    pageNum: _this.pageInfo.pageNum,
                    pageSize: _this.pageInfo.pageSize,
                    role: _this.pageInfo.role,
                    keyword: keyword,
                    type: _this.pageInfo.type
                },
                type: 'POST',
                dataType: 'json',
                success: function (res) {
                    _this.renderHtml(res.data);
                    _this.loadPagination(res.data);
                },
                error: function (error) {

                }

            });
        });
    },
    /**
     * 加载分页信息
     * @param data
     */
    loadPagination: function (data) {
        console.log(data);
        var _this = this;
        $("#myPagination").pagination({
            currentPage: data.pageNum,
            totalPage: data.pages,
            callback: function (current) {
                _this.pageInfo.pageNum = current;
                console.log(_this.pageInfo);
                _this.reloadList(_this.pageInfo);
            }
        });
    }

};

$(function () {
    page.init();
});