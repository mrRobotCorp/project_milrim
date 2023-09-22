package milrim_project.login.m04_vo;

import java.text.SimpleDateFormat;
import java.util.Date;
public class VideopostNum {
	    private String videoid;
	    private String title;
	    private String synopsis;
	    private String image;
	    private String video;
	    private Date uploaddate;
	    private String parentnumber;
	    private String value;
	    
		public VideopostNum() {
			super();
			// TODO Auto-generated constructor stub
		}
		public VideopostNum(String videoid, String title, String synopsis, String image, String video, Date uploaddate,
				String parentnumber, String value) {
			super();
			this.videoid = videoid;
			this.title = title;
			this.synopsis = synopsis;
			this.image = image;
			this.video = video;
			this.uploaddate = uploaddate;
			this.parentnumber = parentnumber;
			this.value = value;
		}

		public String getVideoid() {
			return videoid;
		}

		public void setVideoid(String videoid) {
			this.videoid = videoid;
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

		public Date getUploaddate() {
			return uploaddate;
		}

		public void setUploaddate(Date uploaddate) {
			this.uploaddate = uploaddate;
		}

		public String getParentnumber() {
			return parentnumber;
		}

		public void setParentnumber(String parentnumber) {
			this.parentnumber = parentnumber;
		}

		public String getValue() {
			return value;
		}

		public void setValue(String value) {
			this.value = value;
		}

	}
