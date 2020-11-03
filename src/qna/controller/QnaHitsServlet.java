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

import qna.model.service.QnaService;

/**
 * Servlet implementation class QnaHitsServlet
 */
@WebServlet("/qna/hits")
public class QnaHitsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaHitsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int qnaNo = Integer.parseInt(request.getParameter("qnaNoticeNo"));
		int result = new QnaService().updateHits(qnaNo);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if (result > 0) {
			RequestDispatcher view = request.getRequestDispatcher("/qna/detail?qnaNoticeNo="+qnaNo);
			view.forward(request, response);
		}else {
			out.println("<script>alert('오류발생! 잠시 후 다시 시도해 주시기 바랍니다')");
			out.println("history.back();</script>");
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
