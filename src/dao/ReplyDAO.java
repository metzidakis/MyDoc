package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import database.DB;
import classes.Member;

public class ReplyDAO {
	
	//constructor
	public ReplyDAO() {
	}
	
	//method searches if member exists in database and if it provides the correct credentials
	public Member authenticateMember (String username, String password) throws Exception {

		Connection con = null;
		DB dB = new DB();
		
		PreparedStatement stmt = null; 
		
		String sqlquery = "SELECT * FROM member_table WHERE (username = ?) AND ( password = ?);";
		
		try { 
			dB.open();
			con = dB.getConnection();
			
		stmt = con.prepareStatement(sqlquery);

		stmt.setString(1, username ); 
		stmt.setString(2, password );
		
		ResultSet rs = stmt.executeQuery();
		
		Member member = null;
		
		if (rs.next()) {
			member = new Member (rs.getString("username"), rs.getString("password"), rs.getString("email"), rs.getString(""), rs.getString(""), rs.getString(""), rs.getString(""), rs.getString(""), rs.getString(""), rs.getString(""), rs.getString(""));
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
		
		
		String sql = "INSERT INTO  member_table (am, name, surname) VALUES (?, ?, ?);";
		
		try {

			db.open();
			con = db.getConnection();

			PreparedStatement stmt = con.prepareStatement(sql);

			stmt.setString(1, member.getAm());
			stmt.setString(2, member.getName());
			stmt.setString(3, member.getSurname());

			stmt.executeUpdate();

			stmt.close();

		} catch (SQLException e) {

			throw new Exception("Member with AM: " + member.getAm() + " already exists");

		} catch (Exception e) {

			throw new Exception("An error occured while inserting student to database: " + e.getMessage());
			
		} finally {
			
			try {				
				db.close();				
			} catch (Exception e) {
											
			}
			
		}

	}// End of saveMember
	
	//method for searching members by keyword
	public ArrayList<Member> findMemberByKeyword(String keyword) throws Exception {

		Connection con = null;
		ArrayList<Member> results = new ArrayList<Member>();		
		DB dB = new DB();
		
		PreparedStatement stmt = null; 
		
		String sqlquery = "SELECT * FROM student_table WHERE (name LIKE ?) OR ( surname LIKE ?);";
		
		try {
			
			
			dB.open();
			con = dB.getConnection();
			
			stmt = con.prepareStatement(sqlquery);
	
			stmt.setString(1, "%" + keyword + "%" ); 
			stmt.setString(2, "%" + keyword + "%" );
			
			ResultSet rs = stmt.executeQuery();
			
			while (rs.next()) {
				results.add(new Member(rs.getString("name"), rs.getString("surname"), rs.getString("am"), sqlquery, sqlquery, sqlquery, sqlquery, sqlquery, sqlquery, sqlquery, sqlquery));
			}
			
			stmt.close();
			dB.close();

			return results;

		} catch (Exception e) {

			throw new Exception("An error occured while searching for student in the database: " + e.getMessage());
			
		} finally {
			
			try {
				dB.close();
			} catch (Exception e) {
				
			}
		}

	}// End of findMemberByKeyword
	
} //End of class
