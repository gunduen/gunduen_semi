package travel.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import travel.model.service.TravelService;
import travel.model.vo.Travel;

/**
 * Servlet implementation class DriverTravelListServlet
 */
@WebServlet("/DriverTravel/List")
public class DriverTravelListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DriverTravelListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
request.setCharacterEncoding("utf-8");
		
		String driverId = request.getParameter("driverId");
		System.out.println(driverId);
		ArrayList<Travel> dList = new TravelService().selectDriverTravelList(driverId);
		if(!dList.isEmpty()) {
			request.setAttribute("dList", dList);
			request.setAttribute("driverId", driverId);
			RequestDispatcher travel = request.getRequestDispatcher("/myPage/DriverMyPage.jsp");
			travel.forward(request, response);
		}if(dList.isEmpty()){
			RequestDispatcher travel =request.getRequestDispatcher("/myPage/DriverMyPage.jsp");
			travel.forward(request, response);
		}
		
		else {
			request.getRequestDispatcher("error");
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
