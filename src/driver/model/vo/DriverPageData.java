package driver.model.vo;

import java.util.ArrayList;

public class DriverPageData {
	private ArrayList<Driver> pageList;
	private String pageNavi;
	public ArrayList<Driver> getPageList() {
		return pageList;
	}
	public void setPageList(ArrayList<Driver> pageList) {
		this.pageList = pageList;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	
	
	
}
