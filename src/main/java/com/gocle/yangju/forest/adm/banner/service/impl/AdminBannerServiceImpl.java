package com.gocle.yangju.forest.adm.banner.service.impl;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.fdl.idgnr.EgovIdGnrService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gocle.yangju.forest.adm.banner.service.AdminBannerService;
import com.gocle.yangju.forest.adm.banner.vo.BannerVO;
import com.gocle.yangju.forest.comm.file.service.FileService;


@Service
public class AdminBannerServiceImpl extends EgovAbstractServiceImpl implements AdminBannerService {

	@Autowired
	AdminBannerMapper adminBannerMapper;
	
	@Autowired
	FileService fileService;
	
	@Autowired
	EgovIdGnrService bannerIdGnrService;
	
	@Override
	public List<BannerVO> selectBannerList(BannerVO bannerVO) throws Exception {
		return adminBannerMapper.selectBannerList(bannerVO);
	}

	@Override
	public int insertBanner(BannerVO bannerVO, MultipartHttpServletRequest multiRequest) throws Exception {
		
		String regId = bannerVO.getSessionMemSeq();
		bannerVO.setBnId(bannerIdGnrService.getNextStringId());
		
		if(multiRequest != null) {
			String bannerUploadPath = "Globals.bannerStorePath";
			final List<MultipartFile> fileObj = multiRequest.getFiles("image_atchFileId");
			String atchFileIdx = fileService.saveComBannerFile(fileObj, bannerVO.getBnId(), regId, bannerUploadPath, "N");
			bannerVO.setBnThumb(atchFileIdx);
		}
		
		LocalDate date = LocalDate.parse(bannerVO.getBnStartDate(), DateTimeFormatter.ofPattern("yyyy.MM.dd"));
		String formatted = date.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		bannerVO.setBnStartDate(formatted);
		
		LocalDate date2 = LocalDate.parse(bannerVO.getBnEndDate(), DateTimeFormatter.ofPattern("yyyy.MM.dd"));
		String formatted2 = date2.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		bannerVO.setBnEndDate(formatted2);
		
		
		int result = adminBannerMapper.insertBanner(bannerVO);
		return result;
	}

	@Override
	public BannerVO selectBanner(BannerVO bannerVO) throws Exception {
		return adminBannerMapper.selectBanner(bannerVO);
	}

	@Override
	public int updateBanner(BannerVO bannerVO, MultipartHttpServletRequest multiRequest) throws Exception {
		
		String regId = bannerVO.getSessionMemSeq();
		
		if(multiRequest != null) {
			String bannerUploadPath = "Globals.bannerStorePath";
			final List<MultipartFile> fileObj = multiRequest.getFiles("image_atchFileId");
			String atchFileIdx = fileService.saveComBannerFile(fileObj, bannerVO.getBnId(), regId, bannerUploadPath, "N");
			bannerVO.setBnThumb(atchFileIdx);
		}
		
		LocalDate date = LocalDate.parse(bannerVO.getBnStartDate(), DateTimeFormatter.ofPattern("yyyy.MM.dd"));
		String formatted = date.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		bannerVO.setBnStartDate(formatted);
		
		LocalDate date2 = LocalDate.parse(bannerVO.getBnEndDate(), DateTimeFormatter.ofPattern("yyyy.MM.dd"));
		String formatted2 = date2.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		bannerVO.setBnEndDate(formatted2);
		
		int result = adminBannerMapper.updateBanner(bannerVO);
		return result;
	}

	@Override
	public int deleteBanner(BannerVO bannerVO) throws Exception {
		// 1=사용, 0=미사용
		bannerVO.setBnUse("0");
		return adminBannerMapper.deleteBanner(bannerVO);
	}

}
