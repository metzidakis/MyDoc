package classes;

import java.sql.Date;

public class Doctor {
	
	private String dID;
	private String dUsername;
	private String dPassword;
	private String dEmail;
	private String dName;
	private String dSurname;
	private String dAddress;
	private String dSpecialty;
	private String dRegion;
	private String dGender;
	private String dApproved;
	private String dJoin;
	private String dYearOfBirth;
	
	
	public Doctor(String dID, String dUsername, String dPassword, String dEmail, String dName, String dSurname,
			String dAddress, String dSpecialty, String dRegion, String dGender, String dApproved,
			String dJoin, String dYearOfBirth) {
		super();
		this.dID = dID;
		this.dUsername = dUsername;
		this.dPassword = dPassword;
		this.dEmail = dEmail;
		this.dName = dName;
		this.dSurname = dSurname;
		this.dAddress = dAddress;
		this.dSpecialty = dSpecialty;
		this.dRegion = dRegion;
		this.dGender = dGender;
		this.dApproved = dApproved;
		this.dJoin = dJoin;
		this.dYearOfBirth = dYearOfBirth;
	}
	
	//New constractor
	public Doctor(String dUsername, String dPassword,String dEmail, String dName, String dSurname,String dAddress, String dSpecialty, String dRegion, String dGender, String dYearOfBirth,String dJoin){
	this.dUsername = dUsername;
	this.dPassword = dPassword;
	this.dEmail = dEmail;
	this.dName = dName;
	this.dSurname = dSurname;
	this.dAddress = dAddress;
	this.dSpecialty = dSpecialty;
	this.dRegion = dRegion;
	this.dGender = dGender;
	this.dYearOfBirth = dYearOfBirth;
	this.dJoin = dJoin;
}
	
	//getters and setters
	public String getdID() {
		return dID;
	}
	public String getdUsername() {
		return dUsername;
	}
	public void setdUsername(String dUsername) {
		this.dUsername = dUsername;
	}
	public String getdPassword() {
		return dPassword;
	}
	public void setdPassword(String dPassword) {
		this.dPassword = dPassword;
	}
	public String getdEmail() {
		return dEmail;
	}
	public void setdEmail(String dEmail) {
		this.dEmail = dEmail;
	}
	public String getdName() {
		return dName;
	}
	public void setdName(String dName) {
		this.dName = dName;
	}
	public String getdSurname() {
		return dSurname;
	}
	public void setdSurname(String dSurname) {
		this.dSurname = dSurname;
	}
	public String getdAddress() {
		return dAddress;
	}
	public void setdAddress(String dAddress) {
		this.dAddress = dAddress;
	}
	public String getdSpecialty() {
		return dSpecialty;
	}
	public void setdSpecialty(String dSpecialty) {
		this.dSpecialty = dSpecialty;
	}
	public String getdRegion() {
		return dRegion;
	}
	public void setdRegion(String dRegion) {
		this.dRegion = dRegion;
	}
	public String getdGender() {
		return dGender;
	}
	public void setdGender(String dGender) {
		this.dGender = dGender;
	}
	public String getdApproved() {
		return dApproved;
	}
	public void setdApproved(String dApproved) {
		this.dApproved = dApproved;
	}
	public String getdJoin() {
		return dJoin;
	}
	public void setdJoin(String dJoin) {
		this.dJoin = dJoin;
	}
	public String getdYearOfBirth() {
		return dYearOfBirth;
	}
	public void setdYearOfBirth(String dYearOfBirth) {
		this.dYearOfBirth = dYearOfBirth;
	}
	
	

}
