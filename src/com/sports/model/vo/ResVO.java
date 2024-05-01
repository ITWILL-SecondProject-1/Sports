package com.sports.model.vo;

public class ResVO {
    private int reserveIdx;
    private int facilityIdx;
    private int userIdx;
    private String reserveDate;
    private String reserveTime;
    private int headCount;

    // 기본 생성자
    public ResVO() {
    }

    // 모든 필드를 포함하는 생성자
    public ResVO(int reserveIdx, int facilityIdx, int userIdx, String reserveDate, String reserveTime, int headCount) {
        this.reserveIdx = reserveIdx;
        this.facilityIdx = facilityIdx;
        this.userIdx = userIdx;
        this.reserveDate = reserveDate;
        this.reserveTime = reserveTime;
        this.headCount = headCount;
    }

    // getter 및 setter 메소드
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

    public int getUserIdx() {
        return userIdx;
    }

    public void setUserIdx(int userIdx) {
        this.userIdx = userIdx;
    }

    public String getReserveDate() {
        return reserveDate;
    }

    public void setReserveDate(String reserveDate) {
        this.reserveDate = reserveDate;
    }

    public String getReserveTime() {
        return reserveTime;
    }

    public void setReserveTime(String reserveTime) {
        this.reserveTime = reserveTime;
    }

    public int getHeadCount() {
        return headCount;
    }

    public void setHeadCount(int headCount) {
        this.headCount = headCount;
    }

    // toString() 메소드를 오버라이드하여 객체의 상태를 쉽게 로깅할 수 있도록 함
    @Override
    public String toString() {
        return "ResVO [reserveIdx=" + reserveIdx + ", facilityIdx=" + facilityIdx + ", userIdx=" + userIdx +
               ", reserveDate='" + reserveDate + '\'' + ", reserveTime='" + reserveTime + '\'' + ", headCount=" + headCount + ']';
    }
}
