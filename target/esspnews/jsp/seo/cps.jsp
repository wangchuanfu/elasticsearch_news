<%@page import="java.net.HttpCookie"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="net.sf.json.JSONObject" %>
<%--其它服务器URL start --%>
<%@ page import="com.huayuan.search.common.WebURLParams"%>
<%--其它服务器URL end --%>
<div style="display: none;">
	<script type="text/javascript" src="<%=WebURLParams.CJ_URL %>/js/common/google_analytics.js"></script>
</div>
<%
    String channelId="";
    if(request.getParameter("source")!=null)
    {
	  channelId  = request.getParameter("source");   //来源渠道  如:www.xxx.com
    }
	
	//--针对亿起发要求保存的参数
	String src="";//这个值由广告主指定，用来判断流量来自于亿起发联盟，如果广告主有其他方式识别来源，可以不要此参数(规定yiqifa给我)
	if(request.getParameter("src")!=null)
	{
		src=request.getParameter("src").trim();
	}	
	String channel="cps";//合作方式有cps、sem、roi、cpa等，需要在程序中定义一个固定值即可
	if(request.getParameter("channel")!=null)
	{
		channel=request.getParameter("channel").trim();
	}
	String cid="";//广告主在亿起发平台的推广可有多个标识，此参数可用来区分不同的推广方式，此参数需要回传给亿起发，方便以后如果增加推广方式则接口很容易扩展
	if(request.getParameter("cid")!=null)
	{
		cid=request.getParameter("cid").trim();
	}
	String wi="";//此参数的值经过base64编码，广告主无需转码，须原样回传给亿起发，作为亿起发结算的依据
	if(request.getParameter("wi")!=null)
	{
		wi=request.getParameter("wi").trim();
	}
	
	
	
	//String uid = request.getParameter("uid"); 	//商家ID
	String url   = "";
	String channelName = "";//商家名称
	if(request.getParameter("url")!=null){
		url   = URLDecoder.decode(request.getParameter("url"));
	}
	//完成对终端用户来源的信息标识记录后系统把用户跳转到该URL地址

	response.setHeader("P3P", "CP=\"NOI DEVa TAIa OUR BUS UNI\"");
	
	Integer RD = 30;	//这里是设置COOKIE的有效周期，请按合同规定的广告效果认定期设置， 此处假设广告效果认定期为30天
	//String domainname = ".j1.com";	 //此处xxx设置为你们网站的域名
	if("chanet".equals(channelId)){//成果网
		String sid = request.getParameter("id");
		Cookie newcookie1 = new Cookie("chanetId",sid);
		newcookie1.setPath(request.getContextPath()+"/");
		newcookie1.setDomain(".j1.com");
		if(RD!=0)newcookie1.setMaxAge(60*60*24*RD);
		response.addCookie(newcookie1);
		
		
		Cookie newcookieSrc = new Cookie("cpsSource",channelId);
		newcookieSrc.setPath(request.getContextPath()+"/");
		newcookieSrc.setDomain(".j1.com");
		if(RD!=0)newcookieSrc.setMaxAge(60*60*24*RD);
		response.addCookie(newcookieSrc);
	}else if("lingkete".equals(channelId)){//领克特
		String a_id  = request.getParameter("a_id");    //我们网站下联盟会员ID。
		String m_id  = request.getParameter("m_id");    //广告主在LINKTECH网站的ID
		String c_id  = request.getParameter("c_id");   //广告点击数。
		String l_id  = request.getParameter("l_id");   //广告序号
		String l_type1 = request.getParameter("l_type1"); //广告类型，
		//String merchant_domain = "j1.com";
		if(a_id==null || m_id==null || c_id==null || l_id==null || l_type1==null || url==null)
	   		out.print("<html><head><script language=\"javascript\"> alert('LPMS: Parameter Error'); history.go(-1);</script></head></html>");
		else
		{
			response.setHeader("P3P", "CP=\"NOI DEVa TAIa OUR BUS UNI\""); 
			Cookie ltinfo = new Cookie("LTINFO", a_id + "|" + c_id + "|" + l_id + "|" + l_type1 + "|");
			ltinfo.setPath(request.getContextPath()+"/");
			ltinfo.setDomain(".j1.com");//添加广告主域名
			ltinfo.setMaxAge(60*60*24*RD);
			response.addCookie(ltinfo);
			
			//记录CPS商家
			Cookie newcookieSrc = new Cookie("cpsSource",channelId);
			newcookieSrc.setPath(request.getContextPath()+"/");
			newcookieSrc.setDomain(".j1.com");//添加广告主域名
			newcookieSrc.setMaxAge(60*60*24*RD);
			response.addCookie(newcookieSrc);
		}
	}else if(request.getParameter("source")!=null && request.getParameter("source").startsWith("med-")){
		Cookie newcookieSrc = new Cookie("cpsSource",channelId);
		newcookieSrc.setDomain(".j1.com");//添加广告主域名
		newcookieSrc.setPath(request.getContextPath()+"/");
		newcookieSrc.setMaxAge(60*60*24*RD);//统一Cookie保存为30天
		response.addCookie(newcookieSrc);
	}
	
	
	
	
	//判断是否是亿起发（如果是保存到cookie里）
	if("yiqifa".equals(src))
	{
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("channel", channel);
		jsonObject.put("cid", cid);
		jsonObject.put("wi", wi);
		Cookie newcookieYiqifa = new Cookie("yiqifa",jsonObject.toString());
		newcookieYiqifa.setDomain(".j1.com");
		newcookieYiqifa.setPath(request.getContextPath()+"/");
		newcookieYiqifa.setMaxAge(60*60*24*RD);
		response.addCookie(newcookieYiqifa);
		
		Cookie newcookieYqfSrc = new Cookie("cpsSource","yiqifa");
		newcookieYqfSrc.setDomain(".j1.com");
		newcookieYqfSrc.setPath(request.getContextPath()+"/");
		newcookieYqfSrc.setMaxAge(60*60*24*RD);
		response.addCookie(newcookieYqfSrc);
		
		
		
		
		
		
		
	}
	
	//判断来自闻康商场
	if("wenkang".equals(src))
	{
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("cid", cid);//广告id标志信息
		Cookie newcookieWenkang = new Cookie("wenkang",jsonObject.toString());
		newcookieWenkang.setDomain(".j1.com");
		newcookieWenkang.setPath(request.getContextPath()+"/");
		newcookieWenkang.setMaxAge(60*60*24*RD);
		response.addCookie(newcookieWenkang);
		
		Cookie newcookieWenkSrc = new Cookie("cpsSource","wenkang");
		newcookieWenkSrc.setDomain(".j1.com");
		newcookieWenkSrc.setPath(request.getContextPath()+"/");
		newcookieWenkSrc.setMaxAge(60*60*24*RD);
		response.addCookie(newcookieWenkSrc);
	}
	
	
	//判断来自三脉网
	if("summall".equals(src))
	{
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("cid", cid);//广告id标志信息
		jsonObject.put("wi", wi);//广告id标志信息
		Cookie newcookieSummall = new Cookie("summall",jsonObject.toString());
		newcookieSummall.setDomain(".j1.com");
		newcookieSummall.setPath(request.getContextPath()+"/");
		newcookieSummall.setMaxAge(60*60*24*RD);
		response.addCookie(newcookieSummall);
		
		Cookie newcookieSummallSrc = new Cookie("cpsSource","summall");
		newcookieSummallSrc.setDomain(".j1.com");
		newcookieSummallSrc.setPath(request.getContextPath()+"/");
		newcookieSummallSrc.setMaxAge(60*60*24*RD);
		response.addCookie(newcookieSummallSrc);
	}
	
	

	//重定向URL
	if (url == null || url.equals("") || url.equals("null")) {
        response.sendRedirect("/index.jsp");
    }else{
    	  response.sendRedirect(url);
    }
	
%>
