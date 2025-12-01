package com.gocle.yangju.forest.adm.board.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gocle.yangju.forest.adm.board.vo.BoardArticleVO;
import com.gocle.yangju.forest.adm.board.vo.BoardConfigVO;
import com.gocle.yangju.forest.adm.board.vo.BoardReplyVO;


@Mapper
public interface AdminBoardMapper {

	List<BoardConfigVO> listBoardConfig(BoardConfigVO boardConfigVO) throws Exception;

	int insertBoardConfig(BoardConfigVO boardConfigVO) throws Exception;

	BoardConfigVO selectBoardConfig(BoardConfigVO boardConfigVO) throws Exception;

	int updateBoardConfig(BoardConfigVO boardConfigVO) throws Exception;

	int deleteBoardConfig(BoardConfigVO boardConfigVO) throws Exception;

	List<BoardArticleVO> listBoardArticle(BoardArticleVO boardArticleVO) throws Exception;

	List<BoardArticleVO> topNoticeList(BoardArticleVO boardArticleVO) throws Exception;

	int insertBoardArticle(BoardArticleVO boardArticleVO) throws Exception;

	BoardArticleVO selectBoardArticle(BoardArticleVO boardArticleVO) throws Exception;

	List<BoardReplyVO> listBoardReply(BoardReplyVO boardReplyVO) throws Exception;

	int updateArticleBoard(BoardArticleVO boardArticleVO) throws Exception;

	int deleteBoardArticle(BoardArticleVO boardArticleVO) throws Exception;

	BoardArticleVO getBoardArticle(BoardArticleVO boardArticleVO) throws Exception;

	int insertBoardReply(BoardReplyVO boardReplyVO) throws Exception;

	int deleteBoardReply(BoardReplyVO boardReplyVO) throws Exception;

	int updateBoardReply(BoardReplyVO boardReplyVO) throws Exception;

	BoardConfigVO getBoardConfig(BoardConfigVO boardConfigVO) throws Exception;
}
