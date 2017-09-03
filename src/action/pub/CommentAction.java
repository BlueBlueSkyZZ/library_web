package action.pub;

import java.io.IOException;
import java.io.PrintWriter;

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
}
