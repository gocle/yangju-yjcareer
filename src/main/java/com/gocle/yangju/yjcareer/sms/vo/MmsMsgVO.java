package com.gocle.yangju.yjcareer.sms.vo;

import java.io.Serializable;

public class MmsMsgVO implements Serializable {

    private static final long serialVersionUID = 1L;

    /* PK */
    private String msgKey;              // 메시지 고유번호 (AUTO_INCREMENT)

    /* 기본 정보 */
    private String subject;             // LMS/MMS 제목
    private String phone;               // 수신번호
    private String callback;            // 발신번호
    private String status;              // 발송상태 (0:대기,1:전송완료,2:결과수신)
    private String reqdate;              // 발송 요청 시간
    private String msg;                 // 메시지 내용
    private String type;                // 메시지 타입 (0:LMS,1:MMS)
    private String id;                  // 고객 ID

    /* 파일 관련 */
    private String fileCnt;             // 전송파일개수
    private String fileCntReal;         // 실제 선택된 파일 개수

    private String filePath1;
    private String filePath1Size;
    private String filePath2;
    private String filePath2Size;
    private String filePath3;
    private String filePath3Size;
    private String filePath4;
    private String filePath4Size;
    private String filePath5;
    private String filePath5Size;

    /* 결과/상태 */
    private String sentdate;             // 송신완료시간
    private String rsltdate;             // 수신시간
    private String reportdate;           // 결과 수신 시간
    private String treminateddate;       // 처리 완료 시간
    private String rslt;                 // 결과값
    private String telcoinfo;            // 이통사 코드
    private String routeId;              // 실제 발송 세션 ID

    /* 기타 */
    private String post;                 // 송신자 부서
    private String multiSeq;             // 동보 발송 키
	public String getMsgKey() {
		return msgKey;
	}
	public void setMsgKey(String msgKey) {
		this.msgKey = msgKey;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getCallback() {
		return callback;
	}
	public void setCallback(String callback) {
		this.callback = callback;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getReqdate() {
		return reqdate;
	}
	public void setReqdate(String reqdate) {
		this.reqdate = reqdate;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getFileCnt() {
		return fileCnt;
	}
	public void setFileCnt(String fileCnt) {
		this.fileCnt = fileCnt;
	}
	public String getFileCntReal() {
		return fileCntReal;
	}
	public void setFileCntReal(String fileCntReal) {
		this.fileCntReal = fileCntReal;
	}
	public String getFilePath1() {
		return filePath1;
	}
	public void setFilePath1(String filePath1) {
		this.filePath1 = filePath1;
	}
	public String getFilePath1Size() {
		return filePath1Size;
	}
	public void setFilePath1Size(String filePath1Size) {
		this.filePath1Size = filePath1Size;
	}
	public String getFilePath2() {
		return filePath2;
	}
	public void setFilePath2(String filePath2) {
		this.filePath2 = filePath2;
	}
	public String getFilePath2Size() {
		return filePath2Size;
	}
	public void setFilePath2Size(String filePath2Size) {
		this.filePath2Size = filePath2Size;
	}
	public String getFilePath3() {
		return filePath3;
	}
	public void setFilePath3(String filePath3) {
		this.filePath3 = filePath3;
	}
	public String getFilePath3Size() {
		return filePath3Size;
	}
	public void setFilePath3Size(String filePath3Size) {
		this.filePath3Size = filePath3Size;
	}
	public String getFilePath4() {
		return filePath4;
	}
	public void setFilePath4(String filePath4) {
		this.filePath4 = filePath4;
	}
	public String getFilePath4Size() {
		return filePath4Size;
	}
	public void setFilePath4Size(String filePath4Size) {
		this.filePath4Size = filePath4Size;
	}
	public String getFilePath5() {
		return filePath5;
	}
	public void setFilePath5(String filePath5) {
		this.filePath5 = filePath5;
	}
	public String getFilePath5Size() {
		return filePath5Size;
	}
	public void setFilePath5Size(String filePath5Size) {
		this.filePath5Size = filePath5Size;
	}
	public String getSentdate() {
		return sentdate;
	}
	public void setSentdate(String sentdate) {
		this.sentdate = sentdate;
	}
	public String getRsltdate() {
		return rsltdate;
	}
	public void setRsltdate(String rsltdate) {
		this.rsltdate = rsltdate;
	}
	public String getReportdate() {
		return reportdate;
	}
	public void setReportdate(String reportdate) {
		this.reportdate = reportdate;
	}
	public String getTreminateddate() {
		return treminateddate;
	}
	public void setTreminateddate(String treminateddate) {
		this.treminateddate = treminateddate;
	}
	public String getRslt() {
		return rslt;
	}
	public void setRslt(String rslt) {
		this.rslt = rslt;
	}
	public String getTelcoinfo() {
		return telcoinfo;
	}
	public void setTelcoinfo(String telcoinfo) {
		this.telcoinfo = telcoinfo;
	}
	public String getRouteId() {
		return routeId;
	}
	public void setRouteId(String routeId) {
		this.routeId = routeId;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public String getMultiSeq() {
		return multiSeq;
	}
	public void setMultiSeq(String multiSeq) {
		this.multiSeq = multiSeq;
	}
    
}    