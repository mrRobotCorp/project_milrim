package milrim_project.YJ.vo;

import java.util.Date;
import java.util.List;

public class FreeBoard {
    private String postId;
    private String title;
    private String content;
    private Date fbDate;
    private String id;
    private String name;
    public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	private List<Comment01> comments;
	public List<Comment01> getComments() {
		return comments;
	}
	public void setComments(List<Comment01> comments) {
		this.comments = comments;
	}
	public FreeBoard() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FreeBoard(String postId, String title, String content, Date fbDate, String id) {
		super();
		this.postId = postId;
		this.title = title;
		this.content = content;
		this.fbDate = fbDate;
		this.id = id;
	}
	public String getPostId() {
		return postId;
	}
	public void setPostId(String postId) {
		this.postId = postId;
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
	public Date getFbDate() {
		return fbDate;
	}
	public void setFbDate(Date fbDate) {
		this.fbDate = fbDate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
}
