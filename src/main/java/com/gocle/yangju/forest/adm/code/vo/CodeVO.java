package com.gocle.yangju.forest.adm.code.vo;

import java.io.Serializable;

import com.gocle.yangju.forest.comm.vo.BaseVO;


public class CodeVO extends BaseVO implements Serializable {

	private static final long serialVersionUID = -5579313334859825023L;

	private String codeId;			//코드 아이디
	private String codeName;		//코드 이름
    private String codeGroup;		//그룹 영어
    private String codeCode;		//코드
    private int codeOrder;		//코드 순서
    private String groupDesc;		//코드 그룹 한글 이름  (코드 내용)
    private String codeNameEng;  	//코드 영어
	public String getCodeId() {
		return codeId;
	}
	public void setCodeId(String codeId) {
		this.codeId = codeId;
	}
	public String getCodeName() {
		return codeName;
	}
	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}
	public String getCodeGroup() {
		return codeGroup;
	}
	public void setCodeGroup(String codeGroup) {
		this.codeGroup = codeGroup;
	}
	public String getCodeCode() {
		return codeCode;
	}
	public void setCodeCode(String codeCode) {
		this.codeCode = codeCode;
	}
	public int getCodeOrder() {
		return codeOrder;
	}
	public void setCodeOrder(int codeOrder) {
		this.codeOrder = codeOrder;
	}
	public String getGroupDesc() {
		return groupDesc;
	}
	public void setGroupDesc(String groupDesc) {
		this.groupDesc = groupDesc;
	}
	public String getCodeNameEng() {
		return codeNameEng;
	}
	public void setCodeNameEng(String codeNameEng) {
		this.codeNameEng = codeNameEng;
	}
    
}
