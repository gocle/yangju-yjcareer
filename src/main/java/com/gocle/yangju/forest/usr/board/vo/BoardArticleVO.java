package com.gocle.yangju.forest.usr.board.vo;

import java.io.Serializable;
import java.util.Date;

import com.gocle.yangju.forest.comm.vo.BaseVO;


public class BoardArticleVO extends BaseVO implements Serializable{

	private static final long serialVersionUID = 8447508785668408700L;

	/** 게시글 아이디 */
	private String baId;
	/** 게시판 아이디 */
	private String bcId;
	/** 제목 */
    private String baTitle;
    /** 내용(text) */
	private String baContentPlain;
	/** 내용(html) */
    private String baContentHtml;
    /** 공지글 여부 */  
    private String baNotice;
    /** 공지 시작일 */
    private String baNoticeStartdate;
    /** 공지 종료일 */
    private String baNoticeEnddate;
    /** 비밀글 여부 */
    private String baSecret;
    /** 비밀글 비밀번호 */
    private String baSecretPassword;
    /** 분류코드1 */
    private String baCategory1;
    /** 분류코드2 */
    private String baCategory2;
    /** 분류코드3 */
    private String baCategory3;
    /** 진행상태 */
    private String baStatus;
    /** 회원 아이디 */
    private String memId;
    /** 부서코드 */
    private String depId;
    /** 비회원 작성자 이름 */
    private String baGuestName;
    /** 비회원 작성 비밀번호 */
    private String baGuestPassword;
    /** 작성자 이메일 */
    private String baEmail;
    /** 작성자 IP */
    private String baIp;
    /** 등록일시 */
    private String baRegdate;
    /** 마지막 수정일시 */
    private String baLastModified;
    /** 수정자 아이디 */
    private String baUpdaterId;
    /** 조회수 */
    private int baHit;
    /** 추천수 */
    private String baRecommend;
    /** 댓글수 */
    private String baCommentTotal;
    /** 썸네일 */
    private String baThumb;
    /** 공공누리 */
    private String baNuri;
    /** 게시유무 */
    private String baUse;
    /** 메인페이지 추출 */
    private String baMainSelec;
    /** 공통페이지 추출 */
    private String baCommSelec;
    /** 게시시작일 */
    private String baStartDate;
    /** 게시시작시간 */
    private String baStartTime;
    /** 게시종료일 */
    private String baEndDate;
    /** 공통추출대상 분류코드 */
    private String baComSelCat;
    /** 썸네일 대체텍스트 */
    private String baThumbText;
    /** 답글 */
    private String baAnswer;
    /** 검색태그 */
    private String baTag;
    /** 구분  default, gallary */
    private String bcType;
    /** 게시판 이름 */
    private String bcName;
    /** 다음글ID */
    private String nextNo;
    /** 이전글ID */
    private String preNo;
    /** 다음글 제목 */
    private String nextTitle;
    /** 이전글 제목 */
    private String preTitle;
    
    private String memName;
    
    private String baThumbpath;
    
    private String processStatusArticle;
    
    private String regDate;
    
    private int fileCnt;
    
    private String regId;
    
