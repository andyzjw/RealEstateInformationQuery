package com.dao;

import java.util.List;
import java.util.Map;

import com.pojo.RealEstate;

public interface RealEstateMapper {
	public List<RealEstate> queryAll(Map map);
	public int queryCount(Map map);
}
