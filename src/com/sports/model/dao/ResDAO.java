package com.sports.model.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import com.sports.model.vo.ResVO;
import com.sports.mybatis.DBService;

public class ResDAO {

    // 예약 추가
	public static boolean addReservation(ResVO reservation) {
	    try (SqlSession ss = DBService.getFactory().openSession()) {
	        int availableCapacity = getAvailableCapacity(reservation.getFacilityIdx(), reservation.getReserveDate(), reservation.getReserveTime()); // 남은 수용 인원 조회

	        if (availableCapacity >= reservation.getHeadCount()) { // 예약 인원이 남은 수용 인원을 초과하지 않는 경우
	            boolean result = ss.insert("Res.insertReservation", reservation) > 0;
	            ss.commit();
	            return result;
	        } else {
	            return false; // 수용 인원 초과 시 예약 실패 처리
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}


	private static final int TOTAL_CAPACITY = 100; // 총 수용 인원

	private static int getAvailableCapacity(int facilityIdx, String reserveDate, String reserveTime) {
	    try (SqlSession ss = DBService.getFactory().openSession()) {
	        Map<String, Object> params = new HashMap<>();
	        params.put("facilityIdx", facilityIdx);
	        params.put("reserveDate", reserveDate);
	        params.put("reserveTime", reserveTime);

	        // 이미 예약된 인원 수 조회
	        Integer reservedCapacity = ss.selectOne("Res.selectCapacity", params);
	        reservedCapacity = (reservedCapacity != null) ? reservedCapacity : 0;

	        // 남은 예약 가능 인원 계산
	        return TOTAL_CAPACITY - reservedCapacity;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return 0; // 오류 발생 시 0 반환
	    }
	}




	// 예약 정보 가져오기
    public static ResVO getReservation(int reserveIdx) {
        try (SqlSession ss = DBService.getFactory().openSession()) {
            return ss.selectOne("Res.selectReservation", reserveIdx); 
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    // 예약 수정하기
    public static boolean editReservation(ResVO reservation) {
        try (SqlSession ss = DBService.getFactory().openSession()) {
            int result = ss.update("Res.updateReservation", reservation); 
            ss.commit();
            return result > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // 예약 취소하기 (예약 삭제)
    public static boolean cancelReservation(int reserveIdx) {
        try (SqlSession ss = DBService.getFactory().openSession()) {
            int result = ss.delete("Res.deleteReservation", reserveIdx); 
            ss.commit();
            return result > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
