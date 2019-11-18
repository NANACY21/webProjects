package util;

import java.io.FileWriter;
import java.io.IOException;

/**
 * ���ڻ�������
 * �����ʻ��й���Ϣ������·��
 */
public class AliPayConfig {

//���������������Ļ�����Ϣ

    // Ӧ��ID,����APPID���տ��˺ż�������APPID��Ӧ֧�����˺�
    public static String app_id = "";

    // �̻�˽Կ������PKCS8��ʽRSA2˽Կ
    public static String merchant_private_key = "";

    // ֧������Կ,�鿴��ַ��https://openhome.alipay.com/platform/keyManage.htm ��ӦAPPID�µ�֧������Կ��
    public static String alipay_public_key = "";

    // �������첽֪ͨҳ��·��  ��http://��ʽ������·�������ܼ�?id=123�����Զ����������������������������
    public static String notify_url = "D:\\university\\3_1\\J2EE\\webProjects\\bankms\\web\\a_notify_url.jsp";

    // ҳ����תͬ��֪ͨҳ��·�� ��http://��ʽ������·�������ܼ�?id=123�����Զ����������������������������
    public static String return_url = "D:\\university\\3_1\\J2EE\\webProjects\\bankms\\web\\a_return_url.jsp";

    // ǩ����ʽ
    public static String sign_type = "RSA2";

    // �ַ������ʽ
    public static String charset = "gbk";

    // ֧��������
    public static String gatewayUrl = "https://openapi.alipay.com/gateway.do";

    // ֧��������
    public static String log_path = "F:\\";

    /**
     * д��־��������ԣ�����վ����Ҳ���ԸĳɰѼ�¼�������ݿ⣩
     *
     * @param sWord Ҫд����־����ı�����
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis() + ".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

