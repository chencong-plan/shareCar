package com.jhun.sharecar.service;

import com.jhun.sharecar.common.Result;
import com.jhun.sharecar.pojo.User;

import java.util.List;

/**
 * @author chencong
 * @date 2018/5/16 12:43
 */
public interface IUserService {

    /**
     * 根据id查询实体信息
     *
     * @param id id
     * @return 返回user对象
     */
    User selectById(int id);

    /**
     * 用户登录操作
     *
     * @param username
     * @param password
     * @param role
     * @return 返回user
     */
    User login(String username,String password,Integer role);

    /**
     *
     * @param msg
     * @param type
     * @return
     */
    int check(String msg, String type);

    int register(User user);

    int addAdmin(User user);

    Result getUserList(int role, int pageNum, int pageSize,String keyword ,String type);

    int delUser(int id,int role);

    /**
     * 重置密码
     * @param id
     * @param role
     * @return
     */
    int resetPassword(int id, int role);

    User getUserById(Integer userId);

    Result updateUserInfo(User currentUser, String type, String value);
}
