package com.gocle.yangju.forest.adm.company.vo;

import com.gocle.yangju.forest.comm.vo.BaseVO;

public class CompanyManageVo extends BaseVO {

    private static final long serialVersionUID = 1L;

    private String comId;
    
    private String comTitle;
    
    private String comIntro;
    
    private String useYn;
    
    private String note;
    
    /** 주소 찾기 */    
    private String zipCode;		//우편번호
   
    private String address;		//주소
    
    private String addressDtl; 	//상세 주소

    private String location;
    
    private int seqNo;
    
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

	public String getComIntro() {
		return comIntro;
	}

	public void setComIntro(String comIntro) {
		this.comIntro = comIntro;
	}

	public String getUseYn() {
		return useYn;
	}

	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddressDtl() {
		return addressDtl;
	}

	public void setAddressDtl(String addressDtl) {
		this.addressDtl = addressDtl;
	}
	
	public String getNote() {
		return note;
	}
	
	public void setNote(String note) {
		this.note = note;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public int getSeqNo() {
		return seqNo;
	}

	public void setSeqNo(int seqNo) {
		this.seqNo = seqNo;
	}
	
}
