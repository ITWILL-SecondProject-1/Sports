package com.sports.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.sports.model.vo.FaVO;
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
}
