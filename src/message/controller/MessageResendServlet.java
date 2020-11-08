package message.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import customer.model.vo.Customer;
import driver.model.vo.Driver;
import message.model.service.MessageService;
import message.model.vo.Message;

/**
 * Servlet implementation class MessageResendServlet
 */
@WebServlet("/message/resend")
public class MessageResendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessageResendServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Message message = new Message();
		message.setMessage_Subject(request.getParameter("title"));
		message.setMessage_Contents(request.getParameter("contents"));
		/* message.setSender(request.getParameter("sender")); */
		message.setReceiver(request.getParameter("userId"));
		System.out.println(message);
		
		HttpSession session = request.getSession(); // session에서 userId 가져와야
		if (session != null && (session.getAttribute("customer") != null)) {
			String userId = ((Customer)session.getAttribute("customer")).getCustomer_Id();
			int result = new MessageService().insertMessage(message, userId);
			System.out.println(result);
			if (result > 0) {
				response.sendRedirect("/message/sendSuccess.jsp");
			} else {
				request.getRequestDispatcher("/message/sendError.jsp");
			}
		}
		if (session != null && (session.getAttribute("driver") != null)) {
			String userId = ((Driver)session.getAttribute("driver")).getDriverId();
			int result = new MessageService().insertMessage(message, userId);
			System.out.println(result);
			if (result > 0) {
				response.sendRedirect("/message/sendSuccess.jsp");
			} else {
				request.getRequestDispatcher("/message/sendError.jsp");
			}
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
