package com.sport.joinBbs.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.sport.joinBbs.mybatis.DBService;
import com.sport.joinBbs.vo.JoinBbsVO;

public class JoinBbsDAO {
	
	public static int getTotalCount(){
		try(SqlSession ss = DBService.getFactory().openSession()){
			return ss.selectOne("joinBbs.countJoinBbs");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public static List<JoinBbsVO> getJoinBbsList(){
		try(SqlSession ss = DBService.getFactory().openSession()){
			return ss.selectList("joinBbs.allJoinBbs");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
