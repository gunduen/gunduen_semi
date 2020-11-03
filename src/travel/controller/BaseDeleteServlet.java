package travel.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import driver.model.vo.Driver;
import travel.model.service.TravelService;

/**
 * Servlet implementation class BaseDeleteServlet
 */
@WebServlet("/base/delete")
public class BaseDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BaseDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		String Driver_Id = ((Driver)session.getAttribute("driver")).getDriverId();
		
		System.out.println(Driver_Id);
		
		int result = new TravelService().deleteBaseTravel(Driver_Id);
		
		
		
		if(result>0) {
			System.out.println(Driver_Id);
			session.invalidate();
			request.setAttribute("Driver_Id", Driver_Id);
			RequestDispatcher view = request.getRequestDispatcher("/driver/delete");
		    view.forward(request, response);
		}else {
			response.sendRedirect("/#error");
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
