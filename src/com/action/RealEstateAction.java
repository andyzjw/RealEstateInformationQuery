package com.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pojo.RealEstate;
import com.service.RealEstateService;
import com.util.PageAssistant;

@Controller
@RequestMapping("realEstate")
public class RealEstateAction {
	@Resource
	private RealEstateService REService;
	@RequestMapping("query")
	public String query(Integer currPage,Integer pageSize,String index,Integer condition,HttpSession session) {
		System.out.println("进来");
		Map<String,Object> map = new HashMap<>();
		
		PageAssistant pa = new PageAssistant();
		if(condition != null) {
			if(condition==1&&!"".equals(index)) {
				System.out.println(index);
				map.put("name", index);
			}else if(condition==2 && !"".equals(index)){
				System.out.println(index);
				map.put("cardId", index);
			}
		}
		
		pa.setCount(REService.totalNumber(map));
		System.out.println(pa.getCount());
		if(currPage!=null) {
			System.out.println(currPage);
			pa.setCurrPage(currPage);
		}
		if(pageSize!=null) {
			System.out.println(pageSize);
			pa.setPageSize(pageSize);
		}
		
		
		map.put("identifier", pa.getIdentifier());
		map.put("pageSize", pa.getPageSize());
		
		List<RealEstate> list=REService.query(map);
		
		session.setAttribute("condition", condition);
		session.setAttribute("index", index);
		session.setAttribute("estateInfo", list);
		session.setAttribute("pa", pa);
		return "redirect:/pages/realEstate/realEstateInfo.jsp";
	}
}
