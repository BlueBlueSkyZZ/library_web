package action.book;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;

import util.sql.SQLUtil;

import com.opensymphony.xwork2.ActionSupport;

import entity.book.BookDetailInfo;
import entity.manager.ManagerInfo;

public class BookAction extends ActionSupport{

	/**
	 * 添加图书
	 * @throws IOException
	 */
	public void addNewBook() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
    	response.setCharacterEncoding("UTF-8");
    	request.setCharacterEncoding("utf-8");
    	PrintWriter pw = response.getWriter();
    	String isbn = request.getParameter("newISBN");
    	String bookname = request.getParameter("newBookNmae");
    	String category = request.getParameter("newCategory");
    	String publisher = request.getParameter("newPublisher");
    	String version = request.getParameter("newVersion");
    	String bookimg = request.getParameter("newImage");
    	String outline = request.getParameter("newOutline");
    	String bookAbstract = request.getParameter("newAbstract");
    	String guide = request.getParameter("newGuide");
    	String leftnum = request.getParameter("newLeftNum");
    	String price = request.getParameter("newPrice");
    	String author = request.getParameter("newAuthor");
    	
    	SQLUtil.addNewBook(isbn, bookname, category, publisher, version, bookimg, outline, bookAbstract, guide, leftnum, price, author);
    	
    	pw.flush();
    	pw.close();
	}
	
	/**
	 * 分页
	 * @throws IOException
	 */
	public void showLimitBooks() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
    	response.setCharacterEncoding("UTF-8");
    	request.setCharacterEncoding("utf-8");
    	PrintWriter pw = response.getWriter();
    	int showNum = 8;
    	String nowPage = request.getParameter("nowPage");
    	int nowPageInt = Integer.valueOf(nowPage);
    	String category = request.getParameter("category");
    	List<BookDetailInfo> books = SQLUtil.getLimitBooks(0 + nowPageInt*showNum , showNum, category);
    	
    	String jsonStr = JSONArray.fromObject(books).toString();
    	
    	pw.write(jsonStr);
    	
    	pw.flush();
    	pw.close();
	}
	
	/**
	 * 搜索结果
	 * @throws IOException
	 */
	public void showSearchBooks() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
    	response.setCharacterEncoding("UTF-8");
    	request.setCharacterEncoding("utf-8");
    	PrintWriter pw = response.getWriter();
    	
    	String key = request.getParameter("key");
    	List<BookDetailInfo> books = SQLUtil.getSearchBooks(key);
    	String jsonStr = JSONArray.fromObject(books).toString();
    	
    	pw.write(jsonStr);
    	
    	pw.flush();
    	pw.close();
	}
	
	/**
	 * 获取单本书籍信息
	 * @throws IOException
	 */
	public void getSingleBook() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
    	response.setCharacterEncoding("UTF-8");
    	request.setCharacterEncoding("utf-8");
    	PrintWriter pw = response.getWriter();
		String bookno = request.getParameter("bookno");
    	BookDetailInfo book = SQLUtil.getOneBook(bookno);
    	String jsonStr = JSONArray.fromObject(book).toString();
    	pw.write(jsonStr);
    	pw.flush();
    	pw.close();
	}
}
