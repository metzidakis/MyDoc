package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import database.DB;
import classes.Doctor;

public class DoctorDAO {
	
	//constructor
	public DoctorDAO() {
	}
	
	
	public Doctor authenticateDoctor (String username, String password) throws Exception {

		Connection con = null;
		DB dB = new DB();
		
		PreparedStatement stmt = null; 
		
		String sqlquery = "SELECT * FROM doctor_table WHERE (doctor_username = ?) AND ( doctor_password = ?);";
		
		try { 
			dB.open();
			con = dB.getConnection();
			
		stmt = con.prepareStatement(sqlquery);

		stmt.setString(1, username ); 
		stmt.setString(2, password );
		
		ResultSet rs = stmt.executeQuery();
		
		Doctor doc = null;
		
		if (rs.next()) {
			doc = new Doctor( rs.getString("doctor_id"), rs.getString("doctor_username"), rs.getString("doctor_password"), rs.getString("doctor_email"), rs.getString("doctor_name"), rs.getString("doctor_surname"), rs.getString("doctor_address"), rs.getString("doctor_specialty"), rs.getString("doctor_region"), rs.getString("doctor_gender"), rs.getString("doctor_approved"), rs.getString("doctor_yearofbirth"), rs.getString("doctor_join"));
		}
		
		stmt.close();
		dB.close();
		
		return doc;
		
		} catch (Exception e) {
			
			throw new Exception("An error occured while searching the member: " + e.getMessage());
			
		} finally {
			
			try {
				dB.close();
			} catch (Exception e) {
				
			} 
		}	
		
	} //End of authenticateDoctor
	
	
	 
			// method for saving doctors to database
		public void saveDoctor(Doctor doctor) throws Exception {

			DB db = new DB();
			Connection con = null;
			
			
			String sql = "INSERT INTO doctor_table (doctor_username, doctor_password, doctor_email, doctor_name, doctor_surname, doctor_address, doctor_specialty, doctor_region, doctor_gender, doctor_yearofbirth, doctor_join) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?,?,?);";
			
			try {

				db.open();
				con = db.getConnection();

				PreparedStatement stmt = con.prepareStatement(sql);

				stmt.setString(1, doctor.getdUsername());
				stmt.setString(2, doctor.getdPassword());
				stmt.setString(3, doctor.getdEmail());
				stmt.setString(4, doctor.getdName());
				stmt.setString(5, doctor.getdSurname());
				stmt.setString(6, doctor.getdAddress());
				stmt.setString(7, doctor.getdSpecialty());
				stmt.setString(8, doctor.getdRegion());
				stmt.setString(9, doctor.getdGender());
				stmt.setString(10, doctor.getdYearOfBirth());
				stmt.setString(11, doctor.getdJoin());
				stmt.executeUpdate();

				stmt.close();
				con.close();

			} catch (SQLException e) {
				
				db.close();
				throw new Exception("Member already exists");

			} catch (Exception e) {
				
				db.close();
				throw new Exception("An error occured while inserting doctor to database: " + e.getMessage());
				
			} finally {
				
				try {				
					db.close();				
				} catch (Exception e) {
												
				}
				
			}

		}// End of saveDoctor
		
	
		
