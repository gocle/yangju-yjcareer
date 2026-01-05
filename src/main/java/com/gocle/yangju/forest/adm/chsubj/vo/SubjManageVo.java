package com.gocle.yangju.forest.adm.chsubj.vo;

public class SubjManageVo extends SubjManageDefaultVo {
	
	private static final long serialVersionUID = 1L;
	
	// 교육사이트 코드
    private String sgrCd;
    private String sgrNm;
    // 분류 일련번호
    private String cateCd;
    private String cateNm;
    // 과정코드
    private String subjCd;
    // 교육강좌명
    private String subjNm;
    // 사용 여부
    private String useYn;
    // 전화번호
    private String tel;
    // 교육기관
    private String comId;
    private String comTitle;
    // 교육장소
    private String eduPlace;
    private String locId;
    // 교육대상
    private String eduTarget;
    // 모집방법
    private String enrollType;
    // 중복신청 가능여부
    private String duplEnrollYn;
    // 강의계획서
    private String subjPlan;
    // 유의사항
    private String subjDesc;
    
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
	public String getSubjCd() {
		return subjCd;
	}
	public void setSubjCd(String subjCd) {
		this.subjCd = subjCd;
	}
	public String getSubjNm() {
		return subjNm;
	}
	public void setSubjNm(String subjNm) {
		this.subjNm = subjNm;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getCateNm() {
		return cateNm;
	}
	public void setCateNm(String cateNm) {
		this.cateNm = cateNm;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getSubjPlan() {
		return subjPlan;
	}
	public void setSubjPlan(String subjPlan) {
		this.subjPlan = subjPlan;
	}
	public String getSubjDesc() {
		return subjDesc;
	}
	public void setSubjDesc(String subjDesc) {
		this.subjDesc = subjDesc;
	}
	public String getComId() {
		return comId;
	}
	public void setComId(String comId) {
		this.comId = comId;
	}
	public String getComTitle() {
		return comTitle;
	}
	public void setComTitle(String comTitle) {
		this.comTitle = comTitle;
	}
	public String getEnrollType() {
		return enrollType;
	}
	public void setEnrollType(String enrollType) {
		this.enrollType = enrollType;
	}
	public String getEduTarget() {
		return eduTarget;
	}
	public void setEduTarget(String eduTarget) {
		this.eduTarget = eduTarget;
	}
	public String getDuplEnrollYn() {
		return duplEnrollYn;
	}
	public void setDuplEnrollYn(String duplEnrollYn) {
		this.duplEnrollYn = duplEnrollYn;
	}
	public String getEduPlace() {
		return eduPlace;
	}
	public void setEduPlace(String eduPlace) {
		this.eduPlace = eduPlace;
	}
	public String getLocId() {
		return locId;
	}
	public void setLocId(String locId) {
		this.locId = locId;
	}
	public String getSgrNm() {
		return sgrNm;
	}
	public void setSgrNm(String sgrNm) {
		this.sgrNm = sgrNm;
	}
}
