package milrim_project.YJ.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import milrim_project.YJ.dao.A02_MainDao;
import milrim_project.YJ.vo.BookMark;
import milrim_project.YJ.vo.FreeBoard;
import milrim_project.YJ.vo.VideoPost;


	@Service
	public class A02_MainService {
	    @Autowired
	    private A02_MainDao dao;
	
	    public List<VideoPost> schVideos(String title, String tagName) {
	        return dao.schVideos(title, tagName);
	    }
	    public List<VideoPost> videoDetail(String videoId) {
	    	return dao.videoDetail(videoId);
	    }
	    public List<VideoPost> tagList(String videoId) {
	    	return dao.tagList(videoId);
	    }
	    public void insBookmark(String id,String videoId) {
	        dao.insBookmark(id,videoId);
	    }
	    public void delBookmark(String id,String videoId) {
	        dao.delBookmark(id,videoId);
	    }
	    // 즐겨찾기 여부 확인 로직
	    public boolean isBookmarked(String id, String videoId) {
	        return dao.checkBookmark(id, videoId) > 0;
	    }
	    // 즐겨찾기 등록&삭제
	    public void toggleBookmark(String id, String videoId) {
	        if (isBookmarked(id, videoId)) {
	            delBookmark(id,videoId);
	        } else {
	            insBookmark(id, videoId);
	        }
	    }
	    
	    // 마이페이지 출력
		public List<FreeBoard> postList(String id) {
			if(id==null) id="";
			System.out.println("세션 ID 게시물:"+id);
			return dao.postList(id);
		}
		public List<BookMark> bookmarkList(String id) {
			if(id==null) id="";
			System.out.println("세션 ID 즐겨찾기:"+id);
			return dao.bookmarkList(id);
		}
}
