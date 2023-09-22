package milrim_project.YJ.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import milrim_project.YJ.vo.Comment01;
import milrim_project.YJ.vo.FreeBoard;

@Repository
public interface A03_CommunityDao {
	public List<FreeBoard> postList( @Param("title") String title ) ;
	public List<Comment01> commentList( @Param("postId") String postId ) ;
	public int insPost(FreeBoard ins);	
	public int insComment(Comment01 ins);	
	public int delPost(FreeBoard del);	
	public int delComment(Comment01 del);	
	
}
