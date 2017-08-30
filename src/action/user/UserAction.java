package action.user;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;

import util.sql.SQLUtil;

import com.opensymphony.xwork2.ActionSupport;

import entity.user.UserInfo;

public class UserAction extends ActionSupport{

	@Override
	public String execute() throws Exception {
		HttpServletResponse response = ServletActionContext.getResponse();
    	response.setCharacterEncoding("UTF-8");
    	PrintWriter pw = response.getWriter();
    	
    	List<UserInfo> users = SQLUtil.getAllUsers();
    	String jsonStr = JSONArray.fromObject(users).toString();
    	
    	pw.write(jsonStr);
    	pw.flush();
    	pw.close();
    	return null;
	}
	
	public static void main(String[] args) {
		List<UserInfo> users = SQLUtil.getAllUsers();
    	String jsonStr = JSONArray.fromObject(users).toString();
    	
    	
    	System.out.println(jsonStr);
	}
}
