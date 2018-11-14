package com.pojo;

import java.io.Serializable;
import java.util.Date;

/**
 * 房地产
 * @author administrator
 *
 */
public class RealEstate implements Serializable {
	/** 房产id */
	private Integer id;
	/** 产权人身份证号  */
	private String cardId;
	/** 项目名字 */
	private String projectName;
	/** 具体位置   */
	private String address;
	/** 房屋类型 */
	private String houseType;
	/** 房屋面积 */
	private Integer area;
	/** 建造日期 */
	private Date buildTime;
	/** 产权人 */
	private String name;
	
	public RealEstate(Integer id, String cardId, String projectName, String address, String houseType, Integer area,
			Date buildTime) {
		this.id = id;
		this.cardId = cardId;
		this.projectName = projectName;
		this.address = address;
		this.houseType = houseType;
		this.area = area;
		this.buildTime = buildTime;
	}

	public RealEstate() {
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCardId() {
		return cardId;
	}

	public void setCardId(String cardId) {
		this.cardId = cardId;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getHouseType() {
		return houseType;
	}

	public void setHouseType(String houseType) {
		this.houseType = houseType;
	}

	public Integer getArea() {
		return area;
	}

	public void setArea(Integer area) {
		this.area = area;
	}

	public Date getBuildTime() {
		return buildTime;
	}

	public void setBuildTime(Date buildTime) {
		this.buildTime = buildTime;
	}

	@Override
	public String toString() {
		return "RealEstate [id=" + id + ", cardId=" + cardId + ", projectName=" + projectName + ", address=" + address
				+ ", houseType=" + houseType + ", area=" + area + ", buildTime=" + buildTime + "]";
	}
	
	
	
	
}
