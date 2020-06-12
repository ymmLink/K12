package com.example.demo.utils;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;
import java.util.TimeZone;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.apache.commons.lang3.time.FastDateFormat;

/**
 * 时间工具类 待重构
 * @author phil
 * @date 2017年7月20日
 *
 */
public class DateTimeUtil {

	public static final long ONE_DAY_MILLIS = 24 * 3600 * 1000L;

	public static final String YMDHMS_DATEFORMA = "yyyy-MM-dd HH:mm:ss";

	// private static final ThreadLocal<SimpleDateFormat> local = new ThreadLocal<SimpleDateFormat>();

	// private static Map<String, ThreadLocal<SimpleDateFormat>> local = new HashMap<String, ThreadLocal<SimpleDateFormat>>();

	/**
	 * 格式化日期
	 * @param time
	 * @param format
	 * @return
	 */
	public static String formatDate(long time, String format) {
		return FastDateFormat.getInstance(format).format(new Date(time));
	}

	/**
	 * 格式化日期
	 * @param date
	 * @param format
	 * @return
	 */
	public static String formatDate(Date date, String format) {
		if (date == null) {
			return "";
		}
		return FastDateFormat.getInstance(format).format(date);
	}

	/**
	 * 转换时间
	 * @param str
	 * @param format
	 * @return
	 */
	public static Date parseDate(String str, String format) {
		try {
			return DateUtils.parseDate(str, format);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 取得给定的日期，不包含时间
	 * @param date
	 * @return
	 */
	public static Date getOnlyDate(Date date) {
		if (date == null) {
			return null;
		}
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.set(Calendar.HOUR, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MILLISECOND, 0);
		return cal.getTime();
	}

	/**
	 * 取得给定的日期，不包含时间
	 * @param date
	 * @return
	 */
	public static Date getOnlyDate24(Date date) {
		if (date == null) {
			return null;
		}
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MILLISECOND, 0);
		return cal.getTime();
	}

	public static int getHour() {
		Calendar cld = Calendar.getInstance();
		cld.setTime(new java.util.Date());
		return cld.get(Calendar.HOUR_OF_DAY);
	}

	// public static Date addDays(Date date, int days) {
	// return DateUtils.addDays(date, days);
	// }
	//
	// public static Date addYears(Date date, int years) {
	// return DateUtils.addYears(date, years);
	// }
	//
	// public static Date addMonths(Date date, int months) {
	// return DateUtils.addMonths(date, months);
	// }
	//
	// public static Date addWeeks(Date date, int weeks) {
	// return DateUtils.addWeeks(date, weeks);
	// }

	public static Date getWeekStart() {
		Calendar cal = new GregorianCalendar();
		int day_of_week = cal.get(Calendar.DAY_OF_WEEK) - 2;
		cal.add(Calendar.DATE, -day_of_week);
		return cal.getTime();
	}

	public static Date getMonthStart() {
		Calendar cal = new GregorianCalendar();
		int dayOfMonth = cal.get(GregorianCalendar.DATE);
		cal.add(GregorianCalendar.DATE, -dayOfMonth + 1);
		return cal.getTime();
	}

	public static Date getJdStart() {
		int jd_start_month = 3 * ((getMonth() - 1) / 3) + 1;
		Calendar cal = new GregorianCalendar(getYear(), jd_start_month - 1, 1);

		return cal.getTime();
	}

	public static Date getYearStart() {
		Calendar cal = new GregorianCalendar(getYear(), 0, 1);
		return cal.getTime();
	}

	public static Date getYearEnd() {
		return getYearEnd(getYear());
	}

	public static boolean checkLeapyear(int year) {
		boolean isLeapyear = false;
		if (year % 4 == 0 && year % 100 != 0) {
			isLeapyear = true;
		}
		if (year % 400 == 0)
			isLeapyear = true;
		else if (year % 4 != 0) {
			isLeapyear = false;
		}
		return isLeapyear;
	}

	public static int getDaysOfmonth(int month, int year) {
		int Dates = 0;
		if (month < 0 || month > 12) {
			System.out.println("month Error");
		}
		if (month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12) {
			Dates = 31;
		}
		if (month == 2 && checkLeapyear(year)) {
			Dates = 29;
		}
		if (month == 2 && !checkLeapyear(year)) {
			Dates = 28;
		}
		if (month == 4 || month == 6 || month == 9 || month == 11) {
			Dates = 30;
		}
		return Dates;
	}

	/**
	 * HTTP date uses TimeZone GMT
	 */
	protected static FastDateFormat format = FastDateFormat.getInstance("EEE, dd MMM yyyy HH:mm:ss zzz",
			TimeZone.getTimeZone("GMT"), Locale.US);

	public long getTime(String dateString) {
		try {
			long longtime = format.parse(dateString).getTime();
			return longtime;
		} catch (ParseException e1) {
			Date parsedDate;
			try {
				parsedDate = DateUtils.parseDate(dateString, new String[] { "yyyy/MM/dd", "yyyy.MM.dd HH:mm:ss",
						"yyyy-MM-dd HH:mm:ss", "yyyy-MM-dd HH:mm", "yyyy年MM月dd日", "yyyy年MM月dd日HH", "yyyy年MM月dd日HH:mm",
						"yyyy年MM月dd日HH:mm:ss", "yyyy年MM月dd日HH时", "yyyy年MM月dd日HH时mm分", "yyyy年MM月dd日HH时mm分ss秒",
						"yyyyMMdd", "yyyyMMddHHmmss", "yyyyMMddHHmm", "yyyyMMddHH", "MMM dd yyyy HH:mm:ss. zzz",
						"MMM dd yyyy HH:mm:ss zzz", "dd.MM.yyyy HH:mm:ss zzz", "dd MM yyyy HH:mm:ss zzz",
						"dd.MM.yyyy; HH:mm:ss", "dd.MM.yyyy HH:mm:ss", "dd.MM.yyyy zzz", "EEE MMM dd HH:mm:ss yyyy",
						"EEE MMM dd HH:mm:ss yyyy zzz", "EEE MMM dd HH:mm:ss zzz yyyy", "EEE, MMM dd HH:mm:ss yyyy zzz",
						"EEE, dd MMM yyyy HH:mm:ss zzz", "EEE,dd MMM yyyy HH:mm:ss zzz", "EEE, dd MMM yyyy HH:mm:sszzz",
						"EEE, dd MMM yyyy HH:mm:ss", "EEE, dd-MMM-yy HH:mm:ss zzz", "yyyy/MM/dd HH:mm:ss.SSS zzz",
						"yyyy/MM/dd HH:mm:ss.SSS", "yyyy/MM/dd HH:mm:ss", "yyyy/MM/dd HH:mm:ss zzz", });
				long result = parsedDate.getTime();
				return result;
			} catch (ParseException e) {
				e.printStackTrace();
				return -1;
			}
		}
	}

	public static long[] getTime(long start, long end) {

		long i = end - start;

		long day = i / (3600 * 1000 * 24);
		long h = (i % (3600 * 1000 * 24)) / (3600 * 1000);
		long m = (i % (3600 * 1000)) / (60 * 1000);

		return new long[] { day, h, m };
	}

	public static String getTimeDesc(long start, long end) {
		long[] it = getTime(start, end);
		String d = "";
		if (it[0] != 0) {
			d += it[0] + "天";
		}
		if (it[1] != 0) {
			d += it[1] + "时";
		}
		if (it[2] != 0) {
			d += it[2] + "分";
		}
		if (StringUtils.isEmpty(d)) {
			d = "0分";
		}
		return d;
	}

	public static String getTimeDesc(Date timing_start, Date timing_end) {
		if (timing_start != null && timing_end != null)
			return getTimeDesc(timing_start.getTime(), timing_end.getTime());
		return "";
	}

	public static int getBetweenDayNumber(Date dateA, Date dateB) {
		long dayNumber = 0;
		// 1小时=60分钟=3600秒=3600000
		long mins = 60L * 1000L;
		// long day= 24L * 60L * 60L * 1000L;计算天数之差
		dayNumber = (dateA.getTime() - dateB.getTime()) / mins;
		return (int) dayNumber;
	}

	public static int countWeeksGap(Calendar start, Calendar end) {
		int weeks = 0;
		start.set(Calendar.DAY_OF_WEEK, 1);// 都设置为周日
		end.set(Calendar.DAY_OF_WEEK, 1);// 都设置为周日
		if (start.before(end)) {
			Calendar cal = Calendar.getInstance();
			long time1 = cal.getTimeInMillis();
			long time2 = cal.getTimeInMillis();
			long between_days = (time2 - time1) / (1000 * 3600 * 24);
			int daysGap = Integer.parseInt(String.valueOf(between_days));
			weeks = daysGap / 7;
		}
		weeks++;
		return weeks;
	}

	public static int daysBetween(Date date1, Date date2) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date1);
		long time1 = cal.getTimeInMillis();
		cal.setTime(date2);
		long time2 = cal.getTimeInMillis();
		long between_days = (time2 - time1) / (1000 * 3600 * 24);
		return Integer.parseInt(String.valueOf(between_days));
	}

	public static Date getMonthStart(Integer year, Integer month) {
		Calendar calendar = Calendar.getInstance();
		calendar.set(Calendar.YEAR, year);
		calendar.set(Calendar.MONTH, month);
		calendar.set(Calendar.DAY_OF_MONTH, 1);
		calendar.set(Calendar.HOUR_OF_DAY, 0);
		return calendar.getTime();
	}

	public static Date getMonthEnd(Integer year, Integer month) {
		Calendar calendar = Calendar.getInstance();
		calendar.set(Calendar.YEAR, year);
		calendar.set(Calendar.MONTH, month);
		calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
		calendar.set(Calendar.HOUR_OF_DAY, 23);
		return calendar.getTime();
	}

	public static Date getYearStart(Integer year) {
		Calendar calendar = Calendar.getInstance();
		calendar.clear();
		calendar.set(Calendar.YEAR, year);
		calendar.set(Calendar.MONTH, 0);
		calendar.set(Calendar.DAY_OF_MONTH, 1);
		calendar.set(Calendar.HOUR_OF_DAY, 0);
		return calendar.getTime();
	}

	public static Date getYearEnd(Integer year) {
		Calendar calendar = Calendar.getInstance();
		calendar.clear();
		calendar.set(Calendar.YEAR, year);
		calendar.set(Calendar.MONTH, 11);
		calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
		return calendar.getTime();
	}

	public static Date getQuarterStart(int year, int quarter) {
		Calendar calendar = Calendar.getInstance();
		calendar.set(Calendar.YEAR, year);

		if (quarter == 1) {
			calendar.set(Calendar.MONTH, 0);
			calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMinimum(Calendar.DAY_OF_MONTH));
		}
		if (quarter == 2) {
			calendar.set(Calendar.MONTH, 3);
			calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMinimum(Calendar.DAY_OF_MONTH));
		}
		if (quarter == 3) {
			calendar.set(Calendar.MONTH, 6);
			calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMinimum(Calendar.DAY_OF_MONTH));
		}
		if (quarter == 4) {
			calendar.set(Calendar.MONTH, 9);
			calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMinimum(Calendar.DAY_OF_MONTH));
		}
		calendar.set(Calendar.HOUR_OF_DAY, 0);
		calendar.set(Calendar.MINUTE, 0);
		return calendar.getTime();
	}

	public static Date getQuarterEnd(int year, int quarter) {
		Calendar calendar = Calendar.getInstance();
		calendar.set(Calendar.YEAR, year);
		if (quarter == 1) {
			calendar.set(Calendar.MONTH, 2);
			calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
		}
		if (quarter == 2) {
			calendar.set(Calendar.MONTH, 5);
			calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
		}
		if (quarter == 3) {
			calendar.set(Calendar.MONTH, 8);
			calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
		}
		if (quarter == 4) {
			calendar.set(Calendar.MONTH, 11);
			calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
		}
		calendar.set(Calendar.HOUR_OF_DAY, 23);
		calendar.set(Calendar.MINUTE, 59);
		return calendar.getTime();
	}

	public static String getPrizeCurrTime() {
		Date now = new Date();
		FastDateFormat outFormat = FastDateFormat.getInstance("yyyy年MM月dd日 HH:mm");
		String s = outFormat.format(now);
		return s;
	}

	public static String getCurrTime() {
		Date now = new Date();
		FastDateFormat outFormat = FastDateFormat.getInstance("yyyyMMddHHmmss");
		String s = outFormat.format(now);
		return s;
	}

	public static long Date2Long(int year, int month, int date) {
		Calendar cld = Calendar.getInstance();
		month = month - 1;
		cld.set(year, month, date);
		return cld.getTime().getTime();
	}

	public static long Time2Long(int year, int month, int date, int hour, int minute, int second) {
		Calendar cld = Calendar.getInstance();
		month = month - 1;
		cld.set(year, month, date, hour, minute, second);
		return cld.getTime().getTime();
	}

	public static int getYear(long t) {
		Calendar cld = Calendar.getInstance();
		if (t > 0) {
			cld.setTime(new java.util.Date(t));
		}
		return cld.get(Calendar.YEAR);
	}

	public static int getMonth(long t) {
		Calendar cld = Calendar.getInstance();
		if (t > 0) {
			cld.setTime(new java.util.Date(t));
		}
		return cld.get(Calendar.MONTH) + 1;
	}

	public static int getDay(long t) {
		Calendar cld = Calendar.getInstance();
		if (t > 0) {
			cld.setTime(new java.util.Date(t));
		}
		return cld.get(Calendar.DAY_OF_MONTH);
	}

	public static int getHour(long t) {
		Calendar cld = Calendar.getInstance();
		if (t > 0) {
			cld.setTime(new java.util.Date(t));
		}
		return cld.get(Calendar.HOUR_OF_DAY);
	}

	public static int getMinute(long t) {
		Calendar cld = Calendar.getInstance();
		if (t > 0) {
			cld.setTime(new java.util.Date(t));
		}
		return cld.get(Calendar.MINUTE);
	}

	public static int getFirstDayOfWeek(int year, int month) {

		Calendar cld = Calendar.getInstance();
		cld.set(year, month, 1);

		return cld.get(Calendar.DAY_OF_WEEK);
	}

	public static int getSecond(long t) {
		Calendar cld = Calendar.getInstance();
		if (t > 0) {
			cld.setTime(new java.util.Date(t));
		}
		return cld.get(Calendar.SECOND);
	}

	public static int getYear(Date date) {
		Calendar cld = Calendar.getInstance();
		cld.setTime(date);
		return cld.get(Calendar.YEAR);
	}

	public static int getMonth(Date date) {
		Calendar cld = Calendar.getInstance();
		cld.setTime(date);
		return cld.get(Calendar.MONTH) + 1;
	}

	public static int getDay(Date date) {
		Calendar cld = Calendar.getInstance();
		cld.setTime(date);
		return cld.get(Calendar.DAY_OF_MONTH);
	}

	public static int getHour(Date date) {
		Calendar cld = Calendar.getInstance();
		cld.setTime(date);
		return cld.get(Calendar.HOUR_OF_DAY);
	}

	public static int getMinute(Date date) {
		Calendar cld = Calendar.getInstance();
		cld.setTime(date);
		return cld.get(Calendar.MINUTE);
	}

	public static int getSecond(Date date) {
		Calendar cld = Calendar.getInstance();
		cld.setTime(date);
		return cld.get(Calendar.SECOND);
	}

	public static int getWeekOfMonth(Date date) {
		Calendar cld = Calendar.getInstance();
		cld.setTime(date);
		return cld.get(Calendar.WEEK_OF_MONTH);
	}

	public static int getYear() {
		Calendar cld = Calendar.getInstance();
		cld.setTime(new java.util.Date());
		return cld.get(Calendar.YEAR);
	}

	public static int getMonth() {
		Calendar cld = Calendar.getInstance();
		cld.setTime(new java.util.Date());
		return cld.get(Calendar.MONTH) + 1;
	}

	public static int getDay() {
		Calendar cld = Calendar.getInstance();
		cld.setTime(new java.util.Date());
		return cld.get(Calendar.DAY_OF_MONTH);
	}

	public static boolean checkLeapYear(int Year) {
		boolean isLeapYear = false;
		if (Year % 4 == 0 && Year % 100 != 0) {
			isLeapYear = true;
		}
		if (Year % 400 == 0)
			isLeapYear = true;
		else if (Year % 4 != 0) {
			isLeapYear = false;
		}
		return isLeapYear;
	}

	public static int getDaysOfMonth(int Month, int Year) {
		int Dates = 0;
		if (Month < 0 || Month > 12) {
			System.out.println("Month Error");
		}
		if (Month == 1 || Month == 3 || Month == 5 || Month == 7 || Month == 8 || Month == 10 || Month == 12) {
			Dates = 31;
		}
		if (Month == 2 && checkLeapYear(Year)) {
			Dates = 29;
		}
		if (Month == 2 && !checkLeapYear(Year)) {
			Dates = 28;
		}
		if (Month == 4 || Month == 6 || Month == 9 || Month == 11) {
			Dates = 30;
		}
		return Dates;
	}

	public static List<String> getMonthStartAndEnd(Date fromDate, Date toDate) {
		// 传入一个日期的时间段,返回"1/1/2008&31/1/2008";
		List<String> list = new ArrayList<String>();
		Calendar cal = Calendar.getInstance();
		cal.setTime(fromDate);
		int yearStart = cal.get(Calendar.YEAR);
		int monthStart = cal.get(Calendar.MONTH) + 1;

		Calendar cal2 = Calendar.getInstance();
		cal2.setTime(toDate);
		int yearEnd = cal2.get(Calendar.YEAR);
		int monthEnd = cal2.get(Calendar.MONTH) + 1;

		if (yearEnd - yearStart > 0) {
			for (int i = 0; i <= yearEnd - yearStart; i++) {

				if (i == 0) {// 第一次
					for (int m = monthStart; m <= 12; m++) {
						String monthStartAndEnd = "1/" + m + "/" + yearStart + "&" + getDaysOfMonth(m, yearStart) + "/"
								+ m + "/" + yearStart + "&" + m;
						list.add(monthStartAndEnd);

					}
				} else if (i != (yearEnd - yearStart)) {
					for (int m = 1; m <= 12; m++) {
						String monthStartAndEnd = "1/" + m + "/" + (yearStart + i) + "&" + getDaysOfMonth(m, yearStart)
								+ "/" + m + "/" + (yearStart + i) + "&" + m;
						list.add(monthStartAndEnd);
					}
				} else {// 最后一次
					for (int m = 1; m <= monthEnd; m++) {
						String monthStartAndEnd = "1/" + m + "/" + yearEnd + "&" + getDaysOfMonth(m, yearStart) + "/"
								+ m + "/" + yearEnd + "&" + m;
						list.add(monthStartAndEnd);
					}
				}
			}
		} else if (yearEnd - yearStart == 0) {
			for (int m = monthStart; m <= monthEnd; m++) {
				String monthStartAndEnd = "1/" + m + "/" + yearStart + "&" + getDaysOfMonth(m, yearStart) + "/" + m
						+ "/" + yearStart + "&" + m;
				list.add(monthStartAndEnd);

			}
		}
		return list;
	}

	public static long currentTime() {
		return System.currentTimeMillis();
	}

	public static void main(String[] args) {
		System.out.println(currentTime());
		System.out.println(new Date().getTime());
	}
}
