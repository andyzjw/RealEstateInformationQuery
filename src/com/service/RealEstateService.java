package com.service;

import java.util.List;
import java.util.Map;

import com.pojo.RealEstate;

public interface RealEstateService {
	public List<RealEstate> query(Map map);
	public int totalNumber(Map map);
}
