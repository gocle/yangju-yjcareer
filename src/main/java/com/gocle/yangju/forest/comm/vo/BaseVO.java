package com.gocle.yangju.forest.comm.vo;

import java.io.Serializable;


/**
 * @author gocle_4
 *
 */
public class BaseVO implements Serializable {

	
	private static final long serialVersionUID = 3064666294269330392L;
	
	/** 검색조건 */
    private String searchCondition = "";

    /** 검색Keyword */
    private String searchKeyword = "";

    /** 검색사용여부 */
    private String searchUseYn = "";

    /** 현재페이지 */
    private int pageIndex = 1;

    /** 페이지갯수 */
    private int pageUnit = 10;

    /** 페이지사이즈 */
    private int pageSize = 10;

    /** firstIndex */
    private int firstIndex = 1;

    /** lastIndex */
    private int lastIndex = 1;

    /** recordCountPerPage */
    private int recordCountPerPage = 10;

	/** select total count */
    private String totalCount = "";
    
    /** login usr_id */
    private String sessionMemId = "";
    
    /** login usr_seq */
    private String sessionMemSeq = "";
    
    /** login usr_name */
    private String sessionMemName = "";

    /** 메뉴ID */
    private String menuId = "";
    
    /** 사이트ID*/
    private String siteId = "";
    
    /** 삭제여부*/
    private String deleteYn = "";
    
    /** 등록ID*/
    private String regId = "";
    
    /** 등록일 */
    private String regDt ="";
    
    /** 수정ID*/
    private String updId = "";
    
    /** 수정일 */
    private String updDt = "";
    
    /** IP */
    private String sessionIp;
    
    /** 이메일 */
    private String sessionEmail;
    
    /** 회원 유형 */
    private String sessionMemType;

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	public String getSearchUseYn() {
		return searchUseYn;
	}

	public void setSearchUseYn(String searchUseYn) {
		this.searchUseYn = searchUseYn;
	}

	public int getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}

	public int getPageUnit() {
		return pageUnit;
	}

	public void setPageUnit(int pageUnit) {
		this.pageUnit = pageUnit;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getFirstIndex() {
		return firstIndex;
	}

	public void setFirstIndex(int firstIndex) {
		this.firstIndex = firstIndex;
	}

	public int getLastIndex() {
		return lastIndex;
	}

	public void setLastIndex(int lastIndex) {
		this.lastIndex = lastIndex;
	}

	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}

	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}

	public String getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(String totalCount) {
		this.totalCount = totalCount;
	}

	public String getSessionMemId() {
		return sessionMemId;
	}

	public void setSessionMemId(String sessionMemId) {
		this.sessionMemId = sessionMemId;
	}

	public String getSessionMemSeq() {
		return sessionMemSeq;
	}

	public void setSessionMemSeq(String sessionMemSeq) {
		this.sessionMemSeq = sessionMemSeq;
	}

	public String getSessionMemName() {
		return sessionMemName;
	}

	public void setSessionMemName(String sessionMemName) {
		this.sessionMemName = sessionMemName;
	}

	public String getMenuId() {
		return menuId;
	}

	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}

	public String getSiteId() {
		return siteId;
	}

	public void setSiteId(String siteId) {
		this.siteId = siteId;
	}

	public String getDeleteYn() {
		return deleteYn;
	}

	public void setDeleteYn(String deleteYn) {
		this.deleteYn = deleteYn;
	}

	public String getRegId() {
		return regId;
	}

	public void setRegId(String regId) {
		this.regId = regId;
	}

	public String getRegDt() {
		return regDt;
	}

	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}

	public String getUpdId() {
		return updId;
	}

	public void setUpdId(String updId) {
		this.updId = updId;
	}

	public String getUpdDt() {
		return updDt;
	}

	public void setUpdDt(String updDt) {
		this.updDt = updDt;
	}

	public String getSessionIp() {
		return sessionIp;
	}

	public void setSessionIp(String sessionIp) {
		this.sessionIp = sessionIp;
	}

	public String getSessionEmail() {
		return sessionEmail;
	}

	public void setSessionEmail(String sessionEmail) {
		this.sessionEmail = sessionEmail;
	}

	public String getSessionMemType() {
		return sessionMemType;
	}

	public void setSessionMemType(String sessionMemType) {
		this.sessionMemType = sessionMemType;
	}

}
