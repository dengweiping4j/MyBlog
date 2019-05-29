package com.wq.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author dengweiping
 * @project_name MyBlog
 * @date 2019-5-24
 */
public class DateUtil {

    /*
     * @Description 将日期格式化为指定格式
     * @param [date, format]
     * @return java.lang.String
     * @throws
     * @author dengweiping
     * @date 2019/5/24 16:25
     */
    public static String formatDate(Date date, String format) {
        String result = "";
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        if (date != null) {
            result = sdf.format(date);
        }
        return result;
    }


    /*
     * @Description 将字符串格式化为指定格式
     * @param [str, format]
     * @return java.util.Date
     * @throws
     * @author dengweiping
     * @date 2019/5/24 16:24
     */
    public static Date formatString(String str, String format) throws Exception {
        if (StringUtil.isEmpty(str)) {
            return null;
        }
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        return sdf.parse(str);
    }

    /*
     * @Description 将当前日期格式化为yyyy-MM-dd HH:mm:ss
     * @return java.lang.String
     * @throws
     * @author dengweiping
     * @date 2019/5/24 16:23
     */
    public static String getCurrentDateStr() throws Exception {
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return sdf.format(date);
    }

    /*
     * @Description 根据当前时间，将传入时间的时间处理为刚刚、几分钟前、几小时前等
     * @param [date]
     * @return java.lang.String
     * @throws
     * @author dengweiping
     * @date 2019/5/24 16:22
     */
    public static String DateHandel(String date) {
        String nowDate = null;//当前时间
        try {
            nowDate = getCurrentDateStr();
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (date != null && date.length() >= 16) {
            int dateYear = Integer.parseInt(date.substring(0, 4));//年
            int nowYear = Integer.parseInt(nowDate.substring(0, 4));//当前年
            int dateMonth = Integer.parseInt(date.substring(5, 7));//月
            int nowMonth = Integer.parseInt(nowDate.substring(5, 7));//当前月
            int dateDay = Integer.parseInt(date.substring(8, 10));//日
            int nowDay = Integer.parseInt(nowDate.substring(8, 10));//当前日
            int dateHour = Integer.parseInt(date.substring(11, 13));//小时
            int nowHour = Integer.parseInt(nowDate.substring(11, 13));//当前小时
            int dateMinute = Integer.parseInt(date.substring(14, 16));//分
            int nowMinute = Integer.parseInt(nowDate.substring(14, 16));//当前分
            if (nowYear - dateYear < 1) {
                if (nowMonth - dateMonth == 0) {
                    if (nowDay == dateDay) {
                        if ((nowHour - dateHour) < 1 && (nowMinute - dateMinute) < 1) {
                            return "刚刚";
                        } else if (nowHour - dateHour < 1) {
                            return (nowMinute - dateMinute) + "分钟前";
                        } else if (nowHour - dateHour <= 6) {
                            return (nowHour - dateHour) + "小时前";
                        }
                        return "今天 " + date.substring(11,16);
                    } else if (nowDay - dateDay == 1) {
                        return "昨天 " + date.substring(11, 16);
                    } else if (nowDay - dateDay == 2) {
                        return "前天 " + date.substring(11, 16);
                    }
                }
                return date.substring(5, 16);
            }
            return date.substring(0, 16);
        }
        return date.substring(0, 16);
    }
}
