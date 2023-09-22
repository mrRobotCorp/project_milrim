package milrim_project.YJ.vo;

import java.util.Date;

public class Comment01 {
    private String commentId;
    private String postId;
    private String content;
    private Date cDate;
    private String id;
    private String name;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Comment01() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Comment01(String commentId, String postId, String content, Date cDate, String id) {
		super();
		this.commentId = commentId;
		this.postId = postId;
		this.content = content;
		this.cDate = cDate;
		this.id = id;
	}
	public String getCommentId() {
		return commentId;
	}
	public void setCommentId(String commentId) {
		this.commentId = commentId;
	}
	public String getPostId() {
		return postId;
	}
	public void setPostId(String postId) {
		this.postId = postId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getcDate() {
		return cDate;
	}
	public void setcDate(Date cDate) {
		this.cDate = cDate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
}
