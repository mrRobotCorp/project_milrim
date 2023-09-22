package milrim_project.login.m04_vo;


public class Member {
	private String id;
	private String pass;
	private String name;
	private String email;
	private String phonenumber;
	private String auth;
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Member(String id, String pass, String name, String email, String phonenumber) {
		super();
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.email = email;
		this.phonenumber = phonenumber;
	}
	public Member(String id, String pass) {
		super();
		this.id = id;
		this.pass = pass;
	}
	public Member(String id) {
		super();
		this.id = id;
	}
	public Member(String id, String pass, String name, String email, String phonenumber, String auth) {
		super();
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.email = email;
		this.phonenumber = phonenumber;
		this.auth = auth;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
	
	@Override
	public String toString() {
	    return "Member[id=" + id + ", name=" + name + ", auth=" + auth + "]";
	}



	
}
