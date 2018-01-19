<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript" src="/js/lib/jquery/jquery-1.5.2.min.js" charset="utf-8"></script>
<%@ page isELIgnored="false"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Iterator" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="ctxcjl"  value="http://localhost:8081"/>

<%
    String queryBack = (String) request.getAttribute("queryBack");
    ArrayList<Map<String, Object>> newslist = (ArrayList<Map<String, Object>>) request.getAttribute("newslist");
    String totalHits = (String) request.getAttribute("totalHits");
    String totalTime = (String) request.getAttribute("totalTime");
%>
<c:set var="totalHits" value="<%=totalHits%>"/>
<c:set var="queryBack" value="<%=queryBack%>"/>

<script type="text/javascript">

            function toPage(){
        var queryBack="<%=queryBack%>";
        var p = $("#pageNumText").val();
        p = Number(p);

        if(!/^[0-9]*[1-9][0-9]*$/.test(p)){
            return;
        }


        window.location.href = "${ctxcjl}/SearchNews?query="+queryBack+"&pageNum="+p;



        return false;
    }

</script>



<html>
<head>
    <title>搜索结果</title>
    <link type="text/css" rel="stylesheet" href="css/result.css">
</head>
<body>
<div class="result_search">
    <div class="logo">
        <h2><a href="index.jsp">新闻搜索</a></h2>
    </div>
    <div class="searchbox">
        <form action="/SearchNews" method="get">
            <input type="text" name="query" value="<%=queryBack%>">
            <input type="submit" value="搜索一下">
        </form>
    </div>
</div>
<h5 class="result_info">共搜索到<span><%=totalHits%></span>条结果,耗时<span> <%=Double.parseDouble(totalTime) / 1000.0 %></span>秒
</h5>

<!-- 将此方法注释,最好用el表达式进行取值,赋值

    <div class="newslist">
    <%
        if (newslist.size() > 0) {
            Iterator<Map<String, Object>> iter = newslist.iterator();
            while (iter.hasNext()) {
                Map<String, Object> news = iter.next();
                String content = news.get("content").toString();
                content = content.length() > 200 ? content.substring(0, 200) : content;
    %>
    <div class="news">
        <h4><a href="<%=news.get("url")%>"><%=news.get("title")%>
        </a></h4>
        <p><%=content%> ...
        </p>
    </div>
    <%
            }
        }
    %>


</div>

-->


<div class="newslist">
<c:if test="${!empty newslist }">
    <c:forEach items="${newslist }" var="news" varStatus="status">
     <h4>  <a href="${news.url}">${news.title}</a></h4>

      <p>
        <c:if test="${fn:length(news.content)>200 }">
            ${fn:substring(news.content, 0, 200)}...
        </c:if>
            </p>
    </c:forEach>
</c:if>
</div>






<div class="info">

    第<input type="text" id="pageNumText" class="get_input">页
    <input type="button" value="确定" class="btn" style="cursor: pointer;" onclick="toPage();">





    共有<span style="color: red;">${pagination.totalCount }条   </span>
    <c:if test="${pagination.totalPage eq 1}">
        <span class="disabled">首页</span>
        <span class="disabled">上一页</span>
        <span class="current">1</span>
        <span class="disabled">下一页</span>
        <span class="disabled">末页</span>
    </c:if>
