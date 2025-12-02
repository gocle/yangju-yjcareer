package com.gocle.yangju.forest.usr.edu.web;

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
@RequestMapping("/usr/edu/")
public class UserEduController {
	
	@RequestMapping("intro.do")
	public String intro(ModelMap model) throws Exception {
		
		return "/usr/edu/intro";
	}
	
	@RequestMapping("contents.do")
	public String contents(ModelMap model) throws Exception {
		
		return "/usr/edu/contents";
	}
	
	@RequestMapping("location.do")
	public String location(ModelMap model) throws Exception {
		
		return "/usr/edu/location";
	}
}
