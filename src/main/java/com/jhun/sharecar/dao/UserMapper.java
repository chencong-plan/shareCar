package com.jhun.sharecar.dao;

import com.jhun.sharecar.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author chencong
 * @date 2018/5/16 12:05
 */
public interface UserMapper {

    /**
     * 根据id查询实体信息
     *
     * @param id id
     * @return 返回user对象
     */
    User selectById(Integer id);


    /**
     * 登录操作
     *
     * @param username
     * @param password
     * @param role
     * @return
     */
    User login(@Param("username") String username, @Param("password") String password, @Param("role") Integer role);

    int check(@Param("msg") String msg, @Param("type") String type);

    int insert(User user);

    int updateById(User user);

    List<User> selectUserListByRole(@Param("role") int role, @Param("keyword") String keyword, @Param("type") String type);

    int delUser(@Param("id") int id, @Param("role") int role);

    int updateUserPassword(@Param("id") int id, @Param("role") int role, @Param("password") String password);

    int updateUserInfo(@Param("id") Integer id, @Param("type") String type, @Param("value") String value);

}
