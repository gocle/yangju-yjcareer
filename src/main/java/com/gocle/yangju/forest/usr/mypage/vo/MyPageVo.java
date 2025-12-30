package com.gocle.yangju.forest.usr.mypage.vo;

import java.io.Serializable;

import com.gocle.yangju.forest.comm.vo.BaseVO;

public class MyPageVo extends BaseVO implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	// 분류 코드
    private String sgrCd;
    private String sgrNm;
    // 과정코드
    private String subjCd;
    // 운영과정코드
    private String seqCd;
    // 교육강좌명
    private String subjNm;
    // 기수명
    private String sessionNm;
    private String enrollStartDt;
    private String enrollEndDt;
    // 신청기간
    private String learnStartDt;
    private String learnEndDt;
    // 신청자
    private String diKey;
    private String memName;
    // 성별
    private String sexdstn;
    // 연령대
    private String ageGroup;
    // 학교명
    private String schoolNm;
    // 학년
    private String grade;
    // 휴대전화
    private String hpTel1;
    private String hpTel2;
    private String hpTel3;
    // 메모
    private String memo;
    // 우편번호
    private String zipcode;
    // 주소
    private String address;
    // 거주지
    private String resdncDetail;
    // 신청상태코드
    private String enrollStatusCd;
    private String enrollStatusNm;
    // 신청처리자 아이디
    private String enrollAppId;
    // 신청처리자 아이피
    private String enrollAppIp;
    // 신청처리 일시
    private String enrollAppDt;
    // 예약현황 문자수신여부
    private String smsYn;
    // 관리자 등록여부
    private String forceYn;
    // 신청취소 일시
    private String cancelReqDt;
    // 신청일
    private String regDt;
    // 모집방법
    private String enrollType;
    
	public String getSgrCd() {
		return sgrCd;
	}
	public void setSgrCd(String sgrCd) {
		this.sgrCd = sgrCd;
	}
	public String getSgrNm() {
		return sgrNm;
	}
	public void setSgrNm(String sgrNm) {
		this.sgrNm = sgrNm;
	}
	public String getSubjCd() {
		return subjCd;
	}
	public void setSubjCd(String subjCd) {
		this.subjCd = subjCd;
	}
	public String getSeqCd() {
		return seqCd;
	}
	public void setSeqCd(String seqCd) {
		this.seqCd = seqCd;
	}
	public String getSubjNm() {
		return subjNm;
	}
	public void setSubjNm(String subjNm) {
		this.subjNm = subjNm;
	}
	public String getSessionNm() {
		return sessionNm;
	}
	public void setSessionNm(String sessionNm) {
		this.sessionNm = sessionNm;
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
	public String getDiKey() {
		return diKey;
	}
	public void setDiKey(String diKey) {
		this.diKey = diKey;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getSexdstn() {
		return sexdstn;
	}
	public void setSexdstn(String sexdstn) {
		this.sexdstn = sexdstn;
	}
	public String getAgeGroup() {
		return ageGroup;
	}
	public void setAgeGroup(String ageGroup) {
		this.ageGroup = ageGroup;
	}
	public String getSchoolNm() {
		return schoolNm;
	}
	public void setSchoolNm(String schoolNm) {
		this.schoolNm = schoolNm;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getHpTel1() {
		return hpTel1;
	}
	public void setHpTel1(String hpTel1) {
		this.hpTel1 = hpTel1;
	}
	public String getHpTel2() {
		return hpTel2;
	}
	public void setHpTel2(String hpTel2) {
		this.hpTel2 = hpTel2;
	}
	public String getHpTel3() {
		return hpTel3;
	}
	public void setHpTel3(String hpTel3) {
		this.hpTel3 = hpTel3;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getResdncDetail() {
		return resdncDetail;
	}
	public void setResdncDetail(String resdncDetail) {
		this.resdncDetail = resdncDetail;
	}
	public String getEnrollStatusCd() {
		return enrollStatusCd;
	}
	public void setEnrollStatusCd(String enrollStatusCd) {
		this.enrollStatusCd = enrollStatusCd;
	}
	public String getEnrollAppId() {
		return enrollAppId;
	}
	public void setEnrollAppId(String enrollAppId) {
		this.enrollAppId = enrollAppId;
	}
	public String getEnrollAppIp() {
		return enrollAppIp;
	}
	public void setEnrollAppIp(String enrollAppIp) {
		this.enrollAppIp = enrollAppIp;
	}
	public String getEnrollAppDt() {
		return enrollAppDt;
	}
	public void setEnrollAppDt(String enrollAppDt) {
		this.enrollAppDt = enrollAppDt;
	}
	public String getSmsYn() {
		return smsYn;
	}
	public void setSmsYn(String smsYn) {
		this.smsYn = smsYn;
	}
	public String getForceYn() {
		return forceYn;
	}
	public void setForceYn(String forceYn) {
		this.forceYn = forceYn;
	}
	public String getCancelReqDt() {
		return cancelReqDt;
	}
	public void setCancelReqDt(String cancelReqDt) {
		this.cancelReqDt = cancelReqDt;
	}
	public String getRegDt() {
		return regDt;
	}
	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}
	public String getEnrollType() {
		return enrollType;
	}
	public void setEnrollType(String enrollType) {
		this.enrollType = enrollType;
	}
	public String getEnrollStatusNm() {
		return enrollStatusNm;
	}
	public void setEnrollStatusNm(String enrollStatusNm) {
		this.enrollStatusNm = enrollStatusNm;
	}
    
    
}
