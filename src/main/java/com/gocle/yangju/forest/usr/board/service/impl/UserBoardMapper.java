package com.gocle.yangju.forest.usr.board.service.impl;

import java.util.List;

import com.gocle.yangju.forest.usr.board.vo.BoardArticleVO;
import com.gocle.yangju.forest.usr.board.vo.BoardConfigVO;
import com.gocle.yangju.forest.usr.board.vo.BoardReplyVO;

public interface UserBoardMapper {

	BoardConfigVO getBoardConfig(BoardConfigVO boardConfigVO) throws Exception;

	List<BoardArticleVO> listBoardArticle(BoardArticleVO boardArticleVO) throws Exception;

	List<BoardArticleVO> topNoticeList(BoardArticleVO boardArticleVO) throws Exception;

	int boardHit(BoardArticleVO boardArticleVO) throws Exception;

	BoardArticleVO getUserBoardResult(BoardArticleVO boardArticleVO) throws Exception;

	BoardArticleVO prevNext(BoardArticleVO boardArticleVO) throws Exception;

	List<BoardReplyVO> listBoardReply(BoardReplyVO boardReplyVO) throws Exception;

	int insertUserBoardArticle(BoardArticleVO boardArticleVO) throws Exception;

	BoardArticleVO getBoardArticle(BoardArticleVO boardArticleVO) throws Exception;

	int userUpdateQna(BoardArticleVO boardArticleVO) throws Exception;

	int userDeleteQna(BoardArticleVO boardArticleVO) throws Exception;
	
}
