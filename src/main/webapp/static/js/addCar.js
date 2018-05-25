/**
 * @author liuquanhui
 * @Date 2018-5-22 16:37:10
 * 添加汽车
 * */

var page = {
    selectData: {
        carType: '',
        productName: '',
        operation: ''
    },
    init: function () {
        this.bindEvent();
        this.reloadCarType();
    },
    /**
     * 各种事件的绑定
     */
    bindEvent: function () {
        var _this = this;
        $('#btn-add-car').click(function () {
            var formData = {
                carName: $.trim($('.car-name').val()),
                carType: _this.selectData.carType,
                /*这里是写死的所以不存在id,所以获取text,上面的carType有id 所以获取value */
                productName: _this.selectData.productName,
                operation: _this.selectData.operation,
                carPay: $.trim($('.car-pay').val()),
                /*这里还有图片地址，暂未写*/
                imageUrl: '/uploads/201805220001.jpg'
            };
            console.log(formData);
            var validateResult = _this.formValidate(formData);
            if (validateResult.status) {
                /*数据通过检验，隐藏提示信息*/
                formError.hide();
                console.log(validateResult);
                _this.insertCar(formData);
            } else {
                /*数据不通过校验，提示错误信息*/
                formError.show(validateResult.msg);
            }
        });

        /**
         * 获取汽车类型
         * 这里是写死的所以不存在id,所以获取text,上面的carType有id 所以获取value
         */
        $('#car-type-select').on('change', function () {
            var option = $('#car-type-select option:selected');
            page.selectData.carType = option.val();
        });
        /**
         * 获取生产商
         * 这里是写死的所以不存在id,所以获取text,上面的carType有id 所以获取value
         */
        $('.car-product-name').on('change', function () {
            var option = $('.car-product-name option:selected');
            page.selectData.productName = option.text();
        });
        /**
         * 获取运营商
         */
        $('.car-operation').on('change', function () {
            var option = $('.car-operation option:selected');
            page.selectData.operation = option.text();
        });

    },
    /**
     * 插入数据库
     * @param formData
     */
    insertCar: function (formData) {
        $.ajax({
            url: '/manage/car/addCar',
            data: {
                carTypeId: formData.carType,
                name: formData.carName,
                productName: formData.productName,
                imageUrl: formData.imageUrl,
                operation: formData.operation,
                pay: formData.carPay
            },
            type: 'post',
            dataType: 'json',
            success: function (res) {
                if (res.code === 0) {
                    /*请求成功，跳转回汽车列表页面*/
                    window.location.href="/manage/car";
                    console.log(res);
                }
            },
            error: function (error) {
                console.log(error);
            }

        });
    },
    /**
     * 加载汽车类型
     */
    reloadCarType: function () {
        var _this = this;
        $.ajax({
            url: '/manage/car/cartype/list',
            type: 'get',
            dataType: 'json',
            success: function (res) {
                // console.log(res);
                _this.renderHtml(res.data);
            },
            error: function (error) {

            }
        });
    },
    /**
     * 绘制汽车类型下拉框
     * @param data
     */
    renderHtml: function (data) {
        var $carType = $('#car-type-select');
        $carType.html('');
        var length = data.list.length;
        for (var i = 0; i < length; i++) {
            $op = "<option value='" + data.list[i].id + "'>" + data.list[i].carType+"    ("+data.list[i].price+"元/h)</option>";
            $carType.append($op);
        }
        $carType.selectpicker('refresh');
    },
    /**
     * 各项数据验证
     * @param formData
     */
    formValidate: function (formData) {
        var result = {
            status: false,
            msg: "校验通过"
        };
        if (!util.validate(formData.carName, 'require')) {
            result.msg = "汽车名不能为空";
            return result;
        }
        if (!util.validate(formData.carType, 'require')) {
            result.msg = "汽车类型不能为空";
            return result;
        }
        if (!util.validate(formData.productName, 'require')) {
            result.msg = "汽车生产商不能为空";
            return result;
        }
        if (!util.validate(formData.operation, 'require')) {
            result.msg = "汽车运营商不能为空";
            return result;
        }
        if (!util.validate(formData.carPay, 'require')) {
            result.msg = "租赁价格不能为空";
            return result;
        }
        result.status = true;
        return result;

    }
};


/**
 * 错误提示
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
 * 准备给Bootstrap fileinput文件上传插件使用
 * @type {{init: filePlugin.init}}
 */
var filePlugin = {
    init: function (ctrlName) {
        var control = $('#' + ctrlName);
        control.fileinput({
            language: 'zh', //设置语言
            uploadUrl: "", //上传的地址
            allowedFileExtensions: ['jpg', 'gif', 'png'],//接收的文件后缀
            maxFilesNum: 5,//上传最大的文件数量
            //uploadExtraData:{"id": 1, "fileName":'123.mp3'},
            uploadAsync: true, //默认异步上传
            showUpload: true, //是否显示上传按钮
            showRemove: true, //显示移除按钮
            showPreview: true, //是否显示预览
            showCaption: false,//是否显示标题
            browseClass: "btn btn-primary", //按钮样式
            //dropZoneEnabled: true,//是否显示拖拽区域
            //minImageWidth: 50, //图片的最小宽度
            //minImageHeight: 50,//图片的最小高度
            //maxImageWidth: 1000,//图片的最大宽度
            //maxImageHeight: 1000,//图片的最大高度
            maxFileSize: 0,//单位为kb，如果为0表示不限制文件大小
            //minFileCount: 0,
            //maxFileCount: 10, //表示允许同时上传的最大文件个数
            enctype: 'multipart/form-data',
            validateInitialCount: true,
            previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",
            msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",

        }).on('filepreupload', function (event, data, previewId, index) {     //上传中
            var form = data.form, files = data.files, extra = data.extra,
                response = data.response, reader = data.reader;
            console.log('文件正在上传');
        }).on("fileuploaded", function (event, data, previewId, index) {    //一个文件上传成功
            console.log('文件上传成功！' + data.id);

        }).on('fileerror', function (event, data, msg) {  //一个文件上传失败
            console.log('文件上传失败！' + data.id);
        })
    }

};

$(function () {
    page.init();
    filePlugin.init('modal-car-image');
});