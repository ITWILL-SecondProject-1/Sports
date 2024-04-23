package com.sports.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.sports.model.vo.BoardVO;
import com.sports.mybatis.DBService;

public class BoardDAO {
	
	//전체글조회
	public static List<BoardVO> boardAll() {
		try(SqlSession ss = DBService.getFactory().openSession()) {
			List<BoardVO> list = ss.selectList("sports.boardAll");
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static int getTotalCount() {
		int total = 0;
		try (SqlSession ss = DBService.getFactory().openSession()) {
			total = ss.selectOne("sports.totalCount");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return total;
	}
	
	//페이지글 조회
	public static List<BoardVO> boardList(int begin, int end) {
		try (SqlSession ss = DBService.getFactory().openSession()) {
			Map<String, Integer> map = new HashMap<>();
			map.put("begin", begin);
			map.put("end", end);
			
			return ss.selectList("sports.boardList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//게시글 1개 조회
	public static BoardVO boardOne(int bbsIdx) {
		try (SqlSession ss = DBService.getFactory().openSession()) {
			BoardVO vo = ss.selectOne("sports.boardOne", bbsIdx);
			return vo;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//게시글작성
	public static int boardInsert(BoardVO vo) {
		int result = 0;
		try (SqlSession ss = DBService.getFactory().openSession(true)) {
			result = ss.insert("sports.writeBoard", vo);
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//게시글수정
	public static int boardUpdate(BoardVO vo) {
		int result = 0;
		try (SqlSession ss = DBService.getFactory().openSession(true)) {
			result = ss.update("sports.updateBoard", vo);
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//게시글삭제
	public static int boardDelete(int bbsIdx) {
		int result = 0;
		try (SqlSession ss = DBService.getFactory().openSession(true)) {
			result = ss.delete("sports.deleteBoard", bbsIdx);
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
