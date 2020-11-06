package review.model.vo;
import java.util.ArrayList;


public class PageData {
	//생성자 
	public PageData() {}

	private ArrayList<Review> pageReviewList;
	private String pageReviewNavi;
	public ArrayList<Review> getPageReviewList() {
		return pageReviewList;
	}
	public void setPageReviewList(ArrayList<Review> pageReviewList) {
		this.pageReviewList = pageReviewList;
	}
	public String getPageReviewNavi() {
		return pageReviewNavi;
	}
	public void setPageReviewNavi(String pageReviewNavi) {
		this.pageReviewNavi = pageReviewNavi;
	}
	
	
}
