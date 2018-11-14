package com.pojo;

import java.io.Serializable;
import java.util.Date;

/**
 * 用户
 * @author administrator
 *
 */
public class User implements Serializable{
	/** 用户id */
	private String cardId;
	/** 用户名 */
	private String userName;
	/** 用户性别 */
	private Integer gender;
	/** 获取从数据库注册的时间（包含时分秒） */
	private Date createTime;
	/** 密码 */
	private String password;
	/** 用户状态 */
	private Integer status;
	
	
	
	/**
	 * 用户添加
	 * @param cardId
	 * @param userName
	 * @param password
	 */
	public User(String cardId, String userName,String password) {
		this.cardId = cardId;
		this.userName = userName;
		//設置年齡
		gender(cardId);
		//获取系统时间
		this.password = password;
		this.status = 1;
	}
	
	
	/** 根据cardId判断用户男女 男偶为0，女奇为1 */
	public  void gender(String cardId) {
		int id = Integer.parseInt(cardId.substring(17));
		if(id%2==0) {
			gender=0;
		}else {
			gender=1;
		}
	}
	
	public User(String cardId, String userName, Integer gender, Date createTime, String password, Integer status) {
		this.cardId = cardId;
		this.userName = userName;
		this.gender = gender;
		this.createTime = createTime;
		this.password = password;
		this.status = status;
	}


	public User() {
	}


	public String getCardId() {
		return cardId;
	}


	public void setCardId(String cardId) {
		this.cardId = cardId;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public Integer getGender() {
		return gender;
	}


	public void setGender(Integer gender) {
		this.gender = gender;
	}


	public Date getCreateTime() {
		return createTime;
	}


	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public Integer getStatus() {
		return status;
	}


	public void setStatus(Integer status) {
		this.status = status;
	}


	@Override
	public String toString() {
		return "user [cardId=" + cardId + ", userName=" + userName + ", gender=" + gender + ", createTime=" + createTime
				+ ", password=" + password + ", status=" + status + "]";
	}
	
	
	
	
	
}