		//method for searching members by keyword
		public ArrayList<Doctor> findDoctorByKeywordAndLocationAndSpecialty(String keyword1, String keyword2, String keyword3) throws Exception {

			if ( !keyword1.equals("") && !keyword2.equals("Any") && !keyword3.equals("Any") ) {
			
				Connection con = null;
				ArrayList<Doctor> results = new ArrayList<Doctor>();		
				DB dB = new DB();
				
				PreparedStatement stmt = null; 
				
				String sqlquery = "SELECT * FROM doctor_table WHERE doctor_name LIKE ? AND doctor_specialty = ? AND doctor_region = ?;";
				
				try {
						
					dB.open();
					con = dB.getConnection();
					
					stmt = con.prepareStatement(sqlquery);
			
					stmt.setString(1, "%" + keyword1 + "%" ); 
					stmt.setString(2, keyword2 );
					stmt.setString(3, keyword3);
					
					ResultSet rs = stmt.executeQuery();
					
					while (rs.next()) {
						results.add(new Doctor( rs.getString("doctor_id"), rs.getString("doctor_username"), rs.getString("doctor_password"), rs.getString("doctor_email"), rs.getString("doctor_name"), rs.getString("doctor_surname"), rs.getString("doctor_address"), rs.getString("doctor_specialty"), rs.getString("doctor_region"), rs.getString("doctor_gender"), rs.getString("doctor_approved"), rs.getString("doctor_join"), rs.getString("doctor_yearofbirth")));
					}
					
					stmt.close();
					dB.close();
	
					return results;
	
				} catch (Exception e) {
	
					throw new Exception("An error occured while searching for doctor in the database: " + e.getMessage());
					
				} finally {
					
					try {
						dB.close();
					} catch (Exception e) {
						
					}
				}
			} else if ( !keyword1.equals("") && !keyword2.equals("Any") && keyword3.equals("Any") ) {
				
				Connection con = null;
				ArrayList<Doctor> results = new ArrayList<Doctor>();		
				DB dB = new DB();
				
				PreparedStatement stmt = null; 
				
				String sqlquery = "SELECT * FROM doctor_table WHERE doctor_name LIKE ? AND doctor_specialty = ?;";
				
				try {
						
					dB.open();
					con = dB.getConnection();
					
					stmt = con.prepareStatement(sqlquery);
			
					stmt.setString(1, "%" + keyword1 + "%" ); 
					stmt.setString(2, keyword2 );
					
					ResultSet rs = stmt.executeQuery();
					
					while (rs.next()) {
						results.add(new Doctor( rs.getString("doctor_id"), rs.getString("doctor_username"), rs.getString("doctor_password"), rs.getString("doctor_email"), rs.getString("doctor_name"), rs.getString("doctor_surname"), rs.getString("doctor_address"), rs.getString("doctor_specialty"), rs.getString("doctor_region"), rs.getString("doctor_gender"), rs.getString("doctor_approved"), rs.getString("doctor_join"), rs.getString("doctor_yearofbirth")));
					}
					
					stmt.close();
					dB.close();
	
					return results;
	
				} catch (Exception e) {
	
					throw new Exception("An error occured while searching for doctor in the database: " + e.getMessage());
					
				} finally {
					
					try {
						dB.close();
					} catch (Exception e) {
						
					}
				}
			} else if ( !keyword1.equals("") && keyword2.equals("Any") && !keyword3.equals("Any") ) {
				
				Connection con = null;
				ArrayList<Doctor> results = new ArrayList<Doctor>();		
				DB dB = new DB();
				
				PreparedStatement stmt = null; 
				
				String sqlquery = "SELECT * FROM doctor_table WHERE doctor_name LIKE ? AND doctor_region = ?;";
				
				try {
						
					dB.open();
					con = dB.getConnection();
					
					stmt = con.prepareStatement(sqlquery);
			
					stmt.setString(1, "%" + keyword1 + "%" ); 
					stmt.setString(2, keyword3 );
					
					ResultSet rs = stmt.executeQuery();
					
					while (rs.next()) {
						results.add(new Doctor( rs.getString("doctor_id"), rs.getString("doctor_username"), rs.getString("doctor_password"), rs.getString("doctor_email"), rs.getString("doctor_name"), rs.getString("doctor_surname"), rs.getString("doctor_address"), rs.getString("doctor_specialty"), rs.getString("doctor_region"), rs.getString("doctor_gender"), rs.getString("doctor_approved"), rs.getString("doctor_join"), rs.getString("doctor_yearofbirth")));
					}
					
					stmt.close();
					dB.close();
	
					return results;
	
				} catch (Exception e) {
	
					throw new Exception("An error occured while searching for doctor in the database: " + e.getMessage());
					
				} finally {
					
					try {
						dB.close();
					} catch (Exception e) {
						
					}
				}
			} else if ( !keyword1.equals("") && keyword2.equals("Any") && keyword3.equals("Any") ) {
				
				Connection con = null;
				ArrayList<Doctor> results = new ArrayList<Doctor>();		
				DB dB = new DB();
				
				PreparedStatement stmt = null; 
				
				String sqlquery = "SELECT * FROM doctor_table WHERE doctor_name LIKE ?;";
				
				try {
						
					dB.open();
					con = dB.getConnection();
					
					stmt = con.prepareStatement(sqlquery);
			
					stmt.setString(1, "%" + keyword1 + "%" ); 
					
					ResultSet rs = stmt.executeQuery();
					
					while (rs.next()) {
						results.add(new Doctor( rs.getString("doctor_id"), rs.getString("doctor_username"), rs.getString("doctor_password"), rs.getString("doctor_email"), rs.getString("doctor_name"), rs.getString("doctor_surname"), rs.getString("doctor_address"), rs.getString("doctor_specialty"), rs.getString("doctor_region"), rs.getString("doctor_gender"), rs.getString("doctor_approved"), rs.getString("doctor_join"), rs.getString("doctor_yearofbirth")));
					}
					
					stmt.close();
					dB.close();
	
					return results;
	
				} catch (Exception e) {
	
					throw new Exception("An error occured while searching for doctor in the database: " + e.getMessage());
					
				} finally {
					
					try {
						dB.close();
					} catch (Exception e) {
						
					}
				}
			} else if ( keyword1.equals("") && !keyword2.equals("Any") && !keyword3.equals("Any") ) {
				
				Connection con = null;
				ArrayList<Doctor> results = new ArrayList<Doctor>();		
				DB dB = new DB();
				
				PreparedStatement stmt = null; 
				
				String sqlquery = "SELECT * FROM doctor_table WHERE doctor_specialty = ? AND doctor_region = ?;";
				
				try {
						
					dB.open();
					con = dB.getConnection();
					
					stmt = con.prepareStatement(sqlquery);
			
					stmt.setString(1, keyword2 );
					stmt.setString(2, keyword3);
					
					ResultSet rs = stmt.executeQuery();
					
					while (rs.next()) {
						results.add(new Doctor( rs.getString("doctor_id"), rs.getString("doctor_username"), rs.getString("doctor_password"), rs.getString("doctor_email"), rs.getString("doctor_name"), rs.getString("doctor_surname"), rs.getString("doctor_address"), rs.getString("doctor_specialty"), rs.getString("doctor_region"), rs.getString("doctor_gender"), rs.getString("doctor_approved"), rs.getString("doctor_join"), rs.getString("doctor_yearofbirth")));
					}
					
					stmt.close();
					dB.close();
	
					return results;
	
				} catch (Exception e) {
	
					throw new Exception("An error occured while searching for doctor in the database: " + e.getMessage());
					
				} finally {
					
					try {
						dB.close();
					} catch (Exception e) {
						
					}
				}
			} else if ( keyword1.equals("") && !keyword2.equals("Any") && keyword3.equals("Any") ) {
				
				Connection con = null;
				ArrayList<Doctor> results = new ArrayList<Doctor>();		
				DB dB = new DB();
				
				PreparedStatement stmt = null; 
				
				String sqlquery = "SELECT * FROM doctor_table WHERE doctor_specialty = ?;";
				
				try {
						
					dB.open();
					con = dB.getConnection();
					
					stmt = con.prepareStatement(sqlquery);
			
					stmt.setString(1, keyword2 );
					
					ResultSet rs = stmt.executeQuery();
					
					while (rs.next()) {
						results.add(new Doctor( rs.getString("doctor_id"), rs.getString("doctor_username"), rs.getString("doctor_password"), rs.getString("doctor_email"), rs.getString("doctor_name"), rs.getString("doctor_surname"), rs.getString("doctor_address"), rs.getString("doctor_specialty"), rs.getString("doctor_region"), rs.getString("doctor_gender"), rs.getString("doctor_approved"), rs.getString("doctor_join"), rs.getString("doctor_yearofbirth")));
					}
					
					stmt.close();
					dB.close();
	
					return results;
	
				} catch (Exception e) {
	
					throw new Exception("An error occured while searching for doctor in the database: " + e.getMessage());
					
				} finally {
					
					try {
						dB.close();
					} catch (Exception e) {
						
					}
				}
			} else if ( keyword1.equals("") && keyword2.equals("Any") && !keyword3.equals("Any") ) {
				
				Connection con = null;
				ArrayList<Doctor> results = new ArrayList<Doctor>();		
				DB dB = new DB();
				
				PreparedStatement stmt = null; 
				
				String sqlquery = "SELECT * FROM doctor_table WHERE doctor_region = ?;";
				
				try {
						
					dB.open();
					con = dB.getConnection();
					
					stmt = con.prepareStatement(sqlquery);
			
					stmt.setString(1, keyword3 );
					
					ResultSet rs = stmt.executeQuery();
					
					while (rs.next()) {
						results.add(new Doctor( rs.getString("doctor_id"), rs.getString("doctor_username"), rs.getString("doctor_password"), rs.getString("doctor_email"), rs.getString("doctor_name"), rs.getString("doctor_surname"), rs.getString("doctor_address"), rs.getString("doctor_specialty"), rs.getString("doctor_region"), rs.getString("doctor_gender"), rs.getString("doctor_approved"), rs.getString("doctor_join"), rs.getString("doctor_yearofbirth")));
					}
					
					stmt.close();
					dB.close();
	
					return results;
	
				} catch (Exception e) {
	
					throw new Exception("An error occured while searching for doctor in the database: " + e.getMessage());
					
				} finally {
					
					try {
						dB.close();
					} catch (Exception e) {
						
					}
				}
			}else {
				
				Connection con = null;
				ArrayList<Doctor> results = new ArrayList<Doctor>();		
				DB dB = new DB();
				
				PreparedStatement stmt = null; 
				
				String sqlquery = "SELECT * FROM doctor_table;";
				
				try {
						
					dB.open();
					con = dB.getConnection();
					
					stmt = con.prepareStatement(sqlquery);
					
					ResultSet rs = stmt.executeQuery();
					
					while (rs.next()) {
						results.add(new Doctor( rs.getString("doctor_id"), rs.getString("doctor_username"), rs.getString("doctor_password"), rs.getString("doctor_email"), rs.getString("doctor_name"), rs.getString("doctor_surname"), rs.getString("doctor_address"), rs.getString("doctor_specialty"), rs.getString("doctor_region"), rs.getString("doctor_gender"), rs.getString("doctor_approved"), rs.getString("doctor_join"), rs.getString("doctor_yearofbirth")));
					}
					
					stmt.close();
					dB.close();
	
					return results;
	
				} catch (Exception e) {
	
					throw new Exception("An error occured while searching for doctor in the database: " + e.getMessage());
					
				} finally {
					
					try {
						dB.close();
					} catch (Exception e) {
						
					}
				}
			}
		}
} //End of class
