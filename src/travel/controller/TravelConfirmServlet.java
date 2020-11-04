package travel.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import travel.model.service.TravelService;

/**
 * Servlet implementation class TravelConfirmServlet
 */
@WebServlet("/travel/confirm")
public class TravelConfirmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TravelConfirmServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int packageCode = Integer.parseInt(request.getParameter("package_Code"));
		String driverId = request.getParameter("driverId");
		int result = new TravelService().confirmTravel(packageCode);
		if(result > 0) {
			request.setAttribute("packageCode", packageCode);
			request.setAttribute("driverId", driverId);
			RequestDispatcher travel = request.getRequestDispatcher("/DriverTravel/List");
			travel.forward(request, response);
			
		}else
		{
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
