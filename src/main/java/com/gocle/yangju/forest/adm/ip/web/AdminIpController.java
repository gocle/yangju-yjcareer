package com.gocle.yangju.forest.adm.ip.web;

import java.util.List;

import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gocle.yangju.forest.adm.ip.service.AdminIpService;
import com.gocle.yangju.forest.adm.ip.vo.IpVO;
import com.gocle.yangju.forest.comm.util.IpAccessCache;
import com.gocle.yangju.forest.comm.vo.LoginInfo;

@Controller
@RequestMapping("/adm/ip/")
public class AdminIpController {

	@Autowired
	AdminIpService adminIpService;
	
	@Autowired
    private IpAccessCache ipAccessCache;
	
	
	/**
	 * 관리자 접근 ip리스트
	 * @param ipVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("list.do")
	public String ipList(@ModelAttribute("form")IpVO ipVO, ModelMap model) throws Exception {
		
		String menuId = ipVO.getMenuId();
		
		List<IpVO> resultList = adminIpService.selectAccessIpList(ipVO);
		
		int totalCnt = 0;
		Integer pageSize = ipVO.getPageSize();
		Integer pageIndex = ipVO.getPageIndex();
		
		if(resultList.size() > 0) {
			totalCnt =Integer.parseInt(resultList.get(0).getTotalCount());
		}
		
	    PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setCurrentPageNo(pageIndex);
        paginationInfo.setRecordCountPerPage(pageSize);
        paginationInfo.setPageSize(ipVO.getPageUnit());
        paginationInfo.setTotalRecordCount(totalCnt);
        
        model.addAttribute("pageSize", pageSize);
	    model.addAttribute("totalCount", totalCnt);
	    model.addAttribute("pageIndex", pageIndex);
        model.addAttribute("paginationInfo", paginationInfo);
        
        model.addAttribute("resultList", resultList);
        model.addAttribute("ipVO", ipVO);
        model.addAttribute("menuId",menuId);
		
		return "adm/ip/list";
	}
	
	/**
	 * 관리자 접근 ip등록
	 * @param ipVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("form.do")
	public String ipInsertForm(@ModelAttribute("form")IpVO ipVO, ModelMap model) throws Exception {
		
		String menuId = ipVO.getMenuId();
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.putSessionToVo(ipVO);
		
		model.addAttribute("ipVO", ipVO);
		model.addAttribute("menuId", menuId);
		
		return "adm/ip/form";
	}
	
	/**
	 * 접근가능 ip 등록
	 * @param ipVO
	 * @param redirectAttributes
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("insertAccessIp.do")
	public String addIp (@ModelAttribute("form")IpVO ipVO, RedirectAttributes redirectAttributes, ModelMap model) throws Exception {
		
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.putSessionToVo(ipVO);
		String menuId = ipVO.getMenuId();
		String retMsg = "";
		
		int result = adminIpService.insertAccessIp(ipVO);
		if(result > 0) {
			retMsg = "저장되었습니다.";
			ipAccessCache.refresh();
		} else {
			retMsg = "저장할 수 없습니다.";
		}
		redirectAttributes.addFlashAttribute("retMsg", retMsg);
		
		
		return "redirect:/adm/ip/list.do?menuId="+ menuId;
	}
	
	/**
	 * 관리자 접근 IP 삭제 
	 * @param ipVO
	 * @param redirectAttributes
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("deleteIp.do")
	public String deleteProgram(@ModelAttribute("form")IpVO ipVO, RedirectAttributes redirectAttributes) throws Exception {
		
		String menuId = ipVO.getMenuId();
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.putSessionToVo(ipVO);
		String retMsg = "";
		
		int result = 0;
		result = adminIpService.deleteIp(ipVO);
		if(result > 0) {
			retMsg = "삭제되었습니다.";
			ipAccessCache.refresh();
		} else {
			retMsg = "삭제할 수 없습니다.";
		}
		redirectAttributes.addFlashAttribute("retMsg", retMsg);
		
		return "redirect:/adm/ip/list.do?menuId="+ menuId;
	}
}
