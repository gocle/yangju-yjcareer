package com.gocle.yangju.forest.adm.ip.vo;

import java.io.Serializable;

import com.gocle.yangju.forest.comm.vo.BaseVO;

public class IpVO extends BaseVO implements Serializable {

	private static final long serialVersionUID = 6933115475179405072L;

	private String ipId;
	
	private String ipAddress;
	
	private String accessName;

	public String getIpId() {
		return ipId;
	}

	public void setIpId(String ipId) {
		this.ipId = ipId;
	}

	public String getIpAddress() {
		return ipAddress;
	}

	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}

	public String getAccessName() {
		return accessName;
	}

	public void setAccessName(String accessName) {
		this.accessName = accessName;
	}
}
