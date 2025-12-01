package com.gocle.yangju.forest.adm.board.vo;

import java.io.Serializable;

import com.gocle.yangju.forest.comm.vo.BaseVO;

public class BoardConfigVO extends BaseVO implements Serializable{

	private static final long serialVersionUID = -6469474124125561798L;

	/** 게시판 아이디 */
	private String bcId;
	/** 게시판 이름 */
	private String bcName;
	/** 게시판 사용상태 */
	private String bcUse;
	/** 게시판 유형 */
	private String bcType;
	/** 구분코드1 */
	private String bcCategory1;
	/** 구분코드1 이름*/
	private String bcCategory1Name;
	/** 구분코드2 */
	private String bcCategory2;
	/** 구분코드2 이름*/
	private String bcCategory2Name;
	/** 구분코드3 */
	private String bcCategory3;
	/** 구분코드3 이름*/
	private String bcCategory3Name;
	/** 진행상태 코드 */
	private String bcStatusCode;
	/** 목록템플릿 */
	private String bcListFile;
	/** 뷰템플릿 */
	private String bcViewFile;
	/** 폼템플릿 */
	private String bcFormFile;
	/** 관리부서 코드*/
	private String bcDepartment;
	/** 관리 그룹 아이디*/
	private String bcGroup;
	/** 회원 목록접근 허용여부 */
	private String bcAllowMemberList;
	/** 회원 글 조회 허용여부 */
	private String bcAllowMemberView;
	/** 회원 글쓰기 허용여부 */
	private String bcAllowMemberForm;
	/** 회원 첨부파일 다운로드 허용여부 */
	private String bcAllowMemberDownload;
	/** 비회원 목록접근 허용여부 */
	private String bcAllowGuestList;
	/** 비회원 글조회 허용여부 */
	private String bcAllowGuestView;
	/** 비회원 글쓰기 허용여부 */
	private String bcAllowGuestForm;
	/** 비회원 첨부파일 다운 허용여부 */
	private String bcAllowGuestDownload;
	/** 공지글 기능 사용여부 */
	private String bcSupportNotice;
	/** 공지글 표시방법(모든페이지/첫페이지) */
	private String bcNoticeEverypage;
	/** 비밀글 기능 사용여부 */
	private String bcSupportSecret;
	/** 댓글 사용여부 */
	private String bcSupportComment;
	/** 답글 사용여부 */
	private String bcSupportAnswer;
	/** 추천기능 사용여부 */
	private String bcSupportRecommend;
	/** 썸네일 사용여부 */
	private String bcSupportThumbnail;
	/** 썸네일 생성시 이미지 자르기 여부 */
	private String bcThumbnailCrop;
	/** 썸네일 생성시 가로길이 */
	private String bcThumbnailWidth;
	/** 썸네일 생성시 세로길이 */
	private String bcThumbnailHeight;
	/** 첨부파일 개수 */
	private String bcUploadFileNum;
	/** 첨부파일 사이즈 제한 */
	private String bcUploadSizeMax;
	/** 목록 페이지 크기 */
	private String bcPageSize;
	/** 등록일시 */
	private String bcRegdate;
	/** 기관코드 */
	private String bcOrganization;
	/** 공공누리 사용여부 */
	private String bcSupportNuri;
	/** 대표이미지 사용여부 */
	private String bcSupportImage;
	/** 조회수 증가방법 */
	private String bcSupportHitDay; 
	private String bcSupportMainSelec;
	private String bcSupportCommSelec;
	private String bcSupportOpenDay;
	public String getBcId() {
		return bcId;
	}
	public void setBcId(String bcId) {
		this.bcId = bcId;
	}
	public String getBcName() {
		return bcName;
	}
	public void setBcName(String bcName) {
		this.bcName = bcName;
	}
	public String getBcUse() {
		return bcUse;
	}
	public void setBcUse(String bcUse) {
		this.bcUse = bcUse;
	}
	public String getBcType() {
		return bcType;
	}
	public void setBcType(String bcType) {
		this.bcType = bcType;
	}
	public String getBcCategory1() {
		return bcCategory1;
	}
	public void setBcCategory1(String bcCategory1) {
		this.bcCategory1 = bcCategory1;
	}
	public String getBcCategory1Name() {
		return bcCategory1Name;
	}
	public void setBcCategory1Name(String bcCategory1Name) {
		this.bcCategory1Name = bcCategory1Name;
	}
	public String getBcCategory2() {
		return bcCategory2;
	}
	public void setBcCategory2(String bcCategory2) {
		this.bcCategory2 = bcCategory2;
	}
	public String getBcCategory2Name() {
		return bcCategory2Name;
	}
	public void setBcCategory2Name(String bcCategory2Name) {
		this.bcCategory2Name = bcCategory2Name;
	}
	public String getBcCategory3() {
		return bcCategory3;
	}
	public void setBcCategory3(String bcCategory3) {
		this.bcCategory3 = bcCategory3;
	}
	public String getBcCategory3Name() {
		return bcCategory3Name;
	}
	public void setBcCategory3Name(String bcCategory3Name) {
		this.bcCategory3Name = bcCategory3Name;
	}
	public String getBcStatusCode() {
		return bcStatusCode;
	}
	public void setBcStatusCode(String bcStatusCode) {
		this.bcStatusCode = bcStatusCode;
	}
	public String getBcListFile() {
		return bcListFile;
	}
	public void setBcListFile(String bcListFile) {
		this.bcListFile = bcListFile;
	}
	public String getBcViewFile() {
		return bcViewFile;
	}
	public void setBcViewFile(String bcViewFile) {
		this.bcViewFile = bcViewFile;
	}
	public String getBcFormFile() {
		return bcFormFile;
	}
	public void setBcFormFile(String bcFormFile) {
		this.bcFormFile = bcFormFile;
	}
	public String getBcDepartment() {
		return bcDepartment;
	}
	public void setBcDepartment(String bcDepartment) {
		this.bcDepartment = bcDepartment;
	}
	public String getBcGroup() {
		return bcGroup;
	}
	public void setBcGroup(String bcGroup) {
		this.bcGroup = bcGroup;
	}
	public String getBcAllowMemberList() {
		return bcAllowMemberList;
	}
	public void setBcAllowMemberList(String bcAllowMemberList) {
		this.bcAllowMemberList = bcAllowMemberList;
	}
	public String getBcAllowMemberView() {
		return bcAllowMemberView;
	}
	public void setBcAllowMemberView(String bcAllowMemberView) {
		this.bcAllowMemberView = bcAllowMemberView;
	}
	public String getBcAllowMemberForm() {
		return bcAllowMemberForm;
	}
	public void setBcAllowMemberForm(String bcAllowMemberForm) {
		this.bcAllowMemberForm = bcAllowMemberForm;
	}
	public String getBcAllowMemberDownload() {
		return bcAllowMemberDownload;
	}
	public void setBcAllowMemberDownload(String bcAllowMemberDownload) {
		this.bcAllowMemberDownload = bcAllowMemberDownload;
	}
	public String getBcAllowGuestList() {
		return bcAllowGuestList;
	}
	public void setBcAllowGuestList(String bcAllowGuestList) {
		this.bcAllowGuestList = bcAllowGuestList;
	}
	public String getBcAllowGuestView() {
		return bcAllowGuestView;
	}
	public void setBcAllowGuestView(String bcAllowGuestView) {
		this.bcAllowGuestView = bcAllowGuestView;
	}
	public String getBcAllowGuestForm() {
		return bcAllowGuestForm;
	}
	public void setBcAllowGuestForm(String bcAllowGuestForm) {
		this.bcAllowGuestForm = bcAllowGuestForm;
	}
	public String getBcAllowGuestDownload() {
		return bcAllowGuestDownload;
	}
	public void setBcAllowGuestDownload(String bcAllowGuestDownload) {
		this.bcAllowGuestDownload = bcAllowGuestDownload;
	}
	public String getBcSupportNotice() {
		return bcSupportNotice;
	}
	public void setBcSupportNotice(String bcSupportNotice) {
		this.bcSupportNotice = bcSupportNotice;
	}
	public String getBcNoticeEverypage() {
		return bcNoticeEverypage;
	}
	public void setBcNoticeEverypage(String bcNoticeEverypage) {
		this.bcNoticeEverypage = bcNoticeEverypage;
	}
	public String getBcSupportSecret() {
		return bcSupportSecret;
	}
	public void setBcSupportSecret(String bcSupportSecret) {
		this.bcSupportSecret = bcSupportSecret;
	}
	public String getBcSupportComment() {
		return bcSupportComment;
	}
	public void setBcSupportComment(String bcSupportComment) {
		this.bcSupportComment = bcSupportComment;
	}
	public String getBcSupportAnswer() {
		return bcSupportAnswer;
	}
	public void setBcSupportAnswer(String bcSupportAnswer) {
		this.bcSupportAnswer = bcSupportAnswer;
	}
	public String getBcSupportRecommend() {
		return bcSupportRecommend;
	}
	public void setBcSupportRecommend(String bcSupportRecommend) {
		this.bcSupportRecommend = bcSupportRecommend;
	}
	public String getBcSupportThumbnail() {
		return bcSupportThumbnail;
	}
	public void setBcSupportThumbnail(String bcSupportThumbnail) {
		this.bcSupportThumbnail = bcSupportThumbnail;
	}
	public String getBcThumbnailCrop() {
		return bcThumbnailCrop;
	}
	public void setBcThumbnailCrop(String bcThumbnailCrop) {
		this.bcThumbnailCrop = bcThumbnailCrop;
	}
	public String getBcThumbnailWidth() {
		return bcThumbnailWidth;
	}
	public void setBcThumbnailWidth(String bcThumbnailWidth) {
		this.bcThumbnailWidth = bcThumbnailWidth;
	}
	public String getBcThumbnailHeight() {
		return bcThumbnailHeight;
	}
	public void setBcThumbnailHeight(String bcThumbnailHeight) {
		this.bcThumbnailHeight = bcThumbnailHeight;
	}
	public String getBcUploadFileNum() {
		return bcUploadFileNum;
	}
	public void setBcUploadFileNum(String bcUploadFileNum) {
		this.bcUploadFileNum = bcUploadFileNum;
	}
	public String getBcUploadSizeMax() {
		return bcUploadSizeMax;
	}
	public void setBcUploadSizeMax(String bcUploadSizeMax) {
		this.bcUploadSizeMax = bcUploadSizeMax;
	}
	public String getBcPageSize() {
		return bcPageSize;
	}
	public void setBcPageSize(String bcPageSize) {
		this.bcPageSize = bcPageSize;
	}
	public String getBcRegdate() {
		return bcRegdate;
	}
	public void setBcRegdate(String bcRegdate) {
		this.bcRegdate = bcRegdate;
	}
	public String getBcOrganization() {
		return bcOrganization;
	}
	public void setBcOrganization(String bcOrganization) {
		this.bcOrganization = bcOrganization;
	}
	public String getBcSupportNuri() {
		return bcSupportNuri;
	}
	public void setBcSupportNuri(String bcSupportNuri) {
		this.bcSupportNuri = bcSupportNuri;
	}
	public String getBcSupportImage() {
		return bcSupportImage;
	}
	public void setBcSupportImage(String bcSupportImage) {
		this.bcSupportImage = bcSupportImage;
	}
	public String getBcSupportHitDay() {
		return bcSupportHitDay;
	}
	public void setBcSupportHitDay(String bcSupportHitDay) {
		this.bcSupportHitDay = bcSupportHitDay;
	}
	public String getBcSupportMainSelec() {
		return bcSupportMainSelec;
	}
	public void setBcSupportMainSelec(String bcSupportMainSelec) {
		this.bcSupportMainSelec = bcSupportMainSelec;
	}
	public String getBcSupportCommSelec() {
		return bcSupportCommSelec;
	}
	public void setBcSupportCommSelec(String bcSupportCommSelec) {
		this.bcSupportCommSelec = bcSupportCommSelec;
	}
	public String getBcSupportOpenDay() {
		return bcSupportOpenDay;
	}
	public void setBcSupportOpenDay(String bcSupportOpenDay) {
		this.bcSupportOpenDay = bcSupportOpenDay;
	}
	
	
}
