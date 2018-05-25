/*
* @author liuquanhui
* Date 2018-5-19 11:19:13
* */

var page = {
    pageInfo: {
        pageNum: 1,
        pageSize: 2,
        role: 2,
        type: "username"
    },
    init: function () {
        this.reloadList(page.pageInfo);
        this.bindEvent();
    },
    reloadList: function (pageInfo) {
        var _this = this;
        $.ajax({
            url: "/manage/list",
            type: "post",
            data: {
                pageNum: _this.pageInfo.pageNum,
                pageSize: _this.pageInfo.pageSize,
                role: 2
            },
            dataType: 'json',
            success: function (res) {
                _this.pageInfo.pageNum = res.data.pageNum;
                _this.pageInfo.pageSize = res.data.pageSize;
                page.renderHtml(res.data);
                _this.loadPagination(res.data);
            },
            error: function (error) {
                alert(error);
            }
        });
    },
    bindEvent: function () {
        var _this = this;


        /**
         * 搜索框
         */
        $('#admin-search').click(function () {
            var keyword = $.trim($('#username').val());
            $.ajax({
                url: "/manage/list",
                type: "post",
                data: {
                    pageNum: _this.pageInfo.pageNum,
                    pageSize: _this.pageInfo.pageSize,
                    role: _this.pageInfo.role,
                    keyword: keyword,
                    type: _this.pageInfo.type
                },
                dataType: 'json',
                success: function (res) {
                    _this.pageInfo.pageNum = res.data.pageNum;
                    _this.pageInfo.pageSize = res.data.pageSize;
                    page.renderHtml(res.data);
                    _this.loadPagination(res.data);
                },
                error: function (error) {
                    alert(error);
                }
            });
        });

        /**
         * 点击新增按钮
         */
        $('#admin-add').click(function () {
            _this.showModal('show');
            /*将模态框数据置空*/
            $('.md-id').val('');
            $('.md-username').val('');
            $('.md-password').val('');
            $('.md-re-password').val('');
            $('.md-re-realname').val('');
            $('.md-email').val('');
        });

        /**
         * 点击更新按钮
         */
        $('.admin-data').on('click', '.admin-update', function () {
            var $this = $(this);
            /*调用模态框*/
            _this.showModal('show');
            /*加载数据*/
            var $tr = $this.parent().parent().children('.admin');
            var trData = {
                id: $.trim($tr.eq(0).text()),
                username: $.trim($tr.eq(1).text()),
                password: $.trim($tr.eq(2).text()),
                realName: $.trim($tr.eq(3).text()),
                email: $.trim($tr.eq(4).text())
            };
            console.log(trData);
            /*填充模态框的值*/
            _this.insertModel(trData);
        });

        /**
         * 删除按钮
         */
        $('.admin-data').on('click', '.admin-delete', function () {
            var $this = $(this);
            var $tr = $this.parent().parent().children('.admin');
            _this.msgModal('show');
            /*选择确定*/
            $('#msg-modal-confirm').click(function () {
                var id = $tr.eq(0).text();
                console.log(id);
                /*do something*/
                // 异步验证用户名是否存在
                $.ajax({
                    url: "/manage/del/" + id,
                    type: "post",
                    dataType: 'json',
                    success: function (res) {
                        if (0 === res.code) {
                            _this.msgAlert('记录删除成功');
                            _this.msgModal('hide');
                            $('.msg-alert').css('display', 'block');
                            page.reloadList();
                        } else if (1 === res.code) {
                            _this.msgAlert('失败');
                            _this.msgModal('hide');
                            $('.msg-alert').css('display', 'block');
                        }
                    },
                    error: function (error) {

                    }
                });

            });
        });

        /**
         * 更新重置密码操作
         */
        $('.admin-data').on('click', '.admin-reset', function () {
            var $this = $(this);
            var $tr = $this.parent().parent().children('.admin');
            var id = $tr.eq(0).text();
            /*做重置密码操作*/
            _this.msgModal('show');
            $('#msg-modal-confirm').click(function () {
                /*do something*/
                $.ajax({
                    url: '/manage/reset',
                    data: {id: id},
                    type: 'POST',
                    dataType: 'json',
                    async: false,
                    success: function (res) {
                        _this.msgAlert(res.msg);
                    }, error: function (error) {
                        _this.msgAlert('更新密码成功');
                    }
                });
                _this.msgModal('hide');
                $('.msg-alert').css('display', 'block');
                page.reloadList();
            });
        });
        /**
         * 校验用户名是否已经存在于库当中
         */
        $('.md-username').blur(function () {
            var username = $.trim($('.md-username').val());
            // 如果用户名为空，则不做验证
            if (!username) {
                formError.show("用户名不能为空");
                return;
            }
            // 异步验证用户名是否存在
            $.ajax({
                url: "/user/check_validate",
                data: {
                    type: 'username',
                    msg: username
                },
                type: "post",
                dataType: 'json',
                success: function (res) {
                    if (0 === res.code) {
                        formError.hide();
                    } else if (1 === res.code) {
                        formError.show(res.msg);
                    }
                },
                error: function (error) {
                    formError.show(error.text);
                }
            });
        });

        /**
         * 提交按钮
         */
        $('#admin-submit').click(function () {
            var formData = {
                id: $.trim($('.md-id').val()),
                username: $.trim($('.md-username').val()),
                password: $.trim($('.md-password').val()),
                rePassword: $.trim($('.md-re-password').val()),
                realName: $.trim($('.md-re-realname').val()),
                email: $.trim($('.md-email').val())
            };
            var formValidateResult = _this.formValidate(formData);
            if (formValidateResult.status) {
                /*表单校验通过*/
                var result = _this.insertAdmin(formData);
                if (result) {
                    _this.msgAlert('更新信息成功');
                    page.reloadList();
                } else {
                    _this.msgAlert('更新信息失败');
                    $('.error-msg div').removeClass('alert-success').addClass('alert-warning');
                }
                _this.showModal('hide');
                $('.msg-alert').css('display', 'block');
            } else {
                /*表单校验不通过*/
                formError.show(formValidateResult.msg);
            }
        });

    },

    /**
     * 加载分页
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
    },

    /**
     * 加载页面
     * @param data
     */
    renderHtml: function (data) {
        var $tbody = $('.admin-data');
        $tbody.html('');
        var length = data.list.length;
        for (var i = 0; i < length; i++) {
            var $tr = "<tr><td class='admin admin-id'>" + data.list[i].id + "</td>" +
                "<td class='admin admin-username'>" + data.list[i].username + "</td>" +
                "<td class='admin admin-password'>" + data.list[i].password + "</td>" +
                "<td class='admin admin-realname'>" + data.list[i].realName + "</td>" +
                "<td class='admin admin-email'>" + data.list[i].email + "</td>" +
                "<td>" +
                "<a class='btn btn-danger btn-sm admin-delete' id='admin-delete'>删除</a>  " +
                "<a class='btn btn-primary btn-sm admin-update'>编辑</a>  " +
                "<a class='btn btn-info btn-sm admin-reset'>重置密码</a>  " +
                "</td>" +
                "</tr>";
            $tbody.append($tr);
        }
    },

    /**
     * 显示模态框
     */
    showModal: function (type) {
        $('#myModal').modal(type);
    },

    /**
     * 信息提示框
     * @param msg
     */
    msgAlert: function (msg) {
        var $div = " <div class=\"alert alert-success\">\n" +
            "<a href=\"\" class=\"close\" data-dismiss=\"alert\">\n" +
            "&times;\n" +
            "</a><strong>成功！</strong>" + msg + "</div>";
        $('.msg-alert').html($div);
    },

    /**
     * 提示框
     */
    msgModal: function (type) {
        $('#msgModal').modal(type);
    },
    /**
     * 往模态框当中填充值
     * @param trData
     */
    insertModel: function (trData) {
        $('.md-id').val(trData.id);
        $('.md-username').val(trData.username);
        /*用户名不可更改*/
        $('.md-username').attr('disabled', 'disabled');
        $('.md-password').val(trData.password);
        $('.md-re-password').val(trData.password);
        /*两个密码去掉*/
        $('.modal-password-input input').attr('disabled', 'disabled');
        $('.md-re-realname').val(trData.realName);
        $('.md-email').val(trData.email);
        $('#myModalLabel').text('更新管理员信息');
    },


    /**
     * 插入管理员
     * @param formData
     * @returns {boolean}
     */
    insertAdmin: function (formData) {
        var result = false;
        // 异步验证用户名是否存在
        $.ajax({
            url: "/manage/add",
            data: {
                id: formData.id,
                username: formData.username,
                password: formData.password,
                realName: formData.realName,
                email: formData.email
            },
            async: false,
            type: "post",
            dataType: 'json',
            success: function (res) {
                if (0 === res.code) {
                    formError.hide();
                    result = true;
                } else if (1 === res.code) {
                    formError.show(res.msg);
                }
            },
            error: function (error) {
                formError.show(error.text);
            }
        });
        return result;
    },

    /**
     * 表单验证
     * @param formData
     * @returns {{status: boolean, msg: string}}
     */
    formValidate: function (formData) {
        var result = {
            status: false,
            msg: "校验通过"
        };
        if (!util.validate(formData.username, 'require')) {
            result.msg = "用户名不能为空";
            return result;
        }
        if (!util.validate(formData.password, 'require')) {
            result.msg = "密码不能为空";
            return result;
        }
        if (formData.password !== formData.rePassword) {
            result.msg = "两次密码不一致";
            return result;
        }
        if (!util.validate(formData.realName, 'require')) {
            result.msg = "真实姓名不能为空";
            return result;
        }
        if (!util.validate(formData.email, 'email')) {
            result.msg = "邮箱格式不正确";
            return result;
        }
        result.status = true;
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
/**
 * 初始化加载该方法
 */
$(function () {
    /**
     * 初始化页面信息
     */
    page.init();

});

