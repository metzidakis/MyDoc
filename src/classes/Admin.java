package classes;


public class Admin {

	String aPassword;
	String aEmail;
	String aUsername;
	String aID;
	
	//constructor for registering
	public Admin (String aPassword, String aEmail, String aUsername, String aID ){
		this.aPassword = aPassword;
		this.aEmail = aEmail;
		this.aUsername = aUsername;	
		this.aID=aID;
	}
	
	
	//getters and setters	
	public String getaID() {
		return aID;
	}
	public String getaUsername() {
		return aUsername;
	}
	public void setaUsername(String aUsername) {
		this.aUsername = aUsername;
	}
	public String getaPassword() {
		return aPassword;
	}
	public void setaPassword(String aPassword) {
		this.aPassword = aPassword;
	}
	public String getaEmail() {
		return aEmail;
	}
	public void setaEmail(String aEmail) {
		this.aEmail = aEmail;
	}
	
	
	
}
