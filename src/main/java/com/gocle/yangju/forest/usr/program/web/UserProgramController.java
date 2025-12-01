package com.gocle.yangju.forest.usr.program.web;

import java.util.List;

import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gocle.yangju.forest.comm.file.service.FileService;
import com.gocle.yangju.forest.comm.file.vo.FileVO;
import com.gocle.yangju.forest.usr.product.service.UserProductService;
import com.gocle.yangju.forest.usr.product.vo.UserProductVO;
import com.gocle.yangju.forest.usr.program.service.UserProgramService;
import com.gocle.yangju.forest.usr.program.vo.UserProgramVO;


@Controller
@RequestMapping("/usr/program/")
public class UserProgramController {
	
	@Autowired
	UserProgramService userProgramService;
	
	@Autowired
	FileService fileService;
	
	@Autowired
	UserProductService userProductService;
	
	@RequestMapping("woodWorking.do")
	public String woodCenter(ModelMap model) throws Exception {
		
		return "/usr/program/woodWorking";
	}
	
	@RequestMapping("forestEdu.do")
	public String forestEdu(ModelMap model) throws Exception {
		
		return "/usr/program/forestEdu";
	}
	
	
	@RequestMapping("{pgType}/list.do")
	public String programList(@PathVariable("pgType") String pgType, @ModelAttribute("form")UserProgramVO userProgramVO, ModelMap model) throws Exception {
		
		String menuId = userProgramVO.getMenuId();
		List<UserProgramVO> resultList = userProgramService.selectProgramList(userProgramVO);
		
		int totalCnt = 0;
		Integer pageSize = userProgramVO.getPageSize();
		Integer pageIndex =	userProgramVO.getPageIndex();
		
		if(0 < resultList.size() ){
			totalCnt = Integer.parseInt( resultList.get(0).getTotalCount() );
		}
		
		PaginationInfo paginationInfo = new PaginationInfo();
	    paginationInfo.setCurrentPageNo(pageIndex);
        paginationInfo.setRecordCountPerPage(pageSize);
        paginationInfo.setPageSize(userProgramVO.getPageUnit());
        paginationInfo.setTotalRecordCount(totalCnt);
        
        model.addAttribute("pageSize", pageSize);
	    model.addAttribute("totalCount", totalCnt);
	    model.addAttribute("pageIndex", pageIndex);
	    model.addAttribute("paginationInfo", paginationInfo);
	    
        model.addAttribute("resultCnt", totalCnt);
		model.addAttribute("resultList", resultList);
		
		model.addAttribute("pgType", pgType);
		
		return "/usr/program/" + pgType + "/list";
	}
	
	@RequestMapping("{pgType}/detail.do")
	public String programDetail(@PathVariable("pgType") String pgType, @ModelAttribute("form")UserProgramVO userProgramVO, ModelMap model) throws Exception {
		
		String menuId = userProgramVO.getMenuId();
		userProgramVO = userProgramService.selectProgram(userProgramVO);
		
		FileVO fvo = new FileVO();
		fvo.setpId(userProgramVO.getPgId());
		fvo.setThumbnailCrop("N");
		List<FileVO> fileList = fileService.listProductFile(fvo);
		
		fvo.setThumbnailCrop("Y");
		List<FileVO> tFileList = fileService.listProductFile(fvo);
		
		UserProductVO upvo = new UserProductVO();
		List<UserProductVO> productList = userProductService.selectProductList(upvo);
		
	    
		model.addAttribute("userProgramVO", userProgramVO);
		model.addAttribute("fileList", fileList);
		model.addAttribute("fileList1", tFileList);
		model.addAttribute("productList", productList);
		model.addAttribute("pgType", pgType);
		
		return "/usr/program/" + pgType + "/detail";
	}
}
