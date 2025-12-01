package com.gocle.yangju.forest.adm.banner.vo;

import java.io.Serializable;

import com.gocle.yangju.forest.comm.vo.BaseVO;

public class BannerVO extends BaseVO implements Serializable {

	private static final long serialVersionUID = -573368458605795364L;

	/** 배너아이디 */
	private String bnId;
	/** 타입 */
	private String bnType;
	/** 순서 */
	private String bnOrder;
	/** 이름 */
	private String bnName;
	/** 설명 */
	private String bnDescription;
	/** 링크 */
	private String bnLink;
	/** 링크 새창여부 */
	private String bnNewWin;
	/** 게시 시작일 */
	private String bnStartDate;
	/** 게시 종료일 */
	private String bnEndDate;
	/** 등록일 */
	private String bnRegDate;
	/** 사용유무 */
	private String bnUse;
	/** 확장자 */
	private String bnExt;
	/** 가로크기 */
	private String bnWidth;
	/** 세로크기 */
	private String bnHeight;
	/** TOP위치 */
	private String bnTop;
	/** LEFT 위치 */
	private String bnLeft;
	/** 썸네일 */
	private String bnThumb;
	/** 노출 유형 */
	private String bnDisplayType;
	
	public String getBnId() {
		return bnId;
	}
	public void setBnId(String bnId) {
		this.bnId = bnId;
	}
	public String getBnType() {
		return bnType;
	}
	public void setBnType(String bnType) {
		this.bnType = bnType;
	}
	public String getBnOrder() {
		return bnOrder;
	}
	public void setBnOrder(String bnOrder) {
		this.bnOrder = bnOrder;
	}
	public String getBnName() {
		return bnName;
	}
	public void setBnName(String bnName) {
		this.bnName = bnName;
	}
	public String getBnDescription() {
		return bnDescription;
	}
	public void setBnDescription(String bnDescription) {
		this.bnDescription = bnDescription;
	}
	public String getBnLink() {
		return bnLink;
	}
	public void setBnLink(String bnLink) {
		this.bnLink = bnLink;
	}
	public String getBnNewWin() {
		return bnNewWin;
	}
	public void setBnNewWin(String bnNewWin) {
		this.bnNewWin = bnNewWin;
	}
	public String getBnStartDate() {
		return bnStartDate;
	}
	public void setBnStartDate(String bnStartDate) {
		this.bnStartDate = bnStartDate;
	}
	public String getBnEndDate() {
		return bnEndDate;
	}
	public void setBnEndDate(String bnEndDate) {
		this.bnEndDate = bnEndDate;
	}
	public String getBnRegDate() {
		return bnRegDate;
	}
	public void setBnRegDate(String bnRegDate) {
		this.bnRegDate = bnRegDate;
	}
	public String getBnUse() {
		return bnUse;
	}
	public void setBnUse(String bnUse) {
		this.bnUse = bnUse;
	}
	public String getBnExt() {
		return bnExt;
	}
	public void setBnExt(String bnExt) {
		this.bnExt = bnExt;
	}
	public String getBnWidth() {
		return bnWidth;
	}
	public void setBnWidth(String bnWidth) {
		this.bnWidth = bnWidth;
	}
	public String getBnHeight() {
		return bnHeight;
	}
	public void setBnHeight(String bnHeight) {
		this.bnHeight = bnHeight;
	}
	public String getBnTop() {
		return bnTop;
	}
	public void setBnTop(String bnTop) {
		this.bnTop = bnTop;
	}
	public String getBnLeft() {
		return bnLeft;
	}
	public void setBnLeft(String bnLeft) {
		this.bnLeft = bnLeft;
	}
	public String getBnThumb() {
		return bnThumb;
	}
	public void setBnThumb(String bnThumb) {
		this.bnThumb = bnThumb;
	}
	public String getBnDisplayType() {
		return bnDisplayType;
	}
	public void setBnDisplayType(String bnDisplayType) {
		this.bnDisplayType = bnDisplayType;
	}

}
