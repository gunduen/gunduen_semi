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
 * Servlet implementation class DriverTravelDetailServlet
 */
@WebServlet("/select/DriverTravel")
public class DriverTravelDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DriverTravelDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int packageCode = Integer.parseInt(request.getParameter("packageCode"));
		String driverId = request.getParameter("driverId");
		// String driverId = request.getParameter("driverId");
		System.out.println(driverId);
		ArrayList<Travel> tdList = new TravelService().selctMyTravel(packageCode);
		if(!tdList.isEmpty()) {
			request.setAttribute("tdList", tdList);
			request.setAttribute("packageCode", packageCode);
			request.setAttribute("driverId", driverId);
			RequestDispatcher travel = request.getRequestDispatcher("/myPage/TravelDetail.jsp");
			travel.forward(request, response);
		}else {
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
