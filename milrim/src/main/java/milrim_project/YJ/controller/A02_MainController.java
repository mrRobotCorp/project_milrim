package milrim_project.YJ.controller;
// 영재 수정했음 23.8.3 16시 9분

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import milrim_project.YJ.service.A02_MainService;
import milrim_project.YJ.vo.VideoPost;
import milrim_project.login.m04_vo.Member;

@Controller
public class A02_MainController {
	    @Autowired
	    private A02_MainService service;

	    // http://localhost:8080/milrim/main02.do
		@GetMapping("main02.do")
		public String videoList(HttpSession session,Model d) {
	        return "WEB-INF\\views\\project_YJ\\main.jsp";
		}
		@PostMapping("/schVideos.do")
		@ResponseBody
		public List<VideoPost> schVideos(@RequestParam("title") String title, 
		                         @RequestParam(required = false) String tagName) {
		    return service.schVideos(title, tagName);
		}
		
		///////////////////////////////////////////////////////////////
		// 비디오 상세
		 // http://localhost:8080/milrim/video.do?videoId=v1
		@GetMapping("video.do") // 수정했음 16시
		public String video(@RequestParam("videoId") String videoId, HttpSession session, Model d) {
		    // videoId를 사용하여 비디오 상세 정보 조회
		    List<VideoPost> videoDetails = service.videoDetail(videoId);
		    d.addAttribute("videoDetails", videoDetails);
		    
		    // 태그 리스트 출력
		    List<VideoPost> tagList = service.tagList(videoId);
		    d.addAttribute("tagLists", tagList);

		    return "WEB-INF\\views\\project_YJ\\videoDetail.jsp";
		}
		// 즐겨찾기 여부 확인
	    @GetMapping("/check.do")
	    public ResponseEntity<Map<String, Boolean>> checkBookmark(
	    				HttpSession session, @RequestParam String videoId) {
	    	Member memberInfo = (Member) session.getAttribute("userInfo");
	    	String id = memberInfo.getId();

	        System.out.println("즐겨찾기 세션 회원 id : "+id);
	        boolean isBookmarked = service.isBookmarked(id, videoId);
	        Map<String, Boolean> response = new HashMap<>();
	        response.put("isBookmarked", isBookmarked);
	        
	        System.out.println("즐겨찾기 결과:"+response);
	        
	        return ResponseEntity.ok(response);
	    }
	    // 즐겨찾기
	    @GetMapping("/toggle.do")
	    @ResponseBody
	    public String toggleBookmark(HttpSession session, @RequestParam String videoId) {
	    	Member memberInfo = (Member) session.getAttribute("userInfo");
	    	String id = memberInfo.getId();
	        service.toggleBookmark(id, videoId);
	        return "즐겨찾기 토글 성공";
	    }
	    
	    
	    
	    ////////////////////////////////////////////////////////////////
		 // 마이페이지
		 // http://localhost:8080/milrim/mypage.do
	    @GetMapping("/mypage.do") // 수정했음
	    public String mypage(Model model, HttpSession session) {
	    	Member memberInfo = (Member) session.getAttribute("userInfo");
	    	String id = memberInfo.getId();
	        model.addAttribute("posts", service.postList(id));
	        model.addAttribute("bookmarks", service.bookmarkList(id));
	        return "WEB-INF\\views\\project_YJ\\mypage.jsp";
	    }


	    
}
