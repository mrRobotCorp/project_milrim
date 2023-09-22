package milrim_project.login.m02_Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import milrim_project.login.m03_dao.AdminDao;
import milrim_project.login.m04_vo.Freeboard;
import milrim_project.login.m04_vo.Member;
import milrim_project.login.m04_vo.Videopost;
import milrim_project.login.m04_vo.VideopostNum;

@Service
public class AdminService {

	@Autowired
	private AdminDao dao;

	// 회원 조회
	public List<Member> adminMemList(@Param("id") String id){
		if(id==null) id="";
		return dao.adminMemList(id);
	}

	// 회원 삭제
	public String adminMemDel(@Param("id") String id) {
		if(id==null) id="";
		return dao.adminMemDel(id)>0?"삭제 실패":"삭제 성공";
	}
	
	
	
	// 자유게시판 조회
	public List<Freeboard> adminPstList(@Param("title") String title){
		if(title==null) title="";
		return dao.adminPstList(title);
	}

	// 자유게시판 삭제
	public String adminPstDel(@Param("postid")String postid) {
		if(postid==null) postid="";
		return dao.adminPstDel(postid)>0?"삭제 실패":"삭제 성공";
	}

	
	// 포스트 출력
	public List<Videopost> adminFindVide (){

		return dao.adminFindVide();
	}
	
	
/*	
	public List<Videopost> buildHierarchy(List<Videopost> flatList) {
		
	    Map<String, Videopost> videoMap = new HashMap<>();
	    List<Videopost> rootList = new ArrayList<>();

	    // 객체들을 videoid를 키로하여 Map에 저장
	    for (Videopost video : flatList) {
	        videoMap.put(video.getVideoid(), video);
	    }

	    // 계층 구조를 형성
	    for (Videopost video : flatList) {
	        String parentNumber = video.getValue();
	        if (parentNumber == null) {
	            // 부모가 없으면 루트 노드로 처리
	            rootList.add(video);
	        } else {
	            // 부모 노드의 voList에 자식 노드 추가
	            Videopost parent = videoMap.get(parentNumber);
	            if (parent != null) {
	                parent.addToVoList(video);
	                System.out.println("Flat List: 서비스3" + parent);
	            }
	        }
	    }
	    
	    System.out.println("Flat List: 서비스" + flatList);
	    System.out.println("Flat List: 서비스2" + rootList);
	    return rootList;
	}
*/
	public List<Videopost> buildHierarchy(List<Videopost> flatList) {
	    List<Videopost> plist = new ArrayList<>();

	    Videopost post = null;
	    for (Videopost video : flatList) {
	        if (video.getValue() == null) {
	            if (video.getVideoid() != null) {
	                if (post != null) {
	                    plist.add(post);
	                }
	            }
	            // 부모가 없으면 루트 노드로 처리
	            post = new Videopost(
	                    video.getVideoid(),
	                    video.getTitle(),
	                    video.getSynopsis(),
	                    video.getImage(),
	                    video.getVideo(),
	                    video.getUploaddate(),
	                    video.getParentnumber(),
	                    video.getValue(),
	                    new ArrayList<>() // 빈 voList로 초기화
	            );
	        } 
	        if(video.getValue() != null && post != null) { 
	        	// post가 null이 아닌 경우에만 addVideopostNum 호출
	            VideopostNum postNum = new VideopostNum(
	                    video.getVideoid(),
	                    video.getTitle(),
	                    video.getSynopsis(),
	                    video.getImage(),
	                    video.getVideo(),
	                    video.getUploaddate(),
	                    video.getParentnumber(),
	                    video.getValue()
	            );
	            post.addVideopostNum(postNum);
	        }
	    }
	    if (post != null) {
	        plist.add(post);
	    }
	    return plist;
	}









}




















































