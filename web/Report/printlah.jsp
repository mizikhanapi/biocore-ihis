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

<% Gson gsonObj = new Gson();
    String dataPoints = "";
    Map<Object, Object> map = new HashMap<Object, Object>();
    List<Map<Object, Object>> list = new ArrayList<Map<Object, Object>>();

    try {
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        Connection conn = DriverManager.getConnection("jdbc:mysql://10.73.32.200:3306/emedica?zeroDateTimeBehavior=convertToNull", "root", "qwerty");

        Statement statement = conn.createStatement();
        String type, count;

        ResultSet resultSet = statement.executeQuery("SELECT (IFNull(ELIGIBILITY_TYPE_CODE,'Total')) AS TYPE, COUNT(ELIGIBILITY_TYPE_CODE) AS COUNT FROM pms_episode_adt where ELIGIBILITY_TYPE_CODE = 'STUDENT' or ELIGIBILITY_TYPE_CODE= 'STAFF' GROUP BY ELIGIBILITY_TYPE_CODE");
        ResultSetMetaData rsmd = resultSet.getMetaData();

        while (resultSet.next()) {
            type = resultSet.getString("type");
            count = resultSet.getString("count");
            map = new HashMap<Object, Object>();
            map.put("type", type);
            map.put("count", count);
            list.add(map);
            dataPoints = gsonObj.toJson(list);
        }
        conn.close();
    } catch (SQLException e) {
        out.println("<div class='alert alert-danger' style='margin:1%;'>Could not connect to the database. Please check if you have mySQL Connector installed on the machine - if not, try installing the same. Please refer to Instruction.txt</div>");
        dataPoints = null;
    }

%>

<script type="text/javascript" charset="utf-8">

    $(document).ready(function () {
        var chart = new CanvasJS.Chart("chartContainer", {
            theme: "theme2",
            zoomEnabled: true,
            animationEnabled: true,
            title: {
                text: "Data From Database"
            },
            data: [
                {
                    type: "bar",

                    dataPoints: <%out.print(dataPoints);%>
                }
            ]
        });
        chart.render();
    });
</script>