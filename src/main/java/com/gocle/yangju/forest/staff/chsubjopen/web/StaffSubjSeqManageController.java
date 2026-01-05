package com.gocle.yangju.forest.staff.chsubjopen.web;

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
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gocle.yangju.forest.adm.chsearch.service.SearchManageService;
import com.gocle.yangju.forest.adm.chsubj.service.SubjManageService;
import com.gocle.yangju.forest.adm.chsubj.vo.SubjManageVo;
import com.gocle.yangju.forest.adm.chsubjopen.service.SubjSeqManageService;
import com.gocle.yangju.forest.adm.chsubjopen.vo.SubjSeqManageDefaultVo;
import com.gocle.yangju.forest.adm.chsubjopen.vo.SubjSeqManageVo;
import com.gocle.yangju.forest.adm.code.service.AdminCodeService;
import com.gocle.yangju.forest.adm.code.vo.CodeVO;
import com.gocle.yangju.forest.adm.login.vo.LoginVO;
import com.gocle.yangju.forest.comm.file.service.FileService;
import com.gocle.yangju.forest.comm.file.vo.FileVO;
import com.gocle.yangju.forest.comm.vo.LoginInfo;

import egovframework.com.cmm.service.Globals;

@RequestMapping(value = "/staff/chsubjopen")
@Controller(value = "staffSubjSeqManageController")
public class StaffSubjSeqManageController {
	@Autowired
    SearchManageService searchManageService;
	
	@Autowired
	SubjManageService subjManageService;
	
	@Autowired
	SubjSeqManageService subjSeqManageService;
	
	@Autowired
	FileService fileService;
	
	@Autowired
	AdminCodeService adminCodeService;
	
	@RequestMapping(value = "SubjSeqManageList.do")
	public String selectSubjSeqManageList(@ModelAttribute("searchVo") SubjSeqManageVo searchVo
			, HttpSession session, ModelMap model) throws Exception {
		
		String sessionMemType = (String) session.getAttribute(Globals.MEM_TYPE);
		searchVo.setSessionMemType(sessionMemType);
		
		String sessionMemSeq = (String) session.getAttribute(Globals.MEM_SEQ);
		searchVo.setSessionMemSeq(sessionMemSeq);
		
		int totalCount = this.subjSeqManageService.selectTotalCount(searchVo);
		List<SubjSeqManageVo> resultList = this.subjSeqManageService.selectList(searchVo);
		
		Integer pageSize = searchVo.getPageSize();
		Integer pageIndex = searchVo.getPageIndex();

		model.addAttribute("pageIndex", pageIndex);
		model.addAttribute("pageSize", pageSize);
		
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
		
		return "/staff/chsubjopen/SubjSeqManageList";
	}
	
	@RequestMapping(value = "SubjSeqInsertManageForm.do")
	public String subjSeqInsertManageForm(@ModelAttribute("searchVo") SubjSeqManageDefaultVo searchVo
			,@ModelAttribute("subjManageVo") SubjManageVo subjManageVo, ModelMap model) throws Exception {	
		model.addAttribute("menuId", searchVo.getMenuId());
		model.addAttribute("sgrManageList", searchManageService.selectSgrList());
		model.addAttribute("subjList", subjManageService.selectList(subjManageVo));
		model.addAttribute("searchVo", searchVo);
		
		return "/staff/chsubjopen/SubjSeqInsertManageForm";
	}
	
	@RequestMapping(value = "SubjSeqManageInsert.do", method = RequestMethod.POST)
	public String insertSubjSeqManage(@ModelAttribute("searchVo") SubjSeqManageDefaultVo searchVo
			, @ModelAttribute("subjSeqManageVo") SubjSeqManageVo subjSeqManageVo
			, SessionStatus status, RedirectAttributes redirectAttributes) throws Exception {
		
		String retMsg;
		
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.putSessionToVo(subjSeqManageVo);
		
		int result = subjSeqManageService.insert(subjSeqManageVo);
		
		if (result > 0) {
            retMsg = "등록되었습니다.";
            status.setComplete();
        } else {
            retMsg = "등록에 실패했습니다.";
        }
		
		redirectAttributes.addFlashAttribute("retMsg", retMsg);
		return "redirect:/staff/chsubjopen/SubjSeqManageList.do?menuId="+searchVo.getMenuId();
	}
	
	@RequestMapping(value = "SubjSeqManageForm.do")
	public String subjSeqManageForm(@ModelAttribute("searchVo") SubjSeqManageVo searchVo
			, ModelMap model, HttpSession session) throws Exception {
		
		model.addAttribute("cmd", "Update");
		model.addAttribute("menuId", searchVo.getMenuId());
		model.addAttribute("resultMap", subjSeqManageService.select(searchVo));
		
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.putSessionToVo(searchVo);
		
		LoginVO loginVO = new LoginVO();
		loginVO.setMemId(loginInfo.getMemId());
		model.addAttribute("companyList", searchManageService.selectCompanyList(loginVO));
		
		FileVO fvo = new FileVO();
		fvo.setpId(searchVo.getSeqCd());
		fvo.setThumbnailCrop("Y");
		List<FileVO> tFileList = fileService.listProductFile(fvo);
		model.addAttribute("fileList1", tFileList);
		
		CodeVO cvo = new CodeVO();
		cvo.setCodeGroup("EDU_TARGET");
		List<CodeVO> codeList = adminCodeService.selectCodeList(cvo);
		model.addAttribute("codeList", codeList);
		
		return "/staff/chsubjopen/SubjSeqManageForm";
	}
	
	@RequestMapping(value = "SubjSeqManageUpdate.do", method = RequestMethod.POST)
	public String updateSubjSeqManage(@ModelAttribute("subjSeqManageVo") SubjSeqManageVo subjSeqManageVo
			, SessionStatus status, RedirectAttributes redirectAttributes
			, final MultipartHttpServletRequest multiRequest) throws Exception {
		
		String retMsg;
		
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.putSessionToVo(subjSeqManageVo);
		
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
						return "redirect:/staff/chsubjopen/SubjManageForm.do?seqCd="+subjSeqManageVo.getSeqCd();
					}else {
						fileService.saveProductThumFile(tFileObj, subjSeqManageVo.getSeqCd(), subjSeqManageVo.getSessionMemSeq(), ImgFileUploadPath, "Y");
					}
				}
			}
		}
		
		int result = subjSeqManageService.update(subjSeqManageVo);
		
		if (result > 0) {
            retMsg = "수정되었습니다.";
            status.setComplete();
        } else {
            retMsg = "수정에 실패했습니다.";
        }
		
		redirectAttributes.addFlashAttribute("retMsg", retMsg);
		return "redirect:/staff/chsubjopen/SubjSeqManageList.do?menuId="+subjSeqManageVo.getMenuId();
	}
	
	@RequestMapping(value = "SubjSeqManageDelete.do", method = RequestMethod.POST)
	public String subjSeqManageDeleteForm(@ModelAttribute("subjSeqManageVo") SubjSeqManageVo subjSeqManageVo
			, RedirectAttributes redirectAttributes, SessionStatus status) throws Exception {
		
		int result = subjSeqManageService.delete(subjSeqManageVo);
		String retMsg = "";
		
		if (result > 0) {
            retMsg = "삭제되었습니다.";
            status.setComplete();
        } else {
            retMsg = "삭제에 실패했습니다.";
        }
		
		redirectAttributes.addFlashAttribute("retMsg", retMsg);
        return "redirect:/staff/chsubjopen/SubjSeqManageList.do?menuId="+subjSeqManageVo.getMenuId();
	}
}
