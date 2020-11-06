package message.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import customer.model.service.CustomerService;
import driver.model.service.DriverService;

/**
 * Servlet implementation class MessageCustomerCheckServlet
 */
@WebServlet("/message/idCheck")
public class MessageIdCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessageIdCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String field = request.getParameter("field");
		System.out.println(id); System.out.println(field);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if (field.equals("driver") ) {
			
			boolean result = new DriverService().idCheck(id);
			System.out.println(result);
			if (result) {
				out.println("1");
			} else {
				out.println("0");
			}
			out.close();
		} else if (field.equals("customer")) {
			boolean result = new CustomerService().idCheck(id);
			System.out.println(result);
			if (result) {
				out.println("1");
			} else {
				out.println("0");
			}
			out.close();
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
