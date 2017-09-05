package action.pub.wechat;

import util.wechat.MessageUtil;
import util.wechat.WeixinUtil;
import entity.pub.wechat.AccessToken;
import entity.pub.wechat.News;

public class DailyPush {

	/**
	 * ���Ϳͷ�ͼ����Ϣ����
	 * @param weid
	 * @param bookno
	 * @param bookname
	 * @param bookimg
	 * @param url
	 * @param myabstract
	 */
	public static void sendImgTxtMsg(String weid, int bookno, String bookname, String bookimg, String url, String myabstract){
		AccessToken access_token = WeixinUtil.getAccessToken();
		News news = new News();
		news.setTitle("��Ԥ����" + "��" + bookname + "��" + "�Ѿ����Խ���");
		news.setPicUrl(bookimg);
		news.setDescription(myabstract);
		news.setUrl(url);
		String JSONMessageImg2 = MessageUtil.generateServiceImgTxtMsg(weid, "news", news);
		int errcode = WeixinUtil.Cus_Service(access_token.getToken(), JSONMessageImg2);
		System.out.println("recommend_errcode:"+errcode);
	}
}
