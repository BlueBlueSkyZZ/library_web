package util.wechat;

import java.io.IOException;

import net.sf.json.JSONException;
import net.sf.json.JSONObject;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;

import entity.pub.wechat.AccessToken;

public class WeixinUtil {
	// 数据库配置
	public static final String MYSQL_DN = "127.0.0.1:3306/library";
	public static final String MYSQL_NAME = "root";
	public static final String MYSQL_PASSWORD = "root";
	
	// 测试号的数据
//	public static final String APPID = "wx6b71cb3f69dd9a86";
//	public static final String APPSECRET = "f02adc4026d13796f35169b778b4e9ef";
//	public static final String DN = "http://www.iotesta.cn";
	
	// 老马的数据
	public static final String APPID = "wxde3504dfb219fc20";
	public static final String APPSECRET = "1824588d88f3251162b7ba687776b855";
	public static final String DN = "http://www.iotesta.com.cn";

	private static final String ACCESS_TOKEN_URL = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET";
	private static final String UPLOAD_URL = "https://api.weixin.qq.com/cgi-bin/media/upload?access_token=ACCESS_TOKEN&type=TYPE";
	private static final String CREATE_MENU_URL = "https://api.weixin.qq.com/cgi-bin/menu/create?access_token=ACCESS_TOKEN";
	
	private static final String GET_USER_INFO_URL = "https://api.weixin.qq.com/cgi-bin/user/info?access_token=ACCESS_TOKEN&openid=OPENID&lang=zh_CN";
	
	private static final String SCOPE = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=APPID&redirect_uri=REDIRECT_URI&response_type=code&scope=SCOPE&state=STATE#wechat_redirect";
	
	private static final String registerAction = DN + "/library/show_register.action";
	private static final String openLibraryAction = DN + "/library/show_main.action";
	private static final String showSingleCatAction = DN + "/library/show_singleCat.action";
	private static final String payAction = DN + "/library/show_pay.action";
	
	private static final String GET_USER_ID = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code";
	private static final String GET_MATERIAL = "https://api.weixin.qq.com/cgi-bin/material/get_material?access_token=ACCESS_TOKEN";
	
	private static final String POST_CusService_SEND = "https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token=ACCESS_TOKEN";
	/**
	 * get请求
	 * 
	 * @param url
	 * @return
	 */
	public static JSONObject doGetStr(String url) {
		DefaultHttpClient httpClient = new DefaultHttpClient();
		HttpGet httpGet = new HttpGet(url);
		JSONObject jsonObject = null;
		try {
			HttpResponse response = httpClient.execute(httpGet);
			HttpEntity entity = response.getEntity();
			if (entity != null) {
				String result = EntityUtils.toString(entity, "UTF-8");
				jsonObject = JSONObject.fromObject(result);
			}
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return jsonObject;
	}

	/*
	 * post请求
	 */
	public static JSONObject doPostStr(String url, String outStr) {
		DefaultHttpClient httpClient = new DefaultHttpClient();
		HttpPost httpPost = new HttpPost(url);
		JSONObject jsonObject = null;
		try {
			httpPost.setEntity(new StringEntity(outStr, "UTF-8"));
			HttpResponse response = httpClient.execute(httpPost);
			String result = EntityUtils.toString(response.getEntity(), "UTF-8");
			jsonObject = JSONObject.fromObject(result);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return jsonObject;
	}

	/*
	 * 获取access_token
	 */
	//用于在测试类中获取token
	public static AccessToken getAccessToken() {
		AccessToken token = new AccessToken();
		String url = ACCESS_TOKEN_URL.replace("APPID", APPID).replace("APPSECRET", APPSECRET);
		JSONObject jsonObject = doGetStr(url);
		if (jsonObject != null) {
			token.setToken(jsonObject.getString("access_token"));
			token.setExpiresIn(jsonObject.getInt("expires_in"));
		}

		return token;
	}
	
	/**
     * 调用微信JS接口的临时票据
     * 
     * @param access_token 接口访问凭证
     * @return
     */
	public static String getJsApiTicket(String access_token) {
        String url = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=ACCESS_TOKEN&type=jsapi";
        String requestUrl = url.replace("ACCESS_TOKEN", access_token);
        // 发起GET请求获取凭证
        JSONObject jsonObject = doGetStr(requestUrl);
        String jsTicket = null;
        if (jsonObject != null) {
            try {
                jsTicket = jsonObject.getString("ticket");
            } catch (JSONException e) {
                // 获取token失败
                System.out.println("获取token失败 \n" +  jsonObject.getInt("errcode") + jsonObject.getString("errmsg"));
            }
        }
        return jsTicket;
    }
	

	public static int Cus_Service(String access_token, String outStr){
		int result = 0;
		
		String url = POST_CusService_SEND.replace("ACCESS_TOKEN", access_token);
		JSONObject jsonObject = doPostStr(url, outStr);
		if(jsonObject != null){
			result = jsonObject.getInt("errcode");
		}
		return result;
	}
}
