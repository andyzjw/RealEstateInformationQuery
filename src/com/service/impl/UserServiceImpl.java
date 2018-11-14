package com.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.UserDataMapper;
import com.pojo.User;
import com.service.UserService;
@Service("UService")
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDataMapper mapper;
	
	/** 用户登录查询 */
	public Map<String,Object> loginCheck(String cardId, String pwd) {
		String msg = "";
		User u = new User();
		u.setCardId(cardId);
		Map<String, Object> map = new HashMap<>();
		// 查询用户id是否存在
		List<User> list = mapper.query(u);
		if (list.size() == 0) {
			msg = "该账号不存在,请先注册！";
		} else {
			// 获取用户数据
			u = list.get(0);
			// 判断密码 用户状态
			if (pwd.equals(u.getPassword())) {
				if (u.getStatus() == 0) {
					msg = "登录失败，该账号已被冻结";
				} else {
					msg = "";
				}
			} else {
				msg = "登录失败，身份证号或密码错误！";
			}
		}
			map.put("msg", msg);
			map.put("user", u);
		return map;
	}
	
	/** 注册所需要的Id */
	public String checkCardId(String cardId) {
		//接收信息
		String msg = "";
		User u = new User();
		// 将id设置进行查询
		u.setCardId(cardId);
		//查询并接收结果
		List<User> list= mapper.query(u);
		if(list.size()!=0) {
			msg = "身份证号已被注册";
		}
		
		return msg;
	}
	/** 添加用户 */
	public int addUser(String cardId, String name, String password) {
		User u = new User(cardId, name, password);
		return mapper.add(u);
	}
	
	
	
	

}
