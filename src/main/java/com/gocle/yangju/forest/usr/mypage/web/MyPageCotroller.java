package com.gocle.yangju.forest.usr.mypage.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gocle.yangju.forest.usr.mypage.service.MyPageService;
import com.gocle.yangju.forest.usr.reservation.service.UserReservationService;
import com.gocle.yangju.forest.usr.reservation.vo.UserReservationVO;

import egovframework.com.cmm.service.Globals;


@Controller
@RequestMapping("/usr/mypage/")
public class MyPageCotroller {

	@Autowired
	MyPageService myPageService;
	
	@Autowired
	UserReservationService userReservationService;
	
	/**
	 * 나의 예약
	 * @param session
	 * @param model
	 * @param redirectAttributes
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("myReservation.do")
	public String myReservation(HttpSession session, Model model, RedirectAttributes redirectAttributes) throws Exception {
		String diKey = (String) session.getAttribute(Globals.DI_KEY);
		String retMsg = "";
		if(diKey == null) {
			retMsg = "로그인이 필요한 서비스입니다.";
			redirectAttributes.addFlashAttribute("retMsg", retMsg);
			return "redirect:/usr/main.do";
		}
		UserReservationVO urVO = new UserReservationVO();
		urVO.setDiKey(diKey);
		List<UserReservationVO> resultList = myPageService.myReservationList(urVO);
		
		int totalCnt = 0;
		Integer pageSize = urVO.getPageSize();
		Integer pageIndex =	urVO.getPageIndex();
		
		if(0 < resultList.size() ){
			totalCnt = Integer.parseInt( resultList.get(0).getTotalCount() );
		}
		
		PaginationInfo paginationInfo = new PaginationInfo();
	    paginationInfo.setCurrentPageNo(pageIndex);
        paginationInfo.setRecordCountPerPage(pageSize);
        paginationInfo.setPageSize(urVO.getPageUnit());
        paginationInfo.setTotalRecordCount(totalCnt);
        
        model.addAttribute("resultList", resultList);
        model.addAttribute("pageSize", pageSize);
	    model.addAttribute("totalCount", totalCnt);
	    model.addAttribute("pageIndex", pageIndex);
	    model.addAttribute("paginationInfo", paginationInfo);
	    
	    return "/usr/mypage/myReservation";
	}
	
	/**
	 * 나의 예약 상세
	 * @param userReservationVO
	 * @param session
	 * @param model
	 * @param redirectAttributes
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("myReservationView.do")
	public String myReservationView(@ModelAttribute("form")UserReservationVO userReservationVO, HttpSession session, Model model, RedirectAttributes redirectAttributes) throws Exception {
		String diKey = (String) session.getAttribute(Globals.DI_KEY);
		String retMsg = "";
		if(diKey == null) {
			retMsg = "로그인이 필요한 서비스입니다.";
			redirectAttributes.addFlashAttribute("retMsg", retMsg);
			return "redirect:/usr/main.do";
		}
		userReservationVO.setDiKey(diKey);
		userReservationVO = myPageService.myReservationView(userReservationVO);
		
		model.addAttribute("userReservationVO", userReservationVO);
		
		return "/usr/mypage/myReservationView";
	}
	
	
	/**
	 * 예약취소
	 * @param userReservationVO
	 * @param session
	 * @param model
	 * @param redirectAttributes
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("cancelResv.do")
	public Map<String, Object> cancelResv(@ModelAttribute("form")UserReservationVO userReservationVO, HttpSession session, Model model, RedirectAttributes redirectAttributes) throws Exception {
		Map<String, Object> result = new HashMap<>();
		try {
			String diKey = (String) session.getAttribute(Globals.DI_KEY);
			if (diKey == null) {
	            result.put("result", "fail");
	            result.put("message", "로그인이 필요한 서비스입니다.");
	            return result;
	        }
			userReservationVO.setDiKey(diKey);
			myPageService.cancelResv(userReservationVO);
			
			result.put("result", "success");
	        result.put("message", "취소되었습니다.");
		} catch (Exception e) {
	        e.printStackTrace();
	        result.put("result", "fail");
	        result.put("message", "예약 취소 중 오류가 발생했습니다.");
	    }
		
		return result;
	}
}
