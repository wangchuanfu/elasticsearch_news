<%-- <%@page import="com.itextpdf.text.log.SysoLogger"%> --%>
<%@page import="java.net.URLEncoder"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.net.HttpCookie"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.lang.*" %>
<%@ page import="net.sf.json.JSONObject" %>
<%
	//公共CPS入口 
	String cpsSource=""; //来源 如:yiqifa--亿起发
	String linkUrl="";//转向页面链接
	String cid=""; //返回参数，标识，用来区分不同的推广方式
	String wi="";//返回参数 
	Integer RD = 30;	//这里是设置COOKIE的有效周期，请按合同规定的广告效果认定期设置， 此处默认广告效果认定期为30天
	
	if(request.getParameter("source")!=null){
		cpsSource=request.getParameter("source").trim();
	}
	if(request.getParameter("linkUrl")!=null){
		linkUrl= URLDecoder.decode(request.getParameter("linkUrl").trim());
	}
	if(request.getParameter("cid")!=null){
		cid=request.getParameter("cid").trim();
	}
	if(request.getParameter("wi")!=null){
		wi=request.getParameter("wi").trim();
	}
	
	//完成对终端用户来源的信息标识记录后系统把用户跳转到该URL地址
	response.setHeader("P3P", "CP=\"NOI DEVa TAIa OUR BUS UNI\"");
	
	//创建cpsSource Cookie记录来源
	Cookie cpsCookie=new Cookie("cpsSource",cpsSource);
	cpsCookie.setDomain(".j1.com");
	cpsCookie.setPath(request.getContextPath()+"/");
	if(RD!=0)cpsCookie.setMaxAge(60*60*24*RD);
	response.addCookie(cpsCookie);
	
	JSONObject jsonObject = new JSONObject();
	jsonObject.put("cid", cid);
	jsonObject.put("wi", wi);
	
	//创建CPS Cookie 记录参数信息
	Cookie subCookie=new Cookie(cpsSource,jsonObject.toString());
	subCookie.setDomain(".j1.com");
	subCookie.setPath(request.getContextPath()+"/");
	try{
		if(RD!=0)subCookie.setMaxAge(60*60*24*RD);
		response.addCookie(subCookie);
		
		//重定向URL
		if (linkUrl == null || linkUrl.equals("") || linkUrl.equals("null")) {
	        response.sendRedirect("/index.jsp");
	    }else{
	    	  response.sendRedirect(linkUrl);
	    }	
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
%>