<%-- 
    Document   : chartquery
    Created on : Apr 23, 2017, 9:05:37 PM
    Author     : user
--%>

<%@page import="java.sql.*"%>
<%@page import="com.google.gson.*"%>
<%
    // (A) database connection
    // "jdbc:mysql://localhost:3306/northwind" - the database url of the form jdbc:subprotocol:subname
    // "root" - the database user on whose behalf the connection is being made
    // "abcd" - the user's password
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection conn = DriverManager.getConnection("jdbc:mysql://10.73.32.200:3306/emedica?zeroDateTimeBehavior=convertToNull", "root", "qwerty");
    
    // (B) retrieve necessary records from database
    Statement getFromDb = conn.createStatement();
    ResultSet products = getFromDb.executeQuery("SELECT  (IFNull(ELIGIBILITY_TYPE_CODE,'Total')) AS type,COUNT(ELIGIBILITY_TYPE_CODE) AS Count FROM pms_episode_adt where ELIGIBILITY_TYPE_CODE = 'STUDENT' or ELIGIBILITY_TYPE_CODE= 'STAFF' GROUP BY ELIGIBILITY_TYPE_CODE");
    // (C) format returned ResultSet as a JSON array
    JsonArray recordsArray = new JsonArray();
    while (products.next()) {
        JsonObject currentRecord = new JsonObject();
        currentRecord.add("TYPE",
                new JsonPrimitive(products.getString("TYPE")));
        currentRecord.add("COUNT",
                new JsonPrimitive(products.getString("COUNT")));
        recordsArray.add(currentRecord);
    }
    // (D)
    out.print(recordsArray);
    out.flush();
%>