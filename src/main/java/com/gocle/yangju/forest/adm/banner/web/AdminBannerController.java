package com.gocle.yangju.forest.adm.banner.web;

import java.util.List;

import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gocle.yangju.forest.adm.banner.service.AdminBannerService;
import com.gocle.yangju.forest.adm.banner.vo.BannerVO;
import com.gocle.yangju.forest.comm.file.service.FileService;
import com.gocle.yangju.forest.comm.file.vo.FileVO;
import com.gocle.yangju.forest.comm.vo.LoginInfo;

@Controller
@RequestMapping("/adm/banner/")
public class AdminBannerController {

	@Autowired
	AdminBannerService adminBannerService;
	
	@Autowired
	FileService fileService;
	
	/**
	 * 배너/팝업 목록
	 * @param bnType
	 * @param bannerVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("{bnType}/list.do")
	public String bannerList(@PathVariable("bnType")String bnType, @ModelAttribute("form")BannerVO bannerVO, ModelMap model) throws Exception {
		
		String menuId = bannerVO.getMenuId();
		
		bannerVO.setBnType(bnType);
		List<BannerVO> bnList = adminBannerService.selectBannerList(bannerVO);
		
		int totalCnt = 0;
		Integer pageSize = bannerVO.getPageSize();
		Integer pageIndex = bannerVO.getPageIndex();
		
		if(bnList.size() > 0) {
			totalCnt = Integer.parseInt(bnList.get(0).getTotalCount());
		}
		
		PaginationInfo paginationInfo = new PaginationInfo();
	    paginationInfo.setCurrentPageNo(pageIndex);
        paginationInfo.setRecordCountPerPage(pageSize);
        paginationInfo.setPageSize(bannerVO.getPageUnit());
        paginationInfo.setTotalRecordCount(totalCnt);
        
        model.addAttribute("pageSize", pageSize);
	    model.addAttribute("totalCount", totalCnt);
	    model.addAttribute("pageIndex", pageIndex);
	    model.addAttribute("paginationInfo", paginationInfo);
	    
        model.addAttribute("resultCnt", totalCnt);
		model.addAttribute("menuId", menuId);
		model.addAttribute("bnType", bnType);
		model.addAttribute("bnList", bnList);
		
		return "/adm/banner/" + bnType + "/list";
	}
	
	/**
	 * 배너/팝업 등록 폼
	 * @param bnType
	 * @param bannerVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("{bnType}/insertForm.do")
	public String bannerInsertForm(@PathVariable("bnType")String bnType, @ModelAttribute("form")BannerVO bannerVO, ModelMap model) throws Exception {
		
		String menuId = bannerVO.getMenuId();
		
		model.addAttribute("bnType", bnType);
		model.addAttribute("menuId", menuId);
		
		return "/adm/banner/" + bnType + "/form";
	}
	
	/**
	 * 배너/팝업 등록
	 * @param bnType
	 * @param bannerVO
	 * @param redirectAttributes
	 * @param multiRequest
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("{bnType}/insert.do")
	public String bannerIsnert(@PathVariable("bnType")String bnType, @ModelAttribute("form")BannerVO bannerVO, RedirectAttributes redirectAttributes
			, final MultipartHttpServletRequest multiRequest, ModelMap model) throws Exception {
		
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.putSessionToVo(bannerVO);
		
		String retMsg = "";
		String menuId = bannerVO.getMenuId();
		bannerVO.setBnType(bnType);
		
		int result = adminBannerService.insertBanner(bannerVO, multiRequest);
		if(result > 0) {
			retMsg = "등록되었습니다.";
		} else {
			retMsg = "등록할 수 없습니다.";
		}
		
		redirectAttributes.addFlashAttribute("retMsg", retMsg);
		model.addAttribute("menuId", menuId);
		model.addAttribute("bnType", bnType);
		
		return "redirect:/adm/banner/" + bnType + "/list.do?menuId=" + menuId;
	}
	
	/**
	 * 배너/팝업 수정 폼
	 * @param bnType
	 * @param bannerVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("{bnType}/updateForm.do")
	public String bannerUpdateForm(@PathVariable("bnType")String bnType, @ModelAttribute("form")BannerVO bannerVO, ModelMap model) throws Exception {
		
		String menuId = bannerVO.getMenuId();
		
		bannerVO = adminBannerService.selectBanner(bannerVO);
		FileVO fileVO = new FileVO();
		fileVO.setAtchFileIdx(bannerVO.getBnThumb());
		List<FileVO> fileList = fileService.listBoardFile(fileVO);
		
		model.addAttribute("bannerResult", bannerVO);
		model.addAttribute("fileList", fileList);
		model.addAttribute("menuId", menuId);
		model.addAttribute("bnType", bnType);
		
		return "/adm/banner/" + bnType + "/form";
	}
	
	/**
	 * 배너/팝업 수정
	 * @param bnType
	 * @param bannerVO
	 * @param redirectAttributes
	 * @param multiRequest
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("{bnType}/update.do")
	public String bannerUpdate(@PathVariable("bnType")String bnType, @ModelAttribute("form")BannerVO bannerVO, RedirectAttributes redirectAttributes,
			final MultipartHttpServletRequest multiRequest, ModelMap model) throws Exception {
		
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.putSessionToVo(bannerVO);
		
		String retMsg = "";
		String menuId = bannerVO.getMenuId();
		
		int result = adminBannerService.updateBanner(bannerVO, multiRequest);
		if(result > 0) {
			retMsg = "수정되었습니다.";
		} else {
			retMsg = "수정할 수 없습니다.";
			redirectAttributes.addFlashAttribute("retMsg", retMsg);
			return "redirect:/adm/banner" + bnType + "/updateForm.do?bnId=" + bannerVO.getBnId() + "&menuId=" + menuId;
		}
		
		model.addAttribute("menuId", menuId);
		model.addAttribute("bnType", bnType);
		redirectAttributes.addFlashAttribute("retMsg", retMsg);
		
		return "redirect:/adm/banner/" + bnType + "/list.do?menuId=" + menuId;
	}
	
	/**
	 * 배너/팝업 삭제
	 * @param bnType
	 * @param bannerVO
	 * @param redirectAttributes
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("{bnType}/delete.do")
	public String deletebanner(@PathVariable("bnType")String bnType, @ModelAttribute("form")BannerVO bannerVO, RedirectAttributes redirectAttributes, ModelMap model) throws Exception {
		
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.putSessionToVo(bannerVO);
		
		String retMsg = "";
		String menuId = bannerVO.getMenuId();
		
		int result = adminBannerService.deleteBanner(bannerVO);
		if(result > 0) {
			retMsg = "삭제되었습니다.";
		} else {
			retMsg = "삭제할 수 없습니다.";
		}
		
		model.addAttribute("menuId", menuId);
		redirectAttributes.addFlashAttribute("retMsg", retMsg);
		
		return "redirect:/adm/banner/" + bnType + "/list.do?menuId=" + menuId;
	}
}
