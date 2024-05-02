package com.sports.model.dao;

import java.util.List;

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
