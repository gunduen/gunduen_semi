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
import qna.model.vo.Answer;
import qna.model.vo.QnaNotice;

/**
 * Servlet implementation class QnaReplyServlet
 */
@WebServlet("/qna/reply")
public class QnaReplyWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaReplyWriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 관리자가 답변 달때 사용하는 서블릿 (INSERT)
		request.setCharacterEncoding("utf-8");
		int qnaNo = Integer.parseInt(request.getParameter("qnaNoticeNo"));
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String replyCheck = request.getParameter("replyCheck");
		HttpSession session = request.getSession();
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if (session != null && (session.getAttribute("customer") != null)) {
			int result = new QnaService().insertReply(subject, content, qnaNo);
			if (result > 0) {
				response.sendRedirect("/qna/detail?qnaNoticeNo="+qnaNo+"&replyCheck="+replyCheck);
			}
			else {
				out.println("<script>alert('답변 등록에 실패하였습니다. 잠시 후 다시 시도해 주시기 바랍니다')");
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
