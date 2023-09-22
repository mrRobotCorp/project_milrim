package milrim_project.login.m03_dao;



import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import milrim_project.YJ.vo.MemberDate;
import milrim_project.login.m04_vo.Member;
import milrim_project.login.m04_vo.Membership;

/**
 * @author user
 *
 */
public interface MemberDao {
	// 회원가입
	@Insert("INSERT INTO MEMBER VALUES (#{id},#{pass},#{name},#{email},#{phonenumber},'user')")
	public void insMember(Member ins);
	// 회원가입 아이디 중복
	@Select("SELECT COUNT(*) as ys FROM MEMBER WHERE id = #{id}")
	public int idcMem(String id);
	// 로그인  SELECT COUNT(*) as id FROM MEMBER WHERE id = #{id} AND pass = #{pass}
	@Select("SELECT COUNT(*) as id FROM MEMBER \r\n"
			+ "	WHERE id = #{id} AND pass = #{pass}")
	public int loginYS(Member sch);
	// 세션 처리
	@Select("SELECT id, name, auth,email FROM member WHERE id = #{sid}")
	public Member makeSession(@Param("sid") String sid);
	
	// 아이디 찾기 
	@Select("SELECT id FROM MEMBER WHERE name = #{name} AND PHONENUMBER  = #{phonenumber}")
	public String findId(@Param("name")String name, @Param("phonenumber") String phonenumber);
	
	// 비밀번호 찾기 
	@Select("SELECT pass FROM MEMBER WHERE id = #{id} AND PHONENUMBER = #{phonenumber}")
	public String findPass(@Param("id") String id, @Param("phonenumber") String phonenumber);
	
	// 멤버쉽
	@Select("SELECT * FROM card WHERE id = #{id}")
	public Membership seletCardInfo(@Param("id") String id); 
	
	@Insert("INSERT INTO card VALUES (#{id},#{cardNum},#{mmyy},#{bday},#{cardPass})")
	public int insCard(Membership sch); 
	
	@Insert("INSERT INTO Membership VALUES ('s'||shipSQU.nextval,#{id},sysdate,ADD_MONTHS(sysdate, 1))")
	public int insMemship(@Param("id") String id);
	
	// 마이페이지 비밀번호 변경
	@Update("UPDATE Member\r\n"
			+ "SET Pass = #{passchange}\r\n"
			+ "WHERE Pass = #{pass} AND id = #{id}")
	public int uptMyPagePass(@Param("pass") String pass, @Param("passchange") String passchange,@Param("id") String id);
	
	// 멤버십 여부
	// @Select("SELECT MembershipID,id,TO_CHAR(StartDate,'YYYY-MM-DD'),TO_CHAR(EndDate,'YYYY-MM-DD') FROM Membership WHERE id = #{id}")
	@Select("SELECT MembershipID,id,StartDate,EndDate FROM Membership WHERE id = #{id}")
	public List<MemberDate> memberShipCh(@Param("id") String id);
	
	
	
	
	
	
}
