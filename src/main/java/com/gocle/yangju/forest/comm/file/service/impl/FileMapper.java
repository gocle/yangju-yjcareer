package com.gocle.yangju.forest.comm.file.service.impl;

import java.util.List;

import com.gocle.yangju.forest.comm.file.vo.FileVO;

public interface FileMapper {

	String getFileIdx() throws Exception;

	Integer insertFile(FileVO fvo) throws Exception;

	List<FileVO> listBoardFile(FileVO fvo) throws Exception;

	FileVO getFile(FileVO fileVO) throws Exception;

	int deleteFile(FileVO fileVO) throws Exception;

	List<FileVO> listProductFile(FileVO fvo) throws Exception;

	List<FileVO> listFile(FileVO fileVO) throws Exception;

}
