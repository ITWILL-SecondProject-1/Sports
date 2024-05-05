package com.sports.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.sport.joinBbs.mybatis.DBService;
import com.sports.model.vo.TeamMemberVO;

public class TeamMemberDAO {
	static String mapperNamespace = "joinBbs";
	//****************************
	
	public static int insertTeamMember(TeamMemberVO teamMem){
		try(SqlSession ss = DBService.getFactory().openSession(true)){
			return ss.insert(mapperNamespace+".insertTeamMember", teamMem);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
