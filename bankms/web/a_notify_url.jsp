<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.alipay.api.internal.util.AlipaySignature" %>
<%@ page import="util.AliPayConfig" %>
<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<%
    /* *
     * ���ܣ�֧�����������첽֪ͨҳ��
     * ���ڣ�2017-03-30
     * ˵����
     * ���´���ֻ��Ϊ�˷����̻����Զ��ṩ���������룬�̻����Ը����Լ���վ����Ҫ�����ռ����ĵ���д,����һ��Ҫʹ�øô��롣
     * �ô������ѧϰ���о�֧�����ӿ�ʹ�ã�ֻ���ṩһ���ο���


     *************************ҳ�湦��˵��*************************
     * ������ҳ���ļ�ʱ�������ĸ�ҳ���ļ������κ�HTML���뼰�ո�
     * ��ҳ�治���ڱ������Բ��ԣ��뵽�������������ԡ���ȷ���ⲿ���Է��ʸ�ҳ�档
     * ���û���յ���ҳ�淵�ص� success
     * �����ҳ��ֻ��֧���ɹ���ҵ���߼������˿�Ĵ������Ե����˿��ѯ�ӿڵĽ��Ϊ׼��
     */

    //��ȡ֧����POST����������Ϣ
    Map<String,String> params = new HashMap<String,String>();
    Map<String,String[]> requestParams = request.getParameterMap();
    for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
        String name = (String) iter.next();
        String[] values = (String[]) requestParams.get(name);
        String valueStr = "";
        for (int i = 0; i < values.length; i++) {
            valueStr = (i == values.length - 1) ? valueStr + values[i]
                    : valueStr + values[i] + ",";
        }
        //����������δ����ڳ�������ʱʹ��
        valueStr = new String(valueStr.getBytes("ISO-8859-1"), "gbk");
        params.put(name, valueStr);
    }

    boolean signVerified = AlipaySignature.rsaCheckV1(params, AliPayConfig.alipay_public_key, AliPayConfig.charset, AliPayConfig.sign_type); //����SDK��֤ǩ��

    //�������������д���ĳ������´�������ο�������

	/* ʵ����֤���̽����̻�����������У�飺
	1����Ҫ��֤��֪ͨ�����е�out_trade_no�Ƿ�Ϊ�̻�ϵͳ�д����Ķ����ţ�
	2���ж�total_amount�Ƿ�ȷʵΪ�ö�����ʵ�ʽ����̻���������ʱ�Ľ���
	3��У��֪ͨ�е�seller_id������seller_email) �Ƿ�Ϊout_trade_no��ʵ��ݵĶ�Ӧ�Ĳ��������е�ʱ��һ���̻������ж��seller_id/seller_email��
	4����֤app_id�Ƿ�Ϊ���̻�����
	*/
    if(signVerified) {//��֤�ɹ�
        //�̻�������
        String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"gbk");

        //֧�������׺�
        String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"gbk");

        //����״̬
        String trade_status = new String(request.getParameter("trade_status").getBytes("ISO-8859-1"),"gbk");

        if(trade_status.equals("TRADE_FINISHED")){
            //�жϸñʶ����Ƿ����̻���վ���Ѿ���������
            //���û�������������ݶ����ţ�out_trade_no�����̻���վ�Ķ���ϵͳ�в鵽�ñʶ�������ϸ����ִ���̻���ҵ�����
            //���������������ִ���̻���ҵ�����

            //ע�⣺
            //�˿����ڳ������˿����޺��������¿��˿��֧����ϵͳ���͸ý���״̬֪ͨ
        }else if (trade_status.equals("TRADE_SUCCESS")){
            //�жϸñʶ����Ƿ����̻���վ���Ѿ���������
            //���û�������������ݶ����ţ�out_trade_no�����̻���վ�Ķ���ϵͳ�в鵽�ñʶ�������ϸ����ִ���̻���ҵ�����
            //���������������ִ���̻���ҵ�����

            //ע�⣺
            //������ɺ�֧����ϵͳ���͸ý���״̬֪ͨ
        }

        out.println("success");

    }else {//��֤ʧ��
        out.println("fail");

        //�����ã�д�ı�������¼������������Ƿ�����
        //String sWord = AlipaySignature.getSignCheckContentV1(params);
        //AlipayConfig.logResult(sWord);
    }

    //�������������д���ĳ������ϴ�������ο�������

%>