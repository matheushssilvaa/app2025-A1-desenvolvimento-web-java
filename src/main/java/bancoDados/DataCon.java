package bancoDados;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DataCon {
	private static final String JDBC_URL = "jdbc:mysql://localhost:3306/sistema2";
	private static final String JDBC_USERNAME = "root";
	private static final String JDBC_PASSWORD = "";

	public static Connection getConnection() throws SQLException, ClassNotFoundException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		return DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
	}
}