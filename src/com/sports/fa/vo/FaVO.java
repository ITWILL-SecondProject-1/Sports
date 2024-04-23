package com.sports.fa.vo;

public class FaVO {
	 private int facilityidx;
	 private String facilityname;
	 private String address;
	 private String phonenumber;
	 private int capacity;
	 private String event;
	 private String image;
	 private String imagepi;
	public int getFacilityidx() {
		return facilityidx;
	}
	public void setFacilityidx(int facilityidx) {
		this.facilityidx = facilityidx;
	}
	public String getFacilityname() {
		return facilityname;
	}
	public void setFacilityname(String facilityname) {
		this.facilityname = facilityname;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	public int getCapacity() {
		return capacity;
	}
	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
	public String getEvent() {
		return event;
	}
	public void setEvent(String event) {
		this.event = event;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getImagepi() {
		return imagepi;
	}
	public void setImagepi(String imagepi) {
		this.imagepi = imagepi;
	}
	@Override
	public String toString() {
		return "FaVO [facilityidx=" + facilityidx + ", facilityname=" + facilityname + ", address=" + address
				+ ", phonenumber=" + phonenumber + ", capacity=" + capacity + ", event=" + event + ", image=" + image
				+ ", imagepi=" + imagepi + "]";
	}
	
	
	 
	 
	
	

}
