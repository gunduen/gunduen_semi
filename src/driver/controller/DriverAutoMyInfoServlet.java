package driver.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import driver.model.service.DriverService;
import driver.model.vo.Driver;
import driver.model.vo.DriverPageData;

/**
 * Servlet implementation class DriverAutoMyInfoServlet
 */
@WebServlet("/driver/autoMyinfo")
public class DriverAutoMyInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DriverAutoMyInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String area = request.getParameter("area");
		int currentPage = 0;
		if(request.getParameter("currentPage")==null) {
			currentPage = 1;
		}else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		DriverPageData pageData = new DriverService().autoMyInfo(currentPage, area);
		ArrayList<Driver> dList = pageData.getPageList();
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if(!dList.isEmpty()) {	
			request.setAttribute("dList", dList);
			request.setAttribute("pageNavi", pageData.getPageNavi());
			System.out.println(dList.toString());
			System.out.println(pageData.getPageNavi());
			RequestDispatcher view = request.getRequestDispatcher("/driverInfoPage/DriverInfoPage.jsp");
			view.forward(request, response);
		} if(dList.isEmpty()) {	
			request.setAttribute("dList", dList);
			request.setAttribute("pageNavi", pageData.getPageNavi());
			System.out.println(dList.toString());
			System.out.println(pageData.getPageNavi());
			RequestDispatcher view = request.getRequestDispatcher("/driverInfoPage/DriverInfoPage.jsp");
			view.forward(request, response);
		}else {
			
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
