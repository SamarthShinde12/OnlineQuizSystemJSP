package com.quiz.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	private static String url="jdbc:postgresql://localhost:5432/quiz-system";
	private static String username="postgres";
	private static String pass="root";
public static Connection getConnection(){
		Connection con=null;
	try {
		Class.forName("org.postgresql.Driver");
		con = DriverManager.getConnection(url, username, pass);
	} catch (ClassNotFoundException | SQLException e) {
		e.printStackTrace();
	}
	return con;
	}
	

}
