                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            package com.sport.joinBbs.common;

//게시판의 페이징 처리를 위한 값을 저장 관리
public class Paging {
	private int nowPage = 1; //현재페이지
	private int nowBlock = 1; //현재 블록(페이지 담는 단위)
	
	private int numPerPage = 3; //하나의 페이지에 표시할 게시글 수
	private int pagePerBlock = 3; //블록당 표시하는 페이지 갯수
	
	private int totalRecord = 0; //총 게시물 갯수(원본 게시글 수)
	private int totalPage = 0; //전체 페이지 갯수
	private int totalBlock = 0; //전체 블록 갯수
	
	private int begin = 0; //현재 페이지상의 시작 게시글 번호
	private int end = 0; //현재 페이지상의 마지막 게시글 번호
	
	private int beginPage = 0; //현재 블록의 시작 페이지 번호
	private int endPage = 0; //현재 블록의 끝 페이지 번호
	
	
	//생성자 (하나의 페이지에 표시할 게시글 수, 블록당 표시하는 페이지 갯수, 원본 게시글 수)
	public Paging(int numPerPage, int pagePerBlock, int totalRecord) {
		setNumPerPage(numPerPage);
		setPagePerBlock(pagePerBlock);
		setTotalRecord(totalRecord);
		setTotalPage();
		setTotalBlock();
		setNowPage(nowPage);
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
		setNowBlock();
		setEnd();
		setBegin();
		setEndPage();
		setBeginPage();
	}
	//전체 페이지 갯수 구하기
	//totalRecord 값을 페이지당 표시할 글의 개수 값을 나누고,
	//나머지가 있으면 페이지 하나 더 추가
	public void setTotalPage() {
		totalPage = totalRecord / numPerPage;
		if (totalRecord % numPerPage > 0) totalPage++;
	}
	public void setTotalBlock() {
		totalBlock = totalPage / pagePerBlock;
		if (totalPage % pagePerBlock > 0) totalBlock++;
	}
	
	//----
	public void setEnd() {
		end = nowPage * numPerPage;
		if (end > totalRecord) {
			end = totalRecord;
		}
	}
	public void setBegin() {
		begin = nowPage * numPerPage - numPerPage + 1;
		if(begin < 0) {
			begin = 1;
		}
	}
	public void setEndPage() {
		endPage = nowBlock * pagePerBlock;
		if (endPage > totalPage) {
			endPage = totalPage;
		}
	}
	public void setBeginPage() {
		beginPage = nowBlock * pagePerBlock - pagePerBlock + 1;
		if(beginPage < 0) {
			beginPage = 1;
		}
	}
	public void setNowBlock() {
		nowBlock = (nowPage - 1) / pagePerBlock + 1;
	}
	//----
	
	
	public int getNowPage() {
		return nowPage;
	}
	public int getNowBlock() {
		return nowBlock;
	}
	public int getNumPerPage() {
		return numPerPage;
	}
	public int getPagePerBlock() {
		return pagePerBlock;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public int getTotalBlock() {
		return totalBlock;
	}
	public int getBegin() {
		return begin;
	}
	public int getEnd() {
		return end;
	}
	public int getBeginPage() {
		return beginPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setNowBlock(int nowBlock) {
		this.nowBlock = nowBlock;
	}
	public void setNumPerPage(int numPerPage) {
		this.numPerPage = numPerPage;
	}
	public void setPagePerBlock(int pagePerBlock) {
		this.pagePerBlock = pagePerBlock;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public void setTotalBlock(int totalBlock) {
		this.totalBlock = totalBlock;
	}
	public void setBegin(int begin) {
		this.begin = begin;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	@Override
	public String toString() {
		return "Paging [nowPage=" + nowPage + ", nowBlock=" + nowBlock + ", numPerPage=" + numPerPage
				+ ", pagePerBlock=" + pagePerBlock + ", totalRecord=" + totalRecord + ", totalPage=" + totalPage
				+ ", totalBlock=" + totalBlock + ", begin=" + begin + ", end=" + end + ", beginPage=" + beginPage
				+ ", endPage=" + endPage + "]";
	}
}
















