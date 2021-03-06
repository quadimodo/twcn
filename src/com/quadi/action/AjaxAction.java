package com.quadi.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.quadi.util.entity.Twt_RltNumBean;

@SuppressWarnings("serial")
public class AjaxAction extends ActionSupport {
	private File files;
	private String uploadFileFileName;
	private String uploadFileContentType;
	private String savePath;


	public void setFiles(File files) {
		this.files = files;
	}

	public String uploadFile() throws Exception {

		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		System.out.println("文件" + uploadFileFileName + "开始上传");

		String extName = ""; // 扩展名
		String newFileName = ""; // 新文件名
		String nowTime = new SimpleDateFormat("yyyyMMddHHmmssSSS")
				.format(new Date()); // 当前时间

		savePath = ServletActionContext.getServletContext().getRealPath(
				this.getSavePath())
				+ "\\"; // windows服务器
		//String realpath = "D://Workspaces//MyEclipse Professional//SSH//WebRoot//img//";
		if (null != files) {
			System.out.println("savePath: " + savePath);

			if (uploadFileFileName.lastIndexOf(".") >= 0) {

				extName = uploadFileFileName.substring(uploadFileFileName
						.lastIndexOf("."));

				newFileName = nowTime + extName;
			}
		}

	FileInputStream fis = new FileInputStream(files);
		FileOutputStream fos = new FileOutputStream(savePath + newFileName);
		//FileInputStream fiss = new FileInputStream(files);
		//FileOutputStream foss = new FileOutputStream(realpath + newFileName);
		int data = 0; ;// 定义一个保存、读取文件中字节的临时变量
		while ((data = fis.read()) != -1) {
			fos.write(data);
		}

		fis.close();
		fos.close();
		//fiss.close();
		//foss.close();

		System.out.println("文件" + uploadFileFileName + "上传结束");
		System.out.println("*********************************");
		Twt_RltNumBean object=new Twt_RltNumBean();
		object.setPicname(newFileName);
		JSONObject jsonObject=JSONObject.fromObject(object);
		out.print(jsonObject);
		out.close();
		return null;
	}

	public String getSavePath() {
		return savePath;
	}

	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}

	public File getFiles() {
		return files;
	}

	public void setUploadFile(File files) {
		this.files = files;
	}

	public String getUploadFileFileName() {
		return uploadFileFileName;
	}

	public void setUploadFileFileName(String uploadFileFileName) {
		this.uploadFileFileName = uploadFileFileName;
	}

	public String getUploadFileContentType() {
		return uploadFileContentType;
	}

	public void setUploadFileContentType(String uploadFileContentType) {
		this.uploadFileContentType = uploadFileContentType;
	}

}
