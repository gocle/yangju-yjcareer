package com.gocle.yangju.forest.usr.festa.web;

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
@RequestMapping("/usr/festa/")
public class UserFestaController {
	
	@RequestMapping("intro.do")
	public String intro(ModelMap model) throws Exception {
		
		return "/usr/festa/intro";
	}
	
	@RequestMapping("booth.do")
	public String booth(ModelMap model) throws Exception {
		
		return "/usr/festa/booth";
	}
	
	@RequestMapping("map.do")
	public String map(ModelMap model) throws Exception {
		
		return "/usr/festa/map";
	}
}
