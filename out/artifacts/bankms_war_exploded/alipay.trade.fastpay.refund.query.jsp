<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gbk">
    <title>bankms - �˿��ѯ</title>
</head>
<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<%@ page import="com.alipay.api.*"%>
<%@ page import="com.alipay.api.request.*"%>
<%@ page import="util.AliPayConfig" %>
<%
    //��ó�ʼ����AlipayClient
    AlipayClient alipayClient = new DefaultAlipayClient(AliPayConfig.gatewayUrl, AliPayConfig.app_id, AliPayConfig.merchant_private_key, "json", AliPayConfig.charset, AliPayConfig.alipay_public_key, AliPayConfig.sign_type);

    //�����������
    AlipayTradeFastpayRefundQueryRequest alipayRequest = new AlipayTradeFastpayRefundQueryRequest();

    //�̻������ţ��̻���վ����ϵͳ��Ψһ������
    String out_trade_no = new String(request.getParameter("WIDRQout_trade_no").getBytes("ISO-8859-1"),"gbk");
    //֧�������׺�
    String trade_no = new String(request.getParameter("WIDRQtrade_no").getBytes("ISO-8859-1"),"gbk");
    //���ѡһ����
    //�����˿�ӿ�ʱ��������˿�����ţ�������˿�����ʱδ���룬���ֵΪ��������ʱ���ⲿ���׺ţ�����
    String out_request_no = new String(request.getParameter("WIDRQout_request_no").getBytes("ISO-8859-1"),"gbk");

    alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\","
            +"\"trade_no\":\""+ trade_no +"\","
            +"\"out_request_no\":\""+ out_request_no +"\"}");

    //����
    String result = alipayClient.execute(alipayRequest).getBody();

    //���
    out.println(result);
%>
<body>
</body>
</html>