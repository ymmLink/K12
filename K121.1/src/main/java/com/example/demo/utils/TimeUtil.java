package com.example.demo.utils;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class TimeUtil {
	public static String getString(String str,Long time){
		SimpleDateFormat sdf=new SimpleDateFormat(str);
		return sdf.format(time);
	}
	
	public static String getString(String str,Date date){
		SimpleDateFormat sdf=new SimpleDateFormat(str);
		return sdf.format(date);
	}
	
	public static String getString(String str){
		return getString(str,new Date());
	}
	public static String getString3(){
		return getString("MM月dd日  HH:mm",new Date());
	}
	public static String getString(){
		return getString("yyyy/MM/dd HH:mm:ss",new Date());
	}
	public static String getString2(String a){
		return getString(a,new Date());
	}
	public static String getOrderId(){
		return getString("MMddHHmmss",new Date());
	}
	
	public static String getStringShort(){
		return getString("yyyy/MM/dd",new Date());
	}
	
	public static String getStringByDate(Date date){
		return getString("yyyy/MM/dd HH:mm:ss",date);
	}
	
	public static String getString(Long time){
		return getString("yyyy/MM/dd HH:mm:ss",time);
	}
	
	public static Date getDate(String format,String datestr) throws ParseException{
		SimpleDateFormat sdf=new SimpleDateFormat(format);
		return sdf.parse(datestr);
	}
	
	public static String getZeroTime(){
		Calendar calendar = Calendar.getInstance();
		calendar.set(Calendar.HOUR_OF_DAY, 0);
		calendar.set(Calendar.MINUTE, 0);
		calendar.set(Calendar.SECOND, 0);
		calendar.set(Calendar.MILLISECOND, 001);
		Date date = calendar.getTime();
		String time=TimeUtil.getStringByDate(date);
		return time;
	}
	/**
	 * 获取当前时间 yyyyMMddHHmmss
	 * @return String
	 */ 
	public static String getCurrTime() {
		Date now = new Date();
		SimpleDateFormat outFormat = new SimpleDateFormat("yyyyMMddHHmmss");
		String s = outFormat.format(now);
		return s;
	}
	/**
	 * 取出一个指定长度大小的随机正整数.
	 * 
	 * @param length
	 *            int 设定所取出随机数的长度。length小于11
	 * @return int 返回生成的随机数。
	 */
	public static int buildRandom(int length) {
		int num = 1;
		double random = Math.random();
		if (random < 0.1) {
			random = random + 0.1;
		}
		for (int i = 0; i < length; i++) {
			num = num * 10;
		}
		return (int) ((random * num));
	}
	
	public static String getRandomName(){
		String thisTime=null;
		SimpleDateFormat sdf=new SimpleDateFormat("HHmmssSSS");
		thisTime=sdf.format(System.currentTimeMillis());
		return thisTime;
	}
	
	
	/**
	 * yyyy/MM/dd HH:mm:ss获取当前时间
	 * @return
	 */
	public static String getfileName(){
		String thisTime=null;
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd/HHmmssSSS");
		thisTime=sdf.format(System.currentTimeMillis());
		
		return thisTime;
	}
	/**
	 * yyyy-MM-dd HH:mm:ss获取当前时间
	 * @return
	 */
	public static String getThisTime(){
		String thisTime=null;
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		thisTime=sdf.format(System.currentTimeMillis());
		return thisTime;
	}
	/**
	 *timestamp
	 * @param args
	 */
	public static Timestamp getThisTimes(){
		Timestamp thisTime=new Timestamp(System.currentTimeMillis());
		return thisTime;
	}
	
	/**
	 * 获取当天开始时间
	 * @return
	 */
	 public static String getDayBegin() {
		 	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	        Calendar cal = new GregorianCalendar();
	        cal.set(Calendar.HOUR_OF_DAY, 0);
	        cal.set(Calendar.MINUTE, 0);
	        cal.set(Calendar.SECOND, 0);
	        cal.set(Calendar.MILLISECOND, 0);
	        return sdf.format(cal.getTime());
	    }
	    /**
	     * 获取当天的结束时间
	     * @return
	     */
	    public static String getDayEnd() {
	    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	        Calendar cal = new GregorianCalendar();
	        cal.set(Calendar.HOUR_OF_DAY, 23);
	        cal.set(Calendar.MINUTE, 59);
	        cal.set(Calendar.SECOND, 59);
	        return sdf.format(cal.getTime());
	    }
	  /**
	   * 获取本周的开始时间(String)
	   * @return
	   */
	    public static String getBeginDayOfWeek1() {
	    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	        Date date = new Date();
	        if (date == null) {
	            return null;
	        }
	        Calendar cal = Calendar.getInstance();
	        cal.setTime(date);
	        int dayofweek = cal.get(Calendar.DAY_OF_WEEK);
	        if (dayofweek == 1) {
	            dayofweek += 7;
	        }
	        cal.add(Calendar.DATE, 2 - dayofweek);
	        return  sdf.format(getDayStartTime(cal.getTime()));
	    }
	    
	    /**
	     * 获取本周的结束时间(string)
	     * @return
	     */
	    public static String getEndDayOfWeek1(){
	    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	        Calendar cal = Calendar.getInstance();
	        cal.setTime(getBeginDayOfWeek());  
	        cal.add(Calendar.DAY_OF_WEEK, 6); 
	        Date weekEndSta = cal.getTime();
	        return sdf.format(getDayEndTime(weekEndSta));
	    }
	    
	    
	  /**
	   * 获取本周的开始时间(Date)
	   * @return
	   */
	    public static Date getBeginDayOfWeek() {
	    	
	        Date date = new Date();
	        if (date == null) {
	            return null;
	        }
	        Calendar cal = Calendar.getInstance();
	        cal.setTime(date);
	        int dayofweek = cal.get(Calendar.DAY_OF_WEEK);
	        if (dayofweek == 1) {
	            dayofweek += 7;
	        }
	        cal.add(Calendar.DATE, 2 - dayofweek);
	        return  getDayStartTime(cal.getTime());
	    }
	    /**
	     * 获取本周的结束时间(Date)
	     * @return
	     */
	    public static Date getEndDayOfWeek(){
	    	
	        Calendar cal = Calendar.getInstance();
	        cal.setTime(getBeginDayOfWeek());  
	        cal.add(Calendar.DAY_OF_WEEK, 6); 
	        Date weekEndSta = cal.getTime();
	        return getDayEndTime(weekEndSta);
	    }
	    
	    /**
	     * 获取本月的开始时间(string)
	     * @return
	     */
	     public static String getBeginDayOfMonth1() {
		    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	            Calendar calendar = Calendar.getInstance();
	            calendar.set(getNowYear(), getNowMonth() - 1, 1);
	            return sdf.format(getDayStartTime(calendar.getTime()));
	        }
	    /**
	     * 获取本月的结束时间(string)
	     * @return
	     */
	     public static String getEndDayOfMonth1() {
		    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	            Calendar calendar = Calendar.getInstance();
	            calendar.set(getNowYear(), getNowMonth() - 1, 1);
	            int day = calendar.getActualMaximum(5);
	            calendar.set(getNowYear(), getNowMonth() - 1, day);
	            return sdf.format(getDayEndTime(calendar.getTime()));
	        }
	    
	    
	    
	    /**
	     * 获取本月的开始时间(Date)
	     * @return
	     */
	     public static Date getBeginDayOfMonth() {
	            Calendar calendar = Calendar.getInstance();
	            calendar.set(getNowYear(), getNowMonth() - 1, 1);
	            return getDayStartTime(calendar.getTime());
	        }
	    /**
	     * 获取本月的结束时间(Date)
	     * @return
	     */
	     public static Date getEndDayOfMonth() {
	            Calendar calendar = Calendar.getInstance();
	            calendar.set(getNowYear(), getNowMonth() - 1, 1);
	            int day = calendar.getActualMaximum(5);
	            calendar.set(getNowYear(), getNowMonth() - 1, day);
	            return getDayEndTime(calendar.getTime());
	        }
	     //获取本年的开始时间
	     public static java.util.Date getBeginDayOfYear() {
	            Calendar cal = Calendar.getInstance();
	            cal.set(Calendar.YEAR, getNowYear());
	            // cal.set
	            cal.set(Calendar.MONTH, Calendar.JANUARY);
	            cal.set(Calendar.DATE, 1);


	            return getDayStartTime(cal.getTime());
	        }
	     //获取本年的结束时间
	     public static java.util.Date getEndDayOfYear() {
	            Calendar cal = Calendar.getInstance();
	            cal.set(Calendar.YEAR, getNowYear());
	            cal.set(Calendar.MONTH, Calendar.DECEMBER);
	            cal.set(Calendar.DATE, 31);
	            return getDayEndTime(cal.getTime());
	        }
	     
	     
	     //获取某个日期的开始时间
	     public static Timestamp getDayStartTime(Date d) {
	         Calendar calendar = Calendar.getInstance();
	         if(null != d) calendar.setTime(d);
	         calendar.set(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH),    calendar.get(Calendar.DAY_OF_MONTH), 0, 0, 0);
	         calendar.set(Calendar.MILLISECOND, 0);
	         return new Timestamp(calendar.getTimeInMillis());
	     }
	     //获取某个日期的结束时间
	     public static Timestamp getDayEndTime(Date d) {
	         Calendar calendar = Calendar.getInstance();
	         if(null != d) calendar.setTime(d);
	         calendar.set(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH),    calendar.get(Calendar.DAY_OF_MONTH), 23, 59, 59);
	         calendar.set(Calendar.MILLISECOND, 999);
	         return new Timestamp(calendar.getTimeInMillis());
	     }
	
	
	     //获取今年是哪一年
	     public static Integer getNowYear() {
	             Date date = new Date();
	            GregorianCalendar gc = (GregorianCalendar) Calendar.getInstance();
	            gc.setTime(date);
	            return Integer.valueOf(gc.get(1));
	        }
	     //获取本月是哪一月
	     public static int getNowMonth() {
	             Date date = new Date();
	            GregorianCalendar gc = (GregorianCalendar) Calendar.getInstance();
	            gc.setTime(date);
	            return gc.get(2) + 1;
	        }
	     //获取前几天日期
	     public static String getPreDay(Date date,int day) {
	    	 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    	 Calendar calendar = Calendar.getInstance();
	    	 calendar.setTime(date);
	    	 calendar.add(Calendar.DATE, -day);
	    	 date = (Date)calendar.getTime();
	    	 return sdf.format(date);
	     }
}
