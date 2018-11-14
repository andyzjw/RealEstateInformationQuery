package com.action;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.service.UserService;

@Controller
@RequestMapping("userData")
public class UserDataAction {
	@Resource
	private UserService UService;
	@RequestMapping("login")
	public String login(String cardId,String password,HttpSession session) {
		Map<String,Object> map= UService.loginCheck(cardId, password);
		if(map.get("msg")!=null&&!"".equals(map.get("msg"))) {
			session.setAttribute("loginMsg", map.get("msg"));
			return "redirect:/login.jsp";
		}else {
			session.setAttribute("user", map.get("user"));
			return "redirect:/pages/main.jsp";
		}
	}
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return  "redirect:/login.jsp";
	}
}
