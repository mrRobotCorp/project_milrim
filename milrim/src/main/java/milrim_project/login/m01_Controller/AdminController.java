package milrim_project.login.m01_Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.util.Date; 

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import milrim_project.login.m02_Service.AdminService;
import milrim_project.login.m04_vo.Freeboard;
import milrim_project.login.m04_vo.Member;
import milrim_project.login.m04_vo.Videopost;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	// == 회원 어드민 ========
	@GetMapping("admin_mem.do")
	public String admin_mem() {
		return "WEB-INF\\views\\project5_Milrim\\admin_mem.jsp";
	}
	// == 회원 조회 어드민 ========
	@PostMapping("admin_mem_List.do")
	@ResponseBody
	public ResponseEntity<List<Member>> adminMemList(@Param("id") String id){
		return ResponseEntity.ok(service.adminMemList(id));
	}
	
	// == 회원 삭제 어드민 ========
	@PostMapping("admin_mem_Del.do")
	@ResponseBody
	public ResponseEntity<String> adminMemDel(@Param("id")String id) {
		System.out.println(service.adminMemDel(id));
		return ResponseEntity.ok(service.adminMemDel(id));
	}
	
	
	
	// == 포스트 어드민 ========
	@GetMapping("admin_pst.do")
	public String admin_pst() {
		return "WEB-INF\\views\\project5_Milrim\\admin_pst.jsp";
	}
	
	// == 포스트 조회 어드민 ========
	@PostMapping("admin_pst_List.do")
	@ResponseBody
	public ResponseEntity<List<Freeboard>> adminPstList(@Param("title") String title){
		
		return ResponseEntity.ok(service.adminPstList(title));
	}
	// == 포스트 삭제 어드민 ========
	@PostMapping("admin_pst_Del.do")
	@ResponseBody
	public ResponseEntity<String> adminPstDel(@Param("postid")String postid){
		System.out.println(ResponseEntity.ok(service.adminPstDel(postid)));
		return ResponseEntity.ok(service.adminPstDel(postid));
	}
	
	
	
	
	
	// == 비디오 어드민 ========
	@GetMapping("admin_vid.do")
	public String admin_vid() {
		return "WEB-INF\\views\\project5_Milrim\\admin_vid.jsp";
	}
	
	// == 비디오 조회 어드민 ========
	@RequestMapping("adminFindVide.do")
	@ResponseBody
	public ResponseEntity<List<Videopost>> adminFindVide() {
	    List<Videopost> hierarchicalList = service.adminFindVide();
	    List<Videopost> hierarchicalResult = service.buildHierarchy(hierarchicalList);

	    System.out.println("Hierarchical Result: " + hierarchicalResult);

	    return ResponseEntity.ok(hierarchicalResult);
	}
	
	
	// == 비디오 삭제 어드민 ========
	
	
	
	
	// == 비디오 수정 어드민 ========
	
	
	
	
	// == 비디오 업로드 어드민 ========
	
	
    @RequestMapping("login112312311.do")
    private void someOtherMethod(HttpServletRequest request) {
        HttpSession session = request.getSession();
        // userInfo라는 이름으로 저장된 데이터를 얻음
        Object userInfo = session.getAttribute("userInfo");
        if (userInfo != null) {
            System.out.println(userInfo);
        } else {
        	System.out.println("실패");
            // 데이터가 없는 경우 처리
        }
    }
	
	
}





















































