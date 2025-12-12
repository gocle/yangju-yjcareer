package com.gocle.yangju.forest.adm.chsubj.vo;

public class SubjCateManageVo extends SubjCateManageDefaultVo {

    private static final long serialVersionUID = 1L;

    //카테고리 코드에 들어갈 첫번째 문자. 외부 코드와 중복 되는것을 막기 위해 삽입 함.
    private String categoryPrefix = "A";
    // 교육사이트 코드
    private String sgrCd;
    private String sgrNm;
    // 분류 일련번호
    private String cateCd;
    // 분류 명
    private String cateNm;
    // 상위 분류 일련번호
    private String upperCateCd;
    // 분류 경로
    private String catePath;
    // 분류 설명
    private String cateDesc;
    // 정렬 순서
    private Integer sortOrder;
    // 사용 여부
    private String useYn;
    
    // 서브분류 일련번호
    private String cateCdSub;
    
    // 개발 연도
    private String issueYear;
    
    // 전문강사 신규 재위촉 구분
    private String specialYn;
    
    // 서류전형 여부
    private String dsYn;
    
    private Integer underCnt;
    
    private Integer subjCnt;
    
    //기관
    private String comId;
    
	public String getCategoryPrefix() {
		return categoryPrefix;
	}
	public void setCategoryPrefix(String categoryPrefix) {
		this.categoryPrefix = categoryPrefix;
	}
	public String getSgrCd() {
		return sgrCd;
	}
	public void setSgrCd(String sgrCd) {
		this.sgrCd = sgrCd;
	}
	public String getCateCd() {
		return cateCd;
	}
	public void setCateCd(String cateCd) {
		this.cateCd = cateCd;
	}
	public String getCateNm() {
		return cateNm;
	}
	public void setCateNm(String cateNm) {
		this.cateNm = cateNm;
	}
	public String getUpperCateCd() {
		return upperCateCd;
	}
	public void setUpperCateCd(String upperCateCd) {
		this.upperCateCd = upperCateCd;
	}
	public String getCatePath() {
		return catePath;
	}
	public void setCatePath(String catePath) {
		this.catePath = catePath;
	}
	public String getCateDesc() {
		return cateDesc;
	}
	public void setCateDesc(String cateDesc) {
		this.cateDesc = cateDesc;
	}
	public Integer getSortOrder() {
		return sortOrder;
	}
	public void setSortOrder(Integer sortOrder) {
		this.sortOrder = sortOrder;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getCateCdSub() {
		return cateCdSub;
	}
	public void setCateCdSub(String cateCdSub) {
		this.cateCdSub = cateCdSub;
	}
	public String getIssueYear() {
		return issueYear;
	}
	public void setIssueYear(String issueYear) {
		this.issueYear = issueYear;
	}
	public String getSpecialYn() {
		return specialYn;
	}
	public void setSpecialYn(String specialYn) {
		this.specialYn = specialYn;
	}
	public String getDsYn() {
		return dsYn;
	}
	public void setDsYn(String dsYn) {
		this.dsYn = dsYn;
	}
	public Integer getUnderCnt() {
		return underCnt;
	}
	public void setUnderCnt(Integer underCnt) {
		this.underCnt = underCnt;
	}
	public Integer getSubjCnt() {
		return subjCnt;
	}
	public void setSubjCnt(Integer subjCnt) {
		this.subjCnt = subjCnt;
	}
	public String getComId() {
		return comId;
	}
	public void setComId(String comId) {
		this.comId = comId;
	}
	public String getSgrNm() {
		return sgrNm;
	}
	public void setSgrNm(String sgrNm) {
		this.sgrNm = sgrNm;
	}
}
