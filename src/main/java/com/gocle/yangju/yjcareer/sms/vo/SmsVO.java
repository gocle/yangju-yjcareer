package com.gocle.yangju.yjcareer.sms.vo;

import java.io.Serializable;

import com.gocle.yangju.forest.comm.vo.BaseVO;

public class SmsVO extends BaseVO implements Serializable {

	private static final long serialVersionUID = -8392466705170899809L;

	/** 메시지 고유번호 (PK, auto_increment) */
    private String trNum;

    /** 메시지 전송 시간 */
    private String trSenddate;

    /** 발급받은 Sub ID */
    private String trId;

    /** 발송상태 (0:대기,1:전송완료,2:결과수신완료) */
    private String trSendstat;

    /** 결과 수신 상태 */
    private String trRsltstat;

    /** 메시지 타입 (0:일반,1:콜백URL) */
    private String trMsgtype;

    /** 수신 전화번호 */
    private String trPhone;

    /** 발신 전화번호 */
    private String trCallback;

    /** 결과 수신 시간 */
    private String trRsltdate;

    /** 결과 수정 시간 */
    private String trModified;

    /** 메시지 내용 */
    private String trMsg;

    /** 문자 유형 */
    private String trClass;

    /** 이동통신사 정보 */
    private String trNet;

    /** 기타 필드 */
    private String trEtc1;
    private String trEtc2;
    private String trEtc3;
    private String trEtc4;
    private String trEtc5;
    private String trEtc6;
    
	public String getTrNum() {
		return trNum;
	}
	public void setTrNum(String trNum) {
		this.trNum = trNum;
	}
	public String getTrSenddate() {
		return trSenddate;
	}
	public void setTrSenddate(String trSenddate) {
		this.trSenddate = trSenddate;
	}
	public String getTrId() {
		return trId;
	}
	public void setTrId(String trId) {
		this.trId = trId;
	}
	public String getTrSendstat() {
		return trSendstat;
	}
	public void setTrSendstat(String trSendstat) {
		this.trSendstat = trSendstat;
	}
	public String getTrRsltstat() {
		return trRsltstat;
	}
	public void setTrRsltstat(String trRsltstat) {
		this.trRsltstat = trRsltstat;
	}
	public String getTrMsgtype() {
		return trMsgtype;
	}
	public void setTrMsgtype(String trMsgtype) {
		this.trMsgtype = trMsgtype;
	}
	public String getTrPhone() {
		return trPhone;
	}
	public void setTrPhone(String trPhone) {
		this.trPhone = trPhone;
	}
	public String getTrCallback() {
		return trCallback;
	}
	public void setTrCallback(String trCallback) {
		this.trCallback = trCallback;
	}
	public String getTrRsltdate() {
		return trRsltdate;
	}
	public void setTrRsltdate(String trRsltdate) {
		this.trRsltdate = trRsltdate;
	}
	public String getTrModified() {
		return trModified;
	}
	public void setTrModified(String trModified) {
		this.trModified = trModified;
	}
	public String getTrMsg() {
		return trMsg;
	}
	public void setTrMsg(String trMsg) {
		this.trMsg = trMsg;
	}
	public String getTrClass() {
		return trClass;
	}
	public void setTrClass(String trClass) {
		this.trClass = trClass;
	}
	public String getTrNet() {
		return trNet;
	}
	public void setTrNet(String trNet) {
		this.trNet = trNet;
	}
	public String getTrEtc1() {
		return trEtc1;
	}
	public void setTrEtc1(String trEtc1) {
		this.trEtc1 = trEtc1;
	}
	public String getTrEtc2() {
		return trEtc2;
	}
	public void setTrEtc2(String trEtc2) {
		this.trEtc2 = trEtc2;
	}
	public String getTrEtc3() {
		return trEtc3;
	}
	public void setTrEtc3(String trEtc3) {
		this.trEtc3 = trEtc3;
	}
	public String getTrEtc4() {
		return trEtc4;
	}
	public void setTrEtc4(String trEtc4) {
		this.trEtc4 = trEtc4;
	}
	public String getTrEtc5() {
		return trEtc5;
	}
	public void setTrEtc5(String trEtc5) {
		this.trEtc5 = trEtc5;
	}
	public String getTrEtc6() {
		return trEtc6;
	}
	public void setTrEtc6(String trEtc6) {
		this.trEtc6 = trEtc6;
	}
    
}
