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

/**
 * Servlet implementation class QnaReplyDeleteServlet
 */
@WebServlet("/qna/replydelete")
public class QnaReplyDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaReplyDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
		int result = new QnaService().deleteReply(qnaNo);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		String replyCheck = request.getParameter("replyCheck");
		if (result > 0) {
			int checkResult = new QnaService().updateCheck(qnaNo, replyCheck);
			if ( checkResult > 0 ) {
				RequestDispatcher view = request.getRequestDispatcher("/qna/detail?qnaNoticeNo="+qnaNo);
				view.forward(request, response);
			}
		}else {
			out.println("<script>alert('답변 삭제에 실패하였습니다. 잠시 후 다시 시도해 주시기 바랍니다')");
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
