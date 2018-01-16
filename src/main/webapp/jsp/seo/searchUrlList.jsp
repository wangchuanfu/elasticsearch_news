<%@page import="com.founder.ec.common.utils.StringUtil"%>
<%@page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--其它服务器URL start --%>
<%@ page import="com.huayuan.search.common.WebURLParams"%>
<%--其它服务器URL end --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-cn" lang="zh-cn"> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<meta http-equiv="Content-Script-Type" content="text/javascript" /> 
<meta http-equiv="Content-Style-Type" content="text/css" />
<title>健一网|华源|网上药店|大药房|商品列表|</title>
<meta name="keywords" content="健一网,网上药店,网上买药,大药房,正品,杜蕾斯,非处方药,保健品商城" />
<meta name="description"
	content="健一网-专业的医药网上购物商城！要买药，就来j1.com！正规网站、天天低价、支持货到付款。销售产品包括中西药品、健康养生、医疗器械、隐形眼镜、美容护肤、母婴产品、居家生活等七个大类，数百万种产品。" />
</head>
<body>
	<h1>健一网上药店销售低价正品处方药，支持货到付款</h1>
	<c:forEach var="url" items="${allSeoUrl }">
		<a href="${url.liebiaoUrl}">${url.keyWord}</a>
	</c:forEach>
	<script type="text/javascript">
	<!--
		function toPage() {
			var total = Number("${pagination.totalPage}");
			var p = $.trim($("#pageNumText").val());
			p = Number(p);
			if (!p || isNaN(p) || p > total) {
				return;
			}
			if (!/^[0-9]*[1-9][0-9]*$/.test(p)) {
				return;
			}
			window.location.href = "<%=WebURLParams.HOME_PAGE_URL %>/2/0/0-0-0-" + p
					+ "/site.html";
			return false;
		}
	//-->
	</script>
	<div class="page-bottom" id="paginationDivId">
		共${pagination.totalCount }条:
		<c:if test="${pagination.totalPage eq 1}">
			<span class="disabled">首页</span>
			<span class="disabled">上一页</span>
			<span class="current">1</span>
			<span class="disabled">下一页</span>
			<span class="disabled">末页</span>
		</c:if>
		<c:if test="${pagination.totalPage > 1 and pagination.totalPage < 7}">
			<c:if test="${pagination.page eq 1}">
				<span class="disabled">首页</span>
				<span class="disabled">上一页</span>
			</c:if>
			<c:if test="${pagination.page != 1}">
				<span> <a
					href="<%=WebURLParams.HOME_PAGE_URL %>/2/0/0-0-0-1/site.html"
					title="首页">首页</a>
				</span>
				<span> <a
					href="<%=WebURLParams.HOME_PAGE_URL %>/2/0/0-0-0-${pagination.page-1}/site.html"
					title="上一页">上一页</a>
				</span>
			</c:if>
			<c:forEach var="i" begin="1" end="${pagination.totalPage}">
				<c:if test="${pagination.page eq i}">
					<span class="current"> ${i} </span>
				</c:if>
				<c:if test="${pagination.page ne i}">
					<span> <a
						href="<%=WebURLParams.HOME_PAGE_URL %>/2/0/0-0-0-${i}/site.html">${i}</a>
					</span>
				</c:if>
			</c:forEach>
			<c:if test="${pagination.page != pagination.totalPage}">
				<span> <a
					href="<%=WebURLParams.HOME_PAGE_URL %>/2/0/0-0-0-${pagination.page+1}/site.html"
					title="下一页">下一页</a>
				</span>
				<a
					href="<%=WebURLParams.HOME_PAGE_URL %>/2/0/0-0-0-${pagination.totalPage}/site.html"
					title="末页">末页</a>
			</c:if>
			<c:if test="${pagination.page eq pagination.totalPage}">
				<span class="disabled">下一页</span>
				<span class="disabled">末页</span>
			</c:if>
		</c:if>
		<c:if test="${pagination.totalPage >=7}">
			<c:if test="${pagination.page eq 1}">
				<span class="disabled">首页</span>
				<span class="disabled">上一页</span>
			</c:if>
			<c:if test="${pagination.page != 1}">
				<span> <a
					href="<%=WebURLParams.HOME_PAGE_URL %>/2/0/0-0-0-1/site.html"
					title="首页">首页</a>
				</span>
				<span> <a
					href="<%=WebURLParams.HOME_PAGE_URL %>/2/0/0-0-0-${pagination.page-1}/site.html"
					title="上一页">上一页</a>
				</span>
			</c:if>
			<c:forEach var="i" begin="1" end="3">
				<c:if test="${pagination.page eq i}">
					<span class="current"> ${i} </span>
				</c:if>
				<c:if test="${pagination.page ne i}">
					<span> <a
						href="<%=WebURLParams.HOME_PAGE_URL %>/2/0/0-0-0-${i}/site.html">${i}</a>
					</span>
				</c:if>
			</c:forEach>
			<c:if test="${pagination.page < 3}">
				<span>…</span>
			</c:if>
			<c:if
				test="${pagination.page >= 3 and pagination.page < 7  and pagination.page < pagination.totalPage-4}">
				<c:forEach var="i" begin="4" end="${pagination.page}">
					<c:if test="${pagination.page eq i}">
						<span class="current"> ${i} </span>
					</c:if>
					<c:if test="${pagination.page ne i}">
						<span> <a
							href="<%=WebURLParams.HOME_PAGE_URL %>/2/0/0-0-0-${i}/site.html">${i}</a>
						</span>
					</c:if>
				</c:forEach>
				<span>…</span>
			</c:if>
			<c:if
				test="${pagination.page >= 3 and pagination.page < 7 and pagination.page >= pagination.totalPage-4}">
				<c:forEach var="i" begin="4" end="${pagination.totalPage-3}">
					<c:if test="${pagination.page eq i}">
						<span class="current"> ${i} </span>
					</c:if>
					<c:if test="${pagination.page ne i}">
						<span> <a
							href="<%=WebURLParams.HOME_PAGE_URL %>/2/0/0-0-0-${i}/site.html">${i}</a>
						</span>
					</c:if>
				</c:forEach>
			</c:if>
			<c:if
				test="${pagination.page >= 7 and pagination.page < pagination.totalPage-4}">
				<span>…</span>
				<c:forEach var="i" begin="${pagination.page -1}"
					end="${pagination.page+1}">
					<c:if test="${pagination.page eq i}">
						<span class="current"> ${i} </span>
					</c:if>
					<c:if test="${pagination.page ne i}">
						<span> <a
							href="<%=WebURLParams.HOME_PAGE_URL %>/2/0/0-0-0-${i}/site.html">${i}</a>
						</span>
					</c:if>
				</c:forEach>
				<span>…</span>
			</c:if>
			<c:if
				test="${pagination.page >= 7 and pagination.page >= pagination.totalPage-4}">
				<span>…</span>
				<c:forEach var="i" begin="${pagination.page}"
					end="${pagination.totalPage -3}">
					<c:if test="${pagination.page eq i}">
						<span class="current"> ${i} </span>
					</c:if>
					<c:if test="${pagination.page ne i}">
						<span> <a
							href="<%=WebURLParams.HOME_PAGE_URL %>/2/0/0-0-0-${i}/site.html">${i}</a>
						</span>
					</c:if>
				</c:forEach>
			</c:if>
			<c:forEach var="i" begin="${pagination.totalPage - 2}"
				end="${pagination.totalPage}">
				<c:if test="${pagination.page eq i}">
					<span class="current"> ${i} </span>
				</c:if>
				<c:if test="${pagination.page ne i}">
					<span> <a
						href="<%=WebURLParams.HOME_PAGE_URL %>/2/0/0-0-0-${i}/site.html">${i}</a>
					</span>
				</c:if>
			</c:forEach>
			<c:if test="${pagination.page != pagination.totalPage}">
				<span> <a
					href="<%=WebURLParams.HOME_PAGE_URL %>/2/0/0-0-0-${pagination.page+1}/site.html"
					title="下一页">下一页</a>
				</span>
				<span> <a
					href="<%=WebURLParams.HOME_PAGE_URL %>/2/0/0-0-0-${pagination.totalPage}/site.html"
					title="末页">末页</a>
				</span>
			</c:if>
			<c:if test="${pagination.page eq pagination.totalPage}">
				<span class="disabled">下一页</span>
				<span class="disabled">末页</span>
			</c:if>
		</c:if>
	</div>
</body>
</html>