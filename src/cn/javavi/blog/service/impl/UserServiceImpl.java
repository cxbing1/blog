package cn.javavi.blog.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import cn.javavi.blog.mapper.UserMapper;
import cn.javavi.blog.po.User;
import cn.javavi.blog.service.UserService;

public class UserServiceImpl implements UserService{

	@Autowired
	private UserMapper userMapper;
	@Override
	public User findUserById(String id) {

		User user=userMapper.findUserById(id);
		
		return user;
		
	}

}
