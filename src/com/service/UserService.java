package com.service;

import java.util.List;
import java.util.Map;

public interface UserService {
	/**登录判断*/
	public Map<String,Object> loginCheck(String cardId,String pwd);
	/** 注册账号查询 */
	public String checkCardId(String cardId);
	/** 注册添加 */
	public int addUser(String cardId,String name,String password);
}
