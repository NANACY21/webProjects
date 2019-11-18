package util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Pattern;

public class Tool {

    /**
     * @param s
     * @param bit
     * @return s�Ƿ���bitλ����
     */
    public static boolean is(String s, int bit) {
        Pattern p = Pattern.compile("^[-\\+]?[\\d]*$");//������ʽ
        if (s.length() == bit && p.matcher(s).matches()) {
            return true;
        }
        return false;
    }

    /**
     * @param s1
     * @param s2
     * @return s1�Ƿ����s2
     */
    public static boolean same(String s1, String s2) {
        if (s1.equals(s2)) {
            return true;
        }
        return false;
    }

    /**
     * @return ��ǰ���� 2019/05/10	09:10:44
     */
    public static String getTime() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd\thh:mm:ss");//�������ڸ�ʽ
        return sdf.format(new Date());//����ת�ַ�����new Date() -- ��ȡ��ǰϵͳʱ��
    }

    //    public String decoderQRCode(){
//        try {
//            String realpath = ServletActionContext.getServletContext().getRealPath("/file");
//            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
//            String imgName = sdf.format(new Date()) + ".png";
//            String filePath = realpath+ Constants.SF_FILE_SEPARATOR+imgName;
//            OutputStream out = new FileOutputStream(filePath);
//            QRCode.GenerateImage(img,out);//����ͼƬ
//            message   = Tool.decoderQRCode(filePath);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return Action.SUCCESS;
//    }
    public static String replaceUnderscore(String s) {
        return s.replace(" ", "_");
    }
}
