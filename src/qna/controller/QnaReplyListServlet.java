package qna.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import qna.model.service.QnaService;
import qna.model.vo.Answer;
import qna.model.vo.QnaNotice;

/**
 * Servlet implementation class QnaReplyListServlet
 */
@WebServlet("/qna/replylist")
public class QnaReplyListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaReplyListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 관리자 답변 불러오는 서블릿 (SELECT)
		request.setCharacterEncoding("utf-8");
		int qnaNo = Integer.parseInt(request.getParameter("qnaNoticeNo"));
		String replyCheck = request.getParameter("replyCheck");
		Answer answer = new QnaService().selectAnswer(qnaNo);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if (answer != null) {
			request.setAttribute("answer", answer);
			RequestDispatcher view = request.getRequestDispatcher("/qna/replycheck?check="+replyCheck);
			view.forward(request, response);
//			RequestDispatcher views = request.getRequestDispatcher("/qna/qnaDetail.jsp");
//			views.forward(request, response);
		}if(answer == null){
			// 관리자 답변이 없을때 실행되는 코드
			RequestDispatcher view = request.getRequestDispatcher("/qna/qnaDetail.jsp");
			view.forward(request, response);
		}
		else {
			out.println("<script>alert('잠시 후 다시 시도해 주시기 바랍니다')");
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
