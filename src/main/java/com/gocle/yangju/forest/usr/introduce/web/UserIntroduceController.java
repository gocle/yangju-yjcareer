package com.gocle.yangju.forest.usr.introduce.web;

import java.util.List;

import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gocle.yangju.forest.adm.program.vo.ProgramVO;

import egovframework.com.cmm.service.EgovProperties;

@Controller
@RequestMapping("/usr/introduce/")
public class UserIntroduceController {
	
	@RequestMapping("intro.do")
	public String intro(ModelMap model) throws Exception {
		
		return "/usr/introduce/intro";
	}
	
	@RequestMapping("vision.do")
	public String vision(ModelMap model) throws Exception {
		
		return "/usr/introduce/vision";
	}
	
	@RequestMapping("business.do")
	public String business(ModelMap model) throws Exception {
		
		return "/usr/introduce/business";
	}
	
	@RequestMapping("map.do")
	public String map(ModelMap model) throws Exception {
		
		return "/usr/introduce/map";
	}
	

	@RequestMapping("woodCenter.do")
	public String woodCenter(ModelMap model) throws Exception {
		
		return "/usr/introduce/woodCenter";
	}
	
	@RequestMapping("woodInfo.do")
	public String woodInfo(ModelMap model) throws Exception {
		
		return "/usr/introduce/woodInfo";
	}
	
	@RequestMapping("woodLoad.do")
	public String woodLoad(ModelMap model) throws Exception {
		
		model.addAttribute("appKey", EgovProperties.getProperty("Globals.appKey"));
		
		return "/usr/introduce/woodLoad";
	}
	
	@RequestMapping("forestEdu.do")
	public String forestEdu(ModelMap model) throws Exception {
		
		return "/usr/introduce/forestEdu";
	}
	
	@RequestMapping("forestInfo.do")
	public String forestInfo(ModelMap model) throws Exception {
		
		return "/usr/introduce/forestInfo";
	}
	
	@RequestMapping("forestStatus.do")
	public String forestStatus(ModelMap model) throws Exception {
		
		return "/usr/introduce/forestStatus";
	}
}
