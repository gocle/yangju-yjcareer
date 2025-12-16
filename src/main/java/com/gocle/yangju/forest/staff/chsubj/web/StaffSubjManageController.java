package com.gocle.yangju.forest.staff.chsubj.web;

import java.util.Arrays;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gocle.yangju.forest.adm.chsearch.service.SearchManageService;
import com.gocle.yangju.forest.adm.chsgr.service.SgrManageService;
import com.gocle.yangju.forest.adm.chsgr.vo.SgrManageVo;
import com.gocle.yangju.forest.adm.chsubj.service.SubjManageService;
import com.gocle.yangju.forest.adm.chsubj.vo.SubjManageVo;
import com.gocle.yangju.forest.adm.code.service.AdminCodeService;
import com.gocle.yangju.forest.adm.code.vo.CodeVO;
import com.gocle.yangju.forest.adm.login.vo.LoginVO;
import com.gocle.yangju.forest.comm.file.service.FileService;
import com.gocle.yangju.forest.comm.file.vo.FileVO;
import com.gocle.yangju.forest.comm.vo.LoginInfo;

import egovframework.com.cmm.service.Globals;

@RequestMapping("/staff/chsubj/")
@Controller(value = "staffSubjManageController")
public class StaffSubjManageController {
	
	@Autowired
	SubjManageService subjManageService;
	
	@Autowired
    SgrManageService sgrManageService;
	
	@Autowired
    SearchManageService searchManageService;
	
	@Autowired
	FileService fileService;
	
	@Autowired
	AdminCodeService adminCodeService;
	
	@RequestMapping(value = "SubjManageList.do")
	public String selectSubjManageList(@ModelAttribute("subjManageVo") SubjManageVo searchVo
			, HttpSession session, ModelMap model) throws Exception {
		
		String sessionMemType = (String) session.getAttribute(Globals.MEM_TYPE);
		searchVo.setSessionMemType(sessionMemType);
		
		String sessionMemSeq = (String) session.getAttribute(Globals.MEM_SEQ);
		searchVo.setSessionMemSeq(sessionMemSeq);
		
		int totalCount = this.subjManageService.selectTotalCount(searchVo);
		List<SubjManageVo> subjManageList = this.subjManageService.selectList(searchVo);
		
		Integer pageSize = searchVo.getPageSize();
		Integer pageIndex = searchVo.getPageIndex();

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(pageIndex);
        paginationInfo.setRecordCountPerPage(pageSize);
        paginationInfo.setPageSize(searchVo.getPageUnit());
        paginationInfo.setTotalRecordCount(totalCount);
		
        model.addAttribute("paginationInfo", paginationInfo);
        model.addAttribute("pageIndex", pageIndex);
		model.addAttribute("pageSize", pageSize);
		
		model.addAttribute("sgrManageList", searchManageService.selectSgrList());
		model.addAttribute("searchVo", searchVo);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("subjManageList", subjManageList);
		model.addAttribute("menuId", searchVo.getMenuId());
		
		return "/staff/chsubj/SubjManageList";
	}
	
	@RequestMapping(value = "SubjManageInsertForm.do")
	public String selectSubjManageForm(@ModelAttribute("subjManageVo") SubjManageVo subjManageVo
			, ModelMap model, HttpSession session) throws Exception {
		
		model.addAttribute("cmd", "Insert");
		model.addAttribute("menuId", subjManageVo.getMenuId());
		
		SgrManageVo sgrManageVo = new SgrManageVo();
		model.addAttribute("sgrManageList", sgrManageService.selectList(sgrManageVo));
		
		String memId = (String) session.getAttribute(Globals.M_ID);
		LoginVO loginVO = new LoginVO();
		loginVO.setMemId(memId);
		model.addAttribute("companyList", searchManageService.selectCompanyList(loginVO));
		
		CodeVO cvo = new CodeVO();
		cvo.setCodeGroup("EDU_TARGET");
		List<CodeVO> codeList = adminCodeService.selectCodeList(cvo);
		model.addAttribute("codeList", codeList);
		
		return "/staff/chsubj/SubjManageForm";
	}
	
	@RequestMapping(value = "SubjManageInsert.do", method = RequestMethod.POST)
	public String subjManageInsert(@ModelAttribute("subjManageVo") SubjManageVo subjManageVo
			, RedirectAttributes redirectAttributes, SessionStatus status
			, final MultipartHttpServletRequest multiRequest, HttpSession session) throws Exception {
		
		String retMsg;
		
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.putSessionToVo(subjManageVo);
		
		String memSeq = (String) session.getAttribute(Globals.MEM_SEQ);
		String ImgFileUploadPath = "Globals.thumbnailStorePath";
	
		if(null != multiRequest) {
			if(multiRequest.getFiles("file_thumbFileId") != null) {
				List<MultipartFile> tFileObj = multiRequest.getFiles("file_thumbFileId");
				
				if(tFileObj != null && !tFileObj.isEmpty() && !tFileObj.get(0).isEmpty()) {
					String fileName = tFileObj.get(0).getOriginalFilename();
					String ext = fileName.substring(fileName.lastIndexOf('.')+1).toLowerCase(Locale.ROOT);
					if(!Arrays.asList("jpg", "jpeg", "png").contains(ext)) {
						retMsg = "허용되지 않는 파일형식입니다.";
						redirectAttributes.addFlashAttribute("retMsg", retMsg);
						return "redirect:/staff/chsubj/SubjManageUpdateForm.do?subjCd="+subjManageVo.getSubjCd();
					}else {
						fileService.saveProductThumFile(tFileObj, subjManageVo.getSubjCd(), memSeq, ImgFileUploadPath, "Y");
					}
				}
			}
		}
		
		int result = subjManageService.insert(subjManageVo);
		
		if (result > 0) {
            retMsg = "등록되었습니다.";
            status.setComplete();
        } else {
            retMsg = "등록에 실패했습니다.";
        }
		 
		redirectAttributes.addFlashAttribute("retMsg", retMsg);
		return "redirect:/staff/chsubj/SubjManageList.do";
	}
	
