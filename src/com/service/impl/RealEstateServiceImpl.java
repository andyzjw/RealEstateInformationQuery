package com.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.RealEstateMapper;
import com.pojo.RealEstate;
import com.service.RealEstateService;

@Service("REService")
public class RealEstateServiceImpl implements RealEstateService {
	@Autowired
	private RealEstateMapper mapper;
	
	public List<RealEstate> query(Map map) {
		return mapper.queryAll(map);
	}

	public int totalNumber(Map map) {
		return mapper.queryCount(map);
	}
}
