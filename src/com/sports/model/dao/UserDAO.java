package com.sports.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.sports.model.vo.UserVO;
import com.sports.mybatis.DBService;

public class UserDAO {
	
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
	
	public static UserVO login(UserVO user) {
		try (SqlSession ss = DBService.getFactory().openSession()) {
			return ss.selectOne("sports.authenticateUser", user);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return null;
	}

}
