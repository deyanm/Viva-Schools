package examplePackage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionManager {

	static Connection con;

	public static Connection getConnection() {

		try {
			String dburl = "jdbc:mysql://localhost:3306/vivaSchools";
			String dbuser = "root";
			String dbpass = "alpine123";
			// assuming "DataSource" is your DataSource name
			Class.forName("com.mysql.jdbc.Driver");
			try {
				con = DriverManager.getConnection(dburl, dbuser, dbpass);

				// assuming your SQL Server's username is "username"
				// and password is "password"
				System.out.println("Connection successful!");
			}

			catch (SQLException ex) {
				ex.printStackTrace();
			}
		}

		catch (ClassNotFoundException e) {
			System.out.println(e);
		}

		return con;
	}
}
