package action.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;

import util.sql.SQLUtil;

import com.opensymphony.xwork2.ActionSupport;

import entity.user.BorrowBook;
import entity.user.BorrowedBook;

public class BorrowAction extends ActionSupport{

	/**
	 * 获取正在借阅的书籍
	 */
	@Override
	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
    	response.setCharacterEncoding("UTF-8");
    	request.setCharacterEncoding("utf-8");
    	PrintWriter pw = response.getWriter();
    	String weid = request.getParameter("weid");
		List<BorrowBook> borrowingBook = SQLUtil.getBorrowing(weid);
		String jsonStr = JSONArray.fromObject(borrowingBook).toString();
    	pw.write(jsonStr);
    	pw.flush();
    	pw.close();
		return null;
	}
	/**
	 * 获取已经借阅的书籍
	 * @throws IOException
	 */
	public void getBorrowed() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
    	response.setCharacterEncoding("UTF-8");
    	request.setCharacterEncoding("utf-8");
    	PrintWriter pw = response.getWriter();
    	String weid = request.getParameter("weid");
    	List<BorrowedBook> borrowedBook = SQLUtil.getBorrowed(weid);
    	String jsonStr = JSONArray.fromObject(borrowedBook).toString();
    	pw.write(jsonStr);
    	pw.flush();
    	pw.close();
	}
	
	/**
	 * 获取所有借阅的书籍
	 * @throws IOException 
	 */
	public void getAllBorrowed() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
    	response.setCharacterEncoding("UTF-8");
    	request.setCharacterEncoding("utf-8");
    	PrintWriter pw = response.getWriter();
    	String weid = request.getParameter("weid");
    	List<BorrowedBook> borrowedBooks = SQLUtil.getAllBorrow(weid);
    	String jsonStr = JSONArray.fromObject(borrowedBooks).toString();
    	pw.write(jsonStr);
    	pw.flush();
    	pw.close();
	}
}