	@RequestMapping(value = "SubjManageUpdateForm.do")
	public String subjManageUpdateForm(@ModelAttribute("subjManageVo") SubjManageVo subjManageVo
			, ModelMap model, HttpSession session) throws Exception {
			
		model.addAttribute("cmd", "Update");
		model.addAttribute("menuId", subjManageVo.getMenuId());
		
		SgrManageVo sgrManageVo = new SgrManageVo();
		model.addAttribute("sgrManageList", sgrManageService.selectList(sgrManageVo));
		
		String memId = (String) session.getAttribute(Globals.M_ID);
		LoginVO loginVO = new LoginVO();
		loginVO.setMemId(memId);
		model.addAttribute("companyList", searchManageService.selectCompanyList(loginVO));
		
		model.addAttribute("resultMap", subjManageService.select(subjManageVo));
		
		FileVO fvo = new FileVO();
		fvo.setpId(subjManageVo.getSubjCd());
		fvo.setThumbnailCrop("Y");
		List<FileVO> tFileList = fileService.listProductFile(fvo);
		model.addAttribute("fileList1", tFileList);
		
		CodeVO cvo = new CodeVO();
		cvo.setCodeGroup("EDU_TARGET");
		List<CodeVO> codeList = adminCodeService.selectCodeList(cvo);
		model.addAttribute("codeList", codeList);
		
		return "/staff/chsubj/SubjManageForm";
	}
	
	@RequestMapping(value = "SubjManageUpdate.do", method = RequestMethod.POST)
	public String subjManageUpdate(@ModelAttribute("subjManageVo") SubjManageVo subjManageVo
			, RedirectAttributes redirectAttributes, SessionStatus status
			, final MultipartHttpServletRequest multiRequest, HttpSession session) throws Exception {
		
		String retMsg;
		
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.putSessionToVo(subjManageVo);
		
		String memSeq = (String) session.getAttribute(Globals.MEM_SEQ);
		String ImgFileUploadPath = "Globals.thumbnailStorePath";
	
		if(null != multiRequest) {
			if(multiRequest.getFiles("file_thumbFileId") != null) {
				List<MultipartFile> tFileObj = multiRequest.getFiles("file_thumbFileId");
				
				if(tFileObj != null && !tFileObj.isEmpty() && !tFileObj.get(0).isEmpty()) {
					String fileName = tFileObj.get(0).getOriginalFilename();
					String ext = fileName.substring(fileName.lastIndexOf('.')+1).toLowerCase(Locale.ROOT);
					if(!Arrays.asList("jpg", "jpeg", "png").contains(ext)) {
						retMsg = "허용되지 않는 파일형식입니다.";
						redirectAttributes.addFlashAttribute("retMsg", retMsg);
						return "redirect:/staff/chsubj/SubjManageUpdateForm.do?subjCd="+subjManageVo.getSubjCd();
					}else {
						fileService.saveProductThumFile(tFileObj, subjManageVo.getSubjCd(), memSeq, ImgFileUploadPath, "Y");
					}
				}
			}
		}
		
		int result = subjManageService.update(subjManageVo);
		
		if (result > 0) {
            retMsg = "수정되었습니다.";
            status.setComplete();
        } else {
            retMsg = "수정에 실패했습니다.";
        }
		 
		redirectAttributes.addFlashAttribute("retMsg", retMsg);
		return "redirect:/staff/chsubj/SubjManageList.do";
	}
	
	@ResponseBody
	@RequestMapping(value = "SubjManageDelete.do")
	public String subjManageDeleteForm(@ModelAttribute("subjManageVo") SubjManageVo subjManageVo
			, RedirectAttributes redirectAttributes, SessionStatus status) throws Exception {
    	
		int result = 0;
		String retMsg = "";
		
		if(subjManageService.selectSubjSubSubSeqCnt(subjManageVo) == 0) {
			result = subjManageService.delete(subjManageVo);
		}
		
		if (result > 0) {
            retMsg = "삭제되었습니다.";
            status.setComplete();
        } else {
        	retMsg = "하위 개설된 운영과정이 존재합니다.\n개설운영과정은 삭제할 수 없습니다.";
        }
		
        return retMsg;
	}
}
