<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gbk">
    <title>bankms - ����</title>
</head>
<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<%@ page import="com.alipay.api.*"%>
<%@ page import="com.alipay.api.request.*"%>
<%@ page import="util.AliPayConfig" %>
<%
    //��ó�ʼ����AlipayClient
    AlipayClient alipayClient = new DefaultAlipayClient(AliPayConfig.gatewayUrl, AliPayConfig.app_id, AliPayConfig.merchant_private_key, "json", AliPayConfig.charset, AliPayConfig.alipay_public_key, AliPayConfig.sign_type);

    //�����������
    AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
    alipayRequest.setReturnUrl(AliPayConfig.return_url);
    alipayRequest.setNotifyUrl(AliPayConfig.notify_url);

    //�̻������ţ��̻���վ����ϵͳ��Ψһ�����ţ�����
    String out_trade_no = new String(request.getParameter("WIDout_trade_no").getBytes("ISO-8859-1"),"gbk");
    //���������
    String total_amount = new String(request.getParameter("WIDtotal_amount").getBytes("ISO-8859-1"),"gbk");
    //�������ƣ�����
    String subject = new String(request.getParameter("WIDsubject").getBytes("ISO-8859-1"),"gbk");
    //��Ʒ�������ɿ�
    String body = new String(request.getParameter("WIDbody").getBytes("ISO-8859-1"),"gbk");

    alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\","
            + "\"total_amount\":\""+ total_amount +"\","
            + "\"subject\":\""+ subject +"\","
            + "\"body\":\""+ body +"\","
            + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");

    //�����BizContent����������ѡ����������������Զ��峬ʱʱ�����timeout_express������˵��
    //alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\","
    //		+ "\"total_amount\":\""+ total_amount +"\","
    //		+ "\"subject\":\""+ subject +"\","
    //		+ "\"body\":\""+ body +"\","
    //		+ "\"timeout_express\":\"10m\","
    //		+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
    //��������ɲ��ġ�������վ֧����API�ĵ�-alipay.trade.page.pay-����������½�

    //����
    String result = alipayClient.pageExecute(alipayRequest).getBody();

    //���
    out.println(result);
%>
<body>
</body>
</html>