package com.quadi.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class AjaxAction  extends ActionSupport{
		private File files;
		private String uploadFileFileName;
		private String uploadFileContentType;

		private String savePath;

		public String uploadFile() throws Exception {

			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("utf-8");

			System.out.println("�ļ�"+ uploadFileFileName +"��ʼ�ϴ�");

			String extName = ""; 	// ��չ��
			String newFileName = ""; // ���ļ���
			String nowTime = new SimpleDateFormat("yyyyMMddHHmmssSSS")
					.format(new Date()); // ��ǰʱ��

			savePath = ServletActionContext.getServletContext().getRealPath(
					this.getSavePath())
					+ "\\";	//windows������

			if (null != files) {
				System.out.println("savePath: " + savePath);
				
				if (uploadFileFileName.lastIndexOf(".") >= 0) {
					
					extName = uploadFileFileName.substring(uploadFileFileName .lastIndexOf("."));
					
					newFileName = nowTime + extName;
				}
			}
			
			FileInputStream fis = new FileInputStream(files);
			FileOutputStream fos = new FileOutputStream(savePath + newFileName);

			int data = 0; // ����һ�����桢��ȡ�ļ����ֽڵ���ʱ����
			while ((data = fis.read()) != -1) {
				fos.write(data);
			}

			fis.close();
			fos.close();
			
			System.out.println("�ļ�"+ uploadFileFileName +"�ϴ�����");
			System.out.println("*********************************");
			
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

