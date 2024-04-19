package com.sport.joinBbs.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.sport.joinBbs.mybatis.DBService;
import com.sport.joinBbs.vo.JoinBbsVO;
import com.sport.joinBbs.vo.JoinCommentVO;
import com.sport.joinBbs.vo.TeamVO;

public class JoinBbsDAO {
	
	public static int getTotalCount(){
		try(SqlSession ss = DBService.getFactory().openSession()){
			return ss.selectOne("joinBbs.countJoinBbs");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public static List<JoinBbsVO> getJoinBbsList(int begin, int end){
		try(SqlSession ss = DBService.getFactory().openSession()){
			Map<String, Integer> map = new HashMap<>();
			map.put("begin", begin);
			map.put("end", end);
			return ss.selectList("joinBbs.joinBbsList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static JoinBbsVO getOndJoinBbs(String bbxIdx) {
		try(SqlSession ss = DBService.getFactory().openSession()){
			JoinBbsVO vo = ss.selectOne("joinBbs.joinBbs", bbxIdx);
			return vo;
		}catch (Exception e) {
				e.printStackTrace();
		}
		return null;
	}
	
	public static List<JoinCommentVO> getCommentsList(String bbxIdx){
		try(SqlSession ss = DBService.getFactory().openSession()){
			return ss.selectList("joinBbs.joinCommentList",bbxIdx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public static int insertComment(JoinCommentVO commVO) {
		try(SqlSession ss = DBService.getFactory().openSession(true)){
			return ss.insert("joinBbs.joinCommentInsert",commVO);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public static int insertJoinBbs(JoinBbsVO vo) {
		try(SqlSession ss = DBService.getFactory().openSession(true)){
			return ss.insert("joinBbs.joinBbsInsert",vo);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public static String getnewTeamIdx(){
		try(SqlSession ss = DBService.getFactory().openSession()){
			return ss.selectOne("joinBbs.getnewTeamIdx");
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
}
