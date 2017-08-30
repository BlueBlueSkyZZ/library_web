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
