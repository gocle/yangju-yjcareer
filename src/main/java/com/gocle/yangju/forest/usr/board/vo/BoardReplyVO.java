package com.gocle.yangju.forest.usr.board.vo;

import java.io.Serializable;

import com.gocle.yangju.forest.comm.vo.BaseVO;

public class BoardReplyVO extends BaseVO implements Serializable {

	private static final long serialVersionUID = -3005594131864534817L;
	
	/** 댓글 ID */
	private String brId;
	/** 게시글 ID */
	private String baId;
	/** 댓글 내용 */
	private String brContent;
	/** 첨부파일 */
	private String atchFileIdx;
	
	private String memName;
	
	private String insertDate;
	
	public String getBrId() {
		return brId;
	}
	public void setBrId(String brId) {
		this.brId = brId;
	}
	public String getBaId() {
		return baId;
	}
	public void setBaId(String baId) {
		this.baId = baId;
	}
	public String getBrContent() {
		return brContent;
	}
	public void setBrContent(String brContent) {
		this.brContent = brContent;
	}
	public String getAtchFileIdx() {
		return atchFileIdx;
	}
	public void setAtchFileIdx(String atchFileIdx) {
		this.atchFileIdx = atchFileIdx;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(String insertDate) {
		this.insertDate = insertDate;
	}
	
}
