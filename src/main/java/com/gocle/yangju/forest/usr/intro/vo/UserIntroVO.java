package com.gocle.yangju.forest.usr.intro.vo;

import java.io.Serializable;

import com.gocle.yangju.forest.comm.vo.BaseVO;

public class UserIntroVO extends BaseVO implements Serializable {

	private static final long serialVersionUID = -573368458605795364L;

	String intId;
	String pgType;
	String intTitle;
	String intDesc;
	String regDt;
	String regId;
	String thumbpath;
	String intAge;
	String intContentHtml;
	
	public String getIntId() {
		return intId;
	}
	public void setIntId(String intId) {
		this.intId = intId;
	}
	public String getPgType() {
		return pgType;
	}
	public void setPgType(String pgType) {
		this.pgType = pgType;
	}
	public String getIntTitle() {
		return intTitle;
	}
	public void setIntTitle(String intTitle) {
		this.intTitle = intTitle;
	}
	public String getIntDesc() {
		return intDesc;
	}
	public void setIntDesc(String intDesc) {
		this.intDesc = intDesc;
	}
	public String getRegDt() {
		return regDt;
	}
	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}
	public String getRegId() {
		return regId;
	}
	public void setRegId(String regId) {
		this.regId = regId;
	}
	public String getThumbpath() {
		return thumbpath;
	}
	public void setThumbpath(String thumbpath) {
		this.thumbpath = thumbpath;
	}
	public String getIntAge() {
		return intAge;
	}
	public void setIntAge(String intAge) {
		this.intAge = intAge;
	}
	public String getIntContentHtml() {
		return intContentHtml;
	}
	public void setIntContentHtml(String intContentHtml) {
		this.intContentHtml = intContentHtml;
	}
}
