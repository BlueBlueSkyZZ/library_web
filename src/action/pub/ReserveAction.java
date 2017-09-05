package action.pub;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;

import util.sql.SQLUtil;
import action.pub.wechat.DailyPush;

import com.opensymphony.xwork2.ActionSupport;

import entity.book.BookDetailInfo;
import entity.pub.Order;

public class ReserveAction extends ActionSupport{

	@Override
	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
    	response.setCharacterEncoding("UTF-8");
    	request.setCharacterEncoding("utf-8");
    	PrintWriter pw = response.getWriter();
    	List<Order> orders = SQLUtil.getOrder();
    	String jsonStr = JSONArray.fromObject(orders).toString();
    	pw.write(jsonStr);
    	pw.flush();
    	pw.close();
		return null;
	}
	
	/**
	 * 发送单个提醒
	 * @throws IOException
	 */
	public void sendRemind() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
    	response.setCharacterEncoding("UTF-8");
    	request.setCharacterEncoding("utf-8");
    	PrintWriter pw = response.getWriter();
    	String bookno = request.getParameter("bookno");
    	String weid = request.getParameter("weid");
    	System.out.println(bookno + weid);
    	//TODO 这里的数据库操作
    	//SQLUtil.permitReserve(bookno, weid);
    	recomBookDaily(Integer.valueOf(bookno), weid);
    	pw.write("success");
    	pw.flush();
    	pw.close();
	}
	
	/**
	 * 根据图书号，weid发送图文消息
	 * @param bookno
	 * @param weid
	 */
	private static void recomBookDaily(int bookno, String weid){
		String bookNo = String.valueOf(bookno);
		BookDetailInfo book = SQLUtil.getOneBook(bookNo);
		String bookname = book.getBookname(); // "如果没有遇见你";
		String bookimg = book.getBookimg(); // "http://apis.juhe.cn/goodbook/img/ab7f47d54f7cc742642c6cb058207acd.jpg";
		String url = "http://www.iotesta.com.cn/library/show_singleItem.action?bookno="+bookno;
		String myabstract = book.getBookAbstract();//"法国畅销天王米索最新力作：《如果没有遇见你》";
		DailyPush.sendImgTxtMsg(weid, bookno, bookname, bookimg, url, myabstract);
	}
	
	public static void main(String[] args) {
		recomBookDaily(645, "otE_a1OD_NOC7jvIz_vIe5heSIAA");
	}
}
