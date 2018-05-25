package com.jhun.sharecar.common;

/**
 * 项目当中公用的一些状态枚举。<br>
 * 用户部分：1——普通用户  2——管理员
 *
 * @author chencong
 * @date 2018/5/16 12:49
 */
public class Const {

    /**
     * 用户登录session名称
     */
    public static String CURRENT_USER = "current_user";

    /**
     * 用户保存用户登录时刻产生的验证码信息
     */
    public static String PIC_CODE = "pic_code";

    /**
     * 默认密码
     */
    public static String PASSWORD = "123456";

    /**
     * 返回json数据时，Result当中code的状态。
     * SUCCESS 代表请求成功
     * ERROR 代表请求失败
     */
    public interface ResponseCode {
        int SUCCESS = 0;
        int ERROR = 1;
        int NEED_LOGIN = 10;
    }


    /**
     * 列举用户状态 USER 代表普通用户； ADMIN 代表管理员
     */
    public interface UserStatus {
        int USER = 1;
        int ADMIN = 2;
    }

    /**
     * 订单状态
     */
    public enum OrderStatus {
        /**
         * 已经支付
         */
        PAY(0, "已支付"),
        /**
         * 未支付
         */
        NO_PAY(1, "未支付"),
        /**
         * 正常
         */
        NORMAL(2, "正常"),
        /**
         * 不正常
         */
        ABNORMAL(3, "不正常"),
        CLOSED(10, "已关闭");
        private int code;
        private String msg;

        OrderStatus(int code, String msg) {
            this.code = code;
            this.msg = msg;
        }

        public int getCode() {
            return code;
        }

        public String getMsg() {
            return msg;
        }
    }

    /**
     * 汽车状态，上下架，停运 启用
     */
    public enum CarStatus {
        ON_LINE(0, "在线"),
        DOWN_LINE(1, "已停运"),
        UN_KNOWN(10, "未知错误");
        private String value;
        private int code;

        CarStatus(int code, String value) {
            this.code = code;
            this.value = value;
        }

        public String getValue() {
            return value;
        }

        public int getCode() {
            return code;
        }
    }
}
