package milrim_project.YJ.controller;
//영재 수정했음 23.8.3 16시 9분
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import milrim_project.YJ.service.A03_CommunityService;
import milrim_project.YJ.vo.Comment01;
import milrim_project.YJ.vo.FreeBoard;
import milrim_project.login.m04_vo.Member;

@Controller
public class A03_CommunityController {
    @Autowired
    private A03_CommunityService service;
    // http://localhost:8080/milrim/community.do
    @GetMapping("community.do")//밀림의숲(커뮤니티)
	public String community(@RequestParam(value = "title",
			  defaultValue = "") String title,HttpSession session,Model d) {
		// 게시글 출력
	    List<FreeBoard> postList = service.postList(title);
	    d.addAttribute("postList", postList);
	    // 댓글 출력
	    for (FreeBoard post : postList) {
	        List<Comment01> comments = service.commentList(post.getPostId());
	        post.setComments(comments);
	    }
	    return "WEB-INF\\views\\project_YJ\\community.jsp";
	}
    // http://localhost:8080/milrim/postList.do?title=제목1
    @GetMapping("/postList.do")
    @ResponseBody
    public List<FreeBoard> postList(@RequestParam(value="title", required=false) String title) {
        if(title == null) {
            title = ""; 
        }
        return service.postList(title);
    }
	// http://localhost:8080/milrim/commentList.do?postId=1
	@GetMapping("/commentList.do")
	@ResponseBody
	public List<Comment01> commentList(@RequestParam("postId") String postId) {
		return service.commentList(postId);
	}
	
	// http://localhost:8080/milrim/writePost.do
	@GetMapping("/writePost.do")
	public String writePost() {
		return "WEB-INF\\views\\project_YJ\\writePost.jsp";
	}
	@ResponseBody
	@RequestMapping("/insPost.do")
	public Map<String, Boolean> insPost(FreeBoard ins, HttpSession session) {
	    Map<String, Boolean> result = new HashMap<>();
        Member memberInfo = (Member) session.getAttribute("userInfo");
        String id = memberInfo.getId();
	    try {
	        ins.setId(id);
	        System.out.println("게시글 작성 세션 Id받았니? : "+id);
	        service.insPost(ins);
	        result.put("success", true);
	    } catch (Exception e) {
	        result.put("success", false);
	    }
	    return result;
	}
	@PostMapping("/addComment.do")
	@ResponseBody
	public Map<String, String> addComment(Comment01 comment, HttpSession session) {
        Member memberInfo = (Member) session.getAttribute("userInfo");
        String id = memberInfo.getId();
	    comment.setId(id);
	    String result = service.insComment(comment);
	    Map<String, String> resultMap = new HashMap<>();
	    resultMap.put("message", result);
	    return resultMap;
	}
	
	@RequestMapping("/delPost.do")
	public ResponseEntity<String> delPost(@RequestParam String postId, HttpSession session){
	    FreeBoard del = new FreeBoard();
        Member memberInfo = (Member) session.getAttribute("userInfo");
        String id = memberInfo.getId();
	    del.setId(id);
	    del.setPostId(postId);
	    return ResponseEntity.ok(service.delPost(del));
	}
	
	@RequestMapping("/delComment.do")
	public ResponseEntity<String> delComment(@RequestParam String commentId, HttpSession session){
	    Comment01 del = new Comment01();
        Member memberInfo = (Member) session.getAttribute("userInfo");
        String id = memberInfo.getId();
	    if (id == null) {
	        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("권한이 없습니다.");
	    }
	    del.setId(id);
	    del.setCommentId(commentId);
	    return ResponseEntity.ok(service.delComment(del));
	}

}
