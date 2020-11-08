package driver.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import driver.model.service.DriverService;
import travel.controller.TravelDeleteServlet;
import travel.model.service.TravelService;

/**
 * Servlet implementation class DriverKickOutServlet
 */
@WebServlet("/driver/kickout")
public class DriverKickOutServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DriverKickOutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("utf-8");
      String driver_Id = request.getParameter("driverId");
      
      int result = new TravelService().deleteBaseTravel(driver_Id);
      response.setContentType("text/html; charset=utf-8");
      PrintWriter out = response.getWriter();
      
      
      if(result>0) {
         request.setAttribute("Driver_Id", driver_Id);
         RequestDispatcher view = request.getRequestDispatcher("/driver/delete");
          view.forward(request, response);
         
      }else {
         out.println("<script>alert('탈퇴에 실패하였습니다.');");
         out.println("location.href='/admin/driverList';</script>");
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