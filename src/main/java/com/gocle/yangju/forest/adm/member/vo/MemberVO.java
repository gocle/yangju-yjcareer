package com.gocle.yangju.forest.adm.member.vo;

import java.io.Serializable;

import com.gocle.yangju.forest.comm.util.CommonUtil;
import com.gocle.yangju.forest.comm.vo.BaseVO;

public class MemberVO extends BaseVO implements Serializable {

	private static final long serialVersionUID = -8990023199807275310L;

	/** 회원SEQ */
	private String memSeq;
	
	/** 회원ID */
	private String memId;
	
	/** 회원유형 */
	private String memType;
	
	/** 회원 이름 */
	private String memName;
	
	/** 비밀번호 */
	private String memPassword;
	
	/** 회원 이메일 */
	private String email;
	
	/** 회원 휴대폰 */
	private String hpNo;
	
	/** 탈퇴 여부 */
	private String scsnYn;
	
	private String   lastLoginYmd;            
	private String   lastPwUpdtYmd;         
	private int   	  pwErrNumberTimes;       
	private String   pwErrLimitYmd;          
	private String   useExpireYmd;
	
	private String permitIp;
	private String deptNm;
	private String startDate;
	private String endDate;
	private String lockYn;
	private String useYn;
	
	public String getMemSeq() {
		return memSeq;
	}
	public void setMemSeq(String memSeq) {
		this.memSeq = memSeq;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemType() {
		return memType;
	}
	public void setMemType(String memType) {
		this.memType = memType;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getMemPassword() {
		return memPassword;
	}
	public void setMemPassword(String memPassword) {
		this.memPassword = memPassword;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getHpNo() {
		return hpNo;
	}
	public void setHpNo(String hpNo) {
		this.hpNo = hpNo;
	}
	public String getScsnYn() {
		return scsnYn;
	}
	public void setScsnYn(String scsnYn) {
		this.scsnYn = scsnYn;
	}
	public String getLastLoginYmd() {
		return lastLoginYmd;
	}
	public void setLastLoginYmd(String lastLoginYmd) {
		this.lastLoginYmd = lastLoginYmd;
	}
	public String getLastPwUpdtYmd() {
		return lastPwUpdtYmd;
	}
	public void setLastPwUpdtYmd(String lastPwUpdtYmd) {
		this.lastPwUpdtYmd = lastPwUpdtYmd;
	}
	public int getPwErrNumberTimes() {
		return pwErrNumberTimes;
	}
	public void setPwErrNumberTimes(int pwErrNumberTimes) {
		this.pwErrNumberTimes = pwErrNumberTimes;
	}
	public String getPwErrLimitYmd() {
		return pwErrLimitYmd;
	}
	public void setPwErrLimitYmd(String pwErrLimitYmd) {
		this.pwErrLimitYmd = pwErrLimitYmd;
	}
	public String getUseExpireYmd() {
		return useExpireYmd;
	}
	public void setUseExpireYmd(String useExpireYmd) {
		this.useExpireYmd = useExpireYmd;
	}
	
	public String getEncryptPassword() throws Exception {
		return CommonUtil.getEncryptPassword(memPassword);
	}
	
	public String getEncryptEmail() throws Exception {
		return CommonUtil.getAesEncrypt(email);
	}
	
	public String getDecryptEmail() throws Exception {
		return CommonUtil.getAesDecrypt(email);
	}
	
	public String getPermitIp() {
		return permitIp;
	}
	
	public void setPermitIp(String permitIp) {
		this.permitIp = permitIp;
	}
	
	public String getDeptNm() {
		return deptNm;
	}
	
	public void setDeptNm(String deptNm) {
		this.deptNm = deptNm;
	}
	
	public String getStartDate() {
		return startDate;
	}
	
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	
	public String getEndDate() {
		return endDate;
	}
	
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	
	public String getLockYn() {
		return lockYn;
	}
	
	public void setLockYn(String lockYn) {
		this.lockYn = lockYn;
	}
	
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}

}
