<%-- 
    Document   : HIS050004
    Created on : Jan 18, 2018, 9:42:10 AM
    Author     : Shammugam
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.connect"%>
<%@page import="dBConn.Conn"%>

<%@include file="../Entrance/validateSession.jsp" %>
<%@include file="validateModuleAccess.jsp" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>iHIS | LIS</title>
        <!-- header -->
        <%@include file = "libraries/labHeadLibrary.jsp" %>
        <%@include file = "../assets/header.html" %>
    </head>



    <body>
        <div class="container-fluid">
            <div class="row">
                <!-- menu side -->		
                <%@include file = "libraries/sideMenus.jsp" %>
                <!-- menu side -->
                <div class="main" style="background: #f2f4f8;">
                    <!-- menu top -->
                    <%@include file = "libraries/topMenus.html" %>
                    <!-- menu top -->
                    <div class="row">

                        <div class="col-md-12">
                            <div class="thumbnail">
                                <h3 style="margin: 0px;">Post to Bill</h3>
                                <hr class="pemisah" />


                                <div id="CompleteOrderListMain">

                                </div>


                            </div>
                        </div>
                    </div>

                </div>
            </div>

        </div>


        <!-- Placed at the end of the document so the pages load faster -->
        <%@include file = "libraries/labFootLibrary.jsp" %>
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="libraries/js/jquery.check-file.js" type="text/javascript"></script>


        <script>


            $("#CompleteOrderListMain").load("manageSendToBillMain.jsp");


        </script>

    </body>
</html>
