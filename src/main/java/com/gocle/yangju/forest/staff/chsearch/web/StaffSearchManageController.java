package com.gocle.yangju.forest.staff.chsearch.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gocle.yangju.forest.adm.chsearch.service.SearchManageService;
import com.gocle.yangju.forest.adm.chsgr.service.SgrManageService;
import com.gocle.yangju.forest.adm.chsubj.vo.SubjCateManageVo;
import com.gocle.yangju.forest.adm.company.vo.CompanyManageVo;

@RequestMapping(value = "/staff/chsearch")
@Controller(value = "staffSearchManageController")
public class StaffSearchManageController {
	
	@Autowired
    SgrManageService sgrManageService;
	
	@Autowired
	SearchManageService searchManageService;
	
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
    public List<SubjCateManageVo> selectSearchCateCdList(@RequestParam("sgrCd") String sgrCd) throws Exception {
        return searchManageService.selectCateCdList(sgrCd);
    }
    
    /**
     * 교육장소 주소를 조회
     */
    @ResponseBody
    @RequestMapping(value = "SearchEduPlaceAddress.do")
    public CompanyManageVo selectSearchEduPlaceAddress(@RequestParam("comId") String comId) throws Exception {
        return searchManageService.selectEduPlaceAddress(comId);
    }
}
