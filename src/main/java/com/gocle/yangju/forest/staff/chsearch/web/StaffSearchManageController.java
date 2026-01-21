package com.gocle.yangju.forest.staff.chsearch.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gocle.yangju.forest.adm.chsearch.service.SearchManageService;
import com.gocle.yangju.forest.adm.chsgr.service.SgrManageService;
import com.gocle.yangju.forest.adm.chsubj.vo.SubjCateManageVo;
import com.gocle.yangju.forest.adm.chuser.service.UsrManageService;
import com.gocle.yangju.forest.adm.chuser.vo.UsrManageVo;
import com.gocle.yangju.forest.adm.company.vo.CompanyManageVo;

import egovframework.com.cmm.service.Globals;

@RequestMapping(value = "/staff/chsearch")
@Controller(value = "staffSearchManageController")
public class StaffSearchManageController {
	
	@Autowired
    SgrManageService sgrManageService;
	
	@Autowired
	SearchManageService searchManageService;
	
	@Autowired
    private UsrManageService usrManageService;
	
	/**
     * 과정(대)분류의 목록을 조회
     */
    @ResponseBody
    @RequestMapping(value = "SearchSgrList.do")
    public List<SubjCateManageVo> selectSearchSgrList() throws Exception {
        return searchManageService.selectSgrList();
    }
    
	/**
     * 과정(소)분류의 목록을 조회
     */
    @ResponseBody
    @RequestMapping(value = "SearchCateCdList.do")
    public List<SubjCateManageVo> selectSearchCateCdList(@RequestParam("sgrCd") String sgrCd, HttpSession session) throws Exception {
    	String memId = (String) session.getAttribute(Globals.M_ID);
        return searchManageService.selectCateCdList(sgrCd, memId);
    }
    
    /**
     * 교육기관의 교육장소 목록을 조회
     */
    @ResponseBody
    @RequestMapping(value = "SearchLocationList.do")
    public List<CompanyManageVo> selectSearchLocationList(@RequestParam("comId") String comId) throws Exception {
        return searchManageService.selectLocationList(comId);
    }
    
    /**
     * 교육생 검색 팝업
     */
    @RequestMapping(value ="/popup/UsrManageSearchInsertList.do")
    public String selectUsrManageSearchInsertList(@ModelAttribute("searchVo") UsrManageVo searchVo, ModelMap model) throws Exception {
    	
    	int totalCount = this.usrManageService.selectUserSearchTotalCount(searchVo);
		List<UsrManageVo> resultList = this.usrManageService.selectUserSearchList(searchVo);
		
		Integer pageSize = searchVo.getPageSize();
		Integer pageIndex = searchVo.getPageIndex();

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(pageIndex);
        paginationInfo.setRecordCountPerPage(pageSize);
        paginationInfo.setPageSize(searchVo.getPageUnit());
        paginationInfo.setTotalRecordCount(totalCount);
		
        model.addAttribute("paginationInfo", paginationInfo);
        model.addAttribute("pageIndex", pageIndex);
		model.addAttribute("pageSize", pageSize);
		
		model.addAttribute("searchVo", searchVo);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("resultList", resultList);
		
    	return "staff/chsearch/popup/UsrManageSearchInsertList";
    }
    
    /**
     * 1:1 상담 교육생 검색 팝업
     */
    @RequestMapping(value ="/popup/UsrManageSearchInsertListA.do")
    public String selectUsrManageSearchInsertListA(@ModelAttribute("searchVo") UsrManageVo searchVo, ModelMap model) throws Exception {
    	
    	model.addAttribute("subjSeqList", searchManageService.selectSubjSeqList(searchVo.getSubjCd()));
    	
    	int totalCount = this.usrManageService.selectUserSearchTotalCount(searchVo);
		List<UsrManageVo> resultList = this.usrManageService.selectUserSearchList(searchVo);
		
		Integer pageSize = searchVo.getPageSize();
		Integer pageIndex = searchVo.getPageIndex();

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(pageIndex);
        paginationInfo.setRecordCountPerPage(pageSize);
        paginationInfo.setPageSize(searchVo.getPageUnit());
        paginationInfo.setTotalRecordCount(totalCount);
		
        model.addAttribute("paginationInfo", paginationInfo);
        model.addAttribute("pageIndex", pageIndex);
		model.addAttribute("pageSize", pageSize);
		
		model.addAttribute("searchVo", searchVo);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("resultList", resultList);
		
    	return "staff/chsearch/popup/UsrManageSearchInsertListA";
    }
}
