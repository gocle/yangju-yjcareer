package com.gocle.yangju.forest.adm.code.web;

import java.util.List;

import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gocle.yangju.forest.adm.code.service.AdminCodeService;
import com.gocle.yangju.forest.adm.code.vo.CodeVO;
import com.gocle.yangju.forest.comm.vo.LoginInfo;


@Controller
@RequestMapping("/adm/standinfo/code/")
public class AdminCodeController {

	@Autowired
	AdminCodeService adminCodeService;
	
	/**
	 * 코드 리스트 조회
	 * @param codeVO
	 * @param redirectAttributes
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("list.do")
	public String getCodeList(@ModelAttribute("form") CodeVO codeVO, RedirectAttributes redirectAttributes, ModelMap model) throws Exception {
		
		String menuId = codeVO.getMenuId();
		List<CodeVO> codeConfigList = adminCodeService.codeConfigList(codeVO);
		
		int totalCnt = 0;
		Integer pageSize = codeVO.getPageSize();
		Integer pageIndex = codeVO.getPageIndex();
		if( 0 < codeConfigList.size() ){ 
			totalCnt =Integer.parseInt(codeConfigList.get(0).getTotalCount());
		}
		model.addAttribute("pageSize", pageSize);
	    model.addAttribute("totalCount", totalCnt);
	    model.addAttribute("pageIndex", pageIndex);
	    
	    PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setCurrentPageNo(pageIndex);
        paginationInfo.setRecordCountPerPage(pageSize);
        paginationInfo.setPageSize(codeVO.getPageUnit());
        paginationInfo.setTotalRecordCount(totalCnt);
        
        model.addAttribute("paginationInfo", paginationInfo);
        model.addAttribute("menuId", menuId);
        model.addAttribute("codeConfigList", codeConfigList);
        
        return "adm/standinfo/code/list";
	}
	
	/**
	 * 코드관리 > 입력폼
	 * @param codeVO
	 * @param redirectAttributes
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("form.do")
	public String insertCodeForm(@ModelAttribute("form") CodeVO codeVO, RedirectAttributes redirectAttributes, ModelMap model) throws Exception {
		
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.putSessionToVo(codeVO);
		
		String menuId = codeVO.getMenuId();
		
		List<CodeVO> codeConfigFormList = adminCodeService.codeConfigFormList(codeVO);
		model.addAttribute("codeConfigFormList", codeConfigFormList);
		model.addAttribute("menuId", menuId);
		
		return "adm/standinfo/code/form";
	}
	
	/**
	 * 코드등록
	 * @param codeVO
	 * @param redirectAttributes
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("insert.do")
	public String insertCode(@ModelAttribute("form") CodeVO codeVO, RedirectAttributes redirectAttributes) throws Exception {
		
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.putSessionToVo(codeVO);
		
		String menuId = codeVO.getMenuId();
		String retMsg = "";
		
		int result = adminCodeService.codeInsert(codeVO);
		if(result > 0) {
			retMsg = "등록되었습니다.";
		} else {
			retMsg = "등록할 수 없습니다.";
		}
		
		redirectAttributes.addFlashAttribute("retMsg",retMsg);
		
		return "redirect:/adm/standinfo/code/list.do?menuId="+menuId;
	}
	
	/**
	 * 코드 상세
	 * @param codeVO
	 * @param redirectAttributes
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("detail.do")
	public String codeDetail(@ModelAttribute("form") CodeVO codeVO, RedirectAttributes redirectAttributes, ModelMap model) throws Exception {
		
		String menuId = codeVO.getMenuId();
		
		List<CodeVO> codeConfigFormList = adminCodeService.codeConfigFormList(codeVO);
		CodeVO codeResult = adminCodeService.selectCode(codeVO);
		
		model.addAttribute("codeResult", codeResult);
		model.addAttribute("codeConfigFormList", codeConfigFormList);
		model.addAttribute("menuId", menuId);
		
		return "adm/standinfo/code/form";
	}
	
	/**
	 * 코드 수정
	 * @param codeVO
	 * @param redirectAttributes
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("update.do")
	public String codeUpdate(@ModelAttribute("form") CodeVO codeVO, RedirectAttributes redirectAttributes, ModelMap model) throws Exception {
		
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.putSessionToVo(codeVO);
		
		String menuId = codeVO.getMenuId();
		String retMsg = "";
		
		int result = adminCodeService.codeUpdate(codeVO);
		if(result > 0) {
			retMsg = "수정되었습니다.";
		} else {
			retMsg = "수정할 수 없습니다.";
		}
		model.addAttribute("menuId", menuId);
		redirectAttributes.addFlashAttribute("retMsg",retMsg);
		
		return "redirect:/adm/standinfo/code/list.do?menuId="+menuId;
	}
	
	/**
	 * 코드 삭제
	 * @param codeVO
	 * @param redirectAttributes
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("delete.do")
	public String codeDelete(@ModelAttribute("form") CodeVO codeVO, RedirectAttributes redirectAttributes, ModelMap model) throws Exception {
		
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.putSessionToVo(codeVO);
		
		String menuId = codeVO.getMenuId();
		String retMsg = "";
		
		int result = adminCodeService.codeDelete(codeVO);
		if(result > 0) {
			retMsg="삭제되었습니다.";
		} else {
			retMsg="삭제할 수 없습니다.";
		}
		
		return "redirect:/adm/standinfo/code/list.do?menuId="+menuId;
	}
}
