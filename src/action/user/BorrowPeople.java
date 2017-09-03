package action.user;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.apache.struts2.ServletActionContext;

import util.sql.SQLUtil;

import com.opensymphony.xwork2.ActionSupport;
import com.sun.jmx.snmp.Timestamp;

public class BorrowPeople extends ActionSupport{

	@Override
	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
    	response.setCharacterEncoding("UTF-8");
    	request.setCharacterEncoding("utf-8");
    	PrintWriter pw = response.getWriter();
    	List<String> orders = SQLUtil.getAllOrderId();
    	List<Long> time = new ArrayList<Long>();
    	for (String string : orders) {
			time.add(getTimestamp(string));
		}

    	//记录某日借阅人数
    	Map<String, Integer> borrowPeople = new TreeMap<String, Integer>(
	    	new Comparator<String>() {
	            public int compare(String obj1, String obj2) {
	                // 升序排序
	                return obj1.compareTo(obj2);
	            }
	        }); 
    	
    	for (Long timesta : time) {
    		
    		/*if(System.currentTimeMillis() - timesta > 5184000){
    			System.out.println("时间过长");
    		}else{*/
    			String date = timestampToString(timesta);
    			int num;
    			if(borrowPeople.get(date) == null){
    				borrowPeople.put(date, 1);
    			}else{
    				num = borrowPeople.get(date) + 1;
    				borrowPeople.put(date, num);
    			}
    		}
		//}
    	
    	
    	//遍历map中的键 、 值 
    	List<String> times = new ArrayList<String>();
    	List<String> nums = new ArrayList<String>();
    	for (String key : borrowPeople.keySet()) {  
    		times.add(key);
    	}  
    	
    	for (Integer value : borrowPeople.values()) {
    		String val = String.valueOf(value);
    		nums.add(val);
    	}  
    	
    	Map<String, List<String>> map1 = new HashMap<String, List<String>>();
    	
    	
    	map1.put("date", times);
    	map1.put("num", nums);
    	
    	//整合输出格式
    	List<Map<String, List<String>>> output = new ArrayList<Map<String,List<String>>>();
    	output.add(map1);
    	
    	System.out.println(output);

    	String jsonStr = JSONArray.fromObject(output).toString();
    	pw.write(jsonStr);
    	
    	pw.flush();
    	pw.close();
		return null;
	}
	
	
	/**
	 * 时间戳转日期（string）
	 * @param timestamp
	 * @return
	 */
	private static String timestampToString(long timestamp){
		String format = "yyyy/MM/dd";
		SimpleDateFormat  sdf = new SimpleDateFormat(format);
		String date = "";
		date = sdf.format(new Date(timestamp));
		return date;
	}
	
	/**
	 * 从订单号截取时间戳
	 * @param orderId
	 * @return
	 */
	private static long getTimestamp(String orderId){
		long timestamp ;
		try{
			String timestampStr = orderId.substring(28);
			timestamp = Long.parseLong(timestampStr);
		}catch(Exception e){
			System.out.println("单号不正常");
			timestamp = System.currentTimeMillis();
			//e.printStackTrace();
		}
		return timestamp;
	}
	
	public static void main(String[] args) {
//		System.out.println(getTimestamp("otE_a1PqGG5BdpTiBL4W3ql6prXg1503668207943"));
//		System.out.println(timestampToString(getTimestamp("otE_a1PqGG5BdpTiBL4W3ql6prXg1503668207943")));
		List<String> orders = SQLUtil.getAllOrderId();
    	List<Long> time = new ArrayList<Long>();
    	for (String string : orders) {
			time.add(getTimestamp(string));
		}

    	//记录某日借阅人数
    	Map<String, Integer> borrowPeople = new TreeMap<String, Integer>(
	    	new Comparator<String>() {
	            public int compare(String obj1, String obj2) {
	                // 升序排序
	                return obj1.compareTo(obj2);
	            }
	        }); 
    	
    	for (Long timesta : time) {
    		
    		/*if(System.currentTimeMillis() - timesta > 5184000){
    			System.out.println("时间过长");
    		}else{*/
    			String date = timestampToString(timesta);
    			int num;
    			if(borrowPeople.get(date) == null){
    				borrowPeople.put(date, 1);
    			}else{
    				num = borrowPeople.get(date) + 1;
    				borrowPeople.put(date, num);
    			}
    		}
		//}
    	
    	
    	//遍历map中的键 、 值 
    	List<String> times = new ArrayList<String>();
    	List<String> nums = new ArrayList<String>();
    	for (String key : borrowPeople.keySet()) {  
    		times.add(key);
    	}  
    	
    	for (Integer value : borrowPeople.values()) {
    		String val = String.valueOf(value);
    		nums.add(val);
    	}  
    	
    	Map<String, List<String>> map1 = new HashMap<String, List<String>>();
    	Map<String, List<String>> map2 = new HashMap<String, List<String>>();
    	
    	map1.put("date", times);
    	map2.put("num", nums);
    	
    	//整合输出格式
    	List<Map<String, List<String>>> output = new ArrayList<Map<String,List<String>>>();
    	output.add(map1);
    	output.add(map2);
    	System.out.println(output);

    	String jsonStr = JSONArray.fromObject(output).toString();
    	System.out.println(jsonStr);
	}
}
