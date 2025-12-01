package com.gocle.yangju.forest.adm.login.vo;

import java.io.Serializable;

import com.gocle.yangju.forest.comm.util.CommonUtil;

public class LoginVO implements Serializable {

	private static final long serialVersionUID = -4804005728717597082L;

	
	private String memSeq;
	private String  memId;                   
	private String  memType;                   
	private String  memName;                  
	private String  memPassword;             
	private String  email;                     
	private String  hpNo;                     
	private String  deptNo;                  
	private int      loginCnt;                
	private String   scsnYn;                
	private String   lastLoginYmd;            
	private String   lastPwUpdtYmd;         
	private int   	  pwErrNumberTimes;       
	private String   pwErrLimitYmd;          
	private String   useExpireYmd;
	
	public String getEncryptPassword() throws Exception {
		return CommonUtil.getEncryptPassword(memPassword);
	}
	
	public String getEncryptEmail() throws Exception {
		return CommonUtil.getAesEncrypt(email);
	}
	
	public String getDecryptEmail() throws Exception {
		return CommonUtil.getAesDecrypt(email);
	}
	
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
	public String getDeptNo() {
		return deptNo;
	}
	public void setDeptNo(String deptNo) {
		this.deptNo = deptNo;
	}
	public int getLoginCnt() {
		return loginCnt;
	}
	public void setLoginCnt(int loginCnt) {
		this.loginCnt = loginCnt;
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
	
}
