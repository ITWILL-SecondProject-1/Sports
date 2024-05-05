package Paging;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.sports.mybatis.DBService;


public class BbsDAO {
	static String mapperNamespace = "pagingMapper";
	
	public static int getTotalCount(){
		try(SqlSession ss = DBService.getFactory().openSession()){
			return ss.selectOne(mapperNamespace + ".getTotalCount");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public static List<BbsVO> getBbsList(int begin, int end){
		try(SqlSession ss = DBService.getFactory().openSession()){
			Map<String, Integer> map = new HashMap<>();
			map.put("begin", begin);
			map.put("end", end);
			return ss.selectList(mapperNamespace + ".getBbsList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
