package com.gocle.yangju.forest.usr.intro.web;

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

@Controller
@RequestMapping("/usr/intro/")
public class UserIntroController {
	
	@Autowired
	private UserIntroService userIntroService;

	@RequestMapping("{pgType}/list.do")
	public String introList(@PathVariable("pgType") String pgType, @ModelAttribute("form") UserIntroVO userIntroVO, ModelMap model) throws Exception {
		
		userIntroVO.setPgType(pgType);
		userIntroVO.setPageSize(8);
		List<UserIntroVO> resultList = userIntroService.selectIntroList(userIntroVO);
		
		int totalCnt = 0;
		Integer pageSize = userIntroVO.getPageSize();
		Integer pageIndex =	userIntroVO.getPageIndex();
		
		if(0 < resultList.size() ){
			totalCnt = Integer.parseInt( resultList.get(0).getTotalCount() );
		}
		
		PaginationInfo paginationInfo = new PaginationInfo();
	    paginationInfo.setCurrentPageNo(pageIndex);
        paginationInfo.setRecordCountPerPage(pageSize);
        paginationInfo.setPageSize(userIntroVO.getPageUnit());
        paginationInfo.setTotalRecordCount(totalCnt);
        
        model.addAttribute("pageSize", pageSize);
	    model.addAttribute("totalCount", totalCnt);
	    model.addAttribute("pageIndex", pageIndex);
	    model.addAttribute("paginationInfo", paginationInfo);
	    
        model.addAttribute("resultCnt", totalCnt);
		model.addAttribute("resultList", resultList);
		
		model.addAttribute("pgType", pgType);
		
		String menuId = userIntroVO.getMenuId();
		model.addAttribute("menuId", menuId);
		
		return "/usr/intro/" + pgType + "/list";
	}
	
	@RequestMapping("{pgType}/detail.do")
	public String introDetail(@PathVariable("pgType") String pgType, @ModelAttribute("form") UserIntroVO userIntroVO, ModelMap model) throws Exception {
		
		UserIntroVO result = userIntroService.selectOneIntro(userIntroVO);
		
		model.addAttribute("result", result);
		model.addAttribute("pgType", pgType);
		
		String menuId = userIntroVO.getMenuId();
		model.addAttribute("menuId", menuId);
		
		return "/usr/intro/" + pgType + "/detail";
	}
}
