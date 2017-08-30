package action.book;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;

import util.sql.SQLUtil;

import com.opensymphony.xwork2.ActionSupport;

import entity.book.BookDetailInfo;

public class ExcelOutput extends ActionSupport {

	private InputStream excelStream; // ���������
	private String excelFileName; // �����ļ���

	public InputStream getExcelStream() {
		return excelStream;
	}

	public void setExcelStream(InputStream excelStream) {
		this.excelStream = excelStream;
	}

	public String getExcelFileName() {
		return excelFileName;
	}

	public void setExcelFileName(String excelFileName) {
		this.excelFileName = excelFileName;
	}


	@Override
	public String execute() throws Exception {
		// ��ȡ�鼮��
		List<BookDetailInfo> booklist = new ArrayList<BookDetailInfo>();
		booklist = SQLUtil.getAllBookList();

		// 1.����һ��book��Ӧexcel����
		HSSFWorkbook book = new HSSFWorkbook();
		// 2.���sheet
		Sheet sheet = book.createSheet("������Ϣ");
		// 3.��0����ӱ�ͷ
		Row row = sheet.createRow(0);
		row.createCell(0).setCellValue("bookno");
		row.createCell(1).setCellValue("isbn");
		row.createCell(2).setCellValue("bookname");
		row.createCell(3).setCellValue("category");
		row.createCell(4).setCellValue("publisher");
		row.createCell(5).setCellValue("version");
		row.createCell(6).setCellValue("bookimg");
		row.createCell(7).setCellValue("outline");
		row.createCell(8).setCellValue("abstract");
		row.createCell(9).setCellValue("guide");
		row.createCell(10).setCellValue("leftnum");
		row.createCell(11).setCellValue("price");
		row.createCell(12).setCellValue("author");
		row.createCell(13).setCellValue("readingnum");
		row.createCell(14).setCellValue("score");
		// 4.������ʽ
		CellStyle sty = book.createCellStyle();
		// sty.setAlignment(short);3.15������
		sty.setAlignment(HorizontalAlignment.LEFT);
		// 5.��������
		for (int i = 1; i < booklist.size(); i++) {
			BookDetailInfo bookDetailInfo = booklist.get(i - 1);
			row = sheet.createRow(i);
			row.createCell(0).setCellValue(bookDetailInfo.getBookno());
			row.createCell(1).setCellValue(bookDetailInfo.getIsbn());
			row.createCell(2).setCellValue(bookDetailInfo.getBookname());
			row.createCell(3).setCellValue(bookDetailInfo.getCategory());
			row.createCell(4).setCellValue(bookDetailInfo.getPublisher());
			row.createCell(5).setCellValue(bookDetailInfo.getVersion());
			row.createCell(6).setCellValue(bookDetailInfo.getBookimg());
			row.createCell(7).setCellValue(bookDetailInfo.getOutline());
			row.createCell(8).setCellValue(bookDetailInfo.getBookAbstract());
			row.createCell(9).setCellValue(bookDetailInfo.getGuide());
			row.createCell(10).setCellValue(bookDetailInfo.getLeftnum());
			row.createCell(11).setCellValue(bookDetailInfo.getPrice());
			row.createCell(12).setCellValue(bookDetailInfo.getAuthor());
			row.createCell(13).setCellValue(bookDetailInfo.getReadingnum());
			row.createCell(14).setCellValue(bookDetailInfo.getScore());
		}

		try {
			// �ļ���������
			ByteArrayOutputStream os = new ByteArrayOutputStream();
			book.write(os);
			byte[] fileContent = os.toByteArray();
			ByteArrayInputStream is = new ByteArrayInputStream(fileContent);
			excelStream = is;
			excelFileName = "data.xls";

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return SUCCESS;
	}
}
