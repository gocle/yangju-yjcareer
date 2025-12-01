package com.gocle.yangju.forest.adm.product.web;

import java.util.Arrays;
import java.util.List;
import java.util.Locale;

import org.apache.commons.lang3.StringUtils;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gocle.yangju.forest.adm.code.service.AdminCodeService;
import com.gocle.yangju.forest.adm.code.vo.CodeVO;
import com.gocle.yangju.forest.adm.product.service.AdminProductService;
import com.gocle.yangju.forest.adm.product.vo.ProductVO;
import com.gocle.yangju.forest.comm.file.service.FileService;
import com.gocle.yangju.forest.comm.file.vo.FileVO;
import com.gocle.yangju.forest.comm.vo.LoginInfo;

@Controller
@RequestMapping("/adm/product")
public class AdminProductController {

	@Autowired
	AdminProductService adminProductService;
	
	@Autowired
	AdminCodeService adminCodeService;
	
	@Autowired
	FileService fileService;
	
	/**
	 * 목재 공예품 리스트
	 * @param productVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("list.do")
	public String productList(@ModelAttribute("form")ProductVO productVO, ModelMap model) throws Exception {
		
		String menuId = productVO.getMenuId();
		
		List<ProductVO> productList = adminProductService.selectProductList(productVO);
		
		int totalCnt = 0;
		Integer pageSize = productVO.getPageSize();
		Integer pageIndex = productVO.getPageIndex();
		
		if(0 < productList.size()) {
			totalCnt = Integer.parseInt( productList.get(0).getTotalCount() );
		}
		PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setCurrentPageNo(pageIndex);
        paginationInfo.setRecordCountPerPage(pageSize);
        paginationInfo.setPageSize(productVO.getPageUnit());
        paginationInfo.setTotalRecordCount(totalCnt);
        
        CodeVO cvo = new CodeVO();
		cvo.setCodeGroup("PRODUCT_TARGET");
		List<CodeVO> codeList = adminCodeService.selectCodeList(cvo);
        
        model.addAttribute("pageSize", pageSize);
	    model.addAttribute("totalCount", totalCnt);
	    model.addAttribute("pageIndex", pageIndex);
	    model.addAttribute("paginationInfo", paginationInfo);
	    
	    model.addAttribute("targetList", codeList);
	    model.addAttribute("productList", productList);
	    model.addAttribute("productVO", productVO);
	    model.addAttribute("menuId", menuId);
	    
	    return "/adm/product/list";
	}
	
	
	/**
	 * 공예품 등록 폼
	 * @param productVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("form.do")
	public String productInsertForm(@ModelAttribute("form")ProductVO productVO, ModelMap model) throws Exception {
		
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.putSessionToVo(productVO);
		
		CodeVO cvo = new CodeVO();
		cvo.setCodeGroup("PRODUCT_TARGET");
		List<CodeVO> codeList = adminCodeService.selectCodeList(cvo);
		
		String menuId = productVO.getMenuId();
		model.addAttribute("productVO", productVO);
		model.addAttribute("menuId", menuId);
		model.addAttribute("targetList", codeList);
		
		return "/adm/product/form";
	}
	
	/**
	 * 공예품 등록
	 * @param productVO
	 * @param multiRequest
	 * @param redirectAttributes
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("insert.do")
	public String productInsert(@ModelAttribute("form")ProductVO productVO, final MultipartHttpServletRequest multiRequest, RedirectAttributes redirectAttributes, ModelMap model) throws Exception {
		
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.putSessionToVo(productVO);
		
		String menuId = productVO.getMenuId();
		String retMsg = "";
		
		List<MultipartFile> objFile = multiRequest.getFiles("file_thumbFileId");
		if (objFile != null && !objFile.isEmpty()) {
		    String fileName = objFile.get(0).getOriginalFilename();
		    if (StringUtils.isNotEmpty(fileName)) {
		        String ext = fileName.substring(fileName.lastIndexOf('.') + 1).toLowerCase(Locale.ROOT);
		        if (!Arrays.asList("jpg", "jpeg", "png").contains(ext)) {
		            retMsg = "허용되지 않는 파일형식입니다.";
		            redirectAttributes.addFlashAttribute("retMsg", retMsg);
		            return "redirect:/adm/product/form.do?menuId=" + menuId;
		        }
		    }
		}
		
		int result = 0;
		result = adminProductService.insertProduct(productVO, multiRequest);
		if (result > 0) {
		    retMsg = "저장되었습니다.";
		} else {
		    retMsg = "저장할 수 없습니다.";
		}
		redirectAttributes.addFlashAttribute("retMsg", retMsg);
		model.addAttribute("menuId", menuId);
		
		return "redirect:/adm/product/list.do?menuId="+menuId;
	}
	
	/**
	 * 공예품 상세
	 * @param productVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("detail.do")
	public String productDetail(@ModelAttribute("form")ProductVO productVO, ModelMap model) throws Exception {
		
		String menuId = productVO.getMenuId();
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.putSessionToVo(productVO);
		
		productVO = adminProductService.selectProduct(productVO);
		
		CodeVO cvo = new CodeVO();
		cvo.setCodeGroup("PRODUCT_TARGET");
		List<CodeVO> codeList = adminCodeService.selectCodeList(cvo);
		
		FileVO fvo = new FileVO();
		fvo.setpId(productVO.getProductId());
		fvo.setThumbnailCrop("N");
		List<FileVO> fileList = fileService.listProductFile(fvo);
		
		fvo.setThumbnailCrop("Y");
		List<FileVO> tFileList = fileService.listProductFile(fvo);
		
		model.addAttribute("productVO", productVO);
		model.addAttribute("targetList", codeList);
		model.addAttribute("fileList", fileList);
		model.addAttribute("fileList1", tFileList);
		model.addAttribute("menuId", menuId);
		
		return "/adm/product/view";
	}
	
	/**
	 * 공예품 수정 폼
	 * @param productVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("updateForm.do")
	public String updateProductForm(@ModelAttribute("form")ProductVO productVO, ModelMap model) throws Exception {
		
		String menuId = productVO.getMenuId();
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.putSessionToVo(productVO);
		
		productVO = adminProductService.selectProduct(productVO);
		
		CodeVO cvo = new CodeVO();
		cvo.setCodeGroup("PRODUCT_TARGET");
		List<CodeVO> codeList = adminCodeService.selectCodeList(cvo);
		
		FileVO fvo = new FileVO();
		fvo.setpId(productVO.getProductId());
		fvo.setThumbnailCrop("N");
		List<FileVO> fileList = fileService.listProductFile(fvo);
		
		fvo.setThumbnailCrop("Y");
		List<FileVO> tFileList = fileService.listProductFile(fvo);
		
		model.addAttribute("productVO", productVO);
		model.addAttribute("targetList", codeList);
		model.addAttribute("fileList", fileList);
		model.addAttribute("fileList1", tFileList);
		model.addAttribute("menuId", menuId);
		
		return "/adm/product/form";
	}
	
	/**
	 * 공예품 수정
	 * @param productVO
	 * @param model
	 * @param multiRequest
	 * @param redirectAttributes
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("update.do")
	public String updateProduct(@ModelAttribute("form")ProductVO productVO, ModelMap model, final MultipartHttpServletRequest multiRequest, RedirectAttributes redirectAttributes) throws Exception {
		
		String menuId = productVO.getMenuId();
		String retMsg = "";
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.putSessionToVo(productVO);
		
		int result = 0;
		result = adminProductService.updateProduct(productVO, multiRequest);
		if(result > 0) {
			retMsg = "수정되었습니다.";
		} else {
			retMsg = "수정할 수 없습니다.";
		}
		
		redirectAttributes.addFlashAttribute("retMsg", retMsg);
		
		return "redirect:/adm/product/list.do?menuId="+menuId;
	}
	
	
	/**
	 * 목재공예품 삭제
	 * @param productVO
	 * @param model
	 * @param redirectAttributes
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("delete.do")
	public String deleteProduct(@ModelAttribute("form")ProductVO productVO, ModelMap model, RedirectAttributes redirectAttributes) throws Exception {
		
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.putSessionToVo(productVO);
		String menuId = productVO.getMenuId();
		String retMsg = "";
		
		int result = adminProductService.deleteProduct(productVO);
		if(result > 0) {
			retMsg = "삭제되었습니다.";
		} else {
			retMsg = "삭제할 수 없습니다.";
		}
		redirectAttributes.addFlashAttribute("retMsg", retMsg);
		
		return "redirect:/adm/product/list.do?menuId="+menuId;
	}
}
