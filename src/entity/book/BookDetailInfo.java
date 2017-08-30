package entity.book;
/**
 * 图书具体信息实体类
 * @author mzy
 *		<action name="output_excel" class="action.book.ExcelOutput" method="exportExcel">
			<result name="success" type="stream"> 
				<!-- 下载文件的类型，如果你不知道是什么格式，可以去 tomcat\conf\web.xml下找 -->  
                <param name="contentType">application/vnd.ms-excel</param>  
                <!-- 返回流 excelStream为action中的流变量名称 -->  
                <param name="inputName">excelStream</param>  
                <!-- attachment 这个位置的参数挺特殊的，可以设置成下载时，是否出现个下载提示框，或者直接下载之类的。  
                fileName指定生成的文件名字(适合动态生成文件名，比如做报表时，一般都要说是几月的统计数据之类)为action中变量-->  
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
