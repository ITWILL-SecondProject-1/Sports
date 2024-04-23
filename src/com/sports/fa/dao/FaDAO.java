package com.sports.fa.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.sports.fa.vo.FaVO;
import com.sports.mybatis.DBService;


public class FaDAO {
	
	public static List<FaVO> getList() {
		try (SqlSession ss = DBService.getFactory().openSession()) {
			return ss.selectList("sports.list");
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return null;
	}
	
}
