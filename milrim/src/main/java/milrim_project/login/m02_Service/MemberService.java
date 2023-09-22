package milrim_project.login.m02_Service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import milrim_project.YJ.vo.MemberDate;
import milrim_project.login.m03_dao.MemberDao;
import milrim_project.login.m04_vo.Member;
import milrim_project.login.m04_vo.Membership;

@Service
public class MemberService {
	
	@Autowired
	private MemberDao dao;
	
	// 회원가입=================
	public void insMember(Member ins) { //회원가입 인서트
		dao.insMember(new Member(ins.getId(),ins.getPass(),ins.getName(),
				ins.getEmail(),ins.getPhonenumber()));
	}
	
	public String idcMem(String id) { // 회원가입 아이디 검사
		dao.idcMem(id);
		return dao.idcMem(id)>0?"Y":"N";
	}
	
	// 로그인=================
	public String loginYS(Member sch) { // 로그인
		if(sch.getId()==null) sch.setId("");
		if(sch.getPass()==null) sch.setPass("");
		return dao.loginYS(sch)>0?"Y":"N";
	}
	
	public Member makeSession(String sid) {
		
		return dao.makeSession(sid);
	}

	// 아이디 찾기=================
	public String findID(String name, String phonenumber) {
		if(name==null) name="";
		if(phonenumber==null) phonenumber="";
		
		return dao.findId(name, phonenumber);
	}
	// 비밀번호 찾기=================
	public String findPASS(String id, String phonenumber) {
		if(id==null) id="";
		if(phonenumber==null) phonenumber="";
		
		return dao.findPass(id, phonenumber);
	}
	
	// 멤버십
	public Membership seletCardInfo(@Param("id") String id) {
		if(id==null) id="";
		return dao.seletCardInfo(id);
	}
	
	public String insCard(Membership sch) {
		if(sch.getCardNum()==null) sch.setCardNum("");
		if(sch.getCardPass()==null) sch.setCardPass("");
		if(sch.getId()==null) sch.setId("");
		if(sch.getMmyy()==null) sch.setMmyy("");
		if(sch.getBday()==null) sch.setBday("");
		return dao.insCard(sch)>0?"Y":"N";
	}
	
	public String insMemship(@Param("id") String id) {
		if(id==null) id="";
		return dao.insMemship(id)>0?"Y":"N";
	}
	
	
	// 마이페이지 비밀번호 찾기
	
	public String uptMyPagePass(@Param("pass") String pass, @Param("passchange") String passchange,@Param("id") String id) {
		if(pass==null)pass="";
		if(passchange==null)passchange="";
		return dao.uptMyPagePass(pass, passchange, id)>0?"Y":"N";
	}
	
	// 멤버쉽 여부
	public List<MemberDate> memberShipCh(@Param("id") String id) {
		if(id==null) id="";
		return dao.memberShipCh(id);
	}
	
}

