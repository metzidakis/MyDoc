package classes;

public class Comment {
	
    private String cID;
    private String cRating;
    private String cDate;
    private String dID;
    private String mID;
    private String cText;
	
	
	public Comment(String cID, String cRating, String cDate, String dID, String mID, String cText) {
		this.cID = cID;
		this.cRating = cRating;
		this.cDate = cDate;
		this.dID = dID;
		this.mID = mID;
		this.cText = cText;
	}
	
	public Comment( String cRating, String cDate, String dID, String mID, String cText) {
		this.cRating = cRating;
		this.cDate = cDate;
		this.dID = dID;
		this.mID = mID;
		this.cText = cText;
	}
	public String getcID() {
		return cID;
	}
	public String getcRating() {
		return cRating;
	}
	public void setcRating(String cRating) {
		this.cRating = cRating;
	}
	public String getcDate() {
		return cDate;
	}
	public void setcDate(String cDate) {
		this.cDate = cDate;
	}
	public String getdID() {
		return dID;
	}
	public void setdID(String dID) {
		this.dID = dID;
	}
	public String getmID() {
		return mID;
	}
	public void setmID(String mID) {
		this.mID = mID;
	}
	public String getcText() {
		return cText;
	}
	public void setcText(String cText) {
		this.cText = cText;
	}
	
	
	
	

}
