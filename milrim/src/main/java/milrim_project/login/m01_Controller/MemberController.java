package milrim_project.login.m01_Controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import milrim_project.login.m02_Service.MemberService;
import milrim_project.login.m04_vo.Member;
import milrim_project.login.m04_vo.Membership;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller("memCtrl")
public class MemberController {

	@Autowired
	private MemberService service;

	
	
	@GetMapping("startpage.do")
	public String startpage() {
		return "WEB-INF\\views\\project5_Milrim\\home.jsp";
	}
	
    @GetMapping("join.do") // 회원가입 페이지
    public String jo() {
    	
        return "WEB-INF\\views\\project5_Milrim\\join.jsp"; // 뷰 페이지 경로 설정
    }
    // 회원가입
    @GetMapping("idMem.do")
    @ResponseBody
    public void insMember(Member ins) {
        service.insMember(ins);
    }
    
    // 아이디 중복
	@PostMapping("idc.do")
	@ResponseBody
	public String idcMem(@Param("id") String id, Model d) {
		
		return service.idcMem(id);
	}
	
	// 인증번호 발송
    String api_key = "NCSCIW74KIRULFKD";
    String api_secret = "0VXCPQF8SNFHHJW38DRZMZ6ZZUZGXFJY";
    Message coolsms = new Message(api_key, api_secret);
    String checkNum = "";

    @PostMapping("mesgo.do")
    @ResponseBody
    public void mesgo(@Param("phonenumber") String phonenumber) {
  	  for(int i=1;i<=6;i++) {
  		  int rdNum = (int)(Math.random()*10);
  		  checkNum += ""+rdNum;
  	  }
        // 4 params(to, from, type, text) are mandatory. must be filled
        HashMap<String, String> params = new HashMap<String, String>();
        params.put("to", phonenumber);
        params.put("from", "01033293090"); //무조건 자기번호 (인증)
        params.put("type", "SMS");
        params.put("text", "\t MilRim \n휴대폰 인증번호: "+checkNum);
        params.put("app_version", "test app 1.2"); // application name and version

        try {
        	//send() 는 메시지를 보내는 함수  
          JSONObject obj = (JSONObject) coolsms.send(params);
          System.out.println(obj.toString());
        } catch (CoolsmsException e) {
          System.out.println(e.getMessage());
          System.out.println(e.getCode());
        }
      }
	// 인증번호 체크
    @PostMapping("checkMes.do")
    public ResponseEntity<String> checkMes(@Param("numberC") String numberC) {
    	String checkOK = "";
    	if(numberC.equals(checkNum)) {
    		checkOK = "Y";
    	}else {
    		checkOK = "N";
    		checkNum = "";
    	}
    	
    	return ResponseEntity.ok(checkOK);
    }
	
	
	
	
	
	
    
    @GetMapping("login.do")
    public String loing() {
    	
    	return "WEB-INF\\views\\project5_Milrim\\login.jsp";
    }
    
    @PostMapping("login01.do")
    @ResponseBody
    public String loginYS(HttpSession session,Member sch, Model d) {
        String loginResult = service.loginYS(sch);
        System.out.println(sch.getId());
        d.addAttribute("memsh",service.memberShipCh(sch.getId()));
		/*
		 * else { d.addAttribute("loginys",""); d.addAttribute("memsh",""); }
		 */
        if (loginResult.equals("Y")) {
            session.setAttribute("userInfo", service.makeSession(sch.getId()));
            session.setAttribute("memSh", service.memberShipCh(sch.getId()));
            System.out.println(service.memberShipCh(sch.getId()));
            System.out.println(service.makeSession(sch.getId()));
        } else {
            // 로그인 실패 또는 처리해야 할 내용이 있다면 여기에 추가하세요
        }

        return  service.loginYS(sch)+service.memberShipCh(sch.getId());
    }
     
    
    

    
    // 로그아웃
	@GetMapping("logout")
	public String logout(HttpSession session) {
		if(session.getAttribute("userInfo")!=null) {
			session.removeAttribute("userInfo");
			session.removeAttribute("memSh");
		}
		return "redirect:/login.do";
	}
    
 //================== 아이디 비밀번호 찾기
    @RequestMapping("find.do")
    public String find() {
    	return "WEB-INF\\views\\project5_Milrim\\findId.jsp";
    }
	// 아이디 찾기=================
    @PostMapping("findID.do")
    public ResponseEntity<String> findID(@Param("name") String name,
    		@Param("phonenumber") String phonenumber) {
    	
    	return ResponseEntity.ok(service.findID(name, phonenumber));
    }
	// 비밀번호 찾기=================
    @PostMapping("findPASS.do")
    public ResponseEntity<String> findPASS(@Param("id") String id,
    		@Param("phonenumber") String phonenumber){
    	
    	return ResponseEntity.ok(service.findPASS(id, phonenumber));
    }
    
    
    // 멤버십
    
    @GetMapping("memberShip.do")
    public String memberShip(Model d , @Param("id") String id) {
        // HttpSession session = request.getSession();
        // userInfo라는 이름으로 저장된 데이터를 얻음
        // Object userInfo = session.getAttribute("userInfo");
        // d.addAttribute("userInfo",userInfo);
        d.addAttribute("cardInfo",service.seletCardInfo(id));
    	return "WEB-INF\\views\\project5_Milrim\\membership.jsp";
    }
    
    @GetMapping("insCard.do") // 카드번호 저장
    @ResponseBody
    public String insCard(Membership sch) {
    
    	return service.insCard(sch);
    }

    @GetMapping("insMemship.do") // 멤버십 저장
    @ResponseBody
    public String insMemship(@Param("id") String id,HttpSession session) {
    	
    	session.setAttribute("memSh1", service.memberShipCh(id));
    	System.out.println(service.memberShipCh(id));
    	return service.insMemship(id);
    }
    
    
    
    // 마이페이지 비밀번호 변경
    @PostMapping("mypagepass.do")
    @ResponseBody
    public String uptMyPagePass(@Param("pass") String pass, @Param("passchange") 
    	String passchange,@Param("id") String id) {
    	
    	return service.uptMyPagePass(pass, passchange, id);
    }
    
    
    
    
/*
로그인 ^ : 세션, 쿠키
회원가입 O 
아이디,비밀번호 찾기 O

*/
    
}


/* 
db
sql
dao
service
controller
html

세션 : 아이디, 이름, 권한
쿠키 : 아이디 저장
회원가입 버튼 활성화


수~목 회원가입, 로그인, 아이디&비밀번호 찾기
금 멤버십+결제, 관리자(회원정보 열람)
토 관리자
1. 회원정보 삭제
2. 게시글 열람 + 삭제
3. 영상 게시판 열람

월 영상 게시판 생성, 영상 게시판 삭제
화 영상 게시판 업데이트

수 보안 + 취합
목 취합
금 발표

*/	



















































