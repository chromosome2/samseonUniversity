package samseon.board;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Date;

public class ArticleVO {
	private int articleNo;
	private String title;
	private String content;
	private String imageFileName;
	private String adminDepartment;
	private Date writeDate;
	
	//생성자
	public ArticleVO() {
		
	}
	
	public ArticleVO(int articleNo, String title, String content, String imageFileName, String adminDepartment) {
		this.articleNo=articleNo;
		this.title=title;
		this.content=content;
		this.imageFileName=imageFileName;
		this.adminDepartment=adminDepartment;
	}
	
	//getters & setters
	public int getArticleNo() {
		return articleNo;
	}

	public void setArticleNo(int articleNo) {
		this.articleNo = articleNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImageFileName() {
		try {
			if(imageFileName != null && imageFileName.length() != 0) {
				imageFileName=URLDecoder.decode(imageFileName, "utf-8");
			}
		} catch (UnsupportedEncodingException e) {
			System.out.println("이미지 로딩 중 에러");
		}
		return imageFileName;
	}

	public void setImageFileName(String imageFileName) {
		try {
			if(imageFileName != null && imageFileName.length() != 0) {
				this.imageFileName = URLEncoder.encode(imageFileName, "utf-8");
			}else {
				this.imageFileName = null;
			}
		} catch (Exception e) {
			System.out.println("이미지 저장 중 에러");
		}
	}

	public String getAdminDepartment() {
		return adminDepartment;
	}

	public void setAdminDepartment(String adminDepartment) {
		this.adminDepartment = adminDepartment;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
}
