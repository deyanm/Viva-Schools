package examplePackage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import examplePackage.UserBean;
import examplePackage.UserDAO;

/**
 * Servlet implementation class ChoosingLanguage
 */
@WebServlet("/LanguageServlet")
public class LanguageServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {

		try {
			UserBean user = new UserBean();
			HttpSession session = request.getSession();
			
			String name = session.getAttribute("name").toString();
			
			String language = request.getParameter("language");
			String learningCenter = request.getParameter("center");
			
			user.setName(name);
			user.setLanguage(language);
			user.setLearningCenter(learningCenter);
			
			if(!(language.equals("") && learningCenter.equals(""))){
				session.setAttribute("center", learningCenter);
				session.setAttribute("language", language);
				UserDAO.insertCenterAndLanguage(user);
				response.sendRedirect("thankYou.jsp");
			}
		}catch (Throwable theException) {
			System.out.println(theException);
		}
	}
}
