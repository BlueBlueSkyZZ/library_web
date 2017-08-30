package util.sql;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import entity.book.BookDetailInfo;
import entity.manager.ManagerInfo;
import entity.user.UserInfo;

public class SQLUtil {

	
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
