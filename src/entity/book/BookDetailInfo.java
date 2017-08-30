package entity.book;
/**
 * ͼ�������Ϣʵ����
 * @author mzy
 *		<action name="output_excel" class="action.book.ExcelOutput" method="exportExcel">
			<result name="success" type="stream"> 
				<!-- �����ļ������ͣ�����㲻֪����ʲô��ʽ������ȥ tomcat\conf\web.xml���� -->  
                <param name="contentType">application/vnd.ms-excel</param>  
                <!-- ������ excelStreamΪaction�е����������� -->  
                <param name="inputName">excelStream</param>  
                <!-- attachment ���λ�õĲ���ͦ����ģ��������ó�����ʱ���Ƿ���ָ�������ʾ�򣬻���ֱ������֮��ġ�  
                fileNameָ�����ɵ��ļ�����(�ʺ϶�̬�����ļ���������������ʱ��һ�㶼Ҫ˵�Ǽ��µ�ͳ������֮��)Ϊaction�б���-->  
                <param name="contentDisposition">  
                    attachment;filename=${excelFileName}  
                </param>  
                <param name="bufferSize">1024</param>
            </result>
		</action>
 */
public class BookDetailInfo {
	
	private String bookno;
	private String isbn;
	private String bookname;
	private String category;
	private String publisher;
	private String version;
	private String bookimg;
	private String outline;
	private String bookAbstract;
	private String guide;
	private String leftnum;
	private String price;
	private String author;
	private String readingnum;
	private String score;
	
	public String getBookno() {
		return bookno;
	}
	public void setBookno(String bookno) {
		this.bookno = bookno;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
	public String getBookimg() {
		return bookimg;
	}
	public void setBookimg(String bookimg) {
		this.bookimg = bookimg;
	}
	public String getOutline() {
		return outline;
	}
	public void setOutline(String outline) {
		this.outline = outline;
	}
	public String getBookAbstract() {
		return bookAbstract;
	}
	public void setBookAbstract(String bookAbstract) {
		this.bookAbstract = bookAbstract;
	}
	public String getGuide() {
		return guide;
	}
	public void setGuide(String guide) {
		this.guide = guide;
	}
	public String getLeftnum() {
		return leftnum;
	}
	public void setLeftnum(String leftnum) {
		this.leftnum = leftnum;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getReadingnum() {
		return readingnum;
	}
	public void setReadingnum(String readingnum) {
		this.readingnum = readingnum;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	
	
}
