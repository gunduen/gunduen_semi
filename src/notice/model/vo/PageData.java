package notice.model.vo;

import java.util.ArrayList;

public class PageData 
{
	private ArrayList<Notice> pageList;
	private String pageNavi;
	
	public PageData() {}

	public ArrayList<Notice> getPageList() {
		return pageList;
	}

	public void setPageList(ArrayList<Notice> pageList) {
		this.pageList = pageList;
	}

	public String getPageNavi() {
		return pageNavi;
	}

	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	
	
}
