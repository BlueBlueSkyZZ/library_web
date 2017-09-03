package action.pub;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;

import util.sql.SQLUtil;

import com.opensymphony.xwork2.ActionSupport;

import entity.manager.ManagerInfo;
import entity.pub.Notice;

public class NoticeAction extends ActionSupport{

	/**
	 * ªÒ»°∆¿¬€
	 */
	@Override
	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
    	response.setCharacterEncoding("UTF-8");
    	request.setCharacterEncoding("utf-8");
    	PrintWriter pw = response.getWriter();
    	String notice_id = request.getParameter("noticeId");
    	Notice notice = SQLUtil.getNotice(notice_id);
    	String jsonStr = JSONArray.fromObject(notice).toString();
    	pw.write(jsonStr);
    	pw.flush();
    	pw.close();
		return null;
	}
	
	public void updateNotice() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
    	response.setCharacterEncoding("UTF-8");
    	request.setCharacterEncoding("utf-8");
    	PrintWriter pw = response.getWriter();
    	String category = request.getParameter("category");
    	String notice_id = request.getParameter("noticeId");
    	String title = request.getParameter("title");
    	String time = request.getParameter("time");
    	String content = request.getParameter("content");
    	String img = request.getParameter("img");
     
    	SQLUtil.updateNotice(category, title, notice_id, time, content, img);
    	
    	pw.write("success");
    	pw.flush();
    	pw.close();
	}
}
