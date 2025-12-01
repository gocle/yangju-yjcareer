package com.gocle.yangju.forest.comm.file.service.impl;

import java.util.List;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.gocle.yangju.forest.comm.file.service.FileService;
import com.gocle.yangju.forest.comm.file.vo.FileVO;
import com.gocle.yangju.forest.comm.util.AtchFileUtil;


@Transactional(rollbackFor=Exception.class)
@Service
public class FileServiceImpl extends EgovAbstractServiceImpl implements FileService {
	
	@Autowired
	FileMapper fileMapper;
	
	@Autowired
	AtchFileUtil atchFileUtil;
	
	@Override
	public int insertFile(List<FileVO> fvoList, String boardIdx,String mIdx ,String thumb) throws Exception {
		
		Integer resultCnt = 0;
		
		for(FileVO fvo : fvoList ){
			fvo.setBoardIdx(boardIdx);
			fvo.setAtchFileIdx(fileMapper.getFileIdx());
			fvo.setRegId(mIdx);
			fvo.setThumbnailCrop(thumb);
			resultCnt = resultCnt + fileMapper.insertFile(fvo);
		}
		
		return resultCnt;
	}
	
	@Override 
	public String saveComBbsFile(List<MultipartFile> fileObj, String baId, String regId, String storePath, String thumbnailCrop) throws Exception {
		
		if(!fileObj.isEmpty()) {
			List<FileVO> result = atchFileUtil.parseAtchFileInfo(fileObj, baId, 0, regId, storePath, thumbnailCrop);
			this.insertFile(result, baId, regId, thumbnailCrop);
		}
		
		return baId;
	}

	@Override
	public String saveComBbsThumFile(List<MultipartFile> fileObj, String baId, String regId, String storePath, String thumbnailCrop) throws Exception {
		
		if(!fileObj.isEmpty()) {
			List<FileVO> result = atchFileUtil.parseAtchFileInfo(fileObj, baId, 0, regId, storePath, thumbnailCrop);
			
			this.insertFile( result , baId , regId , thumbnailCrop);
		}
		return baId;
	}

	@Override
	public List<FileVO> listBoardFile(FileVO fvo) throws Exception {
		return fileMapper.listBoardFile(fvo);
	}

	@Override
	public FileVO getFile(FileVO fileVO) throws Exception {
		return fileMapper.getFile(fileVO);
	}

	@Override
	public int deleteFile(FileVO fileVO) throws Exception {
		return fileMapper.deleteFile(fileVO);
	}

	@Override
	public String saveComBannerFile(List<MultipartFile> fileObj, String bnId, String regId, String bannerUploadPath, String thumbnailCrop) throws Exception {
		String atchFileIdx = null;
		
		if(!fileObj.isEmpty()) {
			List<FileVO> result = atchFileUtil.parseAtchFileInfo(fileObj, bnId, 0, regId, bannerUploadPath, thumbnailCrop);
			this.insertFile( result , bnId , regId , thumbnailCrop);
			if(result.size() > 0) {
				atchFileIdx = result.get(0).getAtchFileIdx();
			} else {
				atchFileIdx = "";
			}
		}
		return atchFileIdx;
	}
	
	@Override
	public int insertProductFile(List<FileVO> fvoList, String pId,String memSeq ,String thumb) throws Exception {
		
		Integer resultCnt = 0;
		
		for(FileVO fvo : fvoList ){
			fvo.setpId(pId);
			fvo.setAtchFileIdx(fileMapper.getFileIdx());
			fvo.setRegId(memSeq);
			fvo.setThumbnailCrop(thumb);
			resultCnt = resultCnt + fileMapper.insertFile(fvo);
		}
		
		return resultCnt;
	}

	@Override
	public void saveProductFile(List<MultipartFile> fileObj, String pId, String regId, String fileUploadPath,
			String thumbnailCrop) throws Exception {
		String atchFileIdx = null;
		
		if(!fileObj.isEmpty()) {
			List<FileVO> result = atchFileUtil.parseAtchFileInfo(fileObj, pId, 0, regId, fileUploadPath, thumbnailCrop);
			this.insertProductFile( result , pId , regId , thumbnailCrop);
			if(result.size() > 0) {
				atchFileIdx = result.get(0).getAtchFileIdx();
			} else {
				atchFileIdx = "";
			}
		}
		
	}

	@Override
	public void saveProductThumFile(List<MultipartFile> tFileObj, String productId, String regId,
			String imgFileUploadPath, String thumbnailCrop) throws Exception {

		if(!tFileObj.isEmpty()) {
			List<FileVO> result = atchFileUtil.parseAtchFileInfo(tFileObj, productId, 0, regId, imgFileUploadPath, thumbnailCrop);
			
			this.insertProductFile( result , productId , regId , thumbnailCrop);
		}
	}

	@Override
	public List<FileVO> listProductFile(FileVO fvo) throws Exception {
		return fileMapper.listProductFile(fvo);
	}
	
	@Override
	public List<FileVO> listFile(FileVO fileVO) throws Exception {
		List<FileVO> data = fileMapper.listFile(fileVO);
		return data;
	}
	
	/////////
	//reply//
	/////////
	@Override
	public String saveFile(List<MultipartFile> fileObj, String atchFileIdx, String mIdx, String storePath,String thumbnailCrop)	throws Exception {
		
	/*	for(int i = 0; i < fileObj.size(); i++){
		  System.out.println("리스트에있나보자1"+ fileObj.get(i).getOriginalFilename());
		}*/
		
		//첨부파일 저장	 		
		//		final Map< String , MultipartFile > fileObj = multiRequest.getFileMap();  // 화면에서 모두 다른 input name인 경우.( <form method='post' action=...> <input name="xx_1" type="file"> ,<input name="xx_2" type="file"> ,<input name="xx_3" type="file"> < /form >)
		//		final List< MultipartFile > fileObj = multiRequest.getFiles("atchFiles"); // 화면에서 모두 같은 input name인 경우.( <form method='post' action=...> <input name="xx" type="file">   ,<input name="xx" type="file">   ,<input name="xx" type="file">   < /form >)
		if(!fileObj.isEmpty()) {
			
		
				//여길안옴. //여기가 문제
			
				List < FileVO > intResult = atchFileUtil.parseComBannerFileInfo( fileObj, atchFileIdx , 0 ,mIdx, storePath ,"N");
				
				
				
				// 2. 파일 정보 DB에 저장
				int result = this.insertReplyFile( intResult );
				
				if( 0 < intResult.size() ){
					/*	System.out.println("여길와야 정상");*/
					
					atchFileIdx = intResult.get(0).getAtchFileIdx();
					/*
					System.out.println("atchFileIdx" + atchFileIdx);*/
				}
				
				if(result == 0){
					
					atchFileIdx = "";
				}
		}
		
		return atchFileIdx;
	}

	//REPLY 파일 정보 DB저장
	@Override
	public int insertReplyFile(List<FileVO> fvoList) throws Exception {
		Integer resultCnt = 0;
		
		for(FileVO fvo : fvoList ){
			
			fvo.setAtchFileIdx(fileMapper.getFileIdx());
			
			
			resultCnt = resultCnt + fileMapper.insertFile(fvo);
		}
		
		
		
		return resultCnt;
		
	}
	
	@Override
	public String getFileIdx() throws Exception {
		String data = fileMapper.getFileIdx();
		return data;
	}
}
