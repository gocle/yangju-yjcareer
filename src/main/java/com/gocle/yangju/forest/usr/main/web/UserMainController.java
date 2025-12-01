package com.gocle.yangju.forest.usr.main.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gocle.yangju.forest.usr.banner.service.UserBannerService;
import com.gocle.yangju.forest.usr.banner.vo.BannerVO;
import com.gocle.yangju.forest.usr.board.service.UserBoardService;
import com.gocle.yangju.forest.usr.board.vo.BoardArticleVO;
import com.gocle.yangju.forest.usr.code.service.UserCodeService;
import com.gocle.yangju.forest.usr.code.vo.CodeVO;
import com.gocle.yangju.forest.usr.intro.service.UserIntroService;
import com.gocle.yangju.forest.usr.intro.vo.UserIntroVO;
import com.gocle.yangju.forest.usr.reservation.service.UserReservationService;
import com.gocle.yangju.forest.usr.reservation.vo.UserReservationVO;

@Controller
public class UserMainController{

	private static final Logger LOG = LoggerFactory.getLogger(UserMainController.class);
	
	@Autowired
	private UserReservationService userReservationService;
	
	@Autowired
	UserBoardService boardService;
	
	@Autowired
	private UserBannerService bannerService;
	
	@Autowired
	UserCodeService codeService;
	
	/**
	 * 메인
	 * @param discussVO
	 * @return DiscussVO
	 * @throws Exception
	 */
	@RequestMapping(value = "usr/main.do")
	public String main(
			ModelMap model,
			HttpServletRequest request,
			HttpSession session) throws Exception {
		
		String returnPage = "";
		
		returnPage = "usr/main/main";
		
		return returnPage;
	}
	
	@RequestMapping(value = "usr/main/myReservation.do")
	public String myReservation(
			ModelMap model,
			HttpServletRequest request,
			HttpSession session,@RequestParam Map<String,Object> params) throws Exception {
		
		String returnPage = "";
		
		returnPage = "usr/main/myReservation";
		
		model.addAttribute("retMsg", params.get("retMsg"));
		
		return returnPage;
	}
	
	@RequestMapping(value = "usr/main/myReservationView.do")
	public String myReservationView(
			ModelMap model,
			HttpServletRequest request,
			HttpSession session) throws Exception {
		
		String returnPage = "";
		
		returnPage = "usr/main/myReservationView";
		
		return returnPage;
	}
	
	@RequestMapping(value = "/usr/reservation/listAjax.do", method = RequestMethod.GET)
	@ResponseBody
	public List<UserReservationVO> listAjax(UserReservationVO reservationVO) throws Exception {
	    if (reservationVO.getPgType() == null || reservationVO.getPgType().isEmpty()) {
	        reservationVO.setPgType("wood"); // 기본값
	    }
	    return userReservationService.selectReservationList(reservationVO);
	}
	
}
