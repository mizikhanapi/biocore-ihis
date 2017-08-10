<%-- 
    Document   : HIS040003
    Created on : May 9, 2017, 6:02:28 PM
    Author     : Shammugam
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="Config.Config"%>

<%@include file="../Entrance/validateSession.jsp" %>
<%@include file="validateModuleAccess.jsp" %>

<%
    Config.getFile_url(session);
    Config.getBase_url(request);
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- header -->
        <%@include file = "libraries/pharmacyHeadLibrary.jsp" %>
        <%@include file = "../assets/header.html" %>
        <!-- header -->
    </head>

    <body>

        <div class="container-fluid">
            <div class="row">       

                <!-- menu side -->		
                <%@include file = "libraries/pharmacySideMenus.jsp" %>
                <!-- menu side -->	

                <!-- main -->		
                <div class="main" style="background: #f2f4f8;">

                    <!-- menu top -->
                    <%@include file = "libraries/pharmacyTopMenus.jsp" %>
                    <!-- menu top -->

                    <div class="row">
                        <div class="col-md-12">
                            <div class="thumbnail">


                                <!-- Tab Menu -->
                                <div class="tabbable-panel">
                                    <div class="tabbable-line">
                                        <ul class="nav nav-tabs ">
                                            <li class="active">
                                                <a href="#tab_default_1" data-toggle="tab">
                                                    DRUG INVOICE</a>
                                            </li>
                                            <li>
                                                <a href="#tab_default_2" data-toggle="tab">
                                                    NEW DELIVERY ORDER </a>
                                            </li>
                                        </ul>

                                        <!-- tab content -->
                                        <div class="tab-content">

                                            <div class="tab-pane active" id="tab_default_1">
                                                
                                                <div id="InvoiceTopContentMaster">
                                                </div>
                                                <%@include file="deleveryInvoiceModal.jsp" %>
                                                
                                            </div>
                                            <div class="tab-pane" id="tab_default_2">
                                                <h3 style="margin: 0px;">New Order</h3>
                                                <hr class="pemisah" />

                                                <div id="deleveryOrderTopContent">
                                                </div>

                                                <hr class="pemisah" />

                                                <div id="deleveryOrderBottomContent">
                                                </div>
                                                <%@include file="deleveryOrderModal.jsp" %>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <!-- Tab Menu -->


                            </div>
                        </div>

                    </div>
                    <!-- End Panel -->


                </div>
                <!-- main -->		

            </div>
        </div>




        <!-- Placed at the end of the document so the pages load faster -->
        <%@include file = "libraries/pharmacyFootLibrary.jsp" %>
        <!-- Placed at the end of the document so the pages load faster -->

        <script>

            $('<div class="loading">Loading</div>').appendTo('body');

            $(document).ready(function () {
                $("#InvoiceTopContentMaster").load("deleveryInvoiceMasterTable.jsp");
                $("#deleveryOrderTopContent").load("deleveryOrderBasic.jsp");
                $("#deleveryOrderBottomContent").load("deleveryOrderTable.jsp");
            });


        </script>

    </body>

</html>