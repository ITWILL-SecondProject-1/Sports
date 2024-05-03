package com.sports.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.sports.model.vo.FaReserveVO;
import com.sports.model.vo.FaVO;
import com.sports.model.vo.ReservationSummaryVO;
import com.sports.mybatis.DBService;


public class FaDAO {
	// 모든 시설을 조회
	public static List<FaVO> getList() {
		try (SqlSession ss = DBService.getFactory().openSession()) {
			return ss.selectList("facility.list");
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return null;
	}
	
	public static List<FaVO> getPagingList(int begin, int end){
		try(SqlSession ss = DBService.getFactory().openSession()){
			Map<String, Integer> map = new HashMap<>();
			map.put("begin", begin);
			map.put("end", end);
			return ss.selectList("facility.getPagingList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}
  //예약목록에서 시설 아이디로 시설 이름 가져오기 
  public static String getFacilityNameById(int facilityIdx) {
      try (SqlSession session = DBService.getFactory().openSession()) {
          return session.selectOne("facility.selectFacilityNameById", facilityIdx);
      } catch (Exception e) {
          e.printStackTrace();
          return null;
      }
  }

	
	// 시설 한 개를 조회
	public static FaVO inquireData(int facilityIdx) {
		try (SqlSession ss = DBService.getFactory().openSession()) {
			return ss.selectOne("facility.inquireFacility", facilityIdx);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return null;
	}
	
	// 해당 시간에 시설의 예약 상태 조회
	public static ReservationSummaryVO getReserveData(FaReserveVO faReserveVO) {
		try (SqlSession ss = DBService.getFactory().openSession()) {
			return ss.selectOne("facility.getReserveData", faReserveVO);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return null;
	}
	
	//시설 추가
	public static int insertFacility(FaVO vo) {
		try (SqlSession ss = DBService.getFactory().openSession(true)) {
			ss.insert("facility.insertFacility", vo);
			return vo.getImageIdx();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	//시설 수정
	public static int updateFacility(FaVO vo) {
		int result = 0;
		try (SqlSession ss = DBService.getFactory().openSession(true)) {
			result = ss.update("facility.updateFacility", vo);
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//시설 삭제
	public static int deleteFacility(int facilityIdx) {
		int result = 0;
		try (SqlSession ss = DBService.getFactory().openSession(true)) {
			result = ss.delete("facility.deleteFacility", facilityIdx);
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
}
