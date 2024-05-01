package com.sports.model.dao;

import org.apache.ibatis.session.SqlSession;
import com.sports.model.vo.ResVO;
import com.sports.mybatis.DBService;

public class ResDAO {

    // 예약 추가
    public static boolean addReservation(ResVO reservation) {
    	  try (SqlSession ss = DBService.getFactory().openSession()) {
              int capacity = getCapacity(reservation.getFacilityIdx(), reservation.getReserveDate(), reservation.getReserveTime()); // 수용 인원 조회
              if (capacity - reservation.getHeadCount() >= 0) { // 예약 인원이 수용 인원을 초과하지 않는 경우
                  boolean result = ss.insert("Res.insertReservation", reservation) > 0;
                  ss.commit();
                  return result;
              } else {
                  return false; // 수용 인원 초과시 예약 실패
              }
          } catch (Exception e) {
              e.printStackTrace();
              return false;
          }
      }

    private static int getCapacity(int facilityIdx, String reserveDate, String reserveTime) {
		return 100;
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
