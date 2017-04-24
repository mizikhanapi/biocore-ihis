<%@page import="java.util.function.ToDoubleFunction"%>
<%@ page import="java.util.*,java.sql.*"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.JsonObject"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<jsp:include page="../WEB-INF/pages/template.jsp">
    <jsp:param value="Render Data From Database" name="pageTitle"/>
    <jsp:param value="<div id='chartContainer'/>" name="content"/> 	
</jsp:include>

<% Gson gsonObj = new Gson();
    String dataPoints = "";
    Map<Object, Object> map = new HashMap<Object, Object>();
    List<Map<Object, Object>> list = new ArrayList<Map<Object, Object>>();

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/canvasjs_db", "root", "");
        Statement statement = connection.createStatement();
        String xVal, yVal;

        ResultSet resultSet = statement.executeQuery("select * from datapoints");
        ResultSetMetaData rsmd = resultSet.getMetaData();

        while (resultSet.next()) {
            xVal = resultSet.getString("x");
            yVal = resultSet.getString("y");
            map = new HashMap<Object, Object>();
            map.put("x", Double.parseDouble(xVal));
            map.put("y", Double.parseDouble(yVal));
            list.add(map);
            dataPoints = gsonObj.toJson(list);
        }
        connection.close();
    } catch (SQLException e) {
        out.println("<div class='alert alert-danger' style='margin:1%;'>Could not connect to the database. Please check if you have mySQL Connector installed on the machine - if not, try installing the same. Please refer to Instruction.txt</div>");
        dataPoints = null;
    }
    
        %>



    <script type="text/javascript">

        $(function () {
    <%if (dataPoints != null) {%>
            var chart = new CanvasJS.Chart("chartContainer", {
                theme: "theme2",
                zoomEnabled: true,
                animationEnabled: true,
                title: {
                    text: "Data From Database"
                },
                data: [
                    {
                        type: "line",

                        dataPoints: <%out.print(dataPoints);%>
                    }
                ]
            });

            chart.render();
    <%}%>
        });
</script>