package com.gocle.spring.vo;

import java.io.Serializable;

public class PaginationVO extends BaseVO implements Serializable {
	  private static final long serialVersionUID = -7869715162095539641L;
	  
	  private boolean pagination = false;
	  
	  private Integer pageIndex = Integer.valueOf(1);
	  
	  private Integer pageUnit = Integer.valueOf(10);
	  
	  private Integer pageSize = Integer.valueOf(10);
	  
	  private Integer firstIndex = Integer.valueOf(0);
	  
	  private Integer lastIndex = Integer.valueOf(0);
	  
	  private Integer recordCountPerPage = Integer.valueOf(10);
	  
	  public boolean isPagination() {
	    return this.pagination;
	  }
	  
	  public void setPagination(boolean isPagination) {
	    this.pagination = isPagination;
	  }
	  
	  public Integer getPageIndex() {
	    return this.pageIndex;
	  }
	  
	  public void setPageIndex(int pageIndex) {
	    this.pageIndex = Integer.valueOf(pageIndex);
	  }
	  
	  public Integer getPageUnit() {
	    return this.pageUnit;
	  }
	  
	  public void setPageUnit(int pageUnit) {
	    this.pageUnit = Integer.valueOf(pageUnit);
	  }
	  
	  public Integer getPageSize() {
	    return this.pageSize;
	  }
	  
	  public void setPageSize(int pageSize) {
	    this.pageSize = Integer.valueOf(pageSize);
	  }
	  
	  public Integer getFirstIndex() {
	    return this.firstIndex;
	  }
	  
	  public void setFirstIndex(int firstIndex) {
	    this.firstIndex = Integer.valueOf(firstIndex);
	  }
	  
	  public Integer getLastIndex() {
	    return this.lastIndex;
	  }
	  
	  public void setLastIndex(int lastIndex) {
	    this.lastIndex = Integer.valueOf(lastIndex);
	  }
	  
	  public Integer getRecordCountPerPage() {
	    return this.recordCountPerPage;
	  }
	  
	  public void setRecordCountPerPage(int recordCountPerPage) {
	    this.recordCountPerPage = Integer.valueOf(recordCountPerPage);
	  }
}
