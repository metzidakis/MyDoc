package classes;

public class Reply {
	static int counter = 0;
	final int rID;
	int rText;
	int rMID;
	int rDID;
	int CID;
	String rDate;
	int rRating;
	
	
	public Reply( int rText, int rMID, int rDID, int cID, String rDate, int rRating ) {
		this.rID = counter;
		this.rText = rText;
		this.rMID = rMID;
		this.rDID = rDID;
		CID = cID;
		this.rDate = rDate;
		this.rRating = rRating;
	}
	
	public int getrID() {
		return rID;
	}
	public int getrText() {
		return rText;
	}
	public void setrText(int rText) {
		this.rText = rText;
	}
	public int getrMID() {
		return rMID;
	}
	public void setrMID(int rMID) {
		this.rMID = rMID;
	}
	public int getrDID() {
		return rDID;
	}
	public void setrDID(int rDID) {
		this.rDID = rDID;
	}
	public int getCID() {
		return CID;
	}
	public void setCID(int cID) {
		CID = cID;
	}
	public String getrDate() {
		return rDate;
	}
	public void setrDate(String rDate) {
		this.rDate = rDate;
	}
	public int getrRating() {
		return rRating;
	}
	public void setrRating(int rRating) {
		this.rRating = rRating;
	}

	

}
