<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gbk">
    <title>bankms - ���ײ�ѯ</title>
</head>
<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<%@ page import="com.alipay.api.*"%>
<%@ page import="com.alipay.api.request.*"%>
<%@ page import="util.AliPayConfig" %>
<%
    //��ó�ʼ����AlipayClient
    AlipayClient alipayClient = new DefaultAlipayClient(AliPayConfig.gatewayUrl, AliPayConfig.app_id, AliPayConfig.merchant_private_key, "json", AliPayConfig.charset, AliPayConfig.alipay_public_key, AliPayConfig.sign_type);

    //�����������
    AlipayTradeQueryRequest alipayRequest = new AlipayTradeQueryRequest();

    //�̻������ţ��̻���վ����ϵͳ��Ψһ������
    String out_trade_no = new String(request.getParameter("WIDTQout_trade_no").getBytes("ISO-8859-1"),"gbk");
    //֧�������׺�
    String trade_no = new String(request.getParameter("WIDTQtrade_no").getBytes("ISO-8859-1"),"gbk");
    //���ѡһ����

    alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\","+"\"trade_no\":\""+ trade_no +"\"}");

    //����
    String result = alipayClient.execute(alipayRequest).getBody();

    //���
    out.println(result);
%>
<body>
</body>
</html>