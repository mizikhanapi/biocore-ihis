<%--
    Document   : HIS080005
    Created on : Oct 11, 2017, 3:13:21 AM
    Author     : Shammugam
--%>

<%@page import="Config.Config"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>

<%@include file="../Entrance/validateSession.jsp" %>
<%@include file="validateModuleAccess.jsp" %>


<%    Config.getFile_url(session);
    Config.getBase_url(request);

    Conn conn = new Conn();
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
    String sub = session.getAttribute("SUB_DISCIPLINE_CODE").toString();

%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- header -->
        <%@include file = "libraries/billingHeadLibrary.jsp" %>
        <%@include file = "../assets/header.html" %>
        <!-- header -->
    </head>

    <body>
        <div class="container-fluid">
            <div class="row">       
                <!-- menu side -->	
                <%@include file = "libraries/billingSideMenus.jsp" %>
                <!-- menu side -->	
                <!-- main -->		
                <div class="main" style="background: #f2f4f8;">
                    <!-- menu top -->
                    <%@include file = "libraries/billingTopMenu.jsp" %>
                    <!-- menu top -->
                    <div class="row">
                        <div class="col-md-12">
                            <div class="thumbnail">

                                <div id="manageBillParameterMainDIV">
                                </div>
                                <div id="manageBillParameterTableDIV">
                                </div>
                                <%@include file="manageBillParameterModal.jsp" %>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- main -->		

        </div>

        <%@include file = "includes/message.html" %>    

        <!-- Placed at the end of the document so the pages load faster -->
        <%@include file = "libraries/billingFootLibrary.jsp" %>
        <!-- Placed at the end of the document so the pages load faster -->

        <script>


            $('<div class="loading">Loading</div>').appendTo('body');

            $("#manageBillParameterMainDIV").load("manageBillParameterMain.jsp");
            $("#manageBillParameterTableDIV").load("manageBillParameterTable.jsp");


        </script>

    </body>
</html>
