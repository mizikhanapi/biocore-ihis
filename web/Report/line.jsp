<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@page import="java.util.function.ToDoubleFunction"%>
<%@page import="java.util.*,java.sql.*"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
    <head>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script type="text/javascript" src="canvasjs.min.js"></script>
        <title>
            test chart
        </title>

    </head>
    <body>
        <div>
            <div id="chartContainer" name="content" >
            </div>
        </div>
    </body>
</html>
<%
Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();

map = new HashMap<Object,Object>(); map.put("x", 10);  map.put("y", 71);list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 20);  map.put("y", 55);list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 30);  map.put("y", 50);list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 40);  map.put("y", 65);list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 50);  map.put("y", 95);list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 60);  map.put("y", 68);list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 70);  map.put("y", 28);list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 80);  map.put("y", 34);list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 90);  map.put("y", 14);list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 100);  map.put("y", 33);list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 110);  map.put("y", 42);list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 120);  map.put("y", 62);list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 130);  map.put("y", 70);list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 140);  map.put("y", 85);list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 150);  map.put("y", 58);list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 160);  map.put("y", 34);list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 170);  map.put("y", 24);list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 180);  map.put("y", 33);list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 190);  map.put("y", 28);list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 200);  map.put("y", 42);list.add(map);	
String dataPoints = gsonObj.toJson(list);
%>

<script type="text/javascript" charset="utf-8">

   $(function () {
       var chart = new CanvasJS.Chart("chartContainer", {
           theme: "theme2",
           zoomEnabled: true,
           animationEnabled: true,
           title: {
               text: "Line Chart in JSP using CanvasJS"
           },
           subtitles: [
               {
                   text: "Try Zooming and Panning"
               }
           ],
           data: [{
               type: "line",
               dataPoints: <%out.print(dataPoints);%>
           }]
       });
       chart.render();
   });
</script>