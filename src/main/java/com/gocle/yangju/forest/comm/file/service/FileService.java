package com.gocle.yangju.forest.comm.file.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.gocle.yangju.forest.comm.file.vo.FileVO;

public interface FileService {

	/** 게시글 첨부파일 저장 */
	String saveComBbsFile(List<MultipartFile> fileObj, String baId, String regId, String storePath , String thumbnailCrop) throws Exception;

	/** 게시글 썸네일 저장 */
	String saveComBbsThumFile(List<MultipartFile> fileObj, String baId,String regId, String storePath, String thumbnailCrop) throws Exception;

	/** 파일정보 저장 */
	int insertFile(List<FileVO> fvoList, String baId, String regId, String thumb) throws Exception;

	/** 파일 목록 */
	List<FileVO> listBoardFile(FileVO fvo) throws Exception;

	/** 파일 다운 */
	FileVO getFile(FileVO fileVO) throws Exception;

	/** 파일 삭제 */
	int deleteFile(FileVO fileVO) throws Exception;

	/** 배너파일 등록 */
	String saveComBannerFile(List<MultipartFile> fileObj, String bnId, String regId, String bannerUploadPath, String thumbnailCrop) throws Exception;

	/** 프로그램,공예품 파일 등록 */
	int insertProductFile(List<FileVO> fvoList, String pId, String memSeq, String thumb) throws Exception;

	/** 프로그램,공예품 첨부파일 저장 */
	void saveProductFile(List<MultipartFile> fileObj, String pId, String regId, String fileUploadPath,
			String string) throws Exception;

	/** 프로그램,공예품 썸네일 첨부파일 저장 */
	void saveProductThumFile(List<MultipartFile> tFileObj, String pId, String regId, String imgFileUploadPath,
			String string) throws Exception;

	/** 프로그램,공예품 파일목록 */
	List<FileVO> listProductFile(FileVO fvo) throws Exception;

	List<FileVO> listFile(FileVO fileVO) throws Exception;

	String saveFile(List<MultipartFile> fileObj, String string, String insertUser, String storePathString,
			String string2) throws Exception;

	int insertReplyFile(List<FileVO> fvoList) throws Exception;
	
	String getFileIdx() throws Exception;
}
