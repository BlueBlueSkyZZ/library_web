package test;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class FileAjaxTest extends ActionSupport{

	private File image;
	private String imageFileName;
	private String imageContentType;
	public File getImage() {
		return image;
	}
	public void setImage(File image) {
		this.image = image;
	}
	public String getImageFileName() {
		return imageFileName;
	}
	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}
	public String getImageContentType() {
		return imageContentType;
	}
	public void setImageContentType(String imageContentType) {
		this.imageContentType = imageContentType;
	}
	
	@Override
	public String execute() throws Exception {
		
		System.out.println(imageFileName);
		
		String path = ServletActionContext.getRequest().getSession()
				.getServletContext().getRealPath("/book_img/");
		
		OutputStream os = new FileOutputStream(
				new File(path, imageFileName));

		InputStream is = new FileInputStream(image);

		byte[] buf = new byte[1024];
		int length = 0;

		while (-1 != (length = is.read(buf))) {
			os.write(buf, 0, length);
		}

		is.close();
		os.close();
		
		//É¾³ýÁÙÊ±ÎÄ¼þ
		image.delete();
		return SUCCESS;
	}
}
