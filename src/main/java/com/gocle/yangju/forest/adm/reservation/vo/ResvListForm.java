package com.gocle.yangju.forest.adm.reservation.vo;

import java.util.List;

public class ResvListForm {
	private String pgId;
    private String pgType;
	private List<ReservationVO> reservationList;

    public List<ReservationVO> getReservationList() {
        return reservationList;
    }

    public void setReservationList(List<ReservationVO> reservationList) {
        this.reservationList = reservationList;
    }

	public String getPgId() {
		return pgId;
	}

	public void setPgId(String pgId) {
		this.pgId = pgId;
	}

	public String getPgType() {
		return pgType;
	}

	public void setPgType(String pgType) {
		this.pgType = pgType;
	}
}
