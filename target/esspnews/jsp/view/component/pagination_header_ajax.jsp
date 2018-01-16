<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div style="width:200px;" class="page-bottom">
	<span class="current">${pagination.page}/${pagination.totalPage }</span>
	<c:if test="${pagination.page eq 1}">
		<span class="disabled">上一页</span>
	</c:if>
	<c:if test="${pagination.page ne 1}">
		<span>
			<a onclick="clickPageNum('${pagination.params}','p=${pagination.page-1}')" href="javascript:void(0)" title="上一页">上一页</a>
		</span>
	</c:if>
	<c:if test="${pagination.page eq pagination.totalPage}">
		<span class="disabled">下一页</span>	
	</c:if>
	<c:if test="${pagination.page ne pagination.totalPage}">
		<span>
			<a onclick="clickPageNum('${pagination.params}','p=${pagination.page+1}')" href="javascript:void(0)" title="下一页">下一页</a>
		</span>	
	</c:if>
</div>
