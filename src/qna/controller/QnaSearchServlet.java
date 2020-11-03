package qna.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import qna.model.service.QnaService;
import qna.model.vo.PageData;
import qna.model.vo.QnaNotice;

/**
 * Servlet implementation class QnaSearchServlet
 */
@WebServlet("/qna/search")
public class QnaSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int currentPage = 0;
		if (request.getParameter("currentPage") == null) {
			currentPage = 1;
		}else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		String search = request.getParameter("search");
		String type = request.getParameter("type");
		PageData pageData = new QnaService().selectSearch(search, currentPage, type);
		ArrayList<QnaNotice> qList = pageData.getPageList();
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		int pageNum = pageData.getTotalCount() - (currentPage -1) * pageData.getRecordCountPerPage();
		if (!qList.isEmpty()) {
			request.setAttribute("qList", qList);
			request.setAttribute("pageNavi", pageData.getPageNavi());
			request.setAttribute("pageNum", pageNum);
			RequestDispatcher view = request.getRequestDispatcher("/qna/qnaSearch.jsp");
			view.forward(request, response);
		}else {
			out.println("<script>alert('검색된 결과가 없습니다.')");
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
