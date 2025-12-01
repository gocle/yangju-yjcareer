package com.gocle.yangju.forest.adm.pay.web;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gocle.yangju.forest.adm.pay.service.AdminPayService;
import com.gocle.yangju.forest.adm.pay.vo.PayForm;
import com.gocle.yangju.forest.adm.pay.vo.PayVO;
import com.gocle.yangju.forest.adm.program.service.AdminProgramService;
import com.gocle.yangju.forest.adm.program.vo.ProgramVO;
import com.gocle.yangju.forest.adm.reservation.vo.ReservationVO;


@Controller
@RequestMapping("/staff/pay/")
public class StaffPayController {

	@Autowired
	AdminPayService adminPayService;
	
	@Autowired
	AdminProgramService adminProgramService;
	
	
	/**
	 * 프로그램 목록
	 * @param pgType
	 * @param reservationVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("{pgType}/list.do")
	public String programList(@PathVariable("pgType") String pgType, @ModelAttribute("form")ReservationVO reservationVO, ModelMap model) throws Exception {
		
		String menuId = reservationVO.getMenuId();
		ProgramVO pvo = new ProgramVO();
		pvo.setPgType(pgType);
		pvo.setSearchCondition(reservationVO.getSearchCondition());
		pvo.setSearchKeyword(reservationVO.getSearchKeyword());
		List<ProgramVO> resultList = adminPayService.selectProgramList(pvo);
		
		int totalCnt = 0;
		Integer pageSize = reservationVO.getPageSize();
		Integer pageIndex = reservationVO.getPageIndex();
		
		if(resultList.size() > 0) {
			totalCnt =Integer.parseInt(resultList.get(0).getTotalCount());
		}
		
	    PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setCurrentPageNo(pageIndex);
        paginationInfo.setRecordCountPerPage(pageSize);
        paginationInfo.setPageSize(pvo.getPageUnit());
        paginationInfo.setTotalRecordCount(totalCnt);
        
        model.addAttribute("pageSize", pageSize);
	    model.addAttribute("totalCount", totalCnt);
	    model.addAttribute("pageIndex", pageIndex);
        model.addAttribute("paginationInfo", paginationInfo);
        
        model.addAttribute("resultList", resultList);
        model.addAttribute("reservationVO", reservationVO);
        model.addAttribute("programVO", pvo);
        model.addAttribute("menuId",menuId);
		model.addAttribute("pgType", pgType);
		
		return "/staff/pay/" + pgType + "/list";
	}
	
	/**
	 * 결제 목록
	 * @param pgType
	 * @param payVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("{pgType}/payList.do")
	public String payList(@PathVariable("pgType") String pgType, @ModelAttribute("form") PayVO payVO, ModelMap model) throws Exception {
		
		String menuId = payVO.getMenuId();
		ProgramVO pvo = new ProgramVO();
		pvo.setPgId(payVO.getPgId());
		pvo.setPgType(pgType);
		pvo.setPgName(payVO.getPgName());
		pvo.setSearchCondition(payVO.getSearchCondition());
		pvo.setSearchKeyword(payVO.getSearchKeyword());
		
		List<PayVO> payList = adminPayService.getPayList(payVO);
		
		int totalCnt = 0;
		Integer pageSize = payVO.getPageSize();
		Integer pageIndex = payVO.getPageIndex();
		if(payList.size() > 0) {
			totalCnt =Integer.parseInt(payList.get(0).getTotalCount());
		}
		
		PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setCurrentPageNo(pageIndex);
        paginationInfo.setRecordCountPerPage(pageSize);
        paginationInfo.setPageSize(payVO.getPageUnit());
        paginationInfo.setTotalRecordCount(totalCnt);
        
        model.addAttribute("menuId",menuId);
        model.addAttribute("payList", payList);
        model.addAttribute("programVO", pvo);
        model.addAttribute("pageSize", pageSize);
	    model.addAttribute("totalCount", totalCnt);
	    model.addAttribute("pageIndex", pageIndex);
        model.addAttribute("paginationInfo", paginationInfo);
		
		return "/staff/pay/" + pgType + "/payList";
	}
	
	/**
	 * 결제 수정 폼
	 * @param pgType
	 * @param payVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("{pgType}/payForm.do")
	public String payForm(@PathVariable("pgType") String pgType, @ModelAttribute("form") PayVO payVO, ModelMap model) throws Exception {
		
		String menuId = payVO.getMenuId();
		ProgramVO pvo = new ProgramVO();
		pvo.setPgId(payVO.getPgId());
		pvo.setPgType(pgType);
		pvo.setSearchCondition(payVO.getSearchCondition());
		pvo.setSearchKeyword(payVO.getSearchKeyword());
		
		List<PayVO> payList = adminPayService.getPayList(payVO);
		
		int totalCnt = 0;
		Integer pageSize = payVO.getPageSize();
		Integer pageIndex = payVO.getPageIndex();
		if(payList.size() > 0) {
			totalCnt =Integer.parseInt(payList.get(0).getTotalCount());
		}
		
		PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setCurrentPageNo(pageIndex);
        paginationInfo.setRecordCountPerPage(pageSize);
        paginationInfo.setPageSize(payVO.getPageUnit());
        paginationInfo.setTotalRecordCount(totalCnt);
        
        model.addAttribute("menuId",menuId);
        model.addAttribute("payList", payList);
        model.addAttribute("programVO", pvo);
        model.addAttribute("pageSize", pageSize);
	    model.addAttribute("totalCount", totalCnt);
	    model.addAttribute("pageIndex", pageIndex);
        model.addAttribute("paginationInfo", paginationInfo);
		
		return "/staff/pay/" + pgType + "/payForm";
	}
	
	/**
	 * 결제 정보 등록
	 * @param pgType
	 * @param payForm
	 * @param model
	 * @param redirectAttributes
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("{pgType}/update.do")
	public String updatePay(@PathVariable("pgType") String pgType, @ModelAttribute("form") PayForm payForm, ModelMap model, RedirectAttributes redirectAttributes) throws Exception {
		
		String retMsg = "";
		String menuId = payForm.getMenuId();
	    try {
	        List<PayVO> payList = payForm.getPayList();
	        for (PayVO vo : payList) {
	            if (vo.getPayId() == null || vo.getPayId().isEmpty()) {
	            	vo.setPgId(payForm.getPgId());
	                adminPayService.insertPayInfo(vo);
	            } else {
	            	adminPayService.updatePayInfo(vo);
	            }
	        }
	        retMsg = "등록되었습니다.";
	    } catch (Exception e) {
	    	retMsg = "등록중 오류가 발생했습니다.";
	        e.printStackTrace();
	    }

	    redirectAttributes.addFlashAttribute("retMsg", retMsg);
	    
		return "redirect:/staff/pay/" + pgType + "/payList.do?menuId=" + menuId + "&pgId=" + payForm.getPgId();
	}
	
	/**
	 * 세금계산서 팝업
	 * @param pgType
	 * @param payVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("{pgType}/taxPopup.do")
	public String taxPopup(@PathVariable("pgType") String pgType, @ModelAttribute("form") PayVO payVO, ModelMap model, HttpServletResponse response) throws Exception {
		if (payVO.getPayId().isEmpty()) {
		    String retMsg = "결제정보가 존재하지 않습니다.";
		    
		    response.setContentType("text/html; charset=UTF-8");
		    PrintWriter out = response.getWriter();
		    out.println("<script>");
		    out.println("alert('" + retMsg + "');");
		    out.println("window.opener.location.reload();");
		    out.println("window.close();");
		    out.println("</script>");
		    out.close();
		    return null; 
		}
		
		payVO = adminPayService.getPayInfo(payVO);
		if (payVO == null) {
			String retMsg = "결제정보가 존재하지 않습니다.";
		    
		    response.setContentType("text/html; charset=UTF-8");
		    PrintWriter out = response.getWriter();
		    out.println("<script>");
		    out.println("alert('" + retMsg + "');");
		    out.println("window.opener.location.reload();");
		    out.println("window.close();");
		    out.println("</script>");
		    out.close();
		    return null;
		}
		
		model.addAttribute("supplierName", "양주 목재 문화체험장");
	    model.addAttribute("supplierRegNo", "123-45-67890");
	    model.addAttribute("customerName", 	payVO.getName());
	    model.addAttribute("productName", payVO.getProductName());
	    model.addAttribute("payDt", payVO.getPayDt());
	    model.addAttribute("peopleCnt", payVO.getPeopleCnt());
	    model.addAttribute("amount", payVO.getAmount());
	    model.addAttribute("note", payVO.getNote());
	    
		return "/staff/pay/" + pgType + "/taxPopup";
	}
	
}
