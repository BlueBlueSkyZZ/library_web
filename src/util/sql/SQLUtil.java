package util.sql;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import entity.user.BorrowBook;
import entity.user.BorrowedBook;
import entity.book.BookDetailInfo;
import entity.manager.ManagerInfo;
import entity.pub.Comment;
import entity.pub.Notice;
import entity.user.UserInfo;

public class SQLUtil {

	
	//书籍管理
	/**
	 * 获取所有图书名称
	 * @return 返回书名List
	 */
	public static List<String> getAllBookName()
	{
		Connection conn = null;
		PreparedStatement stmt = null;// 连接对象
		List<String> bookname = new ArrayList<String>();
		try
		{
			conn = DBHelper.getConnection();// 获得连接对象
			
//			String sql = "INSERT INTO user VALUES(NULL, ?, ?)";// sql语句注册用户
//			stmt = conn.prepareStatement(sql);// 创建连接对象,使用PreparedStatement方法增加可维护性
//			stmt.setString(1, username);
//			stmt.setString(2, password);
//			int i = stmt.executeUpdate();
//			System.out.println("成功添加了" + i + "行");
			String sql = "SELECT bookname FROM book";
			stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){
				if(rs.getString("bookname") != null){
					bookname.add(rs.getString("bookname"));
				}else{
					System.out.println("有空的");
				}
			}
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		finally{
			release(stmt);
		}
		return bookname;
	}
	
	/**
	 * 获取所有图书的具体信息
	 * @return 返回集合
	 */
	public static List<BookDetailInfo> getAllBookList(){
		Connection conn = null;
		PreparedStatement stmt = null;// 连接对象
		List<BookDetailInfo> books = new ArrayList<BookDetailInfo>();
		try
		{
			conn = DBHelper.getConnection();// 获得连接对象
			String sql = "SELECT * FROM book";
			stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){
				//创建对象
				
				BookDetailInfo bookDetailInfo = new BookDetailInfo();
				
				bookDetailInfo.setBookno(rs.getString("bookno"));
				bookDetailInfo.setIsbn(rs.getString("isbn"));
				bookDetailInfo.setBookname(rs.getString("bookname"));
				bookDetailInfo.setCategory(rs.getString("category"));
				bookDetailInfo.setPublisher(rs.getString("publisher"));
				bookDetailInfo.setVersion(rs.getString("version"));
				bookDetailInfo.setBookimg(rs.getString("bookimg"));
				bookDetailInfo.setOutline(rs.getString("outline"));
				bookDetailInfo.setBookAbstract(rs.getString("abstract"));
				bookDetailInfo.setGuide(rs.getString("guide"));
				bookDetailInfo.setLeftnum(rs.getString("leftnum"));
				bookDetailInfo.setPrice(rs.getString("price"));
				bookDetailInfo.setAuthor(rs.getString("author"));
				bookDetailInfo.setReadingnum(rs.getString("readingnum"));
				bookDetailInfo.setScore(rs.getString("score"));
				
				books.add(bookDetailInfo);
			}
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		finally{
			release(stmt);
		}
		return books;
	}
	
	/**
	 * 首页分页加载图书
	 * @param offset 偏移量
	 * @param showNum 搜寻数目
	 * @param category 搜寻类别
	 * @return
	 */
	public static List<BookDetailInfo> getLimitBooks(int offset, int showNum, String category){
		Connection conn = null;
		PreparedStatement stmt = null;// 连接对象
		List<BookDetailInfo> books = new ArrayList<BookDetailInfo>();
		try
		{
			conn = DBHelper.getConnection();// 获得连接对象
			String require = " WHERE 1 = 1 ";
			if(!category.equals("")){
				require = require + " AND category LIKE '%" + category + "%' " ; 
			}
			String sql = "SELECT * FROM book " +
					"" + require + 
					" LIMIT " + offset + "," + showNum;
			
			//System.out.println(sql);		
			stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){
				//创建对象
				
				BookDetailInfo bookDetailInfo = new BookDetailInfo();
				
				bookDetailInfo.setBookno(rs.getString("bookno"));
				bookDetailInfo.setIsbn(rs.getString("isbn"));
				bookDetailInfo.setBookname(rs.getString("bookname"));
				bookDetailInfo.setCategory(rs.getString("category"));
				bookDetailInfo.setPublisher(rs.getString("publisher"));
				bookDetailInfo.setVersion(rs.getString("version"));
				bookDetailInfo.setBookimg(rs.getString("bookimg"));
				bookDetailInfo.setOutline(rs.getString("outline"));
				bookDetailInfo.setBookAbstract(rs.getString("abstract"));
				bookDetailInfo.setGuide(rs.getString("guide"));
				bookDetailInfo.setLeftnum(rs.getString("leftnum"));
				bookDetailInfo.setPrice(rs.getString("price"));
				bookDetailInfo.setAuthor(rs.getString("author"));
				bookDetailInfo.setReadingnum(rs.getString("readingnum"));
				bookDetailInfo.setScore(rs.getString("score"));
				
				books.add(bookDetailInfo);
			}
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		finally{
			release(stmt);
		}
		return books;
	}
	
