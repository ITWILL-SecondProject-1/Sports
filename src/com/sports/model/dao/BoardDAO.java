package com.sports.model.dao;

import java.util.List;

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
	
	// 해당하는 유저의 자유게시글 조회
	public static List<BoardVO> selectUserFreeBoards(String email) {
		try(SqlSession ss = DBService.getFactory().openSession()) {
			List<BoardVO> list = ss.selectList("sports.userFreeBoard", email);
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
