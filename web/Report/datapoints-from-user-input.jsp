<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../WEB-INF/pages/template.jsp">
	<jsp:param value="Add Data Points from User Input" name="pageTitle"/>
	<jsp:param value="<div style='margin-left:7%'> X Value:<input id='xValue' type='number' step='any' placeholder='Enter X-Value'>
   						Y Value:<input id='yValue' type='number' step='any' placeholder='Enter Y-Value'>
   						<button id='renderButton' class='btn btn-info' type='submit' value='Add DataPoints & Render Chart'>
   						Add DataPoints &amp; Render Chart</button></div><div id='chartContainer'/>" name="content"/> 	
</jsp:include>

<script type="text/javascript">

   $(function () {
       var dps = []; //dataPoints.

       var chart = new CanvasJS.Chart("chartContainer", {
           title: {
               text: "Accepting DataPoints from User Input"
           },
           data: [{
               type: "column",
               dataPoints: dps
           }]
       });

       function addDataPointsAndRender() {
           xValue = Number(document.getElementById('xValue').value);
           yValue = Number(document.getElementById('yValue').value);
           dps.push({
               x: xValue,
               y: yValue
           });
           chart.render();
       }

       var renderButton = document.getElementById('renderButton');
       renderButton.addEventListener('click', addDataPointsAndRender);
   });
</script>