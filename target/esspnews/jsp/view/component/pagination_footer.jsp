<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--其它服务器URL start --%>
<%@ page import="com.huayuan.search.common.WebURLParams"%>
<%--其它服务器URL end --%>

<script type="text/javascript">
<!--
	function toPage(){
		var total = Number("${pagination.totalPage}");
		var p = $.trim($("#pageNumText").val());
		p = Number(p);
		if(!p || isNaN(p) || p>total){
			return;
		}
		if(!/^[0-9]*[1-9][0-9]*$/.test(p)){
			return;
		}
		window.location.href = "<%=WebURLParams.LIST_PAGE_URL %>${pagination.requestURL}.html?orderBy=${orderBy}&pageNum="+p;
		return false;
	}
//-->
</script>
<div class="get-page">
	第<input type="text" id="pageNumText" class="get_input">页 
	<input type="button" value="确定" class="btn" style="cursor: pointer;" onclick="toPage();">
</div>
<div class="page-bottom" id="paginationDivId">
共${pagination.totalCount }条: 							
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
				<a href="<%=WebURLParams.LIST_PAGE_URL %>${pagination.requestURL}.html?orderBy=${orderBy}&pageNum=1" title="首页">首页</a>
			</span>
			<span>
				<a href="<%=WebURLParams.LIST_PAGE_URL %>${pagination.requestURL}.html?orderBy=${orderBy}&pageNum=${pagination.page-1}" title="上一页">上一页</a>
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
					<a href="<%=WebURLParams.LIST_PAGE_URL %>${pagination.requestURL}.html?orderBy=${orderBy}&pageNum=${i}">${i}</a>
				</span>
			</c:if>		
		</c:forEach>
		<c:if test="${pagination.page != pagination.totalPage}">
			<span>
				<a href="<%=WebURLParams.LIST_PAGE_URL %>${pagination.requestURL}.html?orderBy=${orderBy}&pageNum=${pagination.page+1}" title="下一页">下一页</a>
			</span>
			<a href="<%=WebURLParams.LIST_PAGE_URL %>${pagination.requestURL}.html?orderBy=${orderBy}&pageNum=${pagination.totalPage}" title="末页">末页</a>
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
				<a href="<%=WebURLParams.LIST_PAGE_URL %>${pagination.requestURL}.html?orderBy=${orderBy}&pageNum=1" title="首页">首页</a>
			</span>
			<span>
				<a href="<%=WebURLParams.LIST_PAGE_URL %>${pagination.requestURL}.html?orderBy=${orderBy}&pageNum=${pagination.page-1}" title="上一页">上一页</a>
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
							<a href="<%=WebURLParams.LIST_PAGE_URL %>${pagination.requestURL}.html?orderBy=${orderBy}&pageNum=${i}" >${i}</a>
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
							<a href="<%=WebURLParams.LIST_PAGE_URL %>${pagination.requestURL}.html?orderBy=${orderBy}&pageNum=${i}" >${i}</a>
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
							<a href="<%=WebURLParams.LIST_PAGE_URL %>${pagination.requestURL}.html?orderBy=${orderBy}&pageNum=${i}" >${i}</a>
						</span>
					</c:if>		
				</c:forEach>
			</c:when>
		</c:choose>
		<c:if test="${pagination.page != pagination.totalPage}">
			<span>
				<a href="<%=WebURLParams.LIST_PAGE_URL %>${pagination.requestURL}.html?orderBy=${orderBy}&pageNum=${pagination.page+1}" title="下一页">下一页</a>
			</span>
			<span>
				<a href="<%=WebURLParams.LIST_PAGE_URL %>${pagination.requestURL}.html?orderBy=${orderBy}&pageNum=${pagination.totalPage}" title="末页">末页</a>
			</span>
		</c:if>
		<c:if test="${pagination.page eq pagination.totalPage}">
			<span class="disabled">下一页</span>	
			<span class="disabled">末页</span>		
		</c:if>
	</c:if>
</div>