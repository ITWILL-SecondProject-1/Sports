package com.sports.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.sports.model.vo.FaVO;
import com.sports.model.vo.ResVO;
import com.sports.mybatis.DBService;

public class ResDAO {

    // 예약 추가
	public static boolean addReservation(ResVO reservation) {
	    try (SqlSession ss = DBService.getFactory().openSession()) {
	        int reservedCapacity = getCapacity(reservation.getFacilityIdx(), reservation.getReserveDate(), reservation.getReserveTime());
	        int availableCapacity = 100 - reservedCapacity; 

	        if (availableCapacity >= reservation.getHeadCount()) {
	            boolean result = ss.insert("Res.insertReservation", reservation) > 0;
	            ss.commit();
	            return result;
	        } else {
	            return false; // 수용 인원 초과시 예약 실패하도록
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}


    private static int getCapacity(int facilityIdx, String reserveDate, String reserveTime) {
        try (SqlSession ss = DBService.getFactory().openSession()) {
            Map<String, Object> params = new HashMap<String, Object>();
            params.put("facilityIdx", facilityIdx);
            params.put("reserveDate", reserveDate);
            params.put("reserveTime", reserveTime);
            
            Integer reservedCapacity = ss.selectOne("Res.selectCapacity", params);
            return reservedCapacity != null ? reservedCapacity : 0; // 예약된  인원 합계를 반환
        } catch (Exception e) {
            e.printStackTrace();
            return 0; // 오류 발생 시 0 반환
        }
    }


    //모든 예약을 조회
    public static List<ResVO> getList(int userIdx) {
		try (SqlSession ss = DBService.getFactory().openSession()) {
			return ss.selectList("Res.selectReservation", userIdx);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return null;
	}
    
    // 예약 수정하기 (마이페이지에서 구현?)
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

    // 예약 취소하기 (예약 삭제 마페)
    public static boolean deleteReservation(int reserveIdx) {
        SqlSession session = null;
        try {
            session = DBService.getFactory().openSession();
            int affectedRows = session.delete("Res.deleteReservationById", reserveIdx);
            session.commit();
            return affectedRows > 0;  // 삭제된 행이 있다면 true 반환
        } catch (Exception e) {
            if (session != null) {
                session.rollback();  // 오류 발생 시 롤백
            }
            e.printStackTrace();
            return false; 
        } finally {
            if (session != null) {
                session.close(); // 세션 닫기
            }
        }
    }

}
