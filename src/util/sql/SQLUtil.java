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

	
	//�鼮����
	/**
	 * ��ȡ����ͼ������
	 * @return ��������List
	 */
	public static List<String> getAllBookName()
	{
		Connection conn = null;
		PreparedStatement stmt = null;// ���Ӷ���
		List<String> bookname = new ArrayList<String>();
		try
		{
			conn = DBHelper.getConnection();// ������Ӷ���
			
//			String sql = "INSERT INTO user VALUES(NULL, ?, ?)";// sql���ע���û�
//			stmt = conn.prepareStatement(sql);// �������Ӷ���,ʹ��PreparedStatement�������ӿ�ά����
//			stmt.setString(1, username);
//			stmt.setString(2, password);
//			int i = stmt.executeUpdate();
//			System.out.println("�ɹ������" + i + "��");
			String sql = "SELECT bookname FROM book";
			stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){
				if(rs.getString("bookname") != null){
					bookname.add(rs.getString("bookname"));
				}else{
					System.out.println("�пյ�");
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
	 * ��ȡ����ͼ��ľ�����Ϣ
	 * @return ���ؼ���
	 */
	public static List<BookDetailInfo> getAllBookList(){
		Connection conn = null;
		PreparedStatement stmt = null;// ���Ӷ���
		List<BookDetailInfo> books = new ArrayList<BookDetailInfo>();
		try
		{
			conn = DBHelper.getConnection();// ������Ӷ���
			String sql = "SELECT * FROM book";
			stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){
				//��������
				
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
	 * ��ҳ��ҳ����ͼ��
	 * @param offset ƫ����
	 * @param showNum ��Ѱ��Ŀ
	 * @param category ��Ѱ���
	 * @return
	 */
	public static List<BookDetailInfo> getLimitBooks(int offset, int showNum, String category){
		Connection conn = null;
		PreparedStatement stmt = null;// ���Ӷ���
		List<BookDetailInfo> books = new ArrayList<BookDetailInfo>();
		try
		{
			conn = DBHelper.getConnection();// ������Ӷ���
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
				//��������
				
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
	 * ����ͼ��
	 * @param key
	 * @return
	 */
	public static List<BookDetailInfo> getSearchBooks(String key){
		Connection conn = null;
		PreparedStatement stmt = null;// ���Ӷ���
		List<BookDetailInfo> books = new ArrayList<BookDetailInfo>();
		try
		{
			conn = DBHelper.getConnection();// ������Ӷ���
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
				//��������
				
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
	 * ����µ�ͼ��
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
		PreparedStatement stmt = null;// ���Ӷ���
		try
		{
			conn = DBHelper.getConnection();// ������Ӷ���
			String sql = "INSERT INTO book (isbn, bookname, category, publisher, version, bookimg, outline, abstract, guide, leftnum, price, author, readingnum, score) " +
					"VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, '0', '0')";// sql���ע���û�
			stmt = conn.prepareStatement(sql);// �������Ӷ���,ʹ��PreparedStatement�������ӿ�ά����
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
			System.out.println("�����" + i + "��");
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		finally{
			release(stmt);
		}
	}
	
	/**
	 * ��ȡ����ͼ����Ϣ
	 * @param bookno
	 * @return
	 */
	public static BookDetailInfo getOneBook(String bookno){
		Connection conn = null;
		PreparedStatement stmt = null;// ���Ӷ���
		BookDetailInfo book = new BookDetailInfo();
		try
		{
			conn = DBHelper.getConnection();// ������Ӷ���
			
			String sql = "SELECT * FROM book WHERE bookno = '" + bookno + "'";
					
			//System.out.println(sql);		
			stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){
				//��������
				
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
	
	//�û�����
	/**
	 * ��ȡ�����û���Ϣ
	 * @return �û���Ϣ��List
	 */
	public static List<UserInfo> getAllUsers(){
		Connection conn = null;
		PreparedStatement stmt = null;// ���Ӷ���
		List<UserInfo> users = new ArrayList<UserInfo>();
		try
		{
			conn = DBHelper.getConnection();// ������Ӷ���
			String sql = "SELECT * FROM user";
			stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){
				//��������
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
	 * ��ѯ�û����ڽ��ĵ��鼮
	 * @param weid
	 * @return �鼮����
	 */
	public static List<BorrowBook> getBorrowing(String weid){
		Connection conn = null;
		PreparedStatement stmt = null;// ���Ӷ���
		List<BorrowBook> books = new ArrayList<BorrowBook>();
		try
		{
			conn = DBHelper.getConnection();// ������Ӷ���
			String sql = "SELECT book.bookimg, book.bookname, borrow.borrowtime FROM book, borrow" +
					" WHERE 1 = 1 " +
					" AND borrow.weid = '" + weid + "'" + 
					" AND book.bookno = borrow.bookno " + 
					" AND borrow.returntime IS NULL";
			//System.out.println(sql);
			stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){
				//��������
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
	 * ��ѯ�û��Ѿ����ĵ��鼮
	 * @param weid
	 * @return
	 */
	public static List<BorrowedBook> getBorrowed(String weid){
		Connection conn = null;
		PreparedStatement stmt = null;// ���Ӷ���
		List<BorrowedBook> books = new ArrayList<BorrowedBook>();
		try
		{
			conn = DBHelper.getConnection();// ������Ӷ���
			String sql = "SELECT book.bookimg, book.bookname, borrow.borrowtime, borrow.returntime FROM book, borrow" +
					" WHERE 1 = 1 " +
					" AND borrow.weid = '" + weid + "'" + 
					" AND book.bookno = borrow.bookno " + 
					" AND borrow.returntime IS NOT NULL";
			//System.out.println(sql);
			stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){
				//��������
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
	 * ��ȡ���н��ĵ��鼮�����ڽ���Ѿ��黹��
	 * @param weid
	 * @return
	 */
	public static List<BorrowedBook> getAllBorrow(String weid){
		
		Connection conn = null;
		PreparedStatement stmt = null;// ���Ӷ���
		List<BorrowedBook> books = new ArrayList<BorrowedBook>();
		try
		{
			conn = DBHelper.getConnection();// ������Ӷ���
			String sql = "SELECT book.bookimg, book.bookname, borrow.borrowtime, borrow.returntime FROM book, borrow" +
					" WHERE 1 = 1 " +
					" AND borrow.weid = '" + weid + "'" + 
					" AND book.bookno = borrow.bookno " +
					" ORDER BY borrow.returntime";
			//System.out.println(sql);
			stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){
				//��������
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
	 * ��ȡ���ж�����
	 * @return
	 */
	public static List<String> getAllOrderId(){
		Connection conn = null;
		PreparedStatement stmt = null;// ���Ӷ���
		List<String> orders = new ArrayList<String>();
		try
		{
			conn = DBHelper.getConnection();// ������Ӷ���
			String sql = "SELECT subscribenum FROM paylist";
			stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){
				//��������
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
	
	
	//����Ա����
	/**
	 * ��ȡ���й���Ա��Ϣ
	 * @return ����Ա��Ϣ��List
	 */
	public static List<ManagerInfo> getAllManagers(){
		Connection conn = null;
		PreparedStatement stmt = null;// ���Ӷ���
		List<ManagerInfo> managers = new ArrayList<ManagerInfo>();
		try
		{
			conn = DBHelper.getConnection();// ������Ӷ���
			String sql = "SELECT * FROM admin";
			stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){
				//��������
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
	 * ��ȡ��������Ա��Ϣ
	 * @param id ����Աid
	 * @return
	 */
	public static ManagerInfo getOneManager(String id){
		Connection conn = null;
		PreparedStatement stmt = null;// ���Ӷ���
		ManagerInfo manager = new ManagerInfo();
		try
		{
			conn = DBHelper.getConnection();// ������Ӷ���
			String sql = "SELECT * FROM admin WHERE 1 = 1 " + 
			 "AND id = '" + id + "'";
			System.out.println(sql);
			stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){
				//��������
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
	 * ��ӹ���Ա
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
		PreparedStatement stmt = null;// ���Ӷ���
		Map<String, String> rankMap = manageRank(rank);//��ȡȨ��Map
		try
		{
			conn = DBHelper.getConnection();// ������Ӷ���
			String sql = "INSERT INTO admin (name, rank, manage_admin, manage_data, manage_scan, tel, address, account, password) " +
					"VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";// sql���ע���û�
			stmt = conn.prepareStatement(sql);// �������Ӷ���,ʹ��PreparedStatement�������ӿ�ά����
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
			System.out.println("�ɹ������" + i + "��");
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		finally{
			release(stmt);
		}

	}
	
	/**
	 * �޸Ĺ���Ա��Ϣ
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
		PreparedStatement stmt = null;// ���Ӷ���
		Map<String, String> rankMap = manageRank(rank);//��ȡȨ��Map
		try
		{
			conn = DBHelper.getConnection();// ������Ӷ���
			String sql = "UPDATE admin SET name=?, rank=?, manage_admin=?, manage_data=?, manage_scan=?, tel=?," +
					"address=?, account=?, password=? " + 
					"WHERE id = '" + id + "'";// sql���ע���û�
			stmt = conn.prepareStatement(sql);// �������Ӷ���,ʹ��PreparedStatement�������ӿ�ά����
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
			System.out.println("�ɹ��޸���" + i + "��");
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		finally{
			release(stmt);
		}
	}
	
	/**
	 * ɾ������Ա
	 * @param id
	 */
	public static void deteleManager(String id){
		Connection conn = null;
		PreparedStatement stmt = null;// ���Ӷ���
		try
		{
			conn = DBHelper.getConnection();// ������Ӷ���
			String sql = "DELETE FROM admin WHERE id = '" + id + "'";
			stmt = conn.prepareStatement(sql);// �������Ӷ���,ʹ��PreparedStatement�������ӿ�ά����
			
			int i = stmt.executeUpdate();
			System.out.println("�ɹ�ɾ����" + i + "��");
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		finally{
			release(stmt);
		}
	}
	
	
	/**
	 * ����rank�ж�Ȩ�� 
	 * @param rank
	 * @return Map����
	 */
	private static Map<String, String> manageRank(String rank){
		Map<String, String> map = new HashMap<String, String>();
		System.out.println(rank);
		if(rank.equals("��������Ա")){
			map.put("manage_admin", "N");
			map.put("manage_data", "N");
			map.put("manage_scan", "Y");
		}else if(rank.equals("�м�����Ա")){
			map.put("manage_admin", "N");
			map.put("manage_scan", "Y");
			map.put("manage_data", "Y");
		}else if(rank.equals("�߼�����Ա")){
			map.put("manage_scan", "Y");
			map.put("manage_data", "Y");
			map.put("manage_admin", "Y");
		}
		return map;
	}
	
	//���ںŹ���
	/**
	 * ��ȡ����
	 * @param num
	 * @return
	 */
	public static Comment getComment(String num){
		Connection conn = null;
		PreparedStatement stmt = null;// ���Ӷ���
		Comment comment = new Comment();
		try
		{
			conn = DBHelper.getConnection();// ������Ӷ���
			String sql = "select bookcomment.comment, bookcomment.time, " +
					"user.weid, user.wename, user.username, bookcomment.commentid, book.bookname " +
					"from bookcomment,user,book " +
					"where bookcomment.status != 'Y' and bookcomment.weid = user.weid and book.bookno = bookcomment.bookno " +
					"limit " + num + ",1;";
			stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){
				//��������
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
	 * �������ͨ��
	 * @param commentid
	 */
	public static void updateComment(String commentid){
		Connection conn = null;
		PreparedStatement stmt = null;// ���Ӷ���
		try
		{
			conn = DBHelper.getConnection();// ������Ӷ���
			String sql = "update bookcomment set status = 'Y' " +
					"where commentid = '" + commentid + "';";
			stmt = conn.prepareStatement(sql);// �������Ӷ���,ʹ��PreparedStatement�������ӿ�ά����
			
			int i = stmt.executeUpdate();
			System.out.println("�ɹ��޸���" + i + "��");
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		finally{
			release(stmt);
		}
	}
	
	/**
	 * ɾ������
	 * @param commentid
	 */
	public static void deleteComment(String commentid){
		Connection conn = null;
		PreparedStatement stmt = null;// ���Ӷ���
		try
		{
			conn = DBHelper.getConnection();// ������Ӷ���
			String sql = "delete from bookcomment " +
					"where commentid = '" + commentid + "';";
			stmt = conn.prepareStatement(sql);// �������Ӷ���,ʹ��PreparedStatement�������ӿ�ά����
			
			int i = stmt.executeUpdate();
			System.out.println("�ɹ�ɾ����" + i + "��");
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		finally{
			release(stmt);
		}
	}
	
	/**
	 * ��ȡ����
	 * @param notice_id
	 * @return
	 */
	public static Notice getNotice(String notice_id){
		Connection conn = null;
		PreparedStatement stmt = null;// ���Ӷ���
		Notice notice = new Notice();
		try
		{
			conn = DBHelper.getConnection();// ������Ӷ���
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
	 * ���¹���
	 * @param notice_id
	 * @param time
	 * @param content
	 * @param img
	 */
	public static void updateNotice(String category, String title, String notice_id, String time, String content, String img){
		Connection conn = null;
		PreparedStatement stmt = null;// ���Ӷ���
		try
		{
			conn = DBHelper.getConnection();// ������Ӷ���
			String sql = "UPDATE announcement SET category=?, title=? ,time=?, content=?, img=?" + 
					"WHERE anno_id = '" + notice_id + "'";// sql���ע���û�
			stmt = conn.prepareStatement(sql);// �������Ӷ���,ʹ��PreparedStatement�������ӿ�ά����
			stmt.setString(1, category);
			stmt.setString(2, title);
			stmt.setString(3, time);
			stmt.setString(4, content);
			stmt.setString(5, img);
			
			int i = stmt.executeUpdate();
			System.out.println("�ɹ��޸���" + i + "��");
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		finally{
			release(stmt);
		}
	}
	
	/**
	 * �ͷ����ݼ�����
	 * @param stmt
	 */
	private static void release(PreparedStatement stmt){
		//�ͷ����ݼ�����
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
		//�ͷ�������
		if(stmt  != null)//�ͷ��ڴ�
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
