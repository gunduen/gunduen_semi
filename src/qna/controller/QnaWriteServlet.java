package qna.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import customer.model.vo.Customer;
import driver.model.vo.Driver;
import qna.model.service.QnaService;

/**
 * Servlet implementation class QnaWriteServlet
 */
@WebServlet("/qna/write")
public class QnaWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaWriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		HttpSession session = request.getSession();
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		// 고객이 QnA 등록했을때 코드
		if (session != null && (session.getAttribute("customer") != null)) {
			String userId = ((Customer)session.getAttribute("customer")).getCustomer_Id();
			int result = new QnaService().insertQna(subject, content, userId);
			if (result > 0) {
				response.sendRedirect("/qna/list");
			}
			else {
				out.println("<script>alert('질문 등록에 실패하였습니다. 잠시 후 다시 시도해 주시기 바랍니다')");
				out.println("history.back();</script>");
			}
			// 기사가 QnA 등록했을때 코드
		}else if(session != null && (session.getAttribute("driver") != null)) {
			String driverId = ((Driver)session.getAttribute("driver")).getDriverId();
			int result = new QnaService().insertQnaa(subject, content, driverId);
			if (result > 0) {
				response.sendRedirect("/qna/list");
			}else {
				out.println("<script>alert('질문 등록에 실패하였습니다. 잠시 후 다시 시도해 주시기 바랍니다')");
				out.println("history.back();</script>");
			}
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
