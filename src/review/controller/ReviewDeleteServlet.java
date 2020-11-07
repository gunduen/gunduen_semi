package review.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import comment.model.service.CommentService;
import review.model.service.ReviewService;

/**
 * Servlet implementation class ReviewDeleteServlet
 */
@WebServlet("/review/delete")
public class ReviewDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
		String area = request.getParameter("reviewArea");
		int package_Code = Integer.parseInt(request.getParameter("package_Code"));
		int resultcomment = new CommentService().deleteAllComment(reviewNo);
		int result = new ReviewService().deleteReview(reviewNo);
//		int resulta = new ReviewService().updateReviewCheck(package_Code);
		if (result > 0) {
			if(resultcomment>0) {
			response.sendRedirect("/review/list?reviewArea=" + area);
			}
		} else {
			request.getRequestDispatcher("/review/reviewError.html");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
