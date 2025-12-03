package com.gocle.yangju.forest.adm.chsgr.vo;

import com.gocle.spring.vo.PaginationVO;

public class SgrManageDefaultVo extends PaginationVO {

    private static final long serialVersionUID = 1L;

    // 교육사이트 코드
    private String searchSgrCd = "";

    /** 검색조건 */
    private String searchCondition = "";

    /** 검색 Keyword */
    private String searchKeyword = "";

    /** 검색 사용여부 */
    private String searchUseYn = "";
    
    // 사용자 권한
    private String mngLevel;

	public String getSearchSgrCd() {
		return searchSgrCd;
	}

	public void setSearchSgrCd(String searchSgrCd) {
		this.searchSgrCd = searchSgrCd;
	}

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

	public String getMngLevel() {
		return mngLevel;
	}

	public void setMngLevel(String mngLevel) {
		this.mngLevel = mngLevel;
	}
	
	
}