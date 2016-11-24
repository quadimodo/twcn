package com.quadi.util.tool;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
/*-------------------------------------------------------------------------------------------------------------
							功能：转换时间格式																											
				格式1：	今天 hh:mm
				格式2：	MM月dd日 hh:mm
-----------------------------------------------------------------------------------------------------------------																			*/
public class UtilTool {
	//变换时间格式
	public  String formatTime(Timestamp tweetsTime){
		//获取当前时间毫秒数
		Calendar c1 = new GregorianCalendar();
	    c1.set(Calendar.HOUR_OF_DAY, 0);
	    c1.set(Calendar.MINUTE, 0);
	    c1.set(Calendar.SECOND, 0);
	    //System.out.println(c1.getTimeInMillis());
		//转换timestamp毫秒数
		 SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddhhmmss");
		  String str = dateFormat.format(tweetsTime);
		  SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
		  long millionSeconds = 0 ;
		  //此处转换为毫秒数
		  try {
			 millionSeconds = sdf.parse(str).getTime();
		} catch (ParseException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}// 毫秒
		  long diffTime=c1.getTimeInMillis()-millionSeconds;
		  SimpleDateFormat sdf_1;
		  String times;
		  if(diffTime<=0 ){
			   sdf_1 = new SimpleDateFormat("今天 hh:mm");
			   times=sdf_1.format(tweetsTime);
		  }else{
			   sdf_1 = new SimpleDateFormat("MM月dd日 hh:mm");
			   times=sdf_1.format(tweetsTime);
		  }
		return times;
	}
/*	public static void main(String[] args) {
		Calendar c1 = new GregorianCalendar();
	    c1.set(Calendar.HOUR_OF_DAY, 0);
	    c1.set(Calendar.MINUTE, 0);
	    c1.set(Calendar.SECOND, 0);
	    System.out.println(c1.getTime());
	    System.out.println(c1.getTimeInMillis());
	}*/
}
