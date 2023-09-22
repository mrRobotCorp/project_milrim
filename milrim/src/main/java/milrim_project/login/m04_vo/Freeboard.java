package milrim_project.login.m04_vo;


import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

// milrim_project.login.m04_vo.Freeboard
public class Freeboard {

	private String postid;
	private String title;
	private String content;
	private Date fbdate;
	private String id;
	
	public Freeboard() {
		super();
		// TODO Auto-generated constructor stub
	}
    public String getFbdate() {
        if (fbdate != null) {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            return dateFormat.format(fbdate);
        }
        return null;
    }
	public Freeboard(String postid, String title, String content, Date fbdate, String id) {
		super();
		this.postid = postid;
		this.title = title;
		this.content = content;
		this.fbdate = fbdate;
		this.id = id;
	}
	public String getPostid() {
		return postid;
	}
	public void setPostid(String postid) {
		this.postid = postid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setFbdate(Date fbdate) {
		this.fbdate = fbdate;
	}
	
	
}
