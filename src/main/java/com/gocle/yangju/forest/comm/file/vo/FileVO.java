package com.gocle.yangju.forest.comm.file.vo;

import java.io.Serializable;

import com.gocle.yangju.forest.comm.vo.BaseVO;



public class FileVO extends BaseVO implements Serializable {

	private static final long serialVersionUID = 7627264130255388345L;

	/** 파일idx */
	private String 		atchFileIdx = "";
	/** 파일 번호 */
	private int   		fileSn       = 0;
	/** 파일 저장 경로 */
	private String   	fileSavePath = "";
	/** 파일저장명 */
	private String   	saveFileName  = "";
	/** 원본파일명 */
	private String   	orgFileName   = "";
	/** 파일확장자 */
	private String   	fileExtn      = "";
	/** 파일크기 */
	private long   		fileSize      = 0;
	/** 다운로드수 */
	private int   		downCnt       = 0;
	/** 게시글idx */
	private String 		boardIdx = "";
	/** 썸네일 여부 */
	private String 		thumbnailCrop = "";
	/** 프로그램,공예품ID */
	private String		pId;
	
	public String getAtchFileIdx() {
		return atchFileIdx;
	}
	public void setAtchFileIdx(String atchFileIdx) {
		this.atchFileIdx = atchFileIdx;
	}
	public int getFileSn() {
		return fileSn;
	}
	public void setFileSn(int fileSn) {
		this.fileSn = fileSn;
	}
	public String getFileSavePath() {
		return fileSavePath;
	}
	public void setFileSavePath(String fileSavePath) {
		this.fileSavePath = fileSavePath;
	}
	public String getSaveFileName() {
		return saveFileName;
	}
	public void setSaveFileName(String saveFileName) {
		this.saveFileName = saveFileName;
	}
	public String getOrgFileName() {
		return orgFileName;
	}
	public void setOrgFileName(String orgFileName) {
		this.orgFileName = orgFileName;
	}
	public String getFileExtn() {
		return fileExtn;
	}
	public void setFileExtn(String fileExtn) {
		this.fileExtn = fileExtn;
	}
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	public int getDownCnt() {
		return downCnt;
	}
	public void setDownCnt(int downCnt) {
		this.downCnt = downCnt;
	}
	public String getBoardIdx() {
		return boardIdx;
	}
	public void setBoardIdx(String boardIdx) {
		if (boardIdx == null || boardIdx.trim().isEmpty()) {
	        this.boardIdx = null;
	    } else {
            this.boardIdx = boardIdx;
	    }
	}
	public String getThumbnailCrop() {
		return thumbnailCrop;
	}
	public void setThumbnailCrop(String thumbnailCrop) {
		this.thumbnailCrop = thumbnailCrop;
	}
	public String getpId() {
		return pId;
	}
	public void setpId(String pId) {
		this.pId = pId;
	}
	
}
