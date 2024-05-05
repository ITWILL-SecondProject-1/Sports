package com.sports.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.sports.model.vo.BoardCommentVO;
import com.sports.mybatis.DBService;

public class BoardCommentDAO {
	
	//자유게시판 댓글 목록
	public static List<BoardCommentVO> selectBoardComment(int bbsIdx) {
		List<BoardCommentVO> list = null;
		
		try (SqlSession ss = DBService.getFactory().openSession()) {
			list = ss.selectList("sports.selectBoardComment", bbsIdx);
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//자유게시판 댓글 1개
	public static BoardCommentVO selectBoardCommentOne(int commentIdx) {
		BoardCommentVO vo = null;
		
		try (SqlSession ss = DBService.getFactory().openSession()) {
			vo = ss.selectOne("sports.selectBoardCommentOne", commentIdx);
			return vo;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	//자유게시판 댓글 작성
	public static int writeBoardComment(BoardCommentVO vo) {
		int result = 0;
		try (SqlSession ss = DBService.getFactory().openSession(true)) {
			result = ss.insert("sports.writeBoardComment", vo);
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//자유게시판 댓글 수정
	public static int updateBoardComment(BoardCommentVO vo) {
		int result = 0;
		try (SqlSession ss = DBService.getFactory().openSession(true)) {
			result = ss.update("sports.updateBoardComment", vo);
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//자유게시판 댓글 삭제
	public static int deleteBoardComment(int commentIdx) {
		int result = 0;
		try (SqlSession ss = DBService.getFactory().openSession(true)) {
			result = ss.delete("sports.deleteBoardComment", commentIdx);
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
