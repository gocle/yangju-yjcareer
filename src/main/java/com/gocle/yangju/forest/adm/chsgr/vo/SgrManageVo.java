package com.gocle.yangju.forest.adm.chsgr.vo;


public class SgrManageVo extends SgrManageDefaultVo {

    private static final long serialVersionUID = 1L;
    // 교육사이트 코드
    private String sgrCd;
    // 교육사이트명
    private String sgrNm;
    // 도메인
    private String domain;
    // 첨부 아이디
    private String attachId;
    // 사용여부
    private String useYn;

    // 대상회사
    private String compCd;
    // 대상회사 배열
    private String[] compCds;
    
    public String getSgrCd() {
		return sgrCd;
	}
	public void setSgrCd(String sgrCd) {
		this.sgrCd = sgrCd;
	}
	public String getSgrNm() {
		return sgrNm;
	}
	public void setSgrNm(String sgrNm) {
		this.sgrNm = sgrNm;
	}
	public String getDomain() {
		return domain;
	}
	public void setDomain(String domain) {
		this.domain = domain;
	}
	public String getAttachId() {
		return attachId;
	}
	public void setAttachId(String attachId) {
		this.attachId = attachId;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getCompCd() {
		return compCd;
	}
	public void setCompCd(String compCd) {
		this.compCd = compCd;
	}
	public String[] getCompCds() {
		return compCds;
	}
	public void setCompCds(String[] compCds) {
		this.compCds = compCds;
	}

}