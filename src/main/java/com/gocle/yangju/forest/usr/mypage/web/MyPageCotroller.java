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

import com.gocle.yangju.forest.adm.chsubjopen.vo.EnrollManageVo;
import com.gocle.yangju.forest.adm.chsubjopen.vo.SubjSeqManageVo;
import com.gocle.yangju.forest.adm.code.service.AdminCodeService;
import com.gocle.yangju.forest.adm.code.vo.CodeVO;
import com.gocle.yangju.forest.comm.file.service.FileService;
import com.gocle.yangju.forest.comm.file.vo.FileVO;
import com.gocle.yangju.forest.usr.mypage.service.MyPageService;
import com.gocle.yangju.forest.usr.mypage.vo.MyPageVo;
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
	
	@Autowired
	AdminCodeService adminCodeService;
	
	@Autowired
	FileService fileService;
	
	/**
	 * 나의 예약
	 */
	@RequestMapping("myReservation.do")
	public String myReservation(@ModelAttribute("myPageVo") MyPageVo myPageVo, HttpSession session, Model model, RedirectAttributes redirectAttributes) throws Exception {
		String diKey = (String) session.getAttribute(Globals.DI_KEY);
		String retMsg = "";
		if(diKey == null) {
			retMsg = "로그인이 필요한 서비스입니다.";
			redirectAttributes.addFlashAttribute("retMsg", retMsg);
			return "redirect:/usr/main.do";
		}
		
		myPageVo.setDiKey(diKey);
		
		int totalCount = myPageService.myReservationCnt(myPageVo);
		Integer pageSize = myPageVo.getPageSize();
		Integer pageIndex =	myPageVo.getPageIndex();
		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("pageIndex", pageIndex);
		
		PaginationInfo paginationInfo = new PaginationInfo();
	    paginationInfo.setCurrentPageNo(pageIndex);
        paginationInfo.setRecordCountPerPage(pageSize);
        paginationInfo.setPageSize(myPageVo.getPageUnit());
        paginationInfo.setTotalRecordCount(totalCount);
        
		List<MyPageVo> resultList = myPageService.myReservationList(myPageVo);
		
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("resultList", resultList);
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("menuId", myPageVo.getMenuId());
		
	    return "/usr/mypage/myReservation";
	}
	
	/**
	 * 나의 예약 상세
	 */
	@RequestMapping("myReservationView.do")
	public String myReservationView(@ModelAttribute("myPageVo") MyPageVo myPageVo, @ModelAttribute("subjSeqManageVo") SubjSeqManageVo subjSeqManageVo, HttpSession session, Model model, RedirectAttributes redirectAttributes) throws Exception {
		String diKey = (String) session.getAttribute(Globals.DI_KEY);
		String retMsg = "";
		if(diKey == null) {
			retMsg = "로그인이 필요한 서비스입니다.";
			redirectAttributes.addFlashAttribute("retMsg", retMsg);
			return "redirect:/usr/main.do";
		}
		
		myPageVo.setDiKey(diKey);
		myPageVo = myPageService.myReservationView(myPageVo);
		
		model.addAttribute("myPageVo", myPageVo);
		
		SubjSeqManageVo resultMap = userReservationService.selectSubjSeqEduInfo(subjSeqManageVo);
		model.addAttribute("resultMap", resultMap);
		
		CodeVO cvo = new CodeVO();
		cvo.setCodeGroup("RESDNC_DETAIL");
		model.addAttribute("resdncList", adminCodeService.selectCodeList(cvo));
		cvo.setCodeGroup("AGE_GROUP");
		model.addAttribute("ageList", adminCodeService.selectCodeList(cvo));
		cvo.setCodeGroup("GRADE");
		model.addAttribute("gradeList", adminCodeService.selectCodeList(cvo));
		cvo.setCodeGroup("EDU_TARGET");
		List<CodeVO> codeList = adminCodeService.selectCodeList(cvo);
		model.addAttribute("codeList", codeList);
		
		FileVO fvo = new FileVO();
		fvo.setpId(resultMap.getSeqCd());
		fvo.setThumbnailCrop("N");
		model.addAttribute("fileList", fileService.listProductFile(fvo));
		
		return "/usr/mypage/myReservationView";
	}
	
	/**
	 * 나의 예약 수정
	 */
	@RequestMapping("myReservationUpdateView.do")
	public String myReservationUpdateView(@ModelAttribute("myPageVo") MyPageVo myPageVo, @ModelAttribute("subjSeqManageVo") SubjSeqManageVo subjSeqManageVo, HttpSession session, Model model, RedirectAttributes redirectAttributes) throws Exception {
		String diKey = (String) session.getAttribute(Globals.DI_KEY);
		String retMsg = "";
		if(diKey == null) {
			retMsg = "로그인이 필요한 서비스입니다.";
			redirectAttributes.addFlashAttribute("retMsg", retMsg);
			return "redirect:/usr/main.do";
		}
		myPageVo.setDiKey(diKey);
		myPageVo = myPageService.myReservationView(myPageVo);
		
		model.addAttribute("myPageVo", myPageVo);
		
		SubjSeqManageVo resultMap = userReservationService.selectSubjSeqEduInfo(subjSeqManageVo);
		model.addAttribute("resultMap", resultMap);
		
		CodeVO cvo = new CodeVO();
		cvo.setCodeGroup("RESDNC_DETAIL");
		model.addAttribute("resdncList", adminCodeService.selectCodeList(cvo));
		cvo.setCodeGroup("AGE_GROUP");
		model.addAttribute("ageList", adminCodeService.selectCodeList(cvo));
		cvo.setCodeGroup("GRADE");
		model.addAttribute("gradeList", adminCodeService.selectCodeList(cvo));
		cvo.setCodeGroup("EDU_TARGET");
		List<CodeVO> codeList = adminCodeService.selectCodeList(cvo);
		model.addAttribute("codeList", codeList);
		
		return "/usr/mypage/myReservationView";
	}
	
	/**
	 * 수강취소
	 */
	@ResponseBody
	@RequestMapping("myReservationCancl.do")
	public Map<String, Object> myReservationCancl(@ModelAttribute("myPageVo") MyPageVo myPageVo, HttpSession session, Model model, RedirectAttributes redirectAttributes) throws Exception {
		Map<String, Object> result = new HashMap<>();
		try {
			String diKey = (String) session.getAttribute(Globals.DI_KEY);
			if (diKey == null) {
	            result.put("result", "fail");
	            result.put("message", "로그인이 필요한 서비스입니다.");
	            return result;
	        }
			myPageVo.setDiKey(diKey);
			myPageService.myReservationCancl(myPageVo);
			
			result.put("result", "success");
		} catch (Exception e) {
	        e.printStackTrace();
	        result.put("result", "fail");

	    }
		
		return result;
	}
	
	/**
	 * 나의 예약 수정
	 */
	@ResponseBody
	@RequestMapping("myReservationUpdate.do")
	public Map<String, Object> myReservationUpdate(@ModelAttribute("enrollManageVo") EnrollManageVo enrollManageVo, HttpSession session, Model model, RedirectAttributes redirectAttributes) throws Exception {
		Map<String, Object> result = new HashMap<>();
		try {
			String diKey = (String) session.getAttribute(Globals.DI_KEY);
			if (diKey == null) {
	            result.put("result", "fail");
	            result.put("message", "로그인이 필요한 서비스입니다.");
	            return result;
	        }
			enrollManageVo.setDiKey(diKey);
			myPageService.myReservationUpdate(enrollManageVo);
			
			result.put("result", "success");
		} catch (Exception e) {
	        e.printStackTrace();
	        result.put("result", "fail");
	    }
		
		return result;
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
