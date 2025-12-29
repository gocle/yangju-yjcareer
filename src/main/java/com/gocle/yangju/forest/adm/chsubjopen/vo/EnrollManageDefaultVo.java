package com.gocle.yangju.forest.adm.chsubjopen.vo;

import java.io.Serializable;

import com.gocle.yangju.forest.comm.vo.BaseVO;

public class EnrollManageDefaultVo extends BaseVO implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	// 검색 대분류
	private String searchSgrCd = "";
	// 검색 소분류
	private String searchCateCd = "";
	// 검색어
    private String searchKeyword = "";
    // 메뉴ID
    private String menuId = "";
    // 신청상태
    private String searchEnrollStatusCd = "";
    // 진행상태
    private String searchStatus = "";
    // 장소
    private String searchEduPlace = "";
    // 신청대상
    private String searchEduTarget = "";
    // 캘린더
    private String searchLearnDt = "";
    
	public String getSearchSgrCd() {
		return searchSgrCd;
	}
	public void setSearchSgrCd(String searchSgrCd) {
		this.searchSgrCd = searchSgrCd;
	}
	public String getSearchCateCd() {
		return searchCateCd;
	}
	public void setSearchCateCd(String searchCateCd) {
		this.searchCateCd = searchCateCd;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public String getMenuId() {
		return menuId;
	}
	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}
	public String getSearchEnrollStatusCd() {
		return searchEnrollStatusCd;
	}
	public void setSearchEnrollStatusCd(String searchEnrollStatusCd) {
		this.searchEnrollStatusCd = searchEnrollStatusCd;
	}
	public String getSearchStatus() {
		return searchStatus;
	}
	public void setSearchStatus(String searchStatus) {
		this.searchStatus = searchStatus;
	}
	public String getSearchEduPlace() {
		return searchEduPlace;
	}
	public void setSearchEduPlace(String searchEduPlace) {
		this.searchEduPlace = searchEduPlace;
	}
	public String getSearchEduTarget() {
		return searchEduTarget;
	}
	public void setSearchEduTarget(String searchEduTarget) {
		this.searchEduTarget = searchEduTarget;
	}
	public String getSearchLearnDt() {
		return searchLearnDt;
	}
	public void setSearchLearnDt(String searchLearnDt) {
		this.searchLearnDt = searchLearnDt;
	}
	
}
