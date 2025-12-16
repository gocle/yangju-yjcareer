package com.gocle.yangju.forest.staff.chsubjopen.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import com.gocle.yangju.forest.adm.chsearch.service.SearchManageService;
import com.gocle.yangju.forest.adm.chsubj.service.SubjManageService;
import com.gocle.yangju.forest.adm.chsubjopen.service.EnrollManageService;
import com.gocle.yangju.forest.adm.chsubjopen.service.SubjSeqManageService;
import com.gocle.yangju.forest.adm.chsubjopen.vo.EnrollManageVo;
import com.gocle.yangju.forest.adm.chsubjopen.vo.SubjSeqManageVo;
import com.gocle.yangju.forest.comm.vo.LoginInfo;

import egovframework.com.cmm.service.Globals;

@RequestMapping(value = "/staff/chsubjopen")
@Controller(value = "staffEnrollManageController")
public class StaffEnrollManageController {
	@Autowired
    SearchManageService searchManageService;
	
	@Autowired
	SubjManageService subjManageService;
	
	@Autowired
	SubjSeqManageService subjSeqManageService;
	
	@Autowired
	EnrollManageService enrollManageService;
	
	@RequestMapping(value = "EnrollManageList.do")
	public String EnrollManageList(@ModelAttribute("searchVo") EnrollManageVo searchVo
			, HttpSession session, ModelMap model) throws Exception {
		
		String sessionMemType = (String) session.getAttribute(Globals.MEM_TYPE);
		searchVo.setSessionMemType(sessionMemType);
		
		String sessionMemSeq = (String) session.getAttribute(Globals.MEM_SEQ);
		searchVo.setSessionMemSeq(sessionMemSeq);
		
		int totalCount = this.enrollManageService.selectTotalCount(searchVo);
		List<EnrollManageVo> resultList = enrollManageService.selectList(searchVo);
		
		Integer pageSize = searchVo.getPageSize();
		Integer pageIndex = searchVo.getPageIndex();

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(pageIndex);
        paginationInfo.setRecordCountPerPage(pageSize);
        paginationInfo.setPageSize(searchVo.getPageUnit());
        paginationInfo.setTotalRecordCount(totalCount);
        
        model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("resultList", resultList);
		
		model.addAttribute("menuId", searchVo.getMenuId());
		model.addAttribute("sgrManageList", searchManageService.selectSgrList());
		model.addAttribute("searchVo", searchVo);
		
		return "/staff/chsubjopen/EnrollManageList";
	}
	
	@RequestMapping(value = "EnrollDetailManageList.do")
	public String EnrollDetailManageList(@ModelAttribute("enrollManageVo") EnrollManageVo searchVo
			, @ModelAttribute("subjSeqManageVo") SubjSeqManageVo subjSeqManageVo, ModelMap model) throws Exception {
		
		model.addAttribute("menuId", searchVo.getMenuId());
		model.addAttribute("resultMap", subjSeqManageService.select(subjSeqManageVo));
		
		int totalCount = this.enrollManageService.selectEnrollDetailTotalCount(searchVo);
		List<EnrollManageVo> resultList = this.enrollManageService.selectEnrollDetailList(searchVo);
		
		Integer pageSize = searchVo.getPageSize();
		Integer pageIndex = searchVo.getPageIndex();
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(pageIndex);
        paginationInfo.setRecordCountPerPage(pageSize);
        paginationInfo.setPageSize(searchVo.getPageUnit());
        paginationInfo.setTotalRecordCount(totalCount);
		
        model.addAttribute("searchVo", searchVo);
        model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("resultList", resultList);
		model.addAttribute("pageIndex", pageIndex);
		model.addAttribute("pageSize", pageSize);
		
		return "/staff/chsubjopen/EnrollDetailManageList";
	}
	
	@RequestMapping("/popup/EnrollDetailManageInsertForm.do")
	public String EnrollManageInsertForm(@ModelAttribute("enrollManageVo") EnrollManageVo enrollManageVo
			,@ModelAttribute("subjSeqManageVo") SubjSeqManageVo subjSeqManageVo, ModelMap model) throws Exception {
		model.addAttribute("cmd", "Insert");
		model.addAttribute("resultMap", subjSeqManageService.select(subjSeqManageVo));
		
		return "/staff/chsubjopen/popup/EnrollDetailManageForm";
	}
	
	@RequestMapping("/popup/EnrollDetailManageUpdateForm.do")
	public String EnrollManageUpdateForm(@ModelAttribute("enrollManageVo") EnrollManageVo enrollManageVo
			,@ModelAttribute("subjSeqManageVo") SubjSeqManageVo subjSeqManageVo, ModelMap model) throws Exception {
		model.addAttribute("cmd", "Update");
		model.addAttribute("resultMap", subjSeqManageService.select(subjSeqManageVo));
		model.addAttribute("userInfo", enrollManageService.selectEnrollUserInfo(enrollManageVo));
		return "/staff/chsubjopen/popup/EnrollDetailManageForm";
	}
	
