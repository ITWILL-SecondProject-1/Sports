package com.sports.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.sports.model.vo.UserVO;
import com.sports.mybatis.DBService;

public class UserDAO {
	
	// 회원가입
	public static boolean register(UserVO user) {
		try (SqlSession ss = DBService.getFactory().openSession()) {
			boolean result = ss.insert("sports.register", user) > 0;
			ss.commit();
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return false;
	}
	
	// 로그인
	public static UserVO login(UserVO user) {
		try (SqlSession ss = DBService.getFactory().openSession()) {
			return ss.selectOne("sports.authenticateUser", user);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return null;
	}
	
	// 이메일 중복 체크
	public static Boolean emailDuplicateCheck(String email) {
		try (SqlSession ss = DBService.getFactory().openSession()) {
			return ss.selectOne("sports.emailDuplicateCheck", email);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return false;
	}
	
	// 유저의 정보 가져오기
	public static UserVO getUserInfo(String email) {
		try (SqlSession ss = DBService.getFactory().openSession()) {
			UserVO user = ss.selectOne("sports.getUserInfo", email);
			System.out.println(user.getEmail());
			return user;
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return null;
	}
	
	// 유저 정보 수정하기
	public static boolean editUserProfile(UserVO user) {
		try (SqlSession ss = DBService.getFactory().openSession()) {
			int result = ss.update("sports.editProfile", user);
			ss.commit();
			return result > 0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	// 프로필 이미지 수정하기
	public static boolean editProfileImg(UserVO user) {
		try (SqlSession ss = DBService.getFactory().openSession()) {
			int result = ss.update("sports.editProfileImg", user);
			ss.commit();
			return result > 0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	//유저인덱스 가져오기
	public static String emailToIndex(String email) {
		try (SqlSession ss = DBService.getFactory().openSession()){
			return ss.selectOne("sports.emailToIndex", email);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//인덱스로 유저 정보 가져오기
	public static UserVO indexToUserInfo(String index) {
		try (SqlSession ss = DBService.getFactory().openSession()) {
			return ss.selectOne("sports.indexUserInfo", index);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
