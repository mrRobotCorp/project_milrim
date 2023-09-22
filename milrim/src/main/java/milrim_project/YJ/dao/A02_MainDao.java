package milrim_project.YJ.dao;
// milrim_project.YJ.dao.A02_MainDao
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import milrim_project.YJ.vo.BookMark;
import milrim_project.YJ.vo.FreeBoard;
import milrim_project.YJ.vo.VideoPost;

@Repository
public interface A02_MainDao {

	 public List<VideoPost> schVideos(@Param("title") String title,
			 										    @Param("tagName") String tagName);
	 public List<VideoPost> videoDetail( @Param("videoId") String videoId );
	 public List<VideoPost> tagList( @Param("videoId") String videoId );
	 public void insBookmark( @Param("id") String id,@Param("videoId") String videoId );
	 public void delBookmark( @Param("id") String id,@Param("videoId") String videoId );
	 public int checkBookmark(@Param("id") String id, @Param("videoId") String videoId);

	@Select("SELECT * FROM FREEBOARD f \r\n"
			+ "WHERE id=#{id}\r\n"
			+ "ORDER BY FBDATE DESC")
	public List<FreeBoard> postList(@Param("id") String id);
	@Select("SELECT * \r\n"
			+ "FROM BOOKMARK b, VIDEOPOST v \r\n"
			+ "WHERE b.VIDEOID = v.VIDEOID\r\n"
			+ "AND id=#{id}\r\n"
			+ "ORDER BY title")
	public List<BookMark> bookmarkList(@Param("id") String id);

	//@Select("SELECT MembershipID,id,TO_CHAR(StartDate,'YYYY-MM-DD'),TO_CHAR(EndDate,'YYYY-MM-DD') FROM Membership WHERE id = #{id}")
	
}