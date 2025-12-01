package com.gocle.yangju.forest.adm.time.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gocle.yangju.forest.adm.program.service.AdminProgramService;
import com.gocle.yangju.forest.adm.program.vo.ProgramVO;
import com.gocle.yangju.forest.adm.reservation.vo.ReservationVO;
import com.gocle.yangju.forest.adm.time.service.AdminProgramTimeService;
import com.gocle.yangju.forest.adm.time.vo.ProgramTimeVO;


@Controller
@RequestMapping("/adm/program/time/")
public class AdminProgramTimeController {

	@Autowired
	AdminProgramTimeService adminProgramTimeService;
	
	@Autowired
	AdminProgramService adminProgramService;
	
	/**
	 * 프로그램 목록 조회
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
		
		return "/adm/time/" + pgType + "/list";
	}
	
	/**
	 * 체험일 삭제
	 * @param pgType
	 * @param programTimeVO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("{pgType}/deleteSlot.do")
	@ResponseBody
	public Map<String, Object> deleteSlot(@PathVariable("pgType") String pgType, @ModelAttribute("form")ProgramTimeVO programTimeVO) throws Exception {
		
		Map<String, Object> result = new HashMap<>();
		int applyCnt = adminProgramTimeService.getApplyCnt(programTimeVO);
		if (applyCnt > 0) {
			 result.put("success", false);
		     result.put("message", "신청자가 존재하여 삭제할 수 없습니다.");
		} else {
			try {
		        adminProgramTimeService.deleteSlot(programTimeVO);

		        result.put("success", true);
		        result.put("message", "삭제가 완료되었습니다.");

		    } catch (Exception e) {
		        e.printStackTrace();
		        result.put("success", false);
		        result.put("message", "삭제 중 오류가 발생했습니다: " + e.getMessage());
		    }
		}
		return result;
	}

}