	/**
	 * 搜索图书
	 * @param key
	 * @return
	 */
	public static List<BookDetailInfo> getSearchBooks(String key){
		Connection conn = null;
		PreparedStatement stmt = null;// 连接对象
		List<BookDetailInfo> books = new ArrayList<BookDetailInfo>();
		try
		{
			conn = DBHelper.getConnection();// 获得连接对象
			String require = " WHERE 1 = 1 ";
			if(!key.equals("")){
				require = require + " AND bookname LIKE '%" + key + "%' " ; 
			}
			String sql = "SELECT * FROM book " +
					 require ;
			
			//System.out.println(sql);		
			stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){
				//创建对象
				
				BookDetailInfo bookDetailInfo = new BookDetailInfo();
				
				bookDetailInfo.setBookno(rs.getString("bookno"));
				bookDetailInfo.setIsbn(rs.getString("isbn"));
				bookDetailInfo.setBookname(rs.getString("bookname"));
				bookDetailInfo.setCategory(rs.getString("category"));
				bookDetailInfo.setPublisher(rs.getString("publisher"));
				bookDetailInfo.setVersion(rs.getString("version"));
				bookDetailInfo.setBookimg(rs.getString("bookimg"));
				bookDetailInfo.setOutline(rs.getString("outline"));
				bookDetailInfo.setBookAbstract(rs.getString("abstract"));
				bookDetailInfo.setGuide(rs.getString("guide"));
				bookDetailInfo.setLeftnum(rs.getString("leftnum"));
				bookDetailInfo.setPrice(rs.getString("price"));
				bookDetailInfo.setAuthor(rs.getString("author"));
				bookDetailInfo.setReadingnum(rs.getString("readingnum"));
				bookDetailInfo.setScore(rs.getString("score"));
				
				books.add(bookDetailInfo);
			}
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		finally{
			release(stmt);
		}
		return books;
	}
	/**
	 * 添加新的图书
	 * @param isbn
	 * @param bookname
	 * @param category
	 * @param publisher
	 * @param version
	 * @param bookimg
	 * @param outline
	 * @param bookAbstract
	 * @param guide
	 * @param leftnum
	 * @param price
	 * @param author
	 */
	public static void addNewBook(String isbn, String bookname, String category, String publisher, String version,
			String bookimg, String outline, String bookAbstract, String guide, String leftnum, String price, String author){
		Connection conn = null;
		PreparedStatement stmt = null;// 连接对象
		try
		{
			conn = DBHelper.getConnection();// 获得连接对象
			String sql = "INSERT INTO book (isbn, bookname, category, publisher, version, bookimg, outline, abstract, guide, leftnum, price, author, readingnum, score) " +
					"VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, '0', '0')";// sql语句注册用户
			stmt = conn.prepareStatement(sql);// 创建连接对象,使用PreparedStatement方法增加可维护性
			stmt.setString(1, isbn);
			stmt.setString(2, bookname);
			stmt.setString(3, category);
			stmt.setString(4, publisher);
			stmt.setString(5, version);
			stmt.setString(6, bookimg);
			stmt.setString(7, outline);
			stmt.setString(8, bookAbstract);
			stmt.setString(9, guide);
			stmt.setString(10, leftnum);
			stmt.setString(11, price);
			stmt.setString(12, author);
			int i = stmt.executeUpdate();
			System.out.println("添加了" + i + "行");
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		finally{
			release(stmt);
		}
	}
	
	/**
	 * 获取单本图书信息
	 * @param bookno
	 * @return
	 */
	public static BookDetailInfo getOneBook(String bookno){
		Connection conn = null;
		PreparedStatement stmt = null;// 连接对象
		BookDetailInfo book = new BookDetailInfo();
		try
		{
			conn = DBHelper.getConnection();// 获得连接对象
			
			String sql = "SELECT * FROM book WHERE bookno = '" + bookno + "'";
					
			//System.out.println(sql);		
			stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){
				//创建对象
				
				book.setBookno(rs.getString("bookno"));
				book.setIsbn(rs.getString("isbn"));
				book.setBookname(rs.getString("bookname"));
				book.setCategory(rs.getString("category"));
				book.setPublisher(rs.getString("publisher"));
				book.setVersion(rs.getString("version"));
				book.setBookimg(rs.getString("bookimg"));
				book.setOutline(rs.getString("outline"));
				book.setBookAbstract(rs.getString("abstract"));
				book.setGuide(rs.getString("guide"));
				book.setLeftnum(rs.getString("leftnum"));
				book.setPrice(rs.getString("price"));
				book.setAuthor(rs.getString("author"));
				book.setReadingnum(rs.getString("readingnum"));
				book.setScore(rs.getString("score"));
				
			}
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		finally{
			release(stmt);
		}
		return book;
		
	}
	
	//用户管理
	/**
	 * 获取所有用户信息
	 * @return 用户信息集List
	 */
	public static List<UserInfo> getAllUsers(){
		Connection conn = null;
		PreparedStatement stmt = null;// 连接对象
		List<UserInfo> users = new ArrayList<UserInfo>();
		try
		{
			conn = DBHelper.getConnection();// 获得连接对象
			String sql = "SELECT * FROM user";
			stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){
				//创建对象
				UserInfo user = new UserInfo();
				
				user.setOpenid(rs.getString("weid"));
				user.setTel(rs.getString("phone"));
				user.setNickname(rs.getString("wename"));
				user.setHeadimgurl(rs.getString("weimg"));
				user.setIdCard(rs.getString("idcard"));
				user.setRealName(rs.getString("username"));
				
				users.add(user);
			}
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		finally{
			release(stmt);
		}
		return users;
	}
	
	/**
	 * 查询用户正在借阅的书籍
	 * @param weid
	 * @return 书籍集合
	 */
	public static List<BorrowBook> getBorrowing(String weid){
		Connection conn = null;
		PreparedStatement stmt = null;// 连接对象
		List<BorrowBook> books = new ArrayList<BorrowBook>();
		try
		{
			conn = DBHelper.getConnection();// 获得连接对象
			String sql = "SELECT book.bookimg, book.bookname, borrow.borrowtime FROM book, borrow" +
					" WHERE 1 = 1 " +
					" AND borrow.weid = '" + weid + "'" + 
					" AND book.bookno = borrow.bookno " + 
					" AND borrow.returntime IS NULL";
			//System.out.println(sql);
			stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){
				//创建对象
				BorrowBook book = new BorrowBook();
				
				book.setBookImg(rs.getString(1));
				book.setBookName(rs.getString(2));
				book.setBorrowTime(rs.getString(3));
				
				books.add(book);
			}
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		finally{
			release(stmt);
		}
		return books;
		
	}
	
	/**
	 * 查询用户已经借阅的书籍
	 * @param weid
	 * @return
	 */
	public static List<BorrowedBook> getBorrowed(String weid){
		Connection conn = null;
		PreparedStatement stmt = null;// 连接对象
		List<BorrowedBook> books = new ArrayList<BorrowedBook>();
		try
		{
			conn = DBHelper.getConnection();// 获得连接对象
			String sql = "SELECT book.bookimg, book.bookname, borrow.borrowtime, borrow.returntime FROM book, borrow" +
					" WHERE 1 = 1 " +
					" AND borrow.weid = '" + weid + "'" + 
					" AND book.bookno = borrow.bookno " + 
					" AND borrow.returntime IS NOT NULL";
			//System.out.println(sql);
			stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){
				//创建对象
				BorrowedBook book = new BorrowedBook();
				
				book.setBookImg(rs.getString(1));
				book.setBookName(rs.getString(2));
				book.setBorrowTime(rs.getString(3));
				book.setReturnTime(rs.getString(4));
				
				books.add(book);
			}
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		finally{
			release(stmt);
		}
		return books;
	}
	
	/**
	 * 获取所有借阅的书籍包括在借和已经归还的
	 * @param weid
	 * @return
	 */
	public static List<BorrowedBook> getAllBorrow(String weid){
		
		Connection conn = null;
		PreparedStatement stmt = null;// 连接对象
		List<BorrowedBook> books = new ArrayList<BorrowedBook>();
		try
		{
			conn = DBHelper.getConnection();// 获得连接对象
			String sql = "SELECT book.bookimg, book.bookname, borrow.borrowtime, borrow.returntime FROM book, borrow" +
					" WHERE 1 = 1 " +
					" AND borrow.weid = '" + weid + "'" + 
					" AND book.bookno = borrow.bookno " +
					" ORDER BY borrow.returntime";
			//System.out.println(sql);
			stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){
				//创建对象
				BorrowedBook book = new BorrowedBook();
				
				book.setBookImg(rs.getString(1));
				book.setBookName(rs.getString(2));
				book.setBorrowTime(rs.getString(3));
				book.setReturnTime(rs.getString(4));
				
				books.add(book);
			}
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		finally{
			release(stmt);
		}
		return books;
	}
	
	/**
	 * 获取所有订单号
	 * @return
	 */
	public static List<String> getAllOrderId(){
		Connection conn = null;
		PreparedStatement stmt = null;// 连接对象
		List<String> orders = new ArrayList<String>();
		try
		{
			conn = DBHelper.getConnection();// 获得连接对象
			String sql = "SELECT subscribenum FROM paylist";
			stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){
				//创建对象
				orders.add(rs.getString(1));
			}
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		finally{
			release(stmt);
		}
		return orders;
	}
	
	
	//管理员管理
	/**
	 * 获取所有管理员信息
	 * @return 管理员信息集List
	 */
	public static List<ManagerInfo> getAllManagers(){
		Connection conn = null;
		PreparedStatement stmt = null;// 连接对象
		List<ManagerInfo> managers = new ArrayList<ManagerInfo>();
		try
		{
			conn = DBHelper.getConnection();// 获得连接对象
			String sql = "SELECT * FROM admin";
			stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){
				//创建对象
				ManagerInfo managerInfo = new ManagerInfo();
				
				managerInfo.setId(rs.getString("id"));
				managerInfo.setName(rs.getString("name"));
				managerInfo.setRank(rs.getString("rank"));
				managerInfo.setManage_admin(rs.getString("manage_admin"));
				managerInfo.setManage_data(rs.getString("manage_data"));
				managerInfo.setManage_scan(rs.getString("manage_scan"));
				managerInfo.setTel(rs.getString("tel"));
				managerInfo.setAddress(rs.getString("address"));
				managerInfo.setAccount(rs.getString("account"));
				managerInfo.setPassword(rs.getString("password"));
				
				managers.add(managerInfo);
			}
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		finally{
			release(stmt);
		}
		return managers;
	}
	
	/**
	 * 获取单个管理员信息
	 * @param id 管理员id
	 * @return
	 */
	public static ManagerInfo getOneManager(String id){
		Connection conn = null;
		PreparedStatement stmt = null;// 连接对象
		ManagerInfo manager = new ManagerInfo();
		try
		{
			conn = DBHelper.getConnection();// 获得连接对象
			String sql = "SELECT * FROM admin WHERE 1 = 1 " + 
			 "AND id = '" + id + "'";
			System.out.println(sql);
			stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){
				//创建对象
				manager.setId(rs.getString("id"));
				manager.setName(rs.getString("name"));
				manager.setRank(rs.getString("rank"));
				manager.setManage_admin(rs.getString("manage_admin"));
				manager.setManage_data(rs.getString("manage_data"));
				manager.setManage_scan(rs.getString("manage_scan"));
				manager.setTel(rs.getString("tel"));
				manager.setAddress(rs.getString("address"));
				manager.setAccount(rs.getString("account"));
				manager.setPassword(rs.getString("password"));
			}
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		finally{
			release(stmt);
		}
		
		return manager;
	}
	
	/**
	 * 添加管理员
	 * @param name
	 * @param rank
	 * @param tel
	 * @param address
	 * @param account
	 * @param password
	 */
	public static void addManager(String name, String rank,
			String tel, String address, String account, String password){
		Connection conn = null;
		PreparedStatement stmt = null;// 连接对象
		Map<String, String> rankMap = manageRank(rank);//获取权限Map
		try
		{
			conn = DBHelper.getConnection();// 获得连接对象
			String sql = "INSERT INTO admin (name, rank, manage_admin, manage_data, manage_scan, tel, address, account, password) " +
					"VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";// sql语句注册用户
			stmt = conn.prepareStatement(sql);// 创建连接对象,使用PreparedStatement方法增加可维护性
			stmt.setString(1, name);
			stmt.setString(2, rank);
			stmt.setString(3, rankMap.get("manage_admin"));
			stmt.setString(4, rankMap.get("manage_data"));
			stmt.setString(5, rankMap.get("manage_scan"));
			stmt.setString(6, tel);
			stmt.setString(7, address);
			stmt.setString(8, account);
			stmt.setString(9, password);
			int i = stmt.executeUpdate();
			System.out.println("成功添加了" + i + "行");
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		finally{
			release(stmt);
		}

	}
	
	/**
	 * 修改管理员信息
	 * @param id
	 * @param account
	 * @param password
	 * @param name
	 * @param address
	 * @param tel
	 * @param rank
	 */
	public static void updateManager(String id, String account, String password, String name,
			String address, String tel, String rank){
		Connection conn = null;
		PreparedStatement stmt = null;// 连接对象
		Map<String, String> rankMap = manageRank(rank);//获取权限Map
		try
		{
			conn = DBHelper.getConnection();// 获得连接对象
			String sql = "UPDATE admin SET name=?, rank=?, manage_admin=?, manage_data=?, manage_scan=?, tel=?," +
					"address=?, account=?, password=? " + 
					"WHERE id = '" + id + "'";// sql语句注册用户
			stmt = conn.prepareStatement(sql);// 创建连接对象,使用PreparedStatement方法增加可维护性
			stmt.setString(1, name);
			stmt.setString(2, rank);
			stmt.setString(3, rankMap.get("manage_admin"));
			stmt.setString(4, rankMap.get("manage_data"));
			stmt.setString(5, rankMap.get("manage_scan"));
			stmt.setString(6, tel);
			stmt.setString(7, address);
			stmt.setString(8, account);
			stmt.setString(9, password);
			int i = stmt.executeUpdate();
			System.out.println("成功修改了" + i + "行");
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		finally{
			release(stmt);
		}
	}
	
	/**
	 * 删除管理员
	 * @param id
	 */
	public static void deteleManager(String id){
		Connection conn = null;
		PreparedStatement stmt = null;// 连接对象
		try
		{
			conn = DBHelper.getConnection();// 获得连接对象
			String sql = "DELETE FROM admin WHERE id = '" + id + "'";
			stmt = conn.prepareStatement(sql);// 创建连接对象,使用PreparedStatement方法增加可维护性
			
			int i = stmt.executeUpdate();
			System.out.println("成功删除了" + i + "行");
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		finally{
			release(stmt);
		}
	}
	
	
	/**
	 * 根据rank判断权限 
	 * @param rank
	 * @return Map集合
	 */
	private static Map<String, String> manageRank(String rank){
		Map<String, String> map = new HashMap<String, String>();
		System.out.println(rank);
		if(rank.equals("初级管理员")){
			map.put("manage_admin", "N");
			map.put("manage_data", "N");
			map.put("manage_scan", "Y");
		}else if(rank.equals("中级管理员")){
			map.put("manage_admin", "N");
			map.put("manage_scan", "Y");
			map.put("manage_data", "Y");
		}else if(rank.equals("高级管理员")){
			map.put("manage_scan", "Y");
			map.put("manage_data", "Y");
			map.put("manage_admin", "Y");
		}
		return map;
	}
	
	//公众号管理
	/**
	 * 获取评论
	 * @param num
	 * @return
	 */
	public static Comment getComment(String num){
		Connection conn = null;
		PreparedStatement stmt = null;// 连接对象
		Comment comment = new Comment();
		try
		{
			conn = DBHelper.getConnection();// 获得连接对象
			String sql = "select bookcomment.comment, bookcomment.time, " +
					"user.weid, user.wename, user.username, bookcomment.commentid, book.bookname " +
					"from bookcomment,user,book " +
					"where bookcomment.status != 'Y' and bookcomment.weid = user.weid and book.bookno = bookcomment.bookno " +
					"limit " + num + ",1;";
			stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){
				//创建对象
				comment = new Comment();
				comment.setComment(rs.getString(1));
				comment.setTime(rs.getString(2));
				comment.setWeid(rs.getString(3));
				comment.setWename(rs.getString(4));
				comment.setRealname(rs.getString(5));
				comment.setCommentid(rs.getString(6));
				comment.setBookname(rs.getString(7));
			}
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		finally{
			release(stmt);
		}
	
		return comment;
	}
	
	/**
	 * 审核评论通过
	 * @param commentid
	 */
	public static void updateComment(String commentid){
		Connection conn = null;
		PreparedStatement stmt = null;// 连接对象
		try
		{
			conn = DBHelper.getConnection();// 获得连接对象
			String sql = "update bookcomment set status = 'Y' " +
					"where commentid = '" + commentid + "';";
			stmt = conn.prepareStatement(sql);// 创建连接对象,使用PreparedStatement方法增加可维护性
			
			int i = stmt.executeUpdate();
			System.out.println("成功修改了" + i + "行");
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		finally{
			release(stmt);
		}
	}
	
	/**
	 * 删除评论
	 * @param commentid
	 */
	public static void deleteComment(String commentid){
		Connection conn = null;
		PreparedStatement stmt = null;// 连接对象
		try
		{
			conn = DBHelper.getConnection();// 获得连接对象
			String sql = "delete from bookcomment " +
					"where commentid = '" + commentid + "';";
			stmt = conn.prepareStatement(sql);// 创建连接对象,使用PreparedStatement方法增加可维护性
			
			int i = stmt.executeUpdate();
			System.out.println("成功删除了" + i + "行");
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		finally{
			release(stmt);
		}
	}
	
	/**
	 * 获取公告
	 * @param notice_id
	 * @return
	 */
	public static Notice getNotice(String notice_id){
		Connection conn = null;
		PreparedStatement stmt = null;// 连接对象
		Notice notice = new Notice();
		try
		{
			conn = DBHelper.getConnection();// 获得连接对象
			String sql = "SELECT * FROM announcement WHERE anno_id = '" + notice_id + "'";
			
			stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			while(rs.next()){
				
				notice.setAnno_id(notice_id);
				notice.setCategory(rs.getString("category"));
				notice.setContent(rs.getString("content"));
				notice.setTitle(rs.getString("title"));
				notice.setTime(rs.getString("time"));
				notice.setImg(rs.getString("img"));
			}
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		finally{
			release(stmt);
		}
		return notice;
	}
	
	/**
	 * 更新公告
	 * @param notice_id
	 * @param time
	 * @param content
	 * @param img
	 */
	public static void updateNotice(String category, String title, String notice_id, String time, String content, String img){
		Connection conn = null;
		PreparedStatement stmt = null;// 连接对象
		try
		{
			conn = DBHelper.getConnection();// 获得连接对象
			String sql = "UPDATE announcement SET category=?, title=? ,time=?, content=?, img=?" + 
					"WHERE anno_id = '" + notice_id + "'";// sql语句注册用户
			stmt = conn.prepareStatement(sql);// 创建连接对象,使用PreparedStatement方法增加可维护性
			stmt.setString(1, category);
			stmt.setString(2, title);
			stmt.setString(3, time);
			stmt.setString(4, content);
			stmt.setString(5, img);
			
			int i = stmt.executeUpdate();
			System.out.println("成功修改了" + i + "行");
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		finally{
			release(stmt);
		}
	}
	
	/**
	 * 释放数据集对象
	 * @param stmt
	 */
	private static void release(PreparedStatement stmt){
		//释放数据集对象
		if(stmt  != null)
		{
			try
			{
				stmt.close();
				stmt = null;
			}
			catch(Exception ex)
			{
				ex.printStackTrace();
			}
		}
		//释放语句对象
		if(stmt  != null)//释放内存
		{
			try
			{
				stmt.close();
				stmt = null;
			}
			catch(Exception ex)
			{
				ex.printStackTrace();
			}
		}
	}
	
}
