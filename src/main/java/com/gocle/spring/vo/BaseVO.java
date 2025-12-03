package com.gocle.spring.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class BaseVO {
	  private String cmd;
	  
	  private String sessionId;
	  
	  private String sessionUserId;
	  
	  private String sessionLoginId;
	  
	  private String sessionUserNm;
	  
	  private String sessionTypeCd;
	  
	  private String sessionAuthCd;
	  
	  private String sessionSgrCd;
	  
	  private String sessionSgrYy;
	  
	  private String sessionSgrSessionCd;
	  
	  private String regId;
	  
	  private String regIp;
	  
	  private String updId;
	  
	  private String updIp;
	  
	  public void setCmd(String cmd) {
	    this.cmd = cmd;
	  }
	  
	  public void setSessionId(String sessionId) {
	    this.sessionId = sessionId;
	  }
	  
	  public void setSessionUserId(String sessionUserId) {
	    this.sessionUserId = sessionUserId;
	  }
	  
	  public void setSessionLoginId(String sessionLoginId) {
	    this.sessionLoginId = sessionLoginId;
	  }
	  
	  public void setSessionUserNm(String sessionUserNm) {
	    this.sessionUserNm = sessionUserNm;
	  }
	  
	  public void setSessionTypeCd(String sessionTypeCd) {
	    this.sessionTypeCd = sessionTypeCd;
	  }
	  
	  public void setSessionAuthCd(String sessionAuthCd) {
	    this.sessionAuthCd = sessionAuthCd;
	  }
	  
	  public void setSessionSgrCd(String sessionSgrCd) {
	    this.sessionSgrCd = sessionSgrCd;
	  }
	  
	  public void setSessionSgrYy(String sessionSgrYy) {
	    this.sessionSgrYy = sessionSgrYy;
	  }
	  
	  public void setSessionSgrSessionCd(String sessionSgrSessionCd) {
	    this.sessionSgrSessionCd = sessionSgrSessionCd;
	  }
	  
	  public void setRegId(String regId) {
	    this.regId = regId;
	  }
	  
	  public void setRegIp(String regIp) {
	    this.regIp = regIp;
	  }
	  
	  public void setUpdId(String updId) {
	    this.updId = updId;
	  }
	  
	  public void setUpdIp(String updIp) {
	    this.updIp = updIp;
	  }
	  
	  public void setDateTimeFunction(String dateTimeFunction) {
	    this.dateTimeFunction = dateTimeFunction;
	  }
	  
	  public void setDateFunction(String dateFunction) {
	    this.dateFunction = dateFunction;
	  }
	  
	  public String getCmd() {
	    return this.cmd;
	  }
	  
	  public String getSessionId() {
	    return this.sessionId;
	  }
	  
	  public String getSessionUserId() {
	    return this.sessionUserId;
	  }
	  
	  public String getSessionLoginId() {
	    return this.sessionLoginId;
	  }
	  
	  public String getSessionUserNm() {
	    return this.sessionUserNm;
	  }
	  
	  public String getSessionTypeCd() {
	    return this.sessionTypeCd;
	  }
	  
	  public String getSessionAuthCd() {
	    return this.sessionAuthCd;
	  }
	  
	  public String getSessionSgrCd() {
	    return this.sessionSgrCd;
	  }
	  
	  public String getSessionSgrYy() {
	    return this.sessionSgrYy;
	  }
	  
	  public String getSessionSgrSessionCd() {
	    return this.sessionSgrSessionCd;
	  }
	  
	  public String getRegId() {
	    return this.regId;
	  }
	  
	  public String getRegIp() {
	    return this.regIp;
	  }
	  
	  public String getUpdId() {
	    return this.updId;
	  }
	  
	  public String getUpdIp() {
	    return this.updIp;
	  }
	  
	  private String dateTimeFunction = "NOW()";
	  
	  public String getDateTimeFunction() {
	    return this.dateTimeFunction;
	  }
	  
	  private String dateFunction = "NOW()";
	  
	  public String getDateFunction() {
	    return this.dateFunction;
	  }
	  
	  public final String toString() {
	    return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	  }
	}
