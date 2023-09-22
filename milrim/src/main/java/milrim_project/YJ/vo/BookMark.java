package milrim_project.YJ.vo;

public class BookMark {
	private String id;
	private String videoId;
	private String image;
	private String title;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public BookMark() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BookMark(String id, String videoId) {
		super();
		this.id = id;
		this.videoId = videoId;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getVideoId() {
		return videoId;
	}
	public void setVideoId(String videoId) {
		this.videoId = videoId;
	}
	
}
