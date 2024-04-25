package Paging;

import java.util.List;

public interface BbsDAO {
	
	public abstract int getTotalCount();
	
	public abstract List<BbsVO> getBbsList(int begin, int end);
}
