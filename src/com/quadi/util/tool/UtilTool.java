package com.quadi.util.tool;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
/*-------------------------------------------------------------------------------------------------------------
							���ܣ�ת��ʱ���ʽ																											
				��ʽ1��	���� hh:mm
				��ʽ2��	MM��dd�� hh:mm
-----------------------------------------------------------------------------------------------------------------																			*/
public class UtilTool {
	//�任ʱ���ʽ
	public  String formatTime(Timestamp tweetsTime){
		//��ȡ��ǰʱ�������
		Calendar c1 = new GregorianCalendar();
	    c1.set(Calendar.HOUR_OF_DAY, 0);
	    c1.set(Calendar.MINUTE, 0);
	    c1.set(Calendar.SECOND, 0);
	    //System.out.println(c1.getTimeInMillis());
		//ת��timestamp������
		 SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddhhmmss");
		  String str = dateFormat.format(tweetsTime);
		  SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
		  long millionSeconds = 0 ;
		  //�˴�ת��Ϊ������
		  try {
			 millionSeconds = sdf.parse(str).getTime();
		} catch (ParseException e) {
			// TODO �Զ����ɵ� catch ��
			e.printStackTrace();
		}// ����
		  long diffTime=c1.getTimeInMillis()-millionSeconds;
		  SimpleDateFormat sdf_1;
		  String times;
		  if(diffTime<=0 ){
			   sdf_1 = new SimpleDateFormat("���� hh:mm");
			   times=sdf_1.format(tweetsTime);
		  }else{
			   sdf_1 = new SimpleDateFormat("MM��dd�� hh:mm");
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
