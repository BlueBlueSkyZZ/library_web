package action.book;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class ImgFileUpload extends ActionSupport{

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
	
	public void uploadImg() throws IOException{
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = response.getWriter();
		
		
		String path = ServletActionContext.getRequest().getSession()
				.getServletContext().getRealPath("/book_img/");
//		String path =ServletActionContext.getRequest().getSession()
//				.getServletContext().getRealPath("/");
//		String[] paths = path.split("_");
//		String imgPath = paths[0] + '\\' + "image\\announcement\\";
		System.out.println(path);
		System.out.println(imageFileName);
		OutputStream os = new FileOutputStream(
				new File(path, imageFileName));

		InputStream is = new FileInputStream(image);

		byte[] buf = new byte[1024];
		int length = 0;

		while (-1 != (length = is.read(buf))) {
			os.write(buf, 0, length);
		}

		pw.write("success");	
		
		is.close();
		os.close();
		pw.flush();
		pw.close();
		//É¾³ýÁÙÊ±ÎÄ¼þ
		image.delete();
	}
}
