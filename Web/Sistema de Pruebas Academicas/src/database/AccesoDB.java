package database;

import java.sql.Connection;
import java.sql.DriverManager;

public class AccesoDB {
	public static Connection getConnection() throws Exception {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521/XE";
		String user = "sdpa";
		String pass = "lilyo";
		Class.forName(driver).newInstance();
		Connection cn=DriverManager.getConnection(url,user,pass);
		return cn;
		
	}
}
