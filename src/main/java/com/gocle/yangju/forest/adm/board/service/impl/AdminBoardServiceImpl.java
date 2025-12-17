package com.gocle.yangju.forest.adm.board.service.impl;

import java.util.List;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.fdl.idgnr.EgovIdGnrService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gocle.yangju.forest.adm.board.service.AdminBoardService;
import com.gocle.yangju.forest.adm.board.vo.BoardArticleVO;
import com.gocle.yangju.forest.adm.board.vo.BoardConfigVO;
import com.gocle.yangju.forest.adm.board.vo.BoardReplyVO;
import com.gocle.yangju.forest.comm.file.service.FileService;


@Transactional(rollbackFor=Exception.class)
@Service
public class AdminBoardServiceImpl extends EgovAbstractServiceImpl implements AdminBoardService {

	@Autowired
	AdminBoardMapper adminBoardMapper;
	
	@Autowired
	FileService fileService;
	
	@Autowired
	EgovIdGnrService boardArticleIdGnrService;
	
	@Autowired
	EgovIdGnrService boardReplyIdGnrService;
	
	
	@Override
	public List<BoardConfigVO> listBoardConfig(BoardConfigVO boardConfigVO) throws Exception {
		return adminBoardMapper.listBoardConfig(boardConfigVO);
	}


	@Override
	public int insertBoardConfig(BoardConfigVO boardConfigVO) throws Exception {
		return adminBoardMapper.insertBoardConfig(boardConfigVO);
	}


	@Override
	public BoardConfigVO selectBoardConfig(BoardConfigVO boardConfigVO) throws Exception {
		return adminBoardMapper.selectBoardConfig(boardConfigVO);
	}


	@Override
	public int updateBoardConfig(BoardConfigVO boardConfigVO) throws Exception {
		return adminBoardMapper.updateBoardConfig(boardConfigVO);
	}


	@Override
	public int deleteBoardConfig(BoardConfigVO boardConfigVO) throws Exception {
		return adminBoardMapper.deleteBoardConfig(boardConfigVO);
	}


	@Override
	public List<BoardArticleVO> listBoardArticle(BoardArticleVO boardArticleVO) throws Exception {
		return adminBoardMapper.listBoardArticle(boardArticleVO);
	}


	@Override
	public List<BoardArticleVO> topNoticeList(BoardArticleVO boardArticleVO) throws Exception {
		return adminBoardMapper.topNoticeList(boardArticleVO);
	}


	@Override
	public int insertBoardArticle(BoardArticleVO boardArticleVO, MultipartHttpServletRequest multiRequest)
			throws Exception {
		
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
		int result = adminBoardMapper.insertBoardArticle(boardArticleVO);
		
		return result;
	}


	@Override
	public BoardArticleVO selectBoardArticle(BoardArticleVO boardArticleVO) throws Exception {
		return adminBoardMapper.selectBoardArticle(boardArticleVO);
	}


	@Override
	public List<BoardReplyVO> listBoardReply(BoardReplyVO boardReplyVO) throws Exception {
		return adminBoardMapper.listBoardReply(boardReplyVO);
	}


	@Override
	public int updateArticleBoard(BoardArticleVO boardArticleVO, final MultipartHttpServletRequest multiRequest)
			throws Exception {
		
		String bbsFileUploadPath = "Globals.fileStorePath";
		String bbsImgFileUploadPath = "Globals.thumbnailStorePath";
		String regId = boardArticleVO.getSessionMemSeq();
		String baId = boardArticleVO.getBaId();
		
		if(null != multiRequest) {
			final List<MultipartFile> fileObj = multiRequest.getFiles("file_atchFileId");
			fileService.saveComBbsFile(fileObj, baId, regId, bbsFileUploadPath, "N");
			
			if(multiRequest.getFiles("file_thumbFileId") != null) {
				final List<MultipartFile> tFileObj = multiRequest.getFiles("file_thumbFileId");
				fileService.saveComBbsThumFile(tFileObj, baId, regId, bbsImgFileUploadPath, "Y");
			}
		}
		int result = adminBoardMapper.updateArticleBoard(boardArticleVO);
		return result;
	}


	@Override
	public int deleteBoardArticle(BoardArticleVO boardArticleVO) throws Exception {
		return adminBoardMapper.deleteBoardArticle(boardArticleVO);
	}
	
	@Override
	public BoardConfigVO getBoardConfig(BoardConfigVO boardConfigVO)
			throws Exception {
		
		BoardConfigVO data = adminBoardMapper.getBoardConfig(boardConfigVO);
		
		
		return data;
	}
	
	@Override
	public BoardArticleVO getBoardArticle(BoardArticleVO boardArticleVO)
			throws Exception {

		
		BoardArticleVO data = adminBoardMapper.getBoardArticle(boardArticleVO);
		
		return data;
	}
	
	//qna
		@Override
		public int updateBoardArticleQna(BoardArticleVO boardArticleVO)
				throws Exception {
			
			int data = adminBoardMapper.updateArticleBoard(boardArticleVO);
			
			
			return data;
		}
		
		
		//리플 저장 (파일추가x)
		@Override
		public int insertBoardReply(BoardReplyVO boardReplyVO, final MultipartHttpServletRequest multiRequest) throws Exception {
			// TODO Auto-generated method stub
			
			boardReplyVO.setBrId(boardReplyIdGnrService.getNextStringId());
			
			String brId = boardReplyVO.getBrId();
			
			String insertUser = boardReplyVO.getSessionMemSeq();
			
			String atchFileIdx = "";
			
			if(null != multiRequest){
			
				//첨부파일 저장	 		
				final List< MultipartFile > fileObj = multiRequest.getFiles("file_atchFileId");
			
				String storePathString ="Globals.fileStorePath";
				
				atchFileIdx =  fileService.saveFile(fileObj, "" , insertUser, storePathString, "N");
				
				
			}
			
			boardReplyVO.setAtchFileIdx(atchFileIdx);
			
			int data = adminBoardMapper.insertBoardReply(boardReplyVO);
		
			return data;
		}
		
		
		//리플 삭제
		@Override
		public int deleteBoardReply(BoardReplyVO boardReplyVO)throws Exception{
			
			
			
			int data = adminBoardMapper.deleteBoardReply(boardReplyVO);
			
			
			return data;
		}
		
		
		//리플 수정
		@Override
		public int updateBoardReply(BoardReplyVO boardReplyVO,
				final MultipartHttpServletRequest multiRequest)throws Exception{
			
			String insertUser = boardReplyVO.getRegId();
			
			String atchFileIdx = "";
			
			if(null != multiRequest){
			
				//첨부파일 저장	 		
				final List< MultipartFile > fileObj = multiRequest.getFiles("file_atchFileId");
						
				String storePathString ="Globals.fileStorePath";
				
				atchFileIdx =  fileService.saveFile(fileObj, "" , insertUser, storePathString, "N");
				
				
			}
			
			boardReplyVO.setAtchFileIdx(atchFileIdx);
			
			int data = adminBoardMapper.updateBoardReply(boardReplyVO);
			
			return data;
			
		}

		@Override
		public BoardReplyVO selectBoardReply(BoardReplyVO boardReplyVO) throws Exception {
			return adminBoardMapper.selectBoardReply(boardReplyVO);
		}
}
