package cn.easycms.util;

/**
 * Created by hackingwu on 2014/4/1.
 */
public class URIEncoder {
    /**
     * 把非Ascii码字符串转换成百分号字符串
     *
     * @param src
     * @return
     */
    public static String escape(String src) {

        int i;
        char j;
        StringBuffer temp = new StringBuffer();
        temp.ensureCapacity(src.length() * 6);
        for (i = 0; i < src.length(); i++) {
            j = src.charAt(i);
            //数字，字母
            if (Character.isDigit(j) || Character.isLowerCase(j) || Character.isUpperCase(j))
                temp.append(j);
            else if (j < 256) {
                temp.append("%");
                if (j < 16)
                    temp.append("0");
                temp.append(Integer.toString(j, 16));
            } else {
                temp.append("%u");
                temp.append(Integer.toString(j, 16));
            }
        }
        return temp.toString();
    }

    /**
     * 把百分号字符串转换成字符串
     *
     * @param src
     * @return
     */
    public static String unescape(String src) {
        StringBuffer temp = new StringBuffer();
        temp.ensureCapacity(src.length());
        int lastPos = 0, pos = 0;
        char ch;
        while (lastPos < src.length()) {
            pos = src.indexOf("%", lastPos);
            if (pos == lastPos) {
                if (src.charAt(pos + 1) == 'u') {
                    ch = (char) Integer.parseInt(src.substring(pos + 2, pos + 6), 16);
                    temp.append(ch);
                    lastPos = pos + 6;
                } else {
                    ch = (char) Integer.parseInt(src.substring(pos + 1, pos + 3), 16);

                    temp.append(ch);
                    lastPos = pos + 3;
                }
            } else {
                if (pos == -1) {
                    temp.append(src.substring(lastPos));
                    lastPos = src.length();
                } else {
                    temp.append(src.substring(lastPos, pos));
                    lastPos = pos;
                }
            }
        }
        return temp.toString();
    }

    public static void main(String[] args) {
        String tmp1 = "~!@#$%^&*()_+|\\=-,./?><;'][{}\"";
        String tmp = "吴志坚";
        System.out.println("testing escape : " + tmp);
        tmp = escape(tmp);
        System.out.println(tmp);
        System.out.println("testing unescape :" + tmp);
        System.out.println(unescape(tmp));
    }

}
