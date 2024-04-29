package com.sports.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.sports.mybatis.DBService;

import Paging.BbsVO;
import Paging.CommentVO;

public class TeamBbsDAO {
	static String mapperNamespace = "teamMapper";
	//****************************
	
	public static String isMyTeam(String teamIdx, String useridx){
		/**/System.out.println("  >>dao");
		/**/System.out.println("    teamIdx : " + teamIdx);
		/**/System.out.println("    useridx : " + useridx);
		try(SqlSession ss = DBService.getFactory().openSession()){
			Map<String, Integer> map = new HashMap<>();
			map.put("teamIdx", Integer.parseInt(teamIdx));
			map.put("useridx", Integer.parseInt(useridx));
			/**/System.out.println("    str : " + ss.selectOne(mapperNamespace + ".isMyTeam", map));
			return ss.selectOne(mapperNamespace + ".isMyTeam", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static String isMyTeam2(String teamIdx, String useridx) {
		try(SqlSession ss = DBService.getFactory().openSession()){
			Map<String, Integer> map = new HashMap<>();
			map.put("teamIdx", Integer.parseInt(teamIdx));
			map.put("useridx", Integer.parseInt(useridx));
			System.out.println("    "+ ss.selectOne("teamMapper.isMyTeam2", map));
			return ss.selectOne("teamMapper.isMyTeam2", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static int getTotalCount(String teamIdx){
		try(SqlSession ss = DBService.getFactory().openSession()){
			return ss.selectOne(mapperNamespace + ".getTotalCount", teamIdx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public static List<BbsVO> getBbsList(int begin, int end, int teamIdx){
		try(SqlSession ss = DBService.getFactory().openSession()){
			Map<String, Integer> map = new HashMap<>();
			map.put("begin", begin);
			map.put("end", end);
			map.put("teamIdx", teamIdx);
			return ss.selectList(mapperNamespace + ".getBbsList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static BbsVO getOndBbs(String bbxIdx) {
		try(SqlSession ss = DBService.getFactory().openSession()){
			BbsVO vo = ss.selectOne(mapperNamespace + ".getOndBbs", bbxIdx);
			return vo;
		}catch (Exception e) {
				e.printStackTrace();
		}
		return null;
	}
	
	public static String getnewBbsIdx(){
		try(SqlSession ss = DBService.getFactory().openSession()){
			return ss.selectOne(mapperNamespace + ".getnewBbsIdx");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static int insertBbs(BbsVO vo) {
		try(SqlSession ss = DBService.getFactory().openSession(true)){
			return ss.insert(mapperNamespace + ".insertBbs",vo);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public static List<CommentVO> getCommentsList(String bbxIdx){
		try(SqlSession ss = DBService.getFactory().openSession()){
			return ss.selectList(mapperNamespace + ".getCommentsList",bbxIdx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public static int insertComment(CommentVO commVO) {
		try(SqlSession ss = DBService.getFactory().openSession(true)){
			return ss.insert(mapperNamespace + ".insertComment",commVO);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
