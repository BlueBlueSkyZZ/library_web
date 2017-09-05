package util.wechat;

import entity.pub.wechat.News;

public class MessageUtil {

	/**
	 * �ͷ��ӿڷ���ͼ����Ϣ
	 * @param openid �û�id
	 * @param type ��Ϣ����
	 * @param news ͼ����Ϣʵ��
	 * @return
	 */
	public static String generateServiceImgTxtMsg(String openid,String type,News news){
		StringBuffer sb = new StringBuffer();
		sb.append("{");
		sb.append("\"touser\":\"").append(openid).append("\",");
		sb.append("\"msgtype\":\"").append(type).append("\",");
		sb.append("\"news\":");
		sb.append("{");
		sb.append("\"articles\":[");
		sb.append("{");
		sb.append("\"title\":\"").append(news.getTitle()).append("\",");
		sb.append("\"description\":\"").append(news.getDescription()).append("\",");
		sb.append("\"url\":\"").append(news.getUrl()).append("\",");
		sb.append("\"picurl\":\"").append(news.getPicUrl()).append("\"");
		sb.append("}]");
		sb.append("}");
		sb.append("}");
		return sb.toString();
	}
}
