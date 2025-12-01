package com.gocle.yangju.forest.adm.program.web;

import java.util.List;

import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gocle.yangju.forest.adm.code.service.AdminCodeService;
import com.gocle.yangju.forest.adm.code.vo.CodeVO;
import com.gocle.yangju.forest.adm.program.service.AdminProgramService;
import com.gocle.yangju.forest.adm.program.vo.ProgramVO;
import com.gocle.yangju.forest.adm.reservation.service.AdminReservationService;
import com.gocle.yangju.forest.comm.file.service.FileService;
import com.gocle.yangju.forest.comm.file.vo.FileVO;
import com.gocle.yangju.forest.comm.vo.LoginInfo;


@Controller
@RequestMapping("/staff/program/")
public class StaffProgramController {

	@Autowired
	AdminProgramService adminProgramService;
	
	@Autowired
	FileService fileService;
	
	
	@Autowired
	AdminReservationService adminReservationService;
	
	@Autowired
	AdminCodeService adminCodeService;
	
	/**
	 * 담당자 > 프로그램 리스트 조회
	 * @param pgType
	 * @param programVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("{pgType}/list.do")
	public String programList(@PathVariable("pgType") String pgType, @ModelAttribute("form")ProgramVO programVO, ModelMap model) throws Exception {
		
		String menuId = programVO.getMenuId();
		
		List<ProgramVO> resultList = adminProgramService.selectProgramList(programVO);
		
		int totalCnt = 0;
		Integer pageSize = programVO.getPageSize();
		Integer pageIndex = programVO.getPageIndex();
		
		if(resultList.size() > 0) {
			totalCnt =Integer.parseInt(resultList.get(0).getTotalCount());
		}
		
	    PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setCurrentPageNo(pageIndex);
        paginationInfo.setRecordCountPerPage(pageSize);
        paginationInfo.setPageSize(programVO.getPageUnit());
        paginationInfo.setTotalRecordCount(totalCnt);
        
        model.addAttribute("pageSize", pageSize);
	    model.addAttribute("totalCount", totalCnt);
	    model.addAttribute("pageIndex", pageIndex);
        model.addAttribute("paginationInfo", paginationInfo);
        
        model.addAttribute("resultList", resultList);
        model.addAttribute("programVO", programVO);
        model.addAttribute("menuId",menuId);
		model.addAttribute("pgType", pgType);
		
		return "/staff/program/" + pgType + "/list";
	}
	
	/**
	 * 담당자 > 프로그램 등록 폼
	 * @param pgType
	 * @param programVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("{pgType}/form.do")
	public String programForm(@PathVariable("pgType") String pgType, @ModelAttribute("form")ProgramVO programVO, ModelMap model) throws Exception {
		
		String menuId = programVO.getMenuId();
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.putSessionToVo(programVO);
		
		CodeVO cvo = new CodeVO();
		cvo.setCodeGroup("FOREST_EDU_CATE");
		List<CodeVO> codeList = adminCodeService.selectCodeList(cvo);
		model.addAttribute("codeList", codeList);
		
		model.addAttribute("programVO", programVO);
		model.addAttribute("menuId", menuId);
		
		return "/staff/program/" + pgType + "/form";
	}
	
	/**
	 * 담당자 > 프로그램 등록
	 * @param pgType
	 * @param programVO
	 * @param multiRequest
	 * @param redirectAttributes
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("{pgType}/insert.do")
	public String programInsert(@PathVariable("pgType") String pgType, @ModelAttribute("form")ProgramVO programVO,
			 final MultipartHttpServletRequest multiRequest, RedirectAttributes redirectAttributes, ModelMap model) throws Exception {
		
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.putSessionToVo(programVO);
		String menuId = programVO.getMenuId();
		String retMsg = "";
		
		int result = adminProgramService.insertProgram(programVO, multiRequest);
		if(result > 0) {
			retMsg = "저장되었습니다.";
		} else {
			retMsg = "저장할 수 없습니다.";
		}
		redirectAttributes.addFlashAttribute("retMsg", retMsg);
		
		return "redirect:/staff/program/" + pgType + "/list.do?menuId="+ menuId;
	}
	
	/**
	 * 담당자 > 프로그램 상세
	 * @param pgType
	 * @param programVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("{pgType}/detail.do")
	public String programDetail(@PathVariable("pgType") String pgType, @ModelAttribute("form")ProgramVO programVO, ModelMap model) throws Exception {
		
		String menuId = programVO.getMenuId();
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.putSessionToVo(programVO);
		
		programVO = adminProgramService.selectProgram(programVO);
		
		FileVO fvo = new FileVO();
		fvo.setpId(programVO.getPgId());
		fvo.setThumbnailCrop("N");
		List<FileVO> fileList = fileService.listProductFile(fvo);
		
		fvo.setThumbnailCrop("Y");
		List<FileVO> tFileList = fileService.listProductFile(fvo);
		
		model.addAttribute("programVO", programVO);
		model.addAttribute("fileList", fileList);
		model.addAttribute("fileList1", tFileList);
		model.addAttribute("menuId", menuId);
		
		return "/staff/program/" + pgType + "/view";
	}
	
	/**
	 * 담당자 > 프로그램 수정 폼
	 * @param pgType
	 * @param programVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("{pgType}/updateForm.do")
	public String updateProgramForm(@PathVariable("pgType") String pgType, @ModelAttribute("form")ProgramVO programVO, ModelMap model) throws Exception {
		
		String menuId = programVO.getMenuId();
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.putSessionToVo(programVO);
		
		programVO = adminProgramService.selectProgram(programVO);
		
		FileVO fvo = new FileVO();
		fvo.setpId(programVO.getPgId());
		fvo.setThumbnailCrop("N");
		List<FileVO> fileList = fileService.listProductFile(fvo);
		
		fvo.setThumbnailCrop("Y");
		List<FileVO> tFileList = fileService.listProductFile(fvo);
		
		CodeVO cvo = new CodeVO();
		cvo.setCodeGroup("FOREST_EDU_CATE");
		List<CodeVO> codeList = adminCodeService.selectCodeList(cvo);
		model.addAttribute("codeList", codeList);
		
		model.addAttribute("programVO", programVO);
		model.addAttribute("fileList", fileList);
		model.addAttribute("fileList1", tFileList);
		model.addAttribute("menuId", menuId);
		
		return "/staff/program/" + pgType + "/form";
	}
	
	/**
	 * 담당자 > 프로그램 수정
	 * @param pgType
	 * @param programVO
	 * @param multiRequest
	 * @param redirectAttributes
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("{pgType}/update.do")
	public String updateProgram(@PathVariable("pgType") String pgType, @ModelAttribute("form")ProgramVO programVO, 
			final MultipartHttpServletRequest multiRequest, RedirectAttributes redirectAttributes) throws Exception {
		
		String menuId = programVO.getMenuId();
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.putSessionToVo(programVO);
		String retMsg = "";
		
		//신청자 존재 시 기간변경 불가능
		ProgramVO oriProgram = adminProgramService.selectProgram(programVO);
		if(!oriProgram.getStartDate().equals(programVO.getStartDate()) || !oriProgram.getEndDate().equals(programVO.getEndDate())) {
			int applyCnt = adminReservationService.getApplyCnt(programVO.getPgId());
			if(applyCnt > 0) {
				retMsg = "신청자가 존재하여 수정할 수 없습니다.";
				redirectAttributes.addFlashAttribute("retMsg", retMsg);
				return "redirect:/staff/program/" + pgType + "/list.do?menuId="+ menuId;
			}
		}
		
		int result = 0;
		result = adminProgramService.updateProgram(programVO, multiRequest);
		if(result > 0) {
			retMsg = "수정되었습니다.";
		} else {
			retMsg = "수정할 수 없습니다.";
		}
		redirectAttributes.addFlashAttribute("retMsg", retMsg);
		
		return "redirect:/staff/program/" + pgType + "/list.do?menuId="+ menuId;
	}
	
	/**
	 * 담당자 > 프로그램 삭제
	 * @param pgType
	 * @param programVO
	 * @param redirectAttributes
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("{pgType}/delete.do")
	public String deleteProgram(@PathVariable("pgType") String pgType, @ModelAttribute("form")ProgramVO programVO, RedirectAttributes redirectAttributes) throws Exception {
		
		String menuId = programVO.getMenuId();
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.putSessionToVo(programVO);
		String retMsg = "";
		
		int applyCnt = adminReservationService.getApplyCnt(programVO.getPgId());
		if(applyCnt > 0) {
			retMsg = "신청자가 존재하여 삭제할 수 없습니다.";
			redirectAttributes.addFlashAttribute("retMsg", retMsg);
			return "redirect:/staff/program/" + pgType + "/list.do?menuId="+ menuId;
		}
		
		int result = 0;
		result = adminProgramService.deleteProgram(programVO);
		if(result > 0) {
			retMsg = "삭제되었습니다.";
		} else {
			retMsg = "삭제할 수 없습니다.";
		}
		redirectAttributes.addFlashAttribute("retMsg", retMsg);
		
		return "redirect:/staff/program/" + pgType + "/list.do?menuId="+ menuId;
	}
	
	/**
	 * 담당자 > 프로그램 복사
	 * @param pgType
	 * @param programVO
	 * @param redirectAttributes
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("{pgType}/copy.do")
	public String copyProgram(@PathVariable("pgType") String pgType, @ModelAttribute("form")ProgramVO programVO, RedirectAttributes redirectAttributes) throws Exception {
		
		String menuId = programVO.getMenuId();
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.putSessionToVo(programVO);
		String retMsg = "";
		
		programVO = adminProgramService.selectProgram(programVO);
		int result = adminProgramService.copyProgram(programVO);
		if(result > 0) {
			retMsg = "복사되었습니다.";
		} else {
			retMsg = "복사할 수 없습니다.";
		}
		redirectAttributes.addFlashAttribute("retMsg", retMsg);
		
		return "redirect:/staff/program/" + pgType + "/list.do?menuId="+ menuId;
	}
	
	// 장소: 코드그룹 단위로 목록 반환 (예: GEN_PLACE, KIND_PLACE, FAM_PLACE)
	@GetMapping("{pgType}/codes.do")
	@ResponseBody
	public List<CodeVO> getCodesByGroup(@RequestParam("group") String group) throws Exception {
	    CodeVO cvo = new CodeVO();
	    cvo.setCodeGroup(group);
	    cvo.setDeleteYn("N");
	    return adminCodeService.selectCodeList(cvo); // ORDER BY CODE_ORDER ASC 권장
	}

	// 모집대상: AUDIENCE 테이블에서 특정 코드만 1건 조회 (예: GEN, KIND, FAM)
	@GetMapping("{pgType}/audience.do")
	@ResponseBody
	public List<CodeVO> getAudienceByCode(@RequestParam("code") String code) throws Exception {
	    CodeVO cvo = new CodeVO();
	    cvo.setCodeGroup("AUDIENCE");
	    cvo.setCodeCode(code);
	    cvo.setDeleteYn("N");
	    return adminCodeService.selectAudCode(cvo);
	}
}
