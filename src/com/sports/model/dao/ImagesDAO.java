package com.sports.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.sports.cloudinary.IMGUpload;
import com.sports.model.vo.ImagesVO;
import com.sports.mybatis.DBService;

public class ImagesDAO {
	// 이미지 인서트
	public static boolean insertImage(ImagesVO imageVO) {
		try (SqlSession ss = DBService.getFactory().openSession()) {
			boolean result = ss.insert("images.insert", imageVO) > 0;
			ss.commit();
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return false;
	}
	
	// 해당하는 게시물의 이미지 리스트 조회
	public static List<ImagesVO> imageList(int imageIdx) {
		try (SqlSession ss = DBService.getFactory().openSession()) {
			return ss.selectList("images.idxList", imageIdx);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return null;
	}
	
	public static boolean deleteImage(String imagePi) {
		IMGUpload imgUpload = new IMGUpload();
		try (SqlSession ss= DBService.getFactory().openSession()) {
			if (ss.delete("images.delete", imagePi) > 0) {
				if (imgUpload.deleteImage(imagePi)) {
					ss.commit();
					return true;
				};
			};
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
}
