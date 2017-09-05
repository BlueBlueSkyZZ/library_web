package action.book;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.struts2.ServletActionContext;

import util.sql.SQLUtil;

import entity.book.ExcelWorkSheet;
import entity.book.BookDetailInfo;

import com.opensymphony.xwork2.ActionSupport;

public class ExcelUpload extends ActionSupport{

	private File excelFile; //上传的文件   
    private String excelFileFileName; //保存原始文件名   
    //将Excel文件解析完毕后信息存放到这个对象中   
    private ExcelWorkSheet<BookDetailInfo> excelWorkSheet;   
    public File getExcelFile() {   
        return excelFile;   
    }   
    public void setExcelFile(File excelFile) {   
        this.excelFile = excelFile;   
    }   
    public String getExcelFileFileName() {   
        return excelFileFileName;   
    }   
    public void setExcelFileFileName(String excelFileFileName) {   
        this.excelFileFileName = excelFileFileName;   
    }   
   
    public ExcelWorkSheet<BookDetailInfo> getExcelWorkSheet() {   
        return excelWorkSheet;   
    }   
    public void setExcelWorkSheet(ExcelWorkSheet<BookDetailInfo> excelWorkSheet) {   
        this.excelWorkSheet = excelWorkSheet;   
    }   
    
   
    
    //判断文件类型   
    public Workbook createWorkBook(InputStream is) throws IOException{   
    	
        if(excelFileFileName.toLowerCase().endsWith("xls")){   
            return new HSSFWorkbook(is);   
        }else if(excelFileFileName.toLowerCase().endsWith("xlsx")){   
            return new XSSFWorkbook(is);   
        }
        return null;   
    }
    
    @Override
    public String execute() throws Exception {
    	HttpServletResponse response = ServletActionContext.getResponse();
    	response.setCharacterEncoding("UTF-8");
    	PrintWriter pw = response.getWriter();
    	Workbook book = createWorkBook(new FileInputStream(excelFile));   
        //book.getNumberOfSheets();  判断Excel文件有多少个sheet   
        Sheet sheet =  book.getSheetAt(0);     
        excelWorkSheet = new ExcelWorkSheet<BookDetailInfo>();   
        //保存工作单名称   
        Row firstRow = sheet.getRow(0);   
        Iterator<Cell> iterator = firstRow.iterator();   
           
        //保存列名   
        List<String> cellNames = new ArrayList<String>();   
        while (iterator.hasNext()) {   
            cellNames.add(iterator.next().getStringCellValue());   
        }   
        excelWorkSheet.setColumns(cellNames);
        
        //确定列数
        final int columnNum = 15;
        String[] column = new String[columnNum];
        
        for (int i = 1; i <= sheet.getLastRowNum(); i++) {   
            Row ros = sheet.getRow(i);
            for(int j = 0; j < columnNum; j++){
            	//防止出现空指针
            	if(ros.getCell(j) == null){
            		column[j] = "00000000";
            	}else{
            		column[j] = ros.getCell(j).getStringCellValue();
            	}
            }
            BookDetailInfo bookDetailInfo = new BookDetailInfo();
            bookDetailInfo.setBookno(column[0]);
            bookDetailInfo.setIsbn(column[1]);
            bookDetailInfo.setBookname(column[2]);
            bookDetailInfo.setCategory(column[3]);
            bookDetailInfo.setPublisher(column[4]);
            bookDetailInfo.setVersion(column[5]);
            bookDetailInfo.setBookimg(column[6]);
            bookDetailInfo.setOutline(column[7]);
            bookDetailInfo.setBookAbstract(column[8]);
            bookDetailInfo.setGuide(column[9]);
            bookDetailInfo.setLeftnum(column[10]);
            bookDetailInfo.setPrice(column[11]);
            bookDetailInfo.setAuthor(column[12]);
            bookDetailInfo.setReadingnum(column[13]);
            bookDetailInfo.setScore(column[14]);
              
            excelWorkSheet.getData().add(bookDetailInfo);   
        }
        
        for (int i = 0; i < excelWorkSheet.getData().size(); i++) {   
        	BookDetailInfo info = excelWorkSheet.getData().get(i);   
            System.out.println(i + ":" +info.getBookname()); 
            String isbn = info.getIsbn();
            String bookname = info.getBookname();
            String category = info.getCategory();
            String publisher = info.getPublisher();
            String version = info.getVersion();
            String bookimg = info.getBookimg();
            String outline = info.getOutline();
            String bookAbstract = info.getBookAbstract();
            String guide = info.getGuide();
            String leftnum = info.getLeftnum();
            String price = info.getPrice();
            String author = info.getAuthor();
            SQLUtil.addNewBook(isbn, bookname, category, publisher, version, bookimg, outline, bookAbstract, guide, leftnum, price, author);
        }
        System.out.println("提交没错");
        
        
		pw.write("success");
		pw.flush();
		pw.close();
        
    	return null;
    }
}
