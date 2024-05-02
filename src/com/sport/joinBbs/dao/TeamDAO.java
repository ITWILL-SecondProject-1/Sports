package com.sport.joinBbs.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.sport.joinBbs.mybatis.DBService;
import com.sport.joinBbs.vo.TeamSignupVO;
import com.sport.joinBbs.vo.TeamVO;

public class TeamDAO {
	public static String getnewTeamIdx(){
		try(SqlSession ss = DBService.getFactory().openSession()){
			return ss.selectOne("joinBbs.getnewTeamIdx");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static TeamVO getOneTeam(String teamIdx) {
		/**/System.out.println("  >>TeamDAO.getOneTeam()");
		try(SqlSession ss = DBService.getFactory().openSession()){
			return ss.selectOne("teamMapper.getOneTeam", teamIdx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static List<TeamVO> getMyTeamList(String useridx){
		try(SqlSession ss = DBService.getFactory().openSession()){
			return ss.selectList("joinBbs.myTeamList", useridx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static TeamVO staticgetOneTeam(String teamIdx) {
		try(SqlSession ss = DBService.getFactory().openSession()){
			return ss.selectOne("joinBbs.team", teamIdx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static int insertTeam(TeamVO teamVo) {
		try(SqlSession ss = DBService.getFactory().openSession(true)){
			return ss.insert("joinBbs.teamInsert",teamVo);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public static int updateTeam(TeamVO teamVo) {
		try(SqlSession ss = DBService.getFactory().openSession(true)){
			return ss.insert("joinBbs.teamUpdate",teamVo);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public static int insertSignup(TeamSignupVO signupVo) {
		try(SqlSession ss = DBService.getFactory().openSession(true)){
			return ss.insert("joinBbs.signupInsert",signupVo);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
