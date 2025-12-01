package com.gocle.yangju.forest.adm.product.service.impl;

import java.util.List;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.fdl.idgnr.EgovIdGnrService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gocle.yangju.forest.adm.product.service.AdminProductService;
import com.gocle.yangju.forest.adm.product.vo.ProductVO;
import com.gocle.yangju.forest.comm.file.service.FileService;


@Transactional(rollbackFor=Exception.class)
@Service
public class AdminProductServiceImpl extends EgovAbstractServiceImpl implements AdminProductService{

	@Autowired
	AdminProductMapper adminProductMapper;
	
	@Autowired
	EgovIdGnrService productIdGnrService;
	
	@Autowired
	FileService fileService;
	
	@Override
	public List<ProductVO> selectProductList(ProductVO productVO) throws Exception {
		return adminProductMapper.selectProductList(productVO);
	}

	@Override
	public int insertProduct(ProductVO productVO, MultipartHttpServletRequest multiRequest) throws Exception {

		productVO.setProductId(productIdGnrService.getNextStringId());
		String productId = productVO.getProductId();
		String regId = productVO.getSessionMemSeq();
		
		String fileUploadPath = "Globals.productFileStorePath";
		String ImgFileUploadPath = "Globals.thumbnailStorePath";
		
		if(null != multiRequest) {
			final List<MultipartFile> fileObj = multiRequest.getFiles("file_atchFileId");
			fileService.saveProductFile(fileObj, productId, regId, fileUploadPath, "N");
			
			if(multiRequest.getFiles("file_thumbFileId") != null) {
				final List<MultipartFile> tFileObj = multiRequest.getFiles("file_thumbFileId");
				fileService.saveProductThumFile(tFileObj, productId, regId, ImgFileUploadPath, "Y");
			}
		}
		int result = adminProductMapper.insertProduct(productVO);
		
		return result;
	}

	@Override
	public ProductVO selectProduct(ProductVO productVO) throws Exception {
		return adminProductMapper.selectProduct(productVO);
	}

	@Override
	public int updateProduct(ProductVO productVO, MultipartHttpServletRequest multiRequest) throws Exception {
		
		String fileUploadPath = "Globals.productFileStorePath";
		String ImgFileUploadPath = "Globals.thumbnailStorePath";
		String productId = productVO.getProductId();
		String regId = productVO.getSessionMemSeq();
		
		if(null != multiRequest) {
			final List<MultipartFile> fileObj = multiRequest.getFiles("file_atchFileId");
			fileService.saveProductFile(fileObj, productId, regId, fileUploadPath, "N");
			
			if(multiRequest.getFiles("file_thumbFileId") != null) {
				final List<MultipartFile> tFileObj = multiRequest.getFiles("file_thumbFileId");
				fileService.saveProductThumFile(tFileObj, productId, regId, ImgFileUploadPath, "Y");
			}
		}
		int result = adminProductMapper.updateProduct(productVO);
		
		return result;
	}

	@Override
	public int deleteProduct(ProductVO productVO) throws Exception {
		return adminProductMapper.deleteProduct(productVO);
	}

}
