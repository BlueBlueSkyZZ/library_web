package action.manager;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;

import util.sql.SQLUtil;

import com.opensymphony.xwork2.ActionSupport;

import entity.manager.ManagerInfo;

public class ManagerAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * ��ȡ���й���Ա��Ϣ
	 */
	@Override
	public String execute() throws Exception {
		HttpServletResponse response = ServletActionContext.getResponse();
    	response.setCharacterEncoding("UTF-8");
    	PrintWriter pw = response.getWriter();
    	
    	List<ManagerInfo> managers = SQLUtil.getAllManagers();
    	String jsonStr = JSONArray.fromObject(managers).toString();
    	
    	pw.write(jsonStr);
    	pw.flush();
    	pw.close();
    	return null;
	}
	
	/**
	 * ��ȡ��������Ա��Ϣ
	 * @throws IOException
	 */
	public void getSingleManager() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
    	response.setCharacterEncoding("UTF-8");
    	request.setCharacterEncoding("utf-8");
    	PrintWriter pw = response.getWriter();
    	String id = request.getParameter("id");
    	ManagerInfo manager = SQLUtil.getOneManager(id);
    	String jsonStr = JSONArray.fromObject(manager).toString();
    	pw.write(jsonStr);
    	pw.flush();
    	pw.close();
	}
	
	/**
	 * ����¹���Ա
	 * @throws IOException
	 */
	public void addNewManager() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
    	response.setCharacterEncoding("UTF-8");
    	request.setCharacterEncoding("utf-8");
    	PrintWriter pw = response.getWriter();
    	String account = request.getParameter("account");
    	String password = request.getParameter("password");
    	String name = request.getParameter("name");
    	String address = request.getParameter("address");
    	String tel = request.getParameter("tel");
    	String rank = request.getParameter("rank");
    	//System.out.println(account);
    	System.out.println(account + password + name + address + tel + rank);
    	SQLUtil.addManager(name, rank, tel, address, account, password);
    	pw.write("success");
    	pw.flush();
    	pw.close();
	}
	
	/**
	 * �޸Ĺ���Ա��Ϣ
	 * @throws IOException
	 */
	public void updateManager() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
    	response.setCharacterEncoding("UTF-8");
    	request.setCharacterEncoding("utf-8");
    	PrintWriter pw = response.getWriter();
    	String id = request.getParameter("id");
    	String account = request.getParameter("account");
    	String password = request.getParameter("password");
    	String name = request.getParameter("name");
    	String address = request.getParameter("address");
    	String tel = request.getParameter("tel");
    	String rank = request.getParameter("rank");
    	SQLUtil.updateManager(id, account, password, name, address, tel, rank);
    	pw.write("success");
    	pw.flush();
    	pw.close();
	}
	
	public static void main(String[] args) {
		List<ManagerInfo> managers = SQLUtil.getAllManagers();
    	String jsonStr = JSONArray.fromObject(managers).toString();
    	System.out.println(jsonStr);
	}
}