<c:if test="${pagination.totalPage > 1 and pagination.totalPage <= 7}">
    <c:if test="${pagination.page eq 1}">
        <span class="disabled">首页</span>
        <span class="disabled">上一页</span>
    </c:if>
    <c:if test="${pagination.page != 1}">
			<span>
				<a href="index.jsp" title="首页">首页</a>
			</span>
        <span>
				<a href="${ctxcjl}/SearchNews?query=${key}&pageNum=${pagination.page-1}" title="上一页">上一页</a>

			</span>
    </c:if>
    <c:forEach var="i" begin="1" end="${pagination.totalPage}">
        <c:if test="${pagination.page eq i}">
				<span class="current">
                        ${i}
                </span>
        </c:if>
        <c:if test="${pagination.page ne i}">
				<span>
                    <a href="${ctxcjl}/SearchNews?query=${key}&pageNum=${i}">${i}</a>

				</span>
        </c:if>
    </c:forEach>

    <c:if test="${pagination.page != pagination.totalPage}">
			<span>
				<a href="${ctxcjl}/SearchNews?query=${key}&pageNum=${pagination.page+1}" title="下一页">下一页</a>

			</span>
        <a href="${ctxcjl}/SearchNews?query=${key}&pageNum=${pagination.totalPage}" title="末页">末页</a>
    </c:if>
    <c:if test="${pagination.page eq pagination.totalPage}">
        <span class="disabled">下一页</span>
        <span class="disabled">末页</span>
    </c:if>

</c:if>

    <c:if test="${pagination.totalPage >7}">
        <c:if test="${pagination.page eq 1}">
            <span class="disabled">首页</span>
            <span class="disabled">上一页</span>
        </c:if>
        <c:if test="${pagination.page != 1}">
			<span>
                <a href="${ctxcjl}/SearchNews?query=${key}" title="首页">首页</a>

			</span>
            <span>
                 <a href="${ctxcjl}/SearchNews?query=${key}&pageNum=${pagination.page-1}" title="上一页">上一页</a>

            </span>
        </c:if>

        <c:choose>

            <c:when test="${pagination.page <= 3}">
                <c:forEach var="i" begin="1" end="7">
                    <c:if test="${pagination.page eq i}">
						<span class="current">
                                ${i}
                        </span>
                    </c:if>
                    <c:if test="${pagination.page ne i}">
						<span>
                    <a href="${ctxcjl}/SearchNews?query=${key}&pageNum=${i}">${i}</a>
						</span>
                    </c:if>
                </c:forEach>
                <span>…</span>
            </c:when>

            <c:when test="${pagination.page > 3 and pagination.page < pagination.totalPage-3}">
                <span>…</span>
                <c:forEach var="i" begin="${pagination.page - 3}" end="${pagination.page + 3}">
                    <c:if test="${pagination.page eq i}">
						<span class="current">
                                ${i}
                        </span>
                    </c:if>
                    <c:if test="${pagination.page ne i}">
						<span>
                    <a href="${ctxcjl}/SearchNews?query=${key}&pageNum=${i}">${i}</a>
						</span>
                    </c:if>
                </c:forEach>
                <span>…</span>
            </c:when>

            <c:when test="${pagination.page > 3 and pagination.page >= pagination.totalPage-3}">
                <span>…</span>
                <c:forEach var="i" begin="${pagination.totalPage - 6}" end="${pagination.totalPage}">
                    <c:if test="${pagination.page eq i}">
						<span class="current">
                                ${i}
                        </span>
                    </c:if>
                    <c:if test="${pagination.page ne i}">
						<span>
                    <a href="${ctxcjl}/SearchNews?query=${key}&pageNum=${i}">${i}</a>
						</span>
                    </c:if>
                </c:forEach>
            </c:when>

        </c:choose>

        <c:if test="${pagination.page != pagination.totalPage}">
			<span>
				<a href="${ctxcjl}/SearchNews?query=${key}&pageNum=${pagination.page+1}" title="下一页">下一页</a>

			</span>
            <span>
        <a href="${ctxcjl}/SearchNews?query=${key}&pageNum=${pagination.totalPage}" title="末页">末页</a>
			</span>
        </c:if>
        <c:if test="${pagination.page eq pagination.totalPage}">
            <span class="disabled">下一页</span>
            <span class="disabled">末页</span>
        </c:if>
    </c:if>



</div>
<div class="info">
    <p>新闻搜索项目实战 Powered By <b> Elasticsearch</b></p>
    <p>@2017 All right reserved</p>
</div>
</body>
</html>

