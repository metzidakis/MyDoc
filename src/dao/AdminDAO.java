package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import database.DB;
import classes.Admin;

public class AdminDAO {
	
	//constructor
	public AdminDAO() {
	}
	
	
	public Admin authenticateAdmin (String username, String password) throws Exception {

		Connection con = null;
		DB dB = new DB();
		
		PreparedStatement stmt = null; 
		
		String sqlquery = "SELECT * FROM admin_table WHERE (username = ?) AND ( password = ?);";
		
		try { 
			dB.open();
			con = dB.getConnection();
			
		stmt = con.prepareStatement(sqlquery);

		stmt.setString(1, username ); 
		stmt.setString(2, password );
		
		ResultSet rs = stmt.executeQuery();
		
		Admin admin = null;
		
		if (rs.next()) {
			admin = new Admin (rs.getString("username"), rs.getString("password"), rs.getString("email"), rs.getString("aID"));
		}
		
		stmt.close();
		dB.close();
		
		return admin;
		
		} catch (Exception e) {
			
			throw new Exception("An error occured while searching the member: " + e.getMessage());
			
		} finally {
			
			try {
				dB.close();
			} catch (Exception e) {
				
			} 
		}	
		
	} //End of authenticateUser
	
} //End of class
