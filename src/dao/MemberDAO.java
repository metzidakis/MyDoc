package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import database.DB;
import classes.Member;

public class MemberDAO {
	
	//constructor
	public MemberDAO() {
	}
	
	//method searches if member exists in database 
	public Member authenticateMember (String username, String password) throws Exception {

		Connection con = null;
		DB dB = new DB();
		
		PreparedStatement stmt = null; 
		
		String sqlquery = "SELECT * FROM member_table WHERE (member_username = ?) AND ( mpassword = ?);";
		
		try { 
			dB.open();
			con = dB.getConnection();
			
		stmt = con.prepareStatement(sqlquery);

		stmt.setString(1, username ); 
		stmt.setString(2, password );
		
		ResultSet rs = stmt.executeQuery();
		
		Member member = null;
		
		if (rs.next()) {
			member = new Member (rs.getString("member_id"), rs.getString("member_username"), rs.getString("mpassword"), rs.getString("member_email"), rs.getString("member_name"), rs.getString("member_surname"), rs.getString("member_phone"), rs.getString("member_gender"), rs.getString("member_region"), rs.getString("member_join"), rs.getString("member_yearofbirth"));
		}
		
		stmt.close();
		dB.close();
		
		return member;
		
		} catch (Exception e) {
			
			throw new Exception("An error occured while searching the member: " + e.getMessage());
			
		} finally {
			
			try {
				dB.close();
			} catch (Exception e) {
				
			} 
		}	
		
	} //End of authenticateMember
	
	
	//method for saving members to database
	public void saveMember(Member member) throws Exception {

		DB db = new DB();
		Connection con = null;
		
		
		String sql = "INSERT INTO member_table ( member_username, mpassword, member_email, member_name, member_surname, member_phone, member_gender, member_region, member_yearofbirth, member_join) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
		
		try {

			db.open();
			con = db.getConnection();

			PreparedStatement stmt = con.prepareStatement(sql);

			stmt.setString(1, member.getmUsername());
			stmt.setString(2, member.getmPassword());
			stmt.setString(3, member.getmEmail());
			stmt.setString(4, member.getmName());
			stmt.setString(5, member.getmSurname());
			stmt.setString(6, member.getmPhone());
			stmt.setString(7, member.getmGender());
			stmt.setString(8, member.getmRegion());
			stmt.setString(9, member.getmYearOfBirth());
			stmt.setString(10, member.getmJoin());
			
			stmt.executeUpdate();

			stmt.close();
			con.close();

		} catch (SQLException e) {

			throw new Exception("Member with User name: " + member.getmUsername() + " already exists");

		} catch (Exception e) {

			throw new Exception("An error occured while inserting student to database: " + e.getMessage());
			
		} finally {
			
			try {				
				db.close();				
			} catch (Exception e) {
											
			}	
		}
	}// End of saveMember
} //End of class
