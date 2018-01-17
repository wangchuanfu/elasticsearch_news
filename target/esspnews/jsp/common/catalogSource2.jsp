<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

${proCatalogSource}
<script type="text/javascript">
	$(function() {
		$("#allNav").hover(function() {
			$("#sidebar-x").show();
		}, function() {
			$("#sidebar-x").hide();
		});
		$("#sidebar-x").hover(function() {
			$(this).show();
		}, function() {
			$(this).hide();
		});
	});
	$(document).ready(function(){
	    $('.sidelist-x').mousemove(function(){
		$(this).find('.i-list-x').show();
		$(this).find('h3').addClass('sidelisthover');
		});
		$('.sidelist-x').mouseleave(function(){
		$(this).find('.i-list-x').hide();
		$(this).find('h3').removeClass('sidelisthover');
		});
	});
</script>
