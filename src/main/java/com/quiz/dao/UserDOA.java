package com.quiz.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.quiz.model.User;
import com.quiz.util.DBConnection;

public class UserDOA {
	
	public static boolean registerUser(User u){
		String insert = "INSERT INTO users (username,password,role) VALUES(?,?,?)";
		try(Connection con = DBConnection.getConnection();
				PreparedStatement pst = con.prepareStatement(insert)){
			
			pst.setString(1, u.getUsername());
			pst.setString(2, u.getPassword());
			pst.setString(3, u.getRole());
			return pst.executeUpdate()>0;	
		} catch (SQLException e) {
			throw new DataAccessException("Failed to register a user",e);
		} 
	}
	
	public static String loginUser(String username, String password) {
		String role = null;
		String sql="SELECT role FROM users WHERE username=? AND password=?";
		try(Connection con = DBConnection.getConnection();
				PreparedStatement pst = con.prepareStatement(sql)){
			pst.setString(1, username);
			pst.setString(2, password);
			
			ResultSet rs= pst.executeQuery();
			
			if(rs.next()) {
				role=rs.getString("role");
			}
			
			return role;	
		}catch (SQLException e) {
			throw new DataAccessException("Failed to login as user",e);
		} 
	
	}
}
