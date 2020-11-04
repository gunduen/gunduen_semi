package driver.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import driver.model.service.DriverService;
import driver.model.vo.Driver;

/**
 * Servlet implementation class DriverDeleteServlet
 */
@WebServlet("/driver/delete")
public class DriverDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DriverDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		
		
		String userId = (String)request.getAttribute("Driver_Id");
		System.out.println("hi");
		System.out.println(userId);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		int result = new DriverService().deleteDriver(userId);
		
		if (result >0) {
			// session.invalidate();
			
			out.println("<script>alert('회원탈퇴가 완료되었습니다.'); document.location.href='/index.jsp';</script>");
			
		}else {
			out.println("<script>alert('회원가입에 실패하셨어요');");
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
