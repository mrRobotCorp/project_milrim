package milrim_project.YJ.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import milrim_project.YJ.dao.A03_CommunityDao;
import milrim_project.YJ.vo.Comment01;
import milrim_project.YJ.vo.FreeBoard;

@Service
public class A03_CommunityService {
	@Autowired
	private A03_CommunityDao dao;
	
	public List<FreeBoard> postList(String title){
		return dao.postList(title);
	}
	public List<Comment01> commentList(String postId){
		return dao.commentList(postId);
	}
	public String insPost(FreeBoard ins){
		return dao.insPost(ins)>0?"Success":"failed";
	}
	public String insComment(Comment01 ins) {
		return dao.insComment(ins)>0?"Success":"failed";
	}
	public String delPost(FreeBoard del){
		return dao.delPost(del)>0?"Success":"failed";
	}
	public String delComment(Comment01 del) {
		return dao.delComment(del)>0?"Success":"failed";
	}
}