	@ResponseBody
	@RequestMapping(value = "EnrollDetailManageInsert.do")
	public String EnrollDetailManageInsert(@ModelAttribute("enrollManageVo") EnrollManageVo enrollManageVo, SessionStatus status) throws Exception {
		
		String retMsg;
		
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.putSessionToVo(enrollManageVo);
		
		int result = enrollManageService.insert(enrollManageVo);
		
		if (result > 0) {
            retMsg = "등록되었습니다.";
            status.setComplete();
        } else {
            retMsg = "등록에 실패했습니다.";
        }
		
		return retMsg;
	}
	
	@ResponseBody
	@RequestMapping(value = "EnrollDetailManageUpdate.do")
	public String EnrollDetailManageUpdate(@ModelAttribute("enrollManageVo") EnrollManageVo enrollManageVo, SessionStatus status) throws Exception {
		
		String retMsg;
		
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.putSessionToVo(enrollManageVo);
		
		int result = enrollManageService.update(enrollManageVo);
		
		if (result > 0) {
            retMsg = "수정되었습니다.";
            status.setComplete();
        } else {
            retMsg = "수정에 실패했습니다.";
        }
		
		return retMsg;
	}
	
	@ResponseBody
	@RequestMapping(value = "EnrollDetailManageDelete.do")
	public String EnrollDetailManageDelete(@ModelAttribute("enrollManageVo") EnrollManageVo enrollManageVo, SessionStatus status) throws Exception {
		
		String retMsg = "";
		
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.putSessionToVo(enrollManageVo);
		
		int result = enrollManageService.delete(enrollManageVo);
		
		if (result > 0) {
            retMsg = "삭제되었습니다.";
            status.setComplete();
        } else {
            retMsg = "삭제에 실패했습니다.";
        }
		
		return retMsg;
	}
	
	@ResponseBody
	@RequestMapping(value = "EnrollDetailManageApply.do")
	public String EnrollDetailManageApply(@ModelAttribute("enrollManageVo") EnrollManageVo enrollManageVo, SessionStatus status) throws Exception {
		String retMsg = "";
		
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.putSessionToVo(enrollManageVo);
		
		enrollManageService.updateEnrollApply(enrollManageVo);
		
		// 수강승인처리된 수강생이 1명 이상인 경우
		if(enrollManageVo.getUserCnt() > 0) {
			if (enrollManageVo.getEduErrCnt() > 0 || enrollManageVo.getDupErrCnt() > 0) {
				status.setComplete();
				retMsg = enrollManageVo.getUserCnt() + "명 수강승인 되었습니다.\n"
						+ enrollManageVo.getDupErrCnt() + "명은 이미 수강승인 상태입니다.\n"+ enrollManageVo.getEduErrCnt()
						+ "명은 수강승인 실패하였습니다.\n(수강신청이 되어 있지 않거나 삭제된 수강생인지 확인하세요.)";
			} else {
				status.setComplete();
				retMsg = enrollManageVo.getUserCnt() + "명 수강 승인이 완료 되었습니다.";
			}
		} else {
			if (enrollManageVo.getEduErrCnt() > 0 || enrollManageVo.getDupErrCnt() > 0) {
				retMsg = enrollManageVo.getDupErrCnt() + "명은 이미 수강승인 상태입니다.\n"
						+ enrollManageVo.getEduErrCnt() + "명 수강승인 실패하였습니다.\n(수강신청 정보가 없거나 삭제된 수강생인지 확인하세요.)";
			} else {
				retMsg = "수강 승인에 실패 하였습니다.";
			}
		}
		
		return retMsg;
	}
	
	@ResponseBody
	@RequestMapping(value = "EnrollDetailManageApplyCancel.do")
	public String EnrollDetailManageApplyCancel(@ModelAttribute("enrollManageVo") EnrollManageVo enrollManageVo, SessionStatus status) throws Exception {
		String retMsg = "";
		
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.putSessionToVo(enrollManageVo);
		
		enrollManageService.updateEnrollApplyCancel(enrollManageVo);
		
		// 승인취소처리된 수강생이 1명 이상인 경우
		if(enrollManageVo.getUserCnt() > 0) {
			if (enrollManageVo.getEduErrCnt() > 0 || enrollManageVo.getDupErrCnt() > 0) {
				status.setComplete();
				retMsg = enrollManageVo.getUserCnt() + "명 승인취소 되었습니다.\n"
						+ enrollManageVo.getDupErrCnt() + "명은 이미 승인취소 상태입니다.\n"+ enrollManageVo.getEduErrCnt()
						+ "명은 승인취소 실패하였습니다.\n(수강신청이 되어 있지 않거나 삭제된 수강생인지 확인하세요.)";
			} else {
				status.setComplete();
				retMsg = enrollManageVo.getUserCnt() + "명 승인취소가 완료 되었습니다.";
			}
		} else {
			if (enrollManageVo.getEduErrCnt() > 0 || enrollManageVo.getDupErrCnt() > 0) {
				retMsg = enrollManageVo.getDupErrCnt() + "명은 이미 승인취소 상태입니다.\n"
						+ enrollManageVo.getEduErrCnt() + "명 승인취소 실패하였습니다.\n(수강신청 정보가 없거나 삭제된 수강생인지 확인하세요.)";
			} else {
				retMsg = "승인취소에 실패 하였습니다.";
			}
		}
		
		return retMsg;
	}
}
