package com.gocle.yangju.forest.usr.layout.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserLayoutController {

	private static final Logger LOG = LoggerFactory.getLogger(UserLayoutController.class);
	
	@RequestMapping(value = "usr/layout/top.do")
	public String top(@ModelAttribute("form") ModelMap model,HttpServletRequest request, HttpSession session) throws Exception {
	
		String returnPage = "";
		
		returnPage = "usr/layout/top"; 
		
		return returnPage;
	}
	
	@RequestMapping(value = "usr/layout/footer.do")
	public String footer(
	ModelMap model,
	HttpServletRequest request,
	HttpSession session) throws Exception {
		
		String returnPage = "";
		
		returnPage = "usr/layout/footer"; 
		
		return returnPage;
	}
	
	
	
}
