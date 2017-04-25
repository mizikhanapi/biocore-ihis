<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../WEB-INF/pages/template.jsp">
	<jsp:param value="Render Chart from JSON" name="pageTitle"/>
	<jsp:param value="<div id='chartContainer'/>" name="content"/> 	
</jsp:include>

<script type="text/javascript">
   $(function () {
   	var dataPoints = [];
   	$.getJSON("${pageContext.request.contextPath}/DataService?xstart=1&ystart=10&length=100&type=json", function(data) {  
   		var chart = new CanvasJS.Chart("chartContainer",{
   			animationEnabled: true,
   			zoomEnabled: true,
   			title:{
   				text:"CanvasJS Charts in JSP using JSON & AJAX"
   			},
   			data: [{
   				type: "line",
   				dataPoints : data
   			}]
   		});
   		chart.render();
   	});
   });
</script>