package examplePackage;

import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import encrypt.BCrypt;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/RegistrationServlet")
@MultipartConfig(maxFileSize = 16177215)
public class RegistrationServlet extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {

		String passHash = null;
		try {

			UserBean user = new UserBean();
			user.setName(request.getParameter("name"));
			user.setUserName(request.getParameter("username"));

			InputStream inputStream = null; // input stream of the upload file
	         
	        // obtains the upload file part in this multipart request
			Part filePart = request.getPart("photo");
	        if (filePart != null) {
	            // prints out some information for debugging
	            System.out.println(filePart.getName());
	            System.out.println(filePart.getSize());
	            System.out.println(filePart.getContentType());
	            // obtains input stream of the upload file
	            inputStream = filePart.getInputStream();
	            user.setImage(inputStream);
	        }
			// check if the password is valid format
			if (UserDAO.isValidPass(request.getParameter("pass"))) {
				
				// hash the password (salt+password+salt = hash)
				passHash = BCrypt.hashpw(request.getParameter("pass"), BCrypt.gensalt());
				System.out.println(passHash);
				user.setPassword(passHash);
			} else {
				response.sendRedirect("invalidSignUp.jsp");
				System.out.println("The password format is not valid!");
			}
			
			// check if the email is valid format
			if (UserDAO.isValidEmail(request.getParameter("email"))) {
				user.setEmail(request.getParameter("email"));
			} else {
				response.sendRedirect("invalidSignUp.jsp");
				System.out.println("The email format is not valid!");
			}

			// check if the passwords are the same
			if (request.getParameter("pass").equals(request.getParameter("pass2"))) {
				UserDAO.registration(user);
				System.out.println("You have successfully registered!");
				response.sendRedirect("userSigned.jsp"); // singed-in page
			} else {
				request.setAttribute("error",
						"Servlet " + request.getAttribute(getServletName()) + "has thrown an exception!");
				request.getRequestDispatcher("/invalidSignUp.jsp").forward(request, response);
				// response.sendRedirect("invalidSignUp.jsp");//invalid sign-up
			}

		} catch (Throwable theException) {
			System.out.println(theException);
			System.out.println("Wrong singing up!");
		}

	}
}
