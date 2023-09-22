package milrim_project.YJ.vo;
// milrim_project.YJ.vo.VideoPost
import java.util.Date;

public class VideoPost {
    private String videoId; // 'v'||sqVideoId 고정값
    private String title;   // 애니메이션 제목, 애니매이션 @화 계층구조
    private String synopsis; // 애니매이션의 줄거리, 회차별 줄거리
    private String image;  // 이미지명
    private String video;  // 비디오명
    private Date uploadDate;  // 업로드 날짜
    private String parentNumber;  // 상위번호
    private String tagName;  // 태그이름
    private String dayOfWeek; // 업로드 요일
    
	public VideoPost() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getDayOfWeek() {
		return dayOfWeek;
	}
	public void setDayOfWeek(String dayOfWeek) {
		this.dayOfWeek = dayOfWeek;
	}
	public String getTagName() {
		return tagName;
	}
	public void setTagName(String tagName) {
		this.tagName = tagName;
	}
	public VideoPost(String title, String tagName) {
		super();
		this.title = title;
		this.tagName = tagName;
	}
	public VideoPost(String videoId, String title, String synopsis, String image, String video, Date uploadDate,
			String parentNumber, String tagName) {
		super();
		this.videoId = videoId;
		this.title = title;
		this.synopsis = synopsis;
		this.image = image;
		this.video = video;
		this.uploadDate = uploadDate;
		this.parentNumber = parentNumber;
		this.tagName = tagName;
	}
	public VideoPost(String videoId, String title, String synopsis, String image, String video, Date uploadDate,
			String parentNumber) {
		super();
		this.videoId = videoId;
		this.title = title;
		this.synopsis = synopsis;
		this.image = image;
		this.video = video;
		this.uploadDate = uploadDate;
		this.parentNumber = parentNumber;
	}
	public String getVideoId() {
		return videoId;
	}
	public void setVideoId(String videoId) {
		this.videoId = videoId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSynopsis() {
		return synopsis;
	}
	public void setSynopsis(String synopsis) {
		this.synopsis = synopsis;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getVideo() {
		return video;
	}
	public void setVideo(String video) {
		this.video = video;
	}
	public Date getUploadDate() {
		return uploadDate;
	}
	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}
	public String getParentNumber() {
		return parentNumber;
	}
	public void setParentNumber(String parentNumber) {
		this.parentNumber = parentNumber;
	}
}
