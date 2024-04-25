package com.sports.model.vo;

public class FaVO {
	private int facilityIdx;
	private String facilityName;
	private String address;
	private String phoneNumber;
	private String event;
	private int imageIdx;
	private int openTime;
	private int closeTime;
	private int capacity;
	private int DateRangeForReservation;
	 
	public int getFacilityIdx() {
		return facilityIdx;
	}
	public void setFacilityIdx(int facilityIdx) {
		this.facilityIdx = facilityIdx;
	}
	public String getFacilityName() {
		return facilityName;
	}
	public void setFacilityName(String facilityName) {
		this.facilityName = facilityName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getEvent() {
		return event;
	}
	public void setEvent(String event) {
		this.event = event;
	}
	public int getImageIdx() {
		return imageIdx;
	}
	public void setImageIdx(int imageIdx) {
		this.imageIdx = imageIdx;
	}
	public int getOpenTime() {
		return openTime;
	}
	public void setOpenTime(int openTime) {
		this.openTime = openTime;
	}
	public int getCloseTime() {
		return closeTime;
	}
	public void setCloseTime(int closeTime) {
		this.closeTime = closeTime;
	}
	public int getCapacity() {
		return capacity;
	}
	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
	public int getDateRangeForReservation() {
		return DateRangeForReservation;
	}
	public void setDateRangeForReservation(int dateRangeForReservation) {
		DateRangeForReservation = dateRangeForReservation;
	}
	
	@Override
	public String toString() {
		return "FaVO [facilityIdx=" + facilityIdx + ", facilityName=" + facilityName + ", address=" + address
				+ ", phoneNumber=" + phoneNumber + ", event=" + event + ", imageIdx=" + imageIdx + ", openTime="
				+ openTime + ", closeTime=" + closeTime + ", capacity=" + capacity + ", DateRangeForReservation="
				+ DateRangeForReservation + "]";
	}
	 
}
