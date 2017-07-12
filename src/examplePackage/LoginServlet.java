package examplePackage;

import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {

		RequestDispatcher rd = null;
		try {

			UserBean user = new UserBean();
			user.setUserName(request.getParameter("username")); // get the un from html															
			user.setPassword(request.getParameter("pass")); // get the pass from html
			user = UserDAO.login(user); // go to UserDAO's method - login

			if (user.isValid()) {
				HttpSession session = request.getSession();
				response.setCharacterEncoding("UTF-8");
				// set session attributes
				session.setAttribute("username", user.getUsername());
				session.setAttribute("name", user.getName());
				session.setAttribute("email", user.getEmail());
				session.setAttribute("password", user.getPassword());
				session.setAttribute("photo", user.getImage());
				
				// set max interval and user cookie to browser
				session.setMaxInactiveInterval(30*60);
				Cookie cookUser = new Cookie("username", user.getUsername());
				cookUser.setMaxAge(30*60);
				response.addCookie(cookUser);
				// request.setAttribute("username", user.getUsername());
				// RequestDispatcher rd = request.getRequestDispatcher("userLogged.jsp");
				// dispatcher.forward(request, response);
				response.sendRedirect("profile_.jsp"); // logged-in page
			}else
				response.sendRedirect("invalidLogin.jsp"); // error page
		} catch (Throwable theException) {
			System.out.println(theException);
		}
	}
}
