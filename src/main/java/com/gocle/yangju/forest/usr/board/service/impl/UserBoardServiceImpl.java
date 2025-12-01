package com.gocle.yangju.forest.usr.board.service.impl;

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
import com.gocle.yangju.forest.usr.board.service.UserBoardService;
import com.gocle.yangju.forest.usr.board.vo.BoardArticleVO;
import com.gocle.yangju.forest.usr.board.vo.BoardConfigVO;
import com.gocle.yangju.forest.usr.board.vo.BoardReplyVO;


@Service
public class UserBoardServiceImpl extends EgovAbstractServiceImpl implements UserBoardService {
	
	@Autowired
    private UserBoardMapper boardMapper;
	
	@Autowired
    private EgovIdGnrService boardArticleIdGnrService;
	
	@Autowired
	FileService fileService;

	@Override
	public BoardConfigVO getBoardConfig(BoardConfigVO boardConfigVO)
			throws Exception {
		
		BoardConfigVO data = boardMapper.getBoardConfig(boardConfigVO);
		
		
		return data;
	}

	@Override
	public List<BoardArticleVO> listBoardArticle(BoardArticleVO boardArticleVO)
			throws Exception {
		List<BoardArticleVO> data = boardMapper.listBoardArticle(boardArticleVO);
		return data;
	}

	@Override
	public List<BoardArticleVO> topNoticeList(BoardArticleVO boardArticleVO)
			throws Exception {
		// TODO Auto-generated method stub
		List<BoardArticleVO> data = boardMapper.topNoticeList(boardArticleVO);
		
		return data;
	}

	//조회수
	@Override
	public int boardHit(BoardArticleVO boardArticleVO) throws Exception {
		
		
		int data = boardMapper.boardHit(boardArticleVO);
		
		return data;
	}
	
	@Override
	public BoardArticleVO getUserBoardResult(BoardArticleVO boardArticleVO)
			throws Exception {
		
		
		BoardArticleVO data = boardMapper.getUserBoardResult(boardArticleVO);
		
		return data;
	}
	
	//게싯판 이전글 
	@Override
	public BoardArticleVO prevNext(BoardArticleVO boardArticleVO)
			throws Exception {
		
		BoardArticleVO data = boardMapper.prevNext(boardArticleVO);
		
		return data;
	}
	
	//리플 목록
	@Override
	public List<BoardReplyVO> listBoardReply(BoardReplyVO boardReplyVO)
			throws Exception {
		
		List<BoardReplyVO> data = boardMapper.listBoardReply(boardReplyVO);
		
		return data;
	}

	//qna 등록
	@Override
	public int insertUserBoardArticle(BoardArticleVO boardArticleVO, MultipartHttpServletRequest multiRequest) throws Exception {
		
		boardArticleVO.setBaId(boardArticleIdGnrService.getNextStringId());
		String baId = boardArticleVO.getBaId();
		String regId = boardArticleVO.getSessionMemSeq();
		
		String bbsFileUploadPath = "Globals.fileStorePath";
		String bbsImgFileUploadPath = "Globals.thumbnailStorePath";
		
		if(null != multiRequest) {
			final List<MultipartFile> fileObj = multiRequest.getFiles("file_atchFileId");
			
			fileService.saveComBbsFile(fileObj, baId, regId, bbsFileUploadPath, "N");
			
			if(multiRequest.getFiles("file_thumbFileId") != null) {
				final List<MultipartFile> tFileObj = multiRequest.getFiles("file_thumbFileId");
				fileService.saveComBbsThumFile(tFileObj, baId, regId, bbsImgFileUploadPath, "Y");
			}
		}
		
		int data = boardMapper.insertUserBoardArticle(boardArticleVO);
		
		return data;
	}

	@Override
	public BoardArticleVO getBoardArticle(BoardArticleVO boardArticleVO)
			throws Exception {

		
		BoardArticleVO data = boardMapper.getBoardArticle(boardArticleVO);
		
		return data;
	}

	//qna 수정
	@Override
	public int userUpdateQna(BoardArticleVO boardArticleVO, MultipartHttpServletRequest multiRequest) throws Exception {
	
		String baId = boardArticleVO.getBaId();
		String regId = boardArticleVO.getSessionMemSeq();
		
		String bbsFileUploadPath = "Globals.fileStorePath";
		String bbsImgFileUploadPath = "Globals.thumbnailStorePath";
		
		if(null != multiRequest) {
			final List<MultipartFile> fileObj = multiRequest.getFiles("file_atchFileId");
			
			fileService.saveComBbsFile(fileObj, baId, regId, bbsFileUploadPath, "N");
			
			if(multiRequest.getFiles("file_thumbFileId") != null) {
				final List<MultipartFile> tFileObj = multiRequest.getFiles("file_thumbFileId");
				fileService.saveComBbsThumFile(tFileObj, baId, regId, bbsImgFileUploadPath, "Y");
			}
		}
		
		int data = boardMapper.userUpdateQna(boardArticleVO); 
		
		return data;
	}
	
	//qna, 체험후기 삭제
	@Override
	public int userDeleteQna(BoardArticleVO boardArticleVO) throws Exception {
		
		int data = boardMapper.userDeleteQna(boardArticleVO); 
		
		return data;
	}

}
