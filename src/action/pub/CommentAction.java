package action.pub;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;

import util.sql.SQLUtil;

import com.opensymphony.xwork2.ActionSupport;

import entity.pub.Comment;

public class CommentAction extends ActionSupport{
	
	/**
	 * 显示
	 */
	@Override
	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
    	response.setCharacterEncoding("UTF-8");
    	request.setCharacterEncoding("utf-8");
    	PrintWriter pw = response.getWriter();
    	String num = request.getParameter("commentNum");
    	System.out.println("执行了execute");
    	Comment comment = SQLUtil.getComment(num);
    	String jsonStr = JSONArray.fromObject(comment).toString();
    	pw.write(jsonStr);
    	pw.flush();
    	pw.close();
		return null;
	}
	
	/**
	 * 通过审核
	 * @throws IOException
	 */
	public void passComment() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
    	response.setCharacterEncoding("UTF-8");
    	request.setCharacterEncoding("utf-8");
    	PrintWriter pw = response.getWriter();
    	String num = request.getParameter("commentNum");
    	String commentid = request.getParameter("commentid");
    	
    	SQLUtil.updateComment(commentid);
    	System.out.println("执行了passComment");
    	Comment comment = SQLUtil.getComment(num);
    	String jsonStr = JSONArray.fromObject(comment).toString();
    	pw.write(jsonStr);
    	pw.flush();
    	pw.close();
	}
	
	
	public void returnComment() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
    	response.setCharacterEncoding("UTF-8");
    	request.setCharacterEncoding("utf-8");
    	PrintWriter pw = response.getWriter();
    	String commentid = request.getParameter("commentid");
    	
    	SQLUtil.return_Comment(commentid);
    	
    	pw.write("success");
    	pw.flush();
    	pw.close();
	}
	/**
	 * 删除评论
	 * @throws IOException
	 */
	public void deleteComment() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
    	response.setCharacterEncoding("UTF-8");
    	request.setCharacterEncoding("utf-8");
    	PrintWriter pw = response.getWriter();
    	String num = request.getParameter("commentNum");
    	String commentid = request.getParameter("commentid");
    	
    	SQLUtil.deleteComment(commentid);
    	
    	Comment comment = SQLUtil.getComment(num);
    	String jsonStr = JSONArray.fromObject(comment).toString();
    	pw.write(jsonStr);
    	pw.flush();
    	pw.close();
    	
	}
	
	/**
	 * 自动审核评论
	 * @throws IOException
	 */
	public void autoJudge() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
    	response.setCharacterEncoding("UTF-8");
    	request.setCharacterEncoding("utf-8");
    	PrintWriter pw = response.getWriter();
    	int count = 0;
    	String keyword = request.getParameter("keyword");
    	String[] keywords = keyword.split(",");
    	System.out.println(keywords[0]);
    	List<Comment> comments = SQLUtil.getAllComment();
    	for (Comment comment : comments) {
			String content = comment.getComment();
			String commentId = comment.getCommentid();
			if(judgeComment(content, keywords)){
				SQLUtil.deleteComment(commentId);
				count++;
			}else{
				SQLUtil.updateComment(commentId);
			}
		}
    	System.out.println(count);
    	pw.write(count+"");
    	pw.flush();
    	pw.close();
	}
	
	/**
	 * 关键词自动过滤
	 * @param content
	 * @param keywords
	 * @return
	 */
	private boolean judgeComment(String content, String[] keywords){
		for(int i = 0; i < keywords.length; i++){
			if(content.indexOf(keywords[i]) != -1){
				return true;
			}
		}
		return false;
	}
	
	/**
	 * 获取所有历史评论
	 * @throws IOException
	 */
	public void getHistoryComment() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
    	response.setCharacterEncoding("UTF-8");
    	request.setCharacterEncoding("utf-8");
    	PrintWriter pw = response.getWriter();
    	List<Comment> comments = SQLUtil.getHistoryComment();
    	String jsonStr = JSONArray.fromObject(comments).toString();
    	pw.write(jsonStr);
    	pw.flush();
    	pw.close();
	}
	
	public static void main(String[] args) {
		List<Comment> comments = SQLUtil.getHistoryComment();
    	String jsonStr = JSONArray.fromObject(comments).toString();
    	System.out.println(jsonStr);
	}
}
