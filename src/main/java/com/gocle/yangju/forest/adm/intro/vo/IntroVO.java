package com.gocle.yangju.forest.adm.intro.vo;

import java.io.Serializable;

import com.gocle.yangju.forest.comm.vo.BaseVO;

public class IntroVO extends BaseVO implements Serializable{

	private static final long serialVersionUID = -4950896280776393933L;
	
	/** 프로그램 소개ID */
	private String intId;
	
	/** 타입 */
	private String pgType;
	
	/** 프로그램 제목 */
	private String intTitle;
	
	/** 프로그램 내용 */
	private String intDesc;
	
	/** 사용 여부 */
	private String useYn;
	
	/** 삭제 여부 */
	private String deleteYn;
	
	/** 순서 */
	private String orders;
	
	/** 썸네일 아이디 */
	private String thumbpath;
	
	private String intAge;
	
	private String intContentHtml;

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

	public String getUseYn() {
		return useYn;
	}

	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}

	public String getDeleteYn() {
		return deleteYn;
	}

	public void setDeleteYn(String deleteYn) {
		this.deleteYn = deleteYn;
	}

	public String getOrders() {
		return orders;
	}

	public void setOrders(String orders) {
		this.orders = orders;
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
