package com.gocle.yangju.forest.adm.intro.web;

import java.util.List;

import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gocle.yangju.forest.adm.code.service.AdminCodeService;
import com.gocle.yangju.forest.adm.code.vo.CodeVO;
import com.gocle.yangju.forest.adm.intro.service.AdminIntroService;
import com.gocle.yangju.forest.adm.intro.vo.IntroVO;
import com.gocle.yangju.forest.adm.program.service.AdminProgramService;
import com.gocle.yangju.forest.comm.file.service.FileService;
import com.gocle.yangju.forest.comm.file.vo.FileVO;
import com.gocle.yangju.forest.comm.vo.LoginInfo;


@Controller
@RequestMapping("/adm/intro/")
public class AdminIntroController {

	@Autowired
	AdminIntroService adminIntroService;
	
	@Autowired
	AdminCodeService adminCodeService;
	
	@Autowired
	FileService fileService;
	
	/**
	 * 프로그램 리스트 조회
	 * @param pgType
	 * @param introVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("{pgType}/list.do")
	public String programList(@PathVariable("pgType") String pgType, @ModelAttribute("form")IntroVO introVO, ModelMap model) throws Exception {
		
		String menuId = introVO.getMenuId();
		
		List<IntroVO> resultList = adminIntroService.selectIntroList(introVO);
		
		int totalCnt = 0;
		Integer pageSize = introVO.getPageSize();
		Integer pageIndex = introVO.getPageIndex();
		
		if(resultList.size() > 0) {
			totalCnt =Integer.parseInt(resultList.get(0).getTotalCount());
		}
		
	    PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setCurrentPageNo(pageIndex);
        paginationInfo.setRecordCountPerPage(pageSize);
        paginationInfo.setPageSize(introVO.getPageUnit());
        paginationInfo.setTotalRecordCount(totalCnt);
        
        model.addAttribute("pageSize", pageSize);
	    model.addAttribute("totalCount", totalCnt);
	    model.addAttribute("pageIndex", pageIndex);
        model.addAttribute("paginationInfo", paginationInfo);
        
        model.addAttribute("resultList", resultList);
        model.addAttribute("introVO", introVO);
        model.addAttribute("menuId",menuId);
		model.addAttribute("pgType", pgType);
		
		return "/adm/intro/" + pgType + "/list";
	}
	
	/**
	 * 프로그램 등록 폼
	 * @param pgType
	 * @param introVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("{pgType}/form.do")
	public String programForm(@PathVariable("pgType") String pgType, @ModelAttribute("form")IntroVO introVO, ModelMap model) throws Exception {
		
		String menuId = introVO.getMenuId();
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.putSessionToVo(introVO);
		
		CodeVO cvo = new CodeVO();
		cvo.setCodeGroup("PRODUCT_TARGET");
		List<CodeVO> codeList = adminCodeService.selectCodeList(cvo);
		
		model.addAttribute("introVO", introVO);
		model.addAttribute("menuId", menuId);
		model.addAttribute("targetList", codeList);
		
		return "/adm/intro/" + pgType + "/form";
	}
	
	/**
	 * 프로그램 등록
	 * @param pgType
	 * @param introVO
	 * @param multiRequest
	 * @param redirectAttributes
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("{pgType}/insert.do")
	public String programInsert(@PathVariable("pgType") String pgType, @ModelAttribute("form")IntroVO introVO,
			 final MultipartHttpServletRequest multiRequest, RedirectAttributes redirectAttributes, ModelMap model) throws Exception {
		
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.putSessionToVo(introVO);
		String menuId = introVO.getMenuId();
		String retMsg = "";
		
		int result = adminIntroService.insertIntro(introVO, multiRequest);
		if(result > 0) {
			retMsg = "저장되었습니다.";
		} else {
			retMsg = "저장할 수 없습니다.";
		}
		redirectAttributes.addFlashAttribute("retMsg", retMsg);
		
		return "redirect:/adm/intro/" + pgType + "/list.do?menuId="+ menuId;
	}
	
	/**
	 * 프로그램 상세
	 * @param pgType
	 * @param introVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("{pgType}/detail.do")
	public String programDetail(@PathVariable("pgType") String pgType, @ModelAttribute("form")IntroVO introVO, ModelMap model) throws Exception {
		
		String menuId = introVO.getMenuId();
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.putSessionToVo(introVO);
		
		introVO = adminIntroService.selectIntro(introVO);
		
		FileVO fvo = new FileVO();
		fvo.setpId(introVO.getIntId());
		fvo.setThumbnailCrop("N");
		List<FileVO> fileList = fileService.listProductFile(fvo);
		
		fvo.setThumbnailCrop("Y");
		List<FileVO> tFileList = fileService.listProductFile(fvo);
		
		CodeVO cvo = new CodeVO();
		cvo.setCodeGroup("PRODUCT_TARGET");
		List<CodeVO> codeList = adminCodeService.selectCodeList(cvo);
		
		model.addAttribute("introVO", introVO);
		model.addAttribute("fileList", fileList);
		model.addAttribute("fileList1", tFileList);
		model.addAttribute("menuId", menuId);
		model.addAttribute("targetList", codeList);
		
		return "/adm/intro/" + pgType + "/view";
	}
	
	/**
	 * 프로그램 수정 폼
	 * @param pgType
	 * @param introVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("{pgType}/updateForm.do")
	public String updateProgramForm(@PathVariable("pgType") String pgType, @ModelAttribute("form")IntroVO introVO, ModelMap model) throws Exception {
		
		String menuId = introVO.getMenuId();
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.putSessionToVo(introVO);
		
		introVO = adminIntroService.selectIntro(introVO);
		
		FileVO fvo = new FileVO();
		fvo.setpId(introVO.getIntId());
		fvo.setThumbnailCrop("N");
		List<FileVO> fileList = fileService.listProductFile(fvo);
		
		fvo.setThumbnailCrop("Y");
		List<FileVO> tFileList = fileService.listProductFile(fvo);
		CodeVO cvo = new CodeVO();
		cvo.setCodeGroup("PRODUCT_TARGET");
		List<CodeVO> codeList = adminCodeService.selectCodeList(cvo);
		
		model.addAttribute("introVO", introVO);
		model.addAttribute("fileList", fileList);
		model.addAttribute("fileList1", tFileList);
		model.addAttribute("menuId", menuId);
		model.addAttribute("targetList", codeList);
		
		return "/adm/intro/" + pgType + "/form";
	}
	
	/**
	 * 프로그램 수정
	 * @param pgType
	 * @param introVO
	 * @param multiRequest
	 * @param redirectAttributes
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("{pgType}/update.do")
	public String updateProgram(@PathVariable("pgType") String pgType, @ModelAttribute("form")IntroVO introVO, 
			final MultipartHttpServletRequest multiRequest, RedirectAttributes redirectAttributes) throws Exception {
		
		String menuId = introVO.getMenuId();
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.putSessionToVo(introVO);
		String retMsg = "";
		
		int result = 0;
		result = adminIntroService.updateIntro(introVO, multiRequest);
		if(result > 0) {
			retMsg = "수정되었습니다.";
		} else {
			retMsg = "수정할 수 없습니다.";
		}
		redirectAttributes.addFlashAttribute("retMsg", retMsg);
		
		return "redirect:/adm/intro/" + pgType + "/list.do?menuId="+ menuId;
	}
	
	/**
	 * 프로그램 삭제
	 * @param pgType
	 * @param introVO
	 * @param redirectAttributes
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("{pgType}/delete.do")
	public String deleteProgram(@PathVariable("pgType") String pgType, @ModelAttribute("form")IntroVO introVO, RedirectAttributes redirectAttributes) throws Exception {
		
		String menuId = introVO.getMenuId();
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.putSessionToVo(introVO);
		String retMsg = "";
		
		int result = 0;
		result = adminIntroService.deleteIntro(introVO);
		if(result > 0) {
			retMsg = "삭제되었습니다.";
		} else {
			retMsg = "삭제할 수 없습니다.";
		}
		redirectAttributes.addFlashAttribute("retMsg", retMsg);
		
		return "redirect:/adm/intro/" + pgType + "/list.do?menuId="+ menuId;
	}
	
	@RequestMapping(value={"{pgType}/introOrderUpdate.do"})
	public @ResponseBody int OrderUpdate(@PathVariable("pgType") String pgType,
			@ModelAttribute("form") IntroVO introVO,
			ModelMap model) throws Exception{
		
		LoginInfo loginInfo = new LoginInfo(); // 세션
		loginInfo.putSessionToVo(introVO); // session의 정보를 VO에 추가.
		introVO.setPgType(pgType);
		int rs = adminIntroService.introOrderUpdate(introVO);
		
		return rs;
	}
	
}
