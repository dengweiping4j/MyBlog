package com.wq.util;

public class StringUtil {

    /*
     * @Description 字符串为空判断
     * @param [str]
     * @return boolean
     * @throws
     * @author dengweiping
     * @date 2019/5/29 11:03
     */
    public static boolean isEmpty(String str) {
        if (str == null || "".equals(str.trim())) {
            return true;
        } else {
            return false;
        }
    }

    /*
     * @Description 字符串非空判断
     * @param [str]
     * @return boolean
     * @throws
     * @author dengweiping
     * @date 2019/5/29 11:02
     */
    public static boolean isNotEmpty(String str) {
        if ((str != null) && !"".equals(str.trim())) {
            return true;
        } else {
            return false;
        }
    }

    /*
     * @Description 空格和回车转义
     * @param [str]
     * @return java.lang.String
     * @throws
     * @author dengweiping
     * @date 2019/5/27 15:58
     */
    public static String replaceSpaceAndEnter(String str) {
        str = str.replace("\n", "<br>");
        str = str.replace(" ", "&nbsp;");
        return str;
    }

    /*
     * @Description 字符串特殊字符转义
     * @param [str]
     * @return java.lang.String
     * @throws
     * @author dengweiping
     * @date 2019/5/27 15:57
     */
    public static String replaceStr(String str) {
        str = str.trim();
        StringBuffer result = new StringBuffer();
        for (int pos = 0; pos < str.length(); pos++) {
            switch (str.charAt(pos)) {
                case '\"':
                    result.append("&quot;");
                    break;
                case '<':
                    result.append("&lt;");
                    break;
                case '>':
                    result.append("&gt;");
                    break;
                case '\'':
                    result.append("&apos;");
                    break;
                case '%':
                    result.append("&pc;");
                    break;
                case '_':
                    result.append("&ul;");
                    break;
                case '#':
                    result.append("&shap;");
                    break;
                case '?':
                    result.append("&ques;");
                    break;
                default:
                    result.append(str.charAt(pos));
                    break;
            }
        }
        String resultStr = replaceSpaceAndEnter(result.toString());
        return resultStr;
    }
}
