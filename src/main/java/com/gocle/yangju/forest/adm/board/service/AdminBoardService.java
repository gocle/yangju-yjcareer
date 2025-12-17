package com.gocle.yangju.forest.adm.board.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gocle.yangju.forest.adm.board.vo.BoardArticleVO;
import com.gocle.yangju.forest.adm.board.vo.BoardConfigVO;
import com.gocle.yangju.forest.adm.board.vo.BoardReplyVO;

public interface AdminBoardService {

	/**
	 * 게시판 리스트
	 * @param boardConfigVO
	 * @return
	 * @throws Exception
	 */
	List<BoardConfigVO> listBoardConfig(BoardConfigVO boardConfigVO) throws Exception;

	/**
	 * 게시판 생성
	 * @param boardConfigVO
	 * @return
	 * @throws Exception
	 */
	int insertBoardConfig(BoardConfigVO boardConfigVO) throws Exception;

	/**
	 * 게시판 상세
	 * @param boardConfigVO
	 * @return
	 * @throws Exception
	 */
	BoardConfigVO selectBoardConfig(BoardConfigVO boardConfigVO) throws Exception;

	/**
	 * 게시판 수정
	 * @param boardConfigVO
	 * @return
	 * @throws Exception
	 */
	int updateBoardConfig(BoardConfigVO boardConfigVO) throws Exception;

	/**
	 * 게시판 삭제
	 * @param boardConfigVO
	 * @return
	 */
	int deleteBoardConfig(BoardConfigVO boardConfigVO) throws Exception;

	/**
	 * 게시글 조회
	 * @param boardArticleVO
	 * @return
	 * @throws Exception
	 */
	List<BoardArticleVO> listBoardArticle(BoardArticleVO boardArticleVO) throws Exception;

	/**
	 * 최신공지 3개
	 * @param boardArticleVO
	 * @return
	 * @throws Exception
	 */
	List<BoardArticleVO> topNoticeList(BoardArticleVO boardArticleVO) throws Exception;

	/**
	 * 관리자 게시글 등록
	 * @param boardArticleVO
	 * @param multiRequest
	 * @return
	 * @throws Exception
	 */
	int insertBoardArticle(BoardArticleVO boardArticleVO, MultipartHttpServletRequest multiRequest) throws Exception;

	/**
	 * 관리자 게시글 상세조회
	 * @param boardArticleVO
	 * @return
	 * @throws Exception
	 */
	BoardArticleVO selectBoardArticle(BoardArticleVO boardArticleVO) throws Exception;

	/**
	 * 게시글 댓글 조회
	 * @param boardReplyVO
	 * @return
	 * @throws Exception
	 */
	List<BoardReplyVO> listBoardReply(BoardReplyVO boardReplyVO) throws Exception;

	/**
	 * 게시글 수정
	 * @param boardArticleVO
	 * @param multiRequest
	 * @return
	 * @throws Exception
	 */
	int updateArticleBoard(BoardArticleVO boardArticleVO, MultipartHttpServletRequest multiRequest) throws Exception;

	/**
	 * 게시글 삭제
	 * @param boardArticleVO
	 * @return
	 * @throws Exception
	 */
	int deleteBoardArticle(BoardArticleVO boardArticleVO) throws Exception;

	BoardConfigVO getBoardConfig(BoardConfigVO boardConfigVO) throws Exception;

	BoardArticleVO getBoardArticle(BoardArticleVO boardArticleVO) throws Exception;

	int updateBoardArticleQna(BoardArticleVO boardArticleVO) throws Exception;

	int insertBoardReply(BoardReplyVO boardReplyVO, MultipartHttpServletRequest multiRequest) throws Exception;

	int deleteBoardReply(BoardReplyVO boardReplyVO) throws Exception;

	int updateBoardReply(BoardReplyVO boardReplyVO, MultipartHttpServletRequest multiRequest) throws Exception;
	
	/**
	 * 게시글 댓글 조회
	 * @param boardReplyVO
	 * @return
	 * @throws Exception
	 */
	BoardReplyVO selectBoardReply(BoardReplyVO boardReplyVO) throws Exception;
}
