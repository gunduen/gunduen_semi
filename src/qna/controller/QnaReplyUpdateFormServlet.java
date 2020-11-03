package qna.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import qna.model.service.QnaService;
import qna.model.vo.Answer;

/**
 * Servlet implementation class QnaReplyUpdateFormServlet
 */
@WebServlet("/qna/replyupdateform")
public class QnaReplyUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaReplyUpdateFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
		Answer answer = new QnaService().selectAnswer(qnaNo);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if (answer != null) {
			request.setAttribute("answer", answer);
			request.getRequestDispatcher("/qna/qnaReplyUpdate.jsp").forward(request, response);
		}else {
			out.println("<script>alert('답변 수정에 실패하였습니다. 잠시 후 다시 시도해 주시기 바랍니다')");
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
