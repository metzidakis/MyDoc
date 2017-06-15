package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;


import database.DB;
import classes.Comment;

public class CommentDAO {
	
	//constructor
	public CommentDAO() {
	}
	
	//method for saving comments to database
	public void saveComment( Comment comment ) throws Exception {

		DB db = new DB();
		Connection con = null;
		
		String sql = "INSERT INTO comment_table (comment_rating, comment_date, doctor_id, member_id, comment_text) VALUES (?, ?, ?, ?, ?);";
		
		try {

			db.open();
			con = db.getConnection();

			PreparedStatement stmt = con.prepareStatement(sql);

			stmt.setString(1, comment.getcRating());
			stmt.setString(2, comment.getcDate());
			stmt.setString(3, comment.getdID());
			stmt.setString(4, comment.getmID());
			stmt.setString(5, comment.getcText());

			stmt.executeUpdate();

			stmt.close();

		} catch (Exception e) {

			throw new Exception("An error occured while inserting student to database: " + e.getMessage());
			
		} finally {
			
			try {				
				db.close();				
			} catch (Exception e) {
											
			}
			
		}

	}// End of saveComment
	
} //End of class
