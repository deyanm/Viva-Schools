package examplePackage;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import encrypt.BCrypt;

public class UserDAO {
	
	public static void registration(UserBean user) {

		Connection conn = null;
		PreparedStatement pstm = null;
		PreparedStatement pstm2 = null;

		String sql = "INSERT INTO UserAccount (Name, Email, UserName, Password, RegDate, isAdmin, Image) values(?,?,?,?,curdate(),false, ?)";
		String sql2 = "INSERT INTO Students (Name) VALUES(?)";
		
		try {

			conn = ConnectionManager.getConnection();
			conn.setAutoCommit(false);
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, user.getName());
			pstm.setString(2, user.getEmail());
			pstm.setString(3, user.getUsername());
			pstm.setString(4, user.getPassword());
            // fetches input stream of the upload file for the blob column
            pstm.setBinaryStream(5, user.getImage());
			pstm.addBatch();
			
			int[] result = pstm.executeBatch();
			System.out.println("The number of rows inserted: "+ result.length);
			
			pstm2 = conn.prepareStatement(sql2);
			pstm2.setString(1, user.getName());
			pstm2.addBatch();
			pstm2.executeBatch();
			
			int[] result2 = pstm2.executeBatch();
			System.out.println("The number of rows inserted2: "+ result2.length);
			conn.commit();
			System.out.println("You have successfully registered!");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void insertLanguage(UserBean user) {

		Connection conn = null;
		PreparedStatement pstm = null;
		try {

			conn = ConnectionManager.getConnection();

			String sql = "UPDATE Students SET Language = ? WHERE Name = ?";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, user.getLanguage());
			pstm.setString(2, user.getName());

			pstm.executeUpdate();
			System.out.println("You successfully set language.");

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public static void insertCenterAndLanguage(UserBean user) {

		Connection conn = null;
		PreparedStatement pstm = null;
		PreparedStatement pstm2 = null;
		try {

			conn = ConnectionManager.getConnection();
			
			conn.setAutoCommit(false);
			
			String sql = "UPDATE Students SET LearningCenter = ? WHERE Name = ?";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, user.getLearningCenter());
			pstm.setString(2, user.getName());
			pstm.executeUpdate();
			
			String sql2 = "UPDATE Students SET Language = ? WHERE Name = ?";
			pstm2 = conn.prepareStatement(sql2);
			pstm2.setString(1, user.getLanguage());
			pstm2.setString(2, user.getName());
			pstm2.executeUpdate();
			
			conn.commit();
			System.out.println("You successfully set language and learning center.");
			
		} catch (SQLException e) {
			e.printStackTrace();
			if (conn != null) {
	            try {
	                System.err.print("Transaction is being rolled back");
	                conn.rollback();
	            } catch(SQLException ex) {
	            	ex.printStackTrace();
	            }
			}
		}

	}
	public static boolean isAdmin(UserBean user){
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		boolean isAdmin = false;
		
		String username = user.getUsername();
		String password = user.getPassword();
		
		try {
			conn = ConnectionManager.getConnection();
			String sql = "SELECT isAdmin FROM UserAccount WHERE UserName=? AND "
					+ "Password =? ";
			
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, username);
			pstm.setString(2, password);
			rs = pstm.executeQuery();
			
			if(rs.equals(true)){
				isAdmin = true;
			}
			
		}catch (Exception ex) {
			System.out.println(ex);
		}
		
		return isAdmin;
	}
	

	public static void changePassword(UserBean user){
		Connection conn = null;
		PreparedStatement pstm = null;
		
		try{
			conn = ConnectionManager.getConnection();
			
			String sql = "UPDATE UserAccount SET Password = ? WHERE UserName = ?";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, user.getPassword());
			pstm.setString(2, user.getUsername());
			pstm.executeUpdate();
			System.out.println("You have successfully changed your password!");
		}catch (SQLException e){
			e.printStackTrace();
		}
	}	
	
	public static boolean selectPass(UserBean user){
		Connection conn = null;
		ResultSet rs = null;

		// preparing some objects for connection
		PreparedStatement stmt = null;

		String username = user.getUsername();
		String password = user.getPassword();
		String hashPass = null;
		boolean matched = false;

		String sql = "SELECT * FROM UserAccount WHERE UserName = ?";
		try {
			// connect to DB
			conn = ConnectionManager.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, username);
			rs = stmt.executeQuery();
			// boolean more = rs.next(); // the .next() returns bool

			if (rs.next()) {
				hashPass = rs.getString("Password");
			}
			matched = BCrypt.checkpw(password, hashPass);
			System.out.println(matched);
			// if user does not exist set the isValid variable to false
		}catch(IllegalArgumentException e){
			e.printStackTrace();
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		return matched;
	}
	
	public static UserBean login(UserBean bean) {

		Connection conn = null;
		ResultSet rs = null;

		// preparing some objects for connection
		PreparedStatement stmt = null;
		String username = bean.getUsername();
		String password = bean.getPassword();
		String filePath = "/Users/deyanmarinov/Documents/workspace/VivaSch/WebContent/img/user.jpg";
		String hashPass = null;
		final int BUFFER_SIZE = 4096;
		boolean matched;
		
		String getHash = "SELECT * FROM UserAccount WHERE UserName= ?";
		System.out.println("Your username is " + username);
		System.out.println("Your password is " + password);
		System.out.println("Query: " + getHash);
		
		try {
			// connect to DB
			conn = ConnectionManager.getConnection();
			
			// Used to trace the process
			stmt = conn.prepareStatement(getHash);
			stmt.setString(1, username);
			rs = stmt.executeQuery();
			// boolean more = rs.next(); // the .next() returns bool

			if (rs.next()) {
				hashPass = rs.getString("Password");
			}
			matched = BCrypt.checkpw(password, hashPass);
			System.out.println(matched);
			// if user does not exist set the isValid variable to false
			if (!matched) {
				System.out.println("Sorry, you are not a registered user! Please sign up first");
				bean.setValid(false);
			}

			// if user exists set the isValid variable to true
			else if (matched) {
				String name = rs.getString("Name");
				Blob blob = rs.getBlob("Image");
                InputStream inputStream = blob.getBinaryStream();
                OutputStream outputStream = new FileOutputStream(filePath);
                int bytesRead = -1;
                byte[] buffer = new byte[BUFFER_SIZE];
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
				System.out.println("Welcome " + name);
				bean.setName(name);
				bean.setImage(inputStream);
				bean.setValid(true);
			}
		} catch (IllegalArgumentException eh) {
			System.out.println("The passwords hashes is not the same!");
		} catch (Exception ex) {
			System.out.println("Log In failed: An Exception has occurred! " + ex);
		}

		// some exception handling
		finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (Exception e) {
				}
				rs = null;
			}

			if (stmt != null) {
				try {
					stmt.close();
				} catch (Exception e) {
				}
				stmt = null;
			}

			if (conn != null) {
				try {
					conn.close();
				} catch (Exception e) {
				}

				conn = null;
			}
		}
		return bean;
	}

	public static boolean isValidEmail(String email) {

		String regex = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";

		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(email);
		return matcher.matches();
	}
	
	public static boolean isValidPass(String password){
		String regex = "^[A-Z][a-zA-Z0-9]+[a-zA-Z0-9]+{10,}";
		
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(password);
		return matcher.matches();
	}
}