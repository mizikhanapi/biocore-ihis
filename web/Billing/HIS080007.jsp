<%-- 
    Document   : HIS080007
    Created on : Feb 22, 2018, 9:24:47 AM
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

                                <h3 style="margin: 0px;">Sales Report by Customer</h3>
                                <hr class="pemisah" />

                                <div id="reportBilllingCustomerSalesReportMainDIV">
                                </div>

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


            //  $('<div class="loading">Loading</div>').appendTo('body');
            //report main head
            $('#BLIPage6').removeClass('collapsed'); 
            $('#BLIPage6').attr('aria-expanded', true);
            //report submenu
            $('#Report').addClass('in');
            $('#Report').attr('aria-expanded', true);
            $('#BLIPage6R2').addClass('active');
            
            $("#reportBilllingCustomerSalesReportMainDIV").load("reportBilllingCustomerSalesReportMain.jsp");


        </script>

    </body>
</html>
