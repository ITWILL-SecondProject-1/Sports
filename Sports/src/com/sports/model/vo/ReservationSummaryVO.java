package com.sports.model.vo;

public class ReservationSummaryVO {
	private Integer facilityIdx;
    private Integer reserveTime;
    private Integer capacity;
    private Integer totalHeadCount;
    private Integer remainingCapacity;

    // 기본 생성자
    public ReservationSummaryVO() {}

    // Getter 및 Setter
    
	public Integer getFacilityIdx() {
		return facilityIdx;
	}

	public void setFacilityIdx(Integer facilityIdx) {
		this.facilityIdx = facilityIdx;
	}
    
    public Integer getReserveTime() {
        return reserveTime;
    }

    public void setReserveTime(Integer reserveTime) {
        this.reserveTime = reserveTime;
    }

    public Integer getCapacity() {
        return capacity;
    }

    public void setCapacity(Integer capacity) {
        this.capacity = capacity;
    }

    public Integer getTotalHeadCount() {
        return totalHeadCount;
    }

    public void setTotalHeadCount(Integer totalHeadCount) {
        this.totalHeadCount = totalHeadCount;
    }

    public Integer getRemainingCapacity() {
        return remainingCapacity;
    }

    public void setRemainingCapacity(Integer remainingCapacity) {
        this.remainingCapacity = remainingCapacity;
    }

	@Override
	public String toString() {
		return "ReservationSummaryVO [facilityIdx=" + facilityIdx + ", reserveTime=" + reserveTime + ", capacity="
				+ capacity + ", totalHeadCount=" + totalHeadCount + ", remainingCapacity=" + remainingCapacity + "]";
	}

}
