package com.sports.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.sports.model.vo.BoardVO;
import com.sports.mybatis.DBService;

public class BoardDAO {
	
	public static List<BoardVO> boardAll() {
		try(SqlSession ss = DBService.getFactory().openSession()) {
			List<BoardVO> list = ss.selectList("sports.boardAll");
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
