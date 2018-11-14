package com.dao;

import java.util.List;

import com.pojo.User;

public interface UserDataMapper {
	/** 查询 */
	public List<User> query(User user);
	/** 添加*/
	public int add(User user);
}
