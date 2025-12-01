package com.gocle.yangju.forest.adm.intro.service.impl;

import java.util.List;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.fdl.idgnr.EgovIdGnrService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gocle.yangju.forest.adm.intro.service.AdminIntroService;
import com.gocle.yangju.forest.adm.intro.vo.IntroVO;
import com.gocle.yangju.forest.comm.file.service.FileService;
import com.gocle.yangju.forest.comm.file.service.impl.FileMapper;
import com.gocle.yangju.forest.comm.file.vo.FileVO;


@Transactional(rollbackFor=Exception.class)
@Service
public class AdminIntroServiceImpl extends EgovAbstractServiceImpl implements AdminIntroService {

	@Autowired
	AdminIntroMapper adminIntroMapper;
	
	@Autowired
	FileMapper fileMapper;
	
	@Autowired
	EgovIdGnrService introIdGnrService;
	
	@Autowired
	FileService fileService;
	
	
	@Override
	public List<IntroVO> selectIntroList(IntroVO introVO) throws Exception {
		return adminIntroMapper.selectIntroList(introVO);
	}

	@Override
	public int insertIntro(IntroVO introVO, MultipartHttpServletRequest multiRequest) throws Exception {
		
		introVO.setIntId(introIdGnrService.getNextStringId());
		String programId = introVO.getIntId();
		String regId = introVO.getSessionMemSeq();
		
		String ImgFileUploadPath = "Globals.thumbnailStorePath";
		
		if(null != multiRequest) {
			if(multiRequest.getFiles("file_thumbFileId") != null) {
				final List<MultipartFile> tFileObj = multiRequest.getFiles("file_thumbFileId");
				fileService.saveProductThumFile(tFileObj, programId, regId, ImgFileUploadPath, "Y");
			}
		}
		int result = adminIntroMapper.insertIntro(introVO);
		
		return result;
	}

	@Override
	public IntroVO selectIntro(IntroVO introVO) throws Exception {
		return adminIntroMapper.selectIntro(introVO);
	}

	@Override
	public int updateIntro(IntroVO introVO, MultipartHttpServletRequest multiRequest) throws Exception {
		
		String programId = introVO.getIntId();
		String regId = introVO.getSessionMemSeq();
		String ImgFileUploadPath = "Globals.thumbnailStorePath";
		
		if(null != multiRequest) {
			if(multiRequest.getFiles("file_thumbFileId") != null) {
				final List<MultipartFile> tFileObj = multiRequest.getFiles("file_thumbFileId");
				
				System.out.println(tFileObj);
				System.out.println(programId);
				System.out.println(regId);
				System.out.println(ImgFileUploadPath);
				
				fileService.saveProductThumFile(tFileObj, programId, regId, ImgFileUploadPath, "Y");
			}
		}
		int result = adminIntroMapper.updateIntro(introVO);
		
		return result;
	}

	@Override
	public int deleteIntro(IntroVO introVO) throws Exception {
		return adminIntroMapper.deleteIntro(introVO);
	}

	@Override
	public int introOrderUpdate(IntroVO introVO) throws Exception {
		
		int data = adminIntroMapper.introOrderUpdate(introVO);
		
		return data;
}

}
