<%--
    Document   : HIS080001
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
                            <div  class="thumbnail">

                                <h3 style="margin: 0px;">Billing</h3>
                                <hr class="pemisah" />

                                <!-- Tab Menu -->
                                <div class="tabbable-panel">
                                    <div class="tabbable-line">
                                        <ul class="nav nav-tabs " id="myTab">
                                            <li class="active">
                                                <a href="#tab_default_1" data-toggle="tab">
                                                    LIST OF CUSTOMER BILLS</a>
                                            </li>
                                            <li>
                                                <a href="#tab_default_2" data-toggle="tab">
                                                    DETAILS OF CUSTOMER BILLS</a>
                                            </li>
                                        </ul>
                                        <!-- tab content -->
                                        <div class="tab-content">
                                            <div class="tab-pane active" id="tab_default_1">

                                                <div id="billMasterOrderListMain">
                                                </div>
                                                <div id="billMasterOrderListContent">
                                                    <table class="table table-bordered" id="billMasterOrderListTable" style="width: 100%">
                                                        <thead>
                                                        <th style="text-align: left;">PMI No.</th>
                                                        <th style="text-align: left;">Name</th>
                                                        <th style="text-align: left;">IC No.</th>
                                                        <th style="text-align: left;">Other ID</th>
                                                        <th style="text-align: left;">Address</th>
                                                        <th style="text-align: left;">Phone No.</th>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td colspan="6" align="center">Please select correct filter and press refresh button</td>
                                                            </tr> 
                                                        </tbody>
                                                    </table>
                                                </div>

                                            </div>

                                            <div class="tab-pane" id="tab_default_2">

                                                <div id="billDetailOrderDetailContent">
                                                </div>
                                                <div id="billDetailOrderDetailContentButton">
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


            $('<div class="loading">Loading</div>').appendTo('body');
            
            $('#BLIPage1').addClass('active');

            $("#billMasterOrderListMain").load("billMasterOrderListMain.jsp");
            //$("#billMasterOrderListContent").load("billMasterOrderListTable.jsp");
            //$("#billDetailOrderDetailContentButton").load("viewBillGenereteBillMasterButton.jsp");


        </script>

    </body>
</html>
