package classes;

import java.sql.Date;

public class Member {
	
	//variables
	private String mUsername;
	private String mPassword;
	private String mEmail;
	private String mName;
	private String mSurname;
	private String mPhone;
	private String mGender;
	private String mRegion;
	private String mJoin;
	private String mYearOfBirth;
	private String mID;
    
	//constructor
	public Member(String mID, String mUsername, String mPassword, String mEmail, String mName, String mSurname, String mPhone, String mGender, String mRegion, String mJoin, String mYearOfBirth) {
		this.mID = mID;
		this.mUsername = mUsername;
		this.mPassword = mPassword;
		this.mEmail = mEmail;
		this.mName = mName;
		this.mSurname = mSurname;
		this.mPhone = mPhone;
		this.mGender = mGender;
		this.mRegion = mRegion;
		this.mJoin = mJoin;
		this.mYearOfBirth = mYearOfBirth;
	}
	
	//new constructor
		public Member(String mUsername, String mPassword, String mEmail, String mName,String mSurname, String mPhone, String mGender, String mRegion, String mYearOfBirth,String mJoin){
			this.mUsername = mUsername;
			this.mPassword = mPassword;
			this.mEmail = mEmail;
			this.mName = mName;
			this.mSurname = mSurname;
			this.mPhone = mPhone;
			this.mGender = mGender;
			this.mRegion = mRegion;
			this.mJoin = mJoin;
			this.mYearOfBirth = mYearOfBirth;
		}
	
	
	//setters and getters
	public String getmID() {
		return mID;
	}

	public String getmUsername() {
		return mUsername;
	}
	public void setmUsername(String mUsername) {
		this.mUsername = mUsername;
	}
	public String getmPassword() {
		return mPassword;
	}
	public void setmPassword(String mPassword) {
		this.mPassword = mPassword;
	}
	public String getmEmail() {
		return mEmail;
	}
	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getmSurname() {
		return mSurname;
	}
	public void setmSurname(String mSurname) {
		this.mSurname = mSurname;
	}
	public String getmPhone() {
		return mPhone;
	}
	public void setmPhone(String mPhone) {
		this.mPhone = mPhone;
	}
	public String getmGender() {
		return mGender;
	}
	public void setmGender(String mGender) {
		this.mGender = mGender;
	}
	public String getmRegion() {
		return mRegion;
	}
	public void setmRegion(String mRegion) {
		this.mRegion = mRegion;
	}
	public String getmJoin() {
		return mJoin;
	}
	public void setmJoin(String mJoin) {
		this.mJoin = mJoin;
	}
	public String getmYearOfBirth() {
		return mYearOfBirth;
	}
	public void setmYearOfBirth(String mYearOfBirth) {
		this.mYearOfBirth = mYearOfBirth;
	}

	
	

}
