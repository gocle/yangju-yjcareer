package com.gocle.yangju.forest.usr.chinfo.vo;

import java.time.LocalDateTime;

public class SubjInfoVo extends SubjInfoDefaultVo {
	
	private static final long serialVersionUID = 1L;
	
	// 교육사이트 코드
    private String sgrCd;
    // 분류 일련번호
    private String cateCd;
    private String cateNm;
    // 과정코드
    private String subjCd;
    // 운영과정코드
    private String seqCd;
    // 교육강좌명
    private String subjNm;
    // 썸네일
    private String thumbpath;
    
    private String enrollStartDt;
    private String enrollEndDt;
    private String learnStartDt;
    private String learnEndDt;
    
    private String capacity;
    private String waitEnrollCnt;
    private String status;
    private String eduTarget;
    
	public String getSgrCd() {
		return sgrCd;
	}
	public void setSgrCd(String sgrCd) {
		this.sgrCd = sgrCd;
	}
	public String getCateCd() {
		return cateCd;
	}
	public void setCateCd(String cateCd) {
		this.cateCd = cateCd;
	}
	public String getCateNm() {
		return cateNm;
	}
	public void setCateNm(String cateNm) {
		this.cateNm = cateNm;
	}
	public String getSubjCd() {
		return subjCd;
	}
	public void setSubjCd(String subjCd) {
		this.subjCd = subjCd;
	}
	public String getSubjNm() {
		return subjNm;
	}
	public void setSubjNm(String subjNm) {
		this.subjNm = subjNm;
	}
	public String getThumbpath() {
		return thumbpath;
	}
	public void setThumbpath(String thumbpath) {
		this.thumbpath = thumbpath;
	}
	public String getEnrollStartDt() {
		return enrollStartDt;
	}
	public void setEnrollStartDt(String enrollStartDt) {
		this.enrollStartDt = enrollStartDt;
	}
	public String getEnrollEndDt() {
		return enrollEndDt;
	}
	public void setEnrollEndDt(String enrollEndDt) {
		this.enrollEndDt = enrollEndDt;
	}
	public String getLearnStartDt() {
		return learnStartDt;
	}
	public void setLearnStartDt(String learnStartDt) {
		this.learnStartDt = learnStartDt;
	}
	public String getLearnEndDt() {
		return learnEndDt;
	}
	public void setLearnEndDt(String learnEndDt) {
		this.learnEndDt = learnEndDt;
	}
	public String getCapacity() {
		return capacity;
	}
	public void setCapacity(String capacity) {
		this.capacity = capacity;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getWaitEnrollCnt() {
		return waitEnrollCnt;
	}
	public void setWaitEnrollCnt(String waitEnrollCnt) {
		this.waitEnrollCnt = waitEnrollCnt;
	}
	public String getEduTarget() {
		return eduTarget;
	}
	public void setEduTarget(String eduTarget) {
		this.eduTarget = eduTarget;
	}
	public String getSeqCd() {
		return seqCd;
	}
	public void setSeqCd(String seqCd) {
		this.seqCd = seqCd;
	}
	
	
}
