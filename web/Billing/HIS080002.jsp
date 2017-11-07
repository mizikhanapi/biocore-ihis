<%--
    Document   : HIS080002
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
        <style>

            .selectedtr {
                background-color:yellow;
            }

        </style>
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
                            <div  class="thumbnail">


                                <!-- Tab Menu -->
                                <div class="tabbable-panel">
                                    <div class="tabbable-line">
                                        <ul class="nav nav-tabs " id="myTab">
                                            <li class="active">
                                                <a href="#tab_default_1" data-toggle="tab">
                                                    GENERATED BILL MASTER</a>
                                            </li>
                                            <li>
                                                <a href="#tab_default_2" data-toggle="tab">
                                                    GENERATED BILL DETAIL</a>
                                            </li>
                                        </ul>
                                        <!-- tab content -->
                                        <div class="tab-content">
                                            <div class="tab-pane active" id="tab_default_1">

                                                <div id="manageBillMasterOrderListMain">
                                                </div>

                                                <hr/>
                                                <br>

                                                <div id="manageBillMasterOrderListContent">
                                                    <table class="table table-bordered" id="manageBillMasterOrderListTable" style="width: 100%">
                                                        <thead>
                                                        <th>Transaction Date</th>
                                                        <th>Bill No.</th>
                                                        <th>Customer ID</th>
                                                        <th>Name</th>
                                                        <th>IC No.</th>
                                                        <th>Other ID</th>
                                                        <th>Phone No.</th>
                                                        <th>Outstanding (RM)</th>
                                                        <th>Action</th>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td colspan="9" align="center">No Record To Show<br>Please Select Correct Filter And Press Refresh Button</td>
                                                            </tr> 
                                                        </tbody>
                                                    </table>
                                                </div>

                                            </div>

                                            <div class="tab-pane" id="tab_default_2">

                                                <div id="manageBillDetailOrderDetailContent">
                                                </div>

                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <!-- Tab Menu -->

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

            $("#manageBillMasterOrderListMain").load("manageBillMasterListMainFilter.jsp");

        </script>

    </body>
</html>
