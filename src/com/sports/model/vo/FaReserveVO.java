package com.sports.model.vo;

public class FaReserveVO {
	private int reserveIdx;
	private int facilityIdx;
	private int useridx;
	private String reserveDate;
	private int reserveTime;
	
	public int getReserveIdx() {
		return reserveIdx;
	}
	public void setReserveIdx(int reserveIdx) {
		this.reserveIdx = reserveIdx;
	}
	public int getFacilityIdx() {
		return facilityIdx;
	}
	public void setFacilityIdx(int facilityIdx) {
		this.facilityIdx = facilityIdx;
	}
	public int getUseridx() {
		return useridx;
	}
	public void setUseridx(int useridx) {
		this.useridx = useridx;
	}
	public String getReserveDate() {
		return reserveDate;
	}
	public void setReserveDate(String reserveDate) {
		this.reserveDate = reserveDate;
	}
	public int getReserveTime() {
		return reserveTime;
	}
	public void setReserveTime(int reserveTime) {
		this.reserveTime = reserveTime;
	}
	@Override
	public String toString() {
		return "FaReserveVO [reserveIdx=" + reserveIdx + ", facilityIdx=" + facilityIdx + ", useridx=" + useridx
				+ ", reserveDate=" + reserveDate + ", reserveTime=" + reserveTime + "]";
	}
}
