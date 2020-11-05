package message.model.vo;

import java.util.ArrayList;

public class PageData {
	//생성자 
	public PageData() {}

	private ArrayList<Message> pageList;
	private String pageNavi;
	private int totalCount;
	private int recordCountPerPage;
	
	//getter, setter
	public ArrayList<Message> getPageList() {
		return pageList;
	}
	public void setPageList(ArrayList<Message> pageList) {
		this.pageList = pageList;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}

	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}
	
	
}
