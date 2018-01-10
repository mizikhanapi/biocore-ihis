<%-- 
    Document   : HIS060003
    Created on : May 1, 2017, 3:05:05 AM
    Author     : Ardhi Surya; rdsurya147@gmail.com; insta: @rdcfc
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="Config.Config"%>

<%@include file="../Entrance/validateSession.jsp" %>
<%@include file="validateModuleAccess.jsp" %>

<%//    Config.getFile_url(session);
//    Config.getBase_url(request);
    Conn conn = new Conn();

%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>iHIS | RIS</title>
        <!-- header -->
        <%@include file = "libraries/radiologyHeadLibrary.jsp" %>
        <%@include file = "../assets/header.html" %>
        <!-- header -->
    </head>

    <body>
        <div class="loading"></div>
        <div class="container-fluid">
            <div class="row">       
                <!-- menu side -->	
                <%@include file = "libraries/radiologySideMenus.jsp" %>
                <!-- menu side -->	
                <!-- main -->		
                <div class="main" style="background: #f2f4f8;">
                    <!-- menu top -->
                    <%@include file = "libraries/radiologyTopMenus.jsp" %>
                    <!-- menu top -->
                    <div class="row">
                        <div class="col-md-12">
                            <div  class="thumbnail">
                                <h3 style="margin: 0px;">Result List</h3>
                                <hr class="pemisah" />

                                <div id="risResultMain">

                                </div>
                                <div id="risResultContent" class="table-guling">

                                </div>
                                <%@include file="order_modal/verifyResult_modal.jsp" %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- main -->		

        </div>


        <!-- Placed at the end of the document so the pages load faster -->
        <%@include file = "libraries/radiologyFootLibrary.jsp" %>
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="libraries/js/jquery.check-file.js" type="text/javascript"></script>
        <script src="../assets/js/rd.jquery.preventKey.js" type="text/javascript"></script>

        <script>
            
            $(function(){
                preventPipeKeyPress(document);
                preventPipeKeyUp("input");
            });

            createScreenLoading();

            $("#risResultMain").load("risResult_main.jsp");
            $("#risResultContent").load("risResult_table.jsp");

        </script>

    </body>

</html>
