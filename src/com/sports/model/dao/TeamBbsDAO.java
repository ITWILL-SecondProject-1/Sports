package com.sports.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.sports.model.vo.TeamBbsVO;
import com.sports.model.vo.TeamSignupVO;
import com.sports.model.vo.UserVO;
import com.sports.mybatis.DBService;

import Paging.BbsVO;
import Paging.CommentVO;

public class TeamBbsDAO {
	static String mapperNamespace = "teamMapper";
	//****************************
	//로그인유저의 해당팀 가입여부 확인
	public static boolean isMyTeam(String teamIdx, String useridx){
		try(SqlSession ss = DBService.getFactory().openSession()){
			Map<String, Integer> map = new HashMap<>();
			map.put("teamIdx", Integer.parseInt(teamIdx));
			map.put("useridx", Integer.parseInt(useridx));
			return ss.selectOne(mapperNamespace + ".isMyTeam", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	//팀맴버 리스트 - 가입맴버 목록 출력용
	public static List<UserVO> getTeamMembers(String teamIdx){
		try(SqlSession ss = DBService.getFactory().openSession()){
			List<String> useridxList = ss.selectList(mapperNamespace + ".getTeamMembers", teamIdx);

			/**/System.out.println("  >>TeamBbsDAO useridxList : "+ useridxList);
			List<UserVO> list = new ArrayList<UserVO>();
			for(String a : useridxList) {
				list.add(ss.selectOne("sports.indexUserInfo", a));
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//가입신청서 리스트 - 신청서목록 출력용
	public static List<TeamSignupVO> getSignupList(String teamIdx){
		try(SqlSession ss = DBService.getFactory().openSession()){
			return ss.selectList(mapperNamespace + ".getSignupList",teamIdx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//페이징용 총 게시글수
	public static int getTotalCount(String teamIdx){
		try(SqlSession ss = DBService.getFactory().openSession()){
			return ss.selectOne(mapperNamespace + ".getTotalCount", teamIdx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	//게시글리스트
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
	
	//글보기용 1글
	public static BbsVO getOndBbs(String bbxIdx) {
		try(SqlSession ss = DBService.getFactory().openSession()){
			BbsVO vo = ss.selectOne(mapperNamespace + ".getOndBbs", bbxIdx);
			return vo;
		}catch (Exception e) {
				e.printStackTrace();
		}
		return null;
	}
	
	//작성할 글 인덱스(뷰페이지 리턴용)
	public static String getnewBbsIdx(){
		try(SqlSession ss = DBService.getFactory().openSession()){
			return ss.selectOne(mapperNamespace + ".getnewBbsIdx");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//글작성
	public static int insertBbs(TeamBbsVO vo) {
	    try (SqlSession ss = DBService.getFactory().openSession(true)) {
	        ss.insert(mapperNamespace +".insertBbs", vo);
	        return vo.getImageIdx(); // BoardVO 객체에서 imageIdx 값 반환
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return 0;
	}
	
	//댓글리스트
	public static List<CommentVO> getCommentsList(String bbxIdx){
		try(SqlSession ss = DBService.getFactory().openSession()){
			return ss.selectList(mapperNamespace + ".getCommentsList",bbxIdx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	//댓글입력
	public static int insertComment(CommentVO commVO) {
		try(SqlSession ss = DBService.getFactory().openSession(true)){
			return ss.insert(mapperNamespace + ".insertComment",commVO);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
