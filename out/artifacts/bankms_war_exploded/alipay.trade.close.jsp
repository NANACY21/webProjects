<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gbk">
    <title>bankms - 交易关闭</title>
</head>
<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<%@ page import="util.AliPayConfig" %>
<%@ page import="com.alipay.api.AlipayClient" %>
<%@ page import="com.alipay.api.DefaultAlipayClient" %>
<%@ page import="com.alipay.api.request.AlipayTradeCloseRequest" %>
<%
    //获得初始化的AlipayClient
    AlipayClient alipayClient = new DefaultAlipayClient(AliPayConfig.gatewayUrl, AliPayConfig.app_id, AliPayConfig.merchant_private_key, "json", AliPayConfig.charset, AliPayConfig.alipay_public_key, AliPayConfig.sign_type);

    //设置请求参数
    AlipayTradeCloseRequest alipayRequest = new AlipayTradeCloseRequest();
    //商户订单号，商户网站订单系统中唯一订单号
    String out_trade_no = new String(request.getParameter("WIDTCout_trade_no").getBytes("ISO-8859-1"),"gbk");
    //支付宝交易号
    String trade_no = new String(request.getParameter("WIDTCtrade_no").getBytes("ISO-8859-1"),"gbk");
    //请二选一设置

    alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\"," +"\"trade_no\":\""+ trade_no +"\"}");

    //请求
    String result = alipayClient.execute(alipayRequest).getBody();

    //输出
    out.println(result);
%>
<body>
</body>
</html>