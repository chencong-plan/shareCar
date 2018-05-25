package com.jhun.sharecar.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jhun.sharecar.common.Const;
import com.jhun.sharecar.common.Result;
import com.jhun.sharecar.dao.UserMapper;
import com.jhun.sharecar.pojo.User;
import com.jhun.sharecar.service.IUserService;
import com.jhun.sharecar.util.DateTimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @author chencong
 * @date 2018/5/16 12:44
 */

@Service
public class UserServiceImpl implements IUserService {

    @Autowired
    private UserMapper userMapper;

    /**
     * 根据id查询实体信息
     *
     * @param id id
     * @return 返回user对象
     */
    @Override
    public User selectById(int id) {
        return userMapper.selectById(id);
    }


    /**
     * 用户登录操作
     *
     * @param username
     * @param password
     * @param role
     * @return 返回user
     */
    @Override
    public User login(String username, String password, Integer role) {
        return userMapper.login(username, password, role);
    }

    @Override
    public int check(String msg, String type) {
        return userMapper.check(msg, type);
    }

    @Override
    public int register(User user) {
        user.setRole(Const.UserStatus.USER);
        return userMapper.insert(user);
    }

    @Override
    public int addAdmin(User user) {
        user.setRole(Const.UserStatus.ADMIN);
        if (user.getId() == null){
            /*新增*/
            return userMapper.insert(user);
        }else{
            /*更新*/
            return userMapper.updateById(user);
        }
    }

    @Override
    public Result getUserList(int role, int pageNum, int pageSize,String keyword,String type) {
        Page<User> page = PageHelper.startPage(pageNum, pageSize);
        List<User> userList = userMapper.selectUserListByRole(role,keyword,type);
        PageInfo<User> pageResult = new PageInfo<>(userList);
        pageResult.setList(userList);
        return new Result(Const.ResponseCode.SUCCESS,"请求成功",pageResult);
    }

    @Override
    public int delUser(int id,int role) {
        return userMapper.delUser(id ,role);
    }

    @Override
    public int resetPassword(int id, int role) {
        return userMapper.updateUserPassword(id,role,Const.PASSWORD);
    }

    @Override
    public User getUserById(Integer userId) {
        return userMapper.selectById(userId);
    }
}
