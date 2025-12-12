package com.gocle.yangju.forest.adm.company.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gocle.spring.vo.OrderVo;
import com.gocle.yangju.forest.adm.chsgr.service.SgrManageService;
import com.gocle.yangju.forest.adm.chsgr.vo.SgrManageDefaultVo;
import com.gocle.yangju.forest.adm.chsgr.vo.SgrManageVo;
import com.gocle.yangju.forest.adm.chsubj.service.SubjCateManageService;
import com.gocle.yangju.forest.adm.chsubj.vo.SubjCateManageDefaultVo;
import com.gocle.yangju.forest.adm.chsubj.vo.SubjCateManageVo;
import com.gocle.yangju.forest.adm.company.service.CompanyManageService;
import com.gocle.yangju.forest.adm.company.vo.CompanyManageVo;
import com.gocle.yangju.forest.comm.vo.LoginInfo;

@RequestMapping(value = "/adm/company")
@Controller(value = "companyManageController")
public class CompanyManageController {

	@Autowired
	CompanyManageService companyManageService;
	
	@Autowired
    SubjCateManageService subjCateManageService;

	@Autowired
    SgrManageService sgrManageService;
	
	@RequestMapping( value = {"list.do"} , method = RequestMethod.GET)
	public String boardListGet(
			CompanyManageVo companyManageVo,
			RedirectAttributes redirectAttributes,
			ModelMap model) throws Exception {
		
		String retMsg = ""; 
		
		// 로그인 체크
		String returnPage = "";	
		
		//해당 타입 리스트
		List<CompanyManageVo> resultList = companyManageService.listBoardArticle(companyManageVo);
		
		int totalCnt = 0;
		
		
		Integer pageSize = companyManageVo.getPageSize();
		Integer pageIndex = companyManageVo.getPageIndex();
		
		if( 0 < resultList.size() ){ 
			totalCnt =Integer.parseInt( resultList.get(0).getTotalCount() );
		}
		
		model.addAttribute("pageSize", pageSize);
		
	    model.addAttribute("totalCount", totalCnt);
	    
	    model.addAttribute("pageIndex", pageIndex);
	    
	    PaginationInfo paginationInfo = new PaginationInfo();

        paginationInfo.setCurrentPageNo(pageIndex);
        paginationInfo.setRecordCountPerPage(pageSize);
        paginationInfo.setPageSize(companyManageVo.getPageUnit());
        paginationInfo.setTotalRecordCount(totalCnt);
      
        model.addAttribute("paginationInfo", paginationInfo);
        
        model.addAttribute("articleList", resultList);
        
        
		model.addAttribute("companyManageVo", companyManageVo);
		
		returnPage = "/adm/company/list";
		
		return returnPage;
		
	}
	
	@RequestMapping( value = { "insert.do"} , method = RequestMethod.GET)
	public String boardInsertGet(CompanyManageVo companyManageVo,
			HttpServletRequest request,
			RedirectAttributes redirectAttributes,
			ModelMap model) throws Exception {
		
		String returnPage = "";	
		
		returnPage = "/adm/company/form";
		
		SgrManageVo sgrManageVo = new SgrManageVo();
		SubjCateManageVo subjCateManageVo = new SubjCateManageVo();
		model.addAttribute("sgrManageList", this.sgrManageService.selectList(sgrManageVo));
        model.addAttribute("resultList", this.subjCateManageService.selectList(subjCateManageVo));
        
		return returnPage;
	}
	
	@RequestMapping( value = { "insert.do"} , method = RequestMethod.POST)
	public String boardInsertPost(
			CompanyManageVo companyManageVo,
			ModelMap model,
			RedirectAttributes redirectAttributes,
			HttpSession session
			) throws Exception {
		
		
		LoginInfo loginInfo = new LoginInfo(); // 세션
		loginInfo.putSessionToVo(companyManageVo); // session의 정보를 VO에 추가.
			
		String returnPage = "";	
		
		String retMsg = "";
		
		int rs = 0;
		
		rs = companyManageService.insertBoardArticle(companyManageVo);
		
		if(rs > 0){
		
			retMsg = "정상적으로 처리됬습니다.";
			
		}else{
			
			retMsg = "저장 처리 건이 없습니다.";
			
		}
		
		
		redirectAttributes.addFlashAttribute("retMsg", retMsg);
	
		returnPage = "/adm/company/list.do";
		
		return "redirect:"+returnPage;
		
	}
	
	@RequestMapping( value = { "update.do"} , method = RequestMethod.GET)
	public String boarUpdateGet(CompanyManageVo companyManageVo,
			HttpServletRequest request,
			RedirectAttributes redirectAttributes,
			ModelMap model) throws Exception {
		
		String returnPage = "";	
		
		companyManageVo = companyManageService.getBoardArticle(companyManageVo);
		
		model.addAttribute("companyManageVo", companyManageVo);
		
		List<CompanyManageVo> companyLocation = companyManageService.getLocation(companyManageVo);
		
		model.addAttribute("companyLocation", companyLocation);
		
		returnPage = "/adm/company/form";
		
		SgrManageVo sgrManageVo = new SgrManageVo();
		model.addAttribute("sgrManageList", this.sgrManageService.selectList(sgrManageVo));
        model.addAttribute("resultList", companyManageService.getMapping(companyManageVo));
        
		return returnPage;
	}
	
	@RequestMapping( value = { "update.do"} , method = RequestMethod.POST)
	public String boardUpdatePost(
			CompanyManageVo companyManageVo,
			ModelMap model,
			RedirectAttributes redirectAttributes,
			HttpSession session
			) throws Exception {
		
		
		LoginInfo loginInfo = new LoginInfo(); // 세션
		loginInfo.putSessionToVo(companyManageVo); // session의 정보를 VO에 추가.
			
		String returnPage = "";	
		
		String retMsg = "";
		
		int rs = 0;
		
		rs = companyManageService.updateBoardArticle(companyManageVo);
		
		if(rs > 0){
		
			retMsg = "정상적으로 처리됬습니다.";
			
		}else{
			
			retMsg = "저장 처리 건이 없습니다.";
			
		}
		
		
		redirectAttributes.addFlashAttribute("retMsg", retMsg);
	
		returnPage = "/adm/company/list.do";
		
		return "redirect:"+returnPage;
		
	}
	
	@RequestMapping( value = { "delete.do"} , method = RequestMethod.POST)
	public String boardDeletePost(
			CompanyManageVo companyManageVo,
			ModelMap model,
			RedirectAttributes redirectAttributes,
			HttpSession session
			) throws Exception {
		
		
		LoginInfo loginInfo = new LoginInfo(); // 세션
		loginInfo.putSessionToVo(companyManageVo); // session의 정보를 VO에 추가.
			
		String returnPage = "";	
		
		String retMsg = "";
		
		int rs = 0;
		
		rs = companyManageService.deleteBoardArticle(companyManageVo);
		
		if(rs > 0){
		
			retMsg = "정상적으로 처리됬습니다.";
			
		}else{
			
			retMsg = "삭제 처리 건이 없습니다.";
			
		}
		
		
		redirectAttributes.addFlashAttribute("retMsg", retMsg);
	
		returnPage = "/adm/company/list.do";
		
		return "redirect:"+returnPage;
		
	}
}
