package com.gocle.spring.vo;

import com.gocle.spring.vo.PaginationVO;

public class OrderDefaultVo extends PaginationVO {

    private static final long serialVersionUID = 1L;

    /** 검색조건 */
    private String searchCondition = "";

    /** 검색 Keyword */
    private String searchKeyword = "";

    /** 검색 사용여부 */
    private String searchUseYn = "";

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
    
    
}
