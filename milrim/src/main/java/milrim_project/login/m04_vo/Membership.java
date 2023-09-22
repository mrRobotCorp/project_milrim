package milrim_project.login.m04_vo;

public class Membership {
	private String id;
	private String cardNum;
	private String mmyy;
	private String bday;
	private String cardPass;
	public Membership() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Membership(String id, String cardNum, String mmyy, String bday, String cardPass) {
		super();
		this.id = id;
		this.cardNum = cardNum;
		this.mmyy = mmyy;
		this.bday = bday;
		this.cardPass = cardPass;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCardNum() {
		return cardNum;
	}
	public void setCardNum(String cardNum) {
		this.cardNum = cardNum;
	}
	public String getMmyy() {
		return mmyy;
	}
	public void setMmyy(String mmyy) {
		this.mmyy = mmyy;
	}
	public String getBday() {
		return bday;
	}
	public void setBday(String bday) {
		this.bday = bday;
	}
	public String getCardPass() {
		return cardPass;
	}
	public void setCardPass(String cardPass) {
		this.cardPass = cardPass;
	}
	
}
