package examplePackage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.Out;

import encrypt.BCrypt;

/**
 * Servlet implementation class ChangePasswordServlet
 */
@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {
	
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		try{
			HttpSession session = request.getSession();
			
			String oldPass = request.getParameter("oldPass");
			String pass = request.getParameter("pass");
			String pass2 = request.getParameter("pass2");
			String passHash = null;
			
			String username = session.getAttribute("username").toString();
			String password = session.getAttribute("password").toString();
			UserBean user = new UserBean();
			user.setUserName(username);
			user.setPassword(oldPass);
			System.out.println(password);
			
			if(UserDAO.selectPass(user)){
				if(UserDAO.isValidPass(pass) && pass.equals(pass2)){
					passHash = BCrypt.hashpw(pass, BCrypt.gensalt());
					System.out.println(passHash);
					user.setPassword(passHash);
					UserDAO.changePassword(user);
				}
			}
			
			
			
		}catch(IllegalArgumentException ex) {
			ex.getMessage();
			System.out.println("Something went wrong, check you input!");
		}
	}

}
