package util.reader;

import java.io.*;
import java.util.Date;
import java.util.Enumeration;
import java.util.Properties;
import java.util.Vector;

/**
 * 读取db.properties
 * 该文件中的键值对数一般不变
 */
public class DbReader {

    private static InputStream is = DbReader.class.getClassLoader().getResourceAsStream("\\util\\reader\\db.properties");
    private static Properties props = new Properties();
    private static FileOutputStream fos = null;

    private static String username = null;
    private static String password = null;
    private static String url = null;
    private static String driver = null;

    private static String AccountActivation_bgImg = null;
    private static String accessNum = null;
    private static String faq = null;

    static {
        try {
            props.load(is);
            username = props.getProperty("jdbc.username");
            password = props.getProperty("jdbc.password");
            url = props.getProperty("jdbc.url");
            driver = props.getProperty("jdbc.driver");

            AccountActivation_bgImg = props.getProperty("AccountActivation_bgImg");
            accessNum = props.getProperty("accessNum");
            faq = props.getProperty("faq");

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static String getUsername() {
        return username;
    }

    public static String getPassword() {
        return password;
    }

    public static String getUrl() {
        return url;
    }

    public static String getDriver() {
        return driver;
    }

    public static String getAccountActivation_bgImg() {
        return AccountActivation_bgImg;
    }

    public static String getAccessNum() {
        return accessNum;
    }

    public static String getFaq() {
        return faq;
    }

    /**
     * 写入文件
     *
     * @param cardID 卡号
     * @param money  外币金额
     * @param index
     * @param fla    1-> 购汇 0->结汇
     * @return
     */
    public static String write(long cardID, double money, int index, int fla) {

        try {
            fos = new FileOutputStream("D:\\university\\3_1\\J2EE\\webProjects\\bankms\\src\\util\\reader\\db.properties");
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        int flag = 0;
        Enumeration<?> enu = props.propertyNames();
        while (enu.hasMoreElements()) {
            String item = (String) enu.nextElement();
            if (item.equals(cardID + "")) {
                String property = props.getProperty(cardID + "");
                String[] s = property.trim().split(" ");
                double v = Double.parseDouble(s[index]);
                if (fla == 1) {
                    v = v + money;
                }
                if (fla == 0) {
                    v = v - money;
                }

                s[index] = v + "";
                String temp = "";
                for (int i = 0; i < s.length; i++) {
                    temp = temp + s[i] + " ";
                    flag = 1;
                }
                props.setProperty(cardID + "", temp);
                try {
                    props.store(fos, new Date().toString());
                    fos.flush();
                    fos.close();
                    return "成功";
                } catch (IOException e) {
                    e.printStackTrace();
                }
                break;
            }
        }
        if (flag == 0) {
            props.setProperty(cardID + "", "0 0 0 ");
            String property = props.getProperty(cardID + "");
            String[] s = property.split(" ");
            s[index] = s[index] + money;
            String temp = "";
            for (int i = 0; i < s.length; i++) {
                temp = temp + s[i] + " ";
            }
            props.setProperty(cardID + "", temp);
            try {
                props.store(fos, new Date().toString());
                fos.flush();
                fos.close();
                return "成功";
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return "失败";
    }

    public static Vector<String> getWaiBi(long cardID) {
        String cardID1 = null;
        cardID1 = props.getProperty(cardID + "");
        if (cardID1 == null) {
            props.setProperty(cardID + "", "0 0 0 ");
            try {
                fos = new FileOutputStream("D:\\university\\3_1\\J2EE\\webProjects\\bankms\\src\\util\\reader\\db.properties");
                props.store(fos, new Date().toString());
                fos.flush();
                fos.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        cardID1 = cardID1.trim();
        String[] s = cardID1.split(" ");
        Vector<String> ss = new Vector<>();
        for (int i = 0; i < s.length; i++) {
            ss.addElement(s[i]);
        }
        return ss;
    }
}
