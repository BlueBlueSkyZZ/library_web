package util.wechat;

import entity.pub.wechat.News;

public class MessageUtil {

	/**
	 * 客服接口发送图文消息
	 * @param openid 用户id
	 * @param type 消息类型
	 * @param news 图文消息实体
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
