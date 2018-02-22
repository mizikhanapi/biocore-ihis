<%-- 
    Document   : index
    Created on : Feb 14, 2018, 10:17:02 AM
    Author     : Ardhi Surya; rdsurya147@gmail.com
--%>

<%@page isErrorPage="true" import="java.io.*" contentType="text/html" pageEncoding="UTF-8"%>
<%
    String hostName = request.getContextPath();
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Smooth Error Page Flat Responsive Widget Template :: w3layouts</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Smooth Error Page template Responsive, Login form web template,Flat Pricing tables,Flat Drop downs  Sign up Web Templates, Flat Web forms, Login sign up Responsive web Forms, SmartPhone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!-- Custom Theme files -->
        
        <link href="<%=hostName%>/Error/style.css" rel="stylesheet" type="text/css" media="all" />
        <link rel="shortcut icon" type="image/png" href="<%=hostName%>/assets/favicon.png"/>
        <!-- //Custom Theme files -->
        <!-- web font -->
        <link href="//fonts.googleapis.com/css?family=Josefin+Sans" rel="stylesheet">
        <link href='//fonts.googleapis.com/css?family=Roboto+Condensed:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>
        <!-- //web font -->
    </head>
    <body>
        <!--mian-content-->
        <h1>Smooth Error Page</h1>
        <div class="main-wthree">
            <h2>Oops!</h2>
            <p><span class="sub-agileinfo">Sorry! </span>Something went wrong!</p>

        </div>
        <!--//mian-content-->
        <!-- copyright -->
        <div class="copyright-w3-agile">
            <p><span class="sub-agileinfo">Go <a href="<%=hostName%>/Entrance/Home">Home</a></span></p>
            <br/>
            <p> © 2016 Smooth Error Page . All rights reserved | Design by <a href="http://w3layouts.com/" target="_blank">W3layouts</a></p>
        </div>
        <!-- //copyright --> 

        <!-- Error Message 
        Message: <%=exception%>
               
        StackTrace:
        <%
            StringWriter stringWriter = new StringWriter();
            PrintWriter printWriter = new PrintWriter(stringWriter);
            exception.printStackTrace(printWriter);
            out.println(stringWriter);
            printWriter.close();
            stringWriter.close();
            
        %>
        
      
        --> 

    </body>
</html>
