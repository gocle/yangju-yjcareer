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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gocle.yangju.forest.adm.chsubjopen.vo.EnrollManageVo;
import com.gocle.yangju.forest.usr.banner.service.UserBannerService;
import com.gocle.yangju.forest.usr.banner.vo.BannerVO;
import com.gocle.yangju.forest.usr.board.service.UserBoardService;
import com.gocle.yangju.forest.usr.board.vo.BoardArticleVO;
import com.gocle.yangju.forest.usr.chinfo.service.SubjInfoService;
import com.gocle.yangju.forest.usr.chinfo.vo.SubjInfoVo;
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
	SubjInfoService subjInfoService;
	
	@Autowired
	UserCodeService codeService;
	
	/**
	 * 메인(index)
	 */
	@RequestMapping(value = "index.do")
	public String index() throws Exception {
		return "redirect:/usr/main.do";
	}
			
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
		
		// 과정소개
		SubjInfoVo subjInfoVo = new SubjInfoVo();
		// 1:1 상시상담
		subjInfoVo.setSearchSgrCd("A");
		model.put("subjManageListA", subjInfoService.selectMainList(subjInfoVo));
		// 꿈자람센터 프로그램
		subjInfoVo.setSearchSgrCd("B");
		model.put("subjManageListB", subjInfoService.selectMainList(subjInfoVo));
		// 행사 및 강좌
		subjInfoVo.setSearchSgrCd("C");
		model.put("subjManageListC", subjInfoService.selectMainList(subjInfoVo));
		
		model.put("popupList", subjInfoService.selectPopupList(subjInfoVo));
		
		// 메인 게시판
		BoardArticleVO boardArticleVO = new BoardArticleVO();
		boardArticleVO.setBaNotice("0");
		
		// 공지사항
		boardArticleVO.setBcId("notice");
		model.put("noticList", boardService.listBoardArticle(boardArticleVO));
		
		// 자료싫
		boardArticleVO.setBcId("photo");
		model.put("photoList", boardService.listBoardArticle(boardArticleVO));
		
		return "usr/main/main";
	}
	
	@RequestMapping("usr/loadSchedule.do")
	@ResponseBody
	public List<Map<String, Object>> loadSchedule(@ModelAttribute("searchVo") EnrollManageVo searchVo) throws Exception {
		
		searchVo.setSearchSgrCd("B");

		List<Map<String, Object>> resultList = userReservationService.selectProgramList(searchVo);

		return resultList;
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