	public String getBaId() {
		return baId;
	}
	public void setBaId(String baId) {
		this.baId = baId;
	}
	public String getBcId() {
		return bcId;
	}
	public void setBcId(String bcId) {
		this.bcId = bcId;
	}
	public String getBaTitle() {
		return baTitle;
	}
	public void setBaTitle(String baTitle) {
		this.baTitle = baTitle;
	}
	public String getBaContentPlain() {
		return baContentPlain;
	}
	public void setBaContentPlain(String baContentPlain) {
		this.baContentPlain = baContentPlain;
	}
	public String getBaContentHtml() {
		return baContentHtml;
	}
	public void setBaContentHtml(String baContentHtml) {
		this.baContentHtml = baContentHtml;
	}
	public String getBaNotice() {
		return baNotice;
	}
	public void setBaNotice(String baNotice) {
		this.baNotice = baNotice;
	}
	public String getBaNoticeStartdate() {
		return baNoticeStartdate;
	}
	public void setBaNoticeStartdate(String baNoticeStartdate) {
		this.baNoticeStartdate = baNoticeStartdate;
	}
	public String getBaNoticeEnddate() {
		return baNoticeEnddate;
	}
	public void setBaNoticeEnddate(String baNoticeEnddate) {
		this.baNoticeEnddate = baNoticeEnddate;
	}
	public String getBaSecret() {
		return baSecret;
	}
	public void setBaSecret(String baSecret) {
		this.baSecret = baSecret;
	}
	public String getBaSecretPassword() {
		return baSecretPassword;
	}
	public void setBaSecretPassword(String baSecretPassword) {
		this.baSecretPassword = baSecretPassword;
	}
	public String getBaCategory1() {
		return baCategory1;
	}
	public void setBaCategory1(String baCategory1) {
		this.baCategory1 = baCategory1;
	}
	public String getBaCategory2() {
		return baCategory2;
	}
	public void setBaCategory2(String baCategory2) {
		this.baCategory2 = baCategory2;
	}
	public String getBaCategory3() {
		return baCategory3;
	}
	public void setBaCategory3(String baCategory3) {
		this.baCategory3 = baCategory3;
	}
	public String getBaStatus() {
		return baStatus;
	}
	public void setBaStatus(String baStatus) {
		this.baStatus = baStatus;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getDepId() {
		return depId;
	}
	public void setDepId(String depId) {
		this.depId = depId;
	}
	public String getBaGuestName() {
		return baGuestName;
	}
	public void setBaGuestName(String baGuestName) {
		this.baGuestName = baGuestName;
	}
	public String getBaGuestPassword() {
		return baGuestPassword;
	}
	public void setBaGuestPassword(String baGuestPassword) {
		this.baGuestPassword = baGuestPassword;
	}
	public String getBaEmail() {
		return baEmail;
	}
	public void setBaEmail(String baEmail) {
		this.baEmail = baEmail;
	}
	public String getBaIp() {
		return baIp;
	}
	public void setBaIp(String baIp) {
		this.baIp = baIp;
	}
	public String getBaRegdate() {
		return baRegdate;
	}
	public void setBaRegdate(String baRegdate) {
		this.baRegdate = baRegdate;
	}
	public String getBaLastModified() {
		return baLastModified;
	}
	public void setBaLastModified(String baLastModified) {
		this.baLastModified = baLastModified;
	}
	public String getBaUpdaterId() {
		return baUpdaterId;
	}
	public void setBaUpdaterId(String baUpdaterId) {
		this.baUpdaterId = baUpdaterId;
	}
	public int getBaHit() {
		return baHit;
	}
	public void setBaHit(int baHit) {
		this.baHit = baHit;
	}
	public String getBaRecommend() {
		return baRecommend;
	}
	public void setBaRecommend(String baRecommend) {
		this.baRecommend = baRecommend;
	}
	public String getBaCommentTotal() {
		return baCommentTotal;
	}
	public void setBaCommentTotal(String baCommentTotal) {
		this.baCommentTotal = baCommentTotal;
	}
	public String getBaThumb() {
		return baThumb;
	}
	public void setBaThumb(String baThumb) {
		this.baThumb = baThumb;
	}
	public String getBaNuri() {
		return baNuri;
	}
	public void setBaNuri(String baNuri) {
		this.baNuri = baNuri;
	}
	public String getBaUse() {
		return baUse;
	}
	public void setBaUse(String baUse) {
		this.baUse = baUse;
	}
	public String getBaMainSelec() {
		return baMainSelec;
	}
	public void setBaMainSelec(String baMainSelec) {
		this.baMainSelec = baMainSelec;
	}
	public String getBaCommSelec() {
		return baCommSelec;
	}
	public void setBaCommSelec(String baCommSelec) {
		this.baCommSelec = baCommSelec;
	}
	public String getBaStartDate() {
		return baStartDate;
	}
	public void setBaStartDate(String baStartDate) {
		this.baStartDate = baStartDate;
	}
	public String getBaStartTime() {
		return baStartTime;
	}
	public void setBaStartTime(String baStartTime) {
		this.baStartTime = baStartTime;
	}
	public String getBaEndDate() {
		return baEndDate;
	}
	public void setBaEndDate(String baEndDate) {
		this.baEndDate = baEndDate;
	}
	public String getBaComSelCat() {
		return baComSelCat;
	}
	public void setBaComSelCat(String baComSelCat) {
		this.baComSelCat = baComSelCat;
	}
	public String getBaThumbText() {
		return baThumbText;
	}
	public void setBaThumbText(String baThumbText) {
		this.baThumbText = baThumbText;
	}
	public String getBaAnswer() {
		return baAnswer;
	}
	public void setBaAnswer(String baAnswer) {
		this.baAnswer = baAnswer;
	}
	public String getBaTag() {
		return baTag;
	}
	public void setBaTag(String baTag) {
		this.baTag = baTag;
	}
	public String getBcType() {
		return bcType;
	}
	public void setBcType(String bcType) {
		this.bcType = bcType;
	}
	public String getBcName() {
		return bcName;
	}
	public void setBcName(String bcName) {
		this.bcName = bcName;
	}
	public String getNextNo() {
		return nextNo;
	}
	public void setNextNo(String nextNo) {
		this.nextNo = nextNo;
	}
	public String getPreNo() {
		return preNo;
	}
	public void setPreNo(String preNo) {
		this.preNo = preNo;
	}
	public String getNextTitle() {
		return nextTitle;
	}
	public void setNextTitle(String nextTitle) {
		this.nextTitle = nextTitle;
	}
	public String getPreTitle() {
		return preTitle;
	}
	public void setPreTitle(String preTitle) {
		this.preTitle = preTitle;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getBaThumbpath() {
		return baThumbpath;
	}
	public void setBaThumbpath(String baThumbpath) {
		this.baThumbpath = baThumbpath;
	}
	public String getProcessStatusArticle() {
		return processStatusArticle;
	}
	public void setProcessStatusArticle(String processStatusArticle) {
		this.processStatusArticle = processStatusArticle;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public int getFileCnt() {
		return fileCnt;
	}
	public void setFileCnt(int fileCnt) {
		this.fileCnt = fileCnt;
	}
	public String getRegId() {
		return regId;
	}
	public void setRegId(String regId) {
		this.regId = regId;
	}
}
