package com.gocle.yangju.forest.usr.support.web;

import java.util.List;

import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gocle.yangju.forest.adm.program.vo.ProgramVO;
import com.gocle.yangju.forest.usr.intro.service.UserIntroService;
import com.gocle.yangju.forest.usr.intro.vo.UserIntroVO;
import com.gocle.yangju.forest.usr.reservation.service.UserReservationService;
import com.gocle.yangju.forest.usr.reservation.vo.UserReservationVO;
import com.gocle.yangju.forest.usr.support.service.UserSupportService;

@Controller
@RequestMapping("/usr/support/")
public class UserSupportController {
	
	@Autowired
	private UserSupportService userSupportService;
	
	@RequestMapping("intro.do")
	public String intro(ModelMap model) throws Exception {
		
		return "/usr/support/intro";
	}
	
	@RequestMapping("list.do")
	public String list(ModelMap model) throws Exception {
		
		return "/usr/support/list";
	}
	
	@RequestMapping("form.do")
	public String form(ModelMap model) throws Exception {
		
		return "/usr/support/form";
	}
}
