<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
<!--
	$(function(){
		var scroll = "${param.scroll}";
		if(scroll == "true"){
			$('body,html').scrollTop(0);
		}
	});

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
		clickPageNum('${pagination.params}','p='+p);
	}
//-->
</script>

<div class="page-bottom" id="paginationDivId">
 <div class="get-page">
		第<input type="text" id="pageNumText" class="get_input" >页
		<input type="button" value="确定" class="btn" style="cursor: pointer;" onclick="toPage();">
</div>
<div style="width:450px; float:right;">共${pagination.totalCount }条:						
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
			<span>
				<a onclick="clickPageNum('${pagination.params}','p=1')" href="javascript:void(0)" title="首页">首页</a>
			</span>
			<span>
				<a onclick="clickPageNum('${pagination.params}','p=${pagination.page-1}')" href="javascript:void(0)" title="上一页">上一页</a>
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
					<a onclick="clickPageNum('${pagination.params}','p=${i}')" href="javascript:void(0)">${i}</a>
				</span>
			</c:if>		
		</c:forEach>
		<c:if test="${pagination.page != pagination.totalPage}">
			<span>
				<a onclick="clickPageNum('${pagination.params}','p=${pagination.page+1}')" href="javascript:void(0)" title="下一页">下一页</a>
			</span>
			<a onclick="clickPageNum('${pagination.params}','p=${pagination.totalPage}')" href="javascript:void(0)" title="末页">末页</a>
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
			<span>
				<a onclick="clickPageNum('${pagination.params}','p=1')" href="javascript:void(0)" title="首页">首页</a>
			</span>
			<span>
				<a onclick="clickPageNum('${pagination.params}','p=${pagination.page-1}')" href="javascript:void(0)" title="上一页">上一页</a>
			</span>
		</c:if>
		<c:forEach var="i" begin="1" end="3">
			<c:if test="${pagination.page eq i}">
				<span class="current">
					${i}
				</span>
			</c:if>
			<c:if test="${pagination.page ne i}">
				<span>
					<a onclick="clickPageNum('${pagination.params}','p=${i}')" href="javascript:void(0)" >${i}</a>
				</span>
			</c:if>		
		</c:forEach>
		
		<c:if test="${pagination.page < 3}">
			<span>…</span>	
		</c:if>
		
		<c:if test="${pagination.page >= 3 and pagination.page < 7  and pagination.page < pagination.totalPage-4}">
			<c:forEach var="i" begin="4" end="${pagination.page}">
				<c:if test="${pagination.page eq i}">
					<span class="current">
						${i}
					</span>
				</c:if>
				<c:if test="${pagination.page ne i}">
					<span>
						<a onclick="clickPageNum('${pagination.params}','p=${i}')" href="javascript:void(0)">${i}</a>
					</span>
				</c:if>		
			</c:forEach>
			<span>…</span>
		</c:if>
		<c:if test="${pagination.page >= 3 and pagination.page < 7 and pagination.page >= pagination.totalPage-4}">
			<c:forEach var="i" begin="4" end="${pagination.totalPage-3}">
				<c:if test="${pagination.page eq i}">
					<span class="current">
						${i}
					</span>
				</c:if>
				<c:if test="${pagination.page ne i}">
					<span>
						<a onclick="clickPageNum('${pagination.params}','p=${i}')" href="javascript:void(0)">${i}</a>
					</span>
				</c:if>		
			</c:forEach>
		</c:if>
		
		<c:if test="${pagination.page >= 7 and pagination.page < pagination.totalPage-4}">
			<span>…</span>
			<c:forEach var="i" begin="${pagination.page -1}" end="${pagination.page+1}">
				<c:if test="${pagination.page eq i}">
					<span class="current">
						${i}
					</span>
				</c:if>
				<c:if test="${pagination.page ne i}">
					<span>
						<a onclick="clickPageNum('${pagination.params}','p=${i}')" href="javascript:void(0)">${i}</a>
					</span>
				</c:if>		
			</c:forEach>
			<span>…</span>
		</c:if>
		
		<c:if test="${pagination.page >= 7 and pagination.page >= pagination.totalPage-4}">
			<span>…</span>
			<c:forEach var="i" begin="${pagination.page}" end="${pagination.totalPage -3}">
				<c:if test="${pagination.page eq i}">
					<span class="current">
						${i}
					</span>
				</c:if>
				<c:if test="${pagination.page ne i}">
					<span>
						<a onclick="clickPageNum('${pagination.params}','p=${i}')" href="javascript:void(0)">${i}</a>
					</span>
				</c:if>		
			</c:forEach>
		</c:if>
		
		<c:forEach var="i" begin="${pagination.totalPage - 2}" end="${pagination.totalPage}">
			<c:if test="${pagination.page eq i}">
				<span class="current">
					${i}
				</span>
			</c:if>
			<c:if test="${pagination.page ne i}">
				<span>
					<a onclick="clickPageNum('${pagination.params}','p=${i}')" href="javascript:void(0)">${i}</a>
				</span>
			</c:if>		
		</c:forEach>
		<c:if test="${pagination.page != pagination.totalPage}">
			<span>
				<a onclick="clickPageNum('${pagination.params}','p=${pagination.page+1}')" href="javascript:void(0)" title="下一页">下一页</a>
			</span>
			<span>
				<a onclick="clickPageNum('${pagination.params}','p=${pagination.totalPage}')" href="javascript:void(0)" title="末页">末页</a>
			</span>
		</c:if>
		<c:if test="${pagination.page eq pagination.totalPage}">
			<span class="disabled">下一页</span>	
			<span class="disabled">末页</span>		
		</c:if>
	</c:if>
	</div>
   
</div>