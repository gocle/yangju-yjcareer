package com.gocle.yangju.forest.adm.member.web;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gocle.yangju.forest.adm.company.service.CompanyManageService;
import com.gocle.yangju.forest.adm.company.vo.CompanyManageVo;
import com.gocle.yangju.forest.adm.member.service.AdminMemberService;
import com.gocle.yangju.forest.adm.member.vo.MemberVO;
import com.gocle.yangju.forest.comm.vo.LoginInfo;

@Controller
@RequestMapping("/adm/member/")
public class AdminMemberController {

	@Autowired
	private AdminMemberService adminMemberService;
	
	@Autowired
	private CompanyManageService companyManageService;
	
	/**
	 * 회원관리 > 회원관리
	 * @param memberVO
	 * @param redirectAttributes
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("memconfig/list.do")
	public String getMemList(@ModelAttribute("form") MemberVO memberVO, RedirectAttributes redirectAttributes, ModelMap model) throws Exception {
		
		String menuId = memberVO.getMenuId();
		
		List<MemberVO> memberList = adminMemberService.getMemberList(memberVO);
		
		int totalCnt = 0;
		Integer pageSize = memberVO.getPageSize();
		Integer pageIndex = memberVO.getPageIndex();
		if(memberList.size() > 0) {
			totalCnt = Integer.parseInt(memberList.get(0).getTotalCount());
		}
		
		model.addAttribute("pageIndex", pageIndex);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("totalCount", totalCnt);
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(pageIndex);
        paginationInfo.setRecordCountPerPage(pageSize);
        paginationInfo.setPageSize(memberVO.getPageUnit());
        paginationInfo.setTotalRecordCount(totalCnt);
		
		model.addAttribute("memberList", memberList);
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("menuId", menuId);
		
		return "/adm/member/memconfig/list";
	}
	
	/**
	 * 회원 관리 > 등록 폼
	 * @param memberVO
	 * @param redirectAttributes
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("memconfig/form.do")
	public String memInsertForm (@ModelAttribute("form") MemberVO memberVO, RedirectAttributes redirectAttributes, ModelMap model) throws Exception {
		
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.putSessionToVo(memberVO);
		
		String menuId = memberVO.getMenuId();
		model.addAttribute("menuId");
		
		CompanyManageVo companyManageVo = new CompanyManageVo();
		model.addAttribute("companyList", companyManageService.listBoardArticle(companyManageVo));
		
		return "/adm/member/memconfig/form";
	}
	
	/**
	 * 회원 등록
	 * @param memberVO
	 * @param redirectAttributes
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "memconfig/insertForm.do")
	public String memInsert(@ModelAttribute MemberVO memberVO, RedirectAttributes redirectAttributes, ModelMap model) throws Exception {
		
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.putSessionToVo(memberVO);
		
		String menuId = memberVO.getMenuId();
		String retMsg = "";
		
		int result = adminMemberService.memberInsert(memberVO);
		if(result > 0) {
			retMsg = "등록되었습니다";
		} else {
			retMsg = "등록할 수 없습니다.";
		}
		
		redirectAttributes.addFlashAttribute("retMsg" , retMsg);
		model.addAttribute("menuId",menuId);
		
		return "redirect:/adm/member/memconfig/list.do?menuId=" + menuId;
	}
	
	/**
	 * 아이디 중복체크
	 * @param memId
	 * @param redirectAttributes
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("idForm.do")
	public String idDupCheck(@RequestParam("memId") String memId, RedirectAttributes redirectAttributes, ModelMap model) throws Exception {
		String result = adminMemberService.idDupCheck(memId);
		return result;
	}
	
	/**
	 * 회원 관리 > 회원 상세 수정폼
	 * @param memberVO
	 * @param redirectAttributes
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("memconfig/updateForm.do")
	public String memUpdateForm(@ModelAttribute("form") MemberVO memberVO, ModelMap model) throws Exception {
		
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.putSessionToVo(memberVO);
		
		String menuId = memberVO.getMenuId();
		
		MemberVO adminUpdateResult = adminMemberService.adminUpdateResult(memberVO);
		model.addAttribute("adminUpdateResult", adminUpdateResult);
		model.addAttribute("menuId", menuId);
		
		CompanyManageVo companyManageVo = new CompanyManageVo();
		model.addAttribute("companyList", companyManageService.listBoardArticle(companyManageVo));
		
		return "/adm/member/memconfig/form";
	}
	
	/**
	 * 회원정보 수정
	 * @param memberVO
	 * @param redirectAttributes
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("memconfig/update.do")
	public String memUpdate(@ModelAttribute("form") MemberVO memberVO, RedirectAttributes redirectAttributes, ModelMap model) throws Exception {
		
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.putSessionToVo(memberVO);
		
		String menuId = memberVO.getMenuId();
		String retMsg = "";
		
		int result = adminMemberService.memberUpdate(memberVO);
		if(result > 0) {
			retMsg = "수정되었습니다.";
		}  else {
			retMsg = "수정할 수 없습니다.";
		}
		redirectAttributes.addFlashAttribute("retMsg" , retMsg);
		model.addAttribute("menuId", menuId);
		
		return "redirect:/adm/member/memconfig/list.do?menuId=" + menuId;
	}
	
	/**
	 * 회원 삭제
	 * @param memberVO
	 * @param redirectAttributes
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("memconfig/delete.do")
	public String memDelete (@ModelAttribute("form") MemberVO memberVO, RedirectAttributes redirectAttributes, ModelMap model) throws Exception {
		
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.putSessionToVo(memberVO);
		
		String menuId = memberVO.getMenuId();
		String retMsg = "";
		
		int result = adminMemberService.memberDelete(memberVO);
		if(result > 0) {
			retMsg = "삭제되었습니다.";
		}  else {
			retMsg = "삭제할 수 없습니다.";
		}
		
		redirectAttributes.addFlashAttribute("retMsg" , retMsg);
		model.addAttribute("menuId",menuId);
		
		return "redirect:/adm/member/memconfig/list.do?menuId=" + menuId;
	}
	
	/**
	 * 비밀번호 초기화
	 * @param memberVO
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("memconfig/resetPassword.do")
	public String resetPassword(@ModelAttribute("form") MemberVO memberVO, HttpServletRequest request, ModelMap model) throws Exception {
		
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.putSessionToVo(memberVO);
		
		String retCd = "";
		int result = 0;
		MemberVO mvo = new MemberVO();
		mvo = adminMemberService.getMember(memberVO);
		
		if(mvo != null) {
			mvo.setMemPassword(memberVO.getMemId());
			mvo.setMemSeq(memberVO.getMemSeq());
			result = adminMemberService.resetPassword(mvo);
			retCd = "SUCCESS";
			if(result > 0) {
				//메일발송부분(회원가입을 받지않으므로 필요X)
			}
		} else {
			retCd = "FALE";
		}
		return retCd;
	}
	
	@ResponseBody
	@RequestMapping("memconfig/updateUseYnAdmin.do")
	public String updateUseYnAdmin(@RequestParam("memArr") String[] memArr, @ModelAttribute("memberVO") MemberVO memberVO,
			@RequestParam("useYn") String useYn, ModelMap model)throws Exception {
		
		String retCd = "";
		
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.putSessionToVo(memberVO);
		
		try {
			adminMemberService.updateUseYnAdmin(memArr, useYn, memberVO.getSessionMemSeq());
			retCd = "SUCCESS";
		}catch (Exception e) {
			e.printStackTrace();
			retCd = "FAIL";
		}
		
		return retCd;
	}
	
	@ResponseBody
	@RequestMapping("memconfig/updateLockYnAdmin.do")
	public String updateLockYnAdmin(@RequestParam("memArr") String[] memArr, @ModelAttribute("memberVO") MemberVO memberVO,
			@RequestParam("lockYn") String lockYn, ModelMap model)throws Exception {
		
		String retCd = "";
		
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.putSessionToVo(memberVO);
		
		try {
			adminMemberService.updateLockYnAdmin(memArr, lockYn, memberVO.getSessionMemSeq());
			retCd = "SUCCESS";
		}catch (Exception e) {
			e.printStackTrace();
			retCd = "FAIL";
		}
		
		return retCd;
	}
	
}
