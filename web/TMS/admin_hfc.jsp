<%-- 
    Document   : admin_hfc
    Created on : Apr 15, 2018, 9:08:28 PM
    Author     : user
--%>

<%@include file="../Entrance/validateSession.jsp" %>
<%@include file="validateAdminAccess.jsp" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>iHIS | Tenant Management System</title>
        <!-- header -->
        <%@include file="libraries/headLibrary.jsp" %>
        <%@include file = "../assets/header.html" %>
        <!-- header -->
    </head>

    <body>
        <div class="loading"></div>
        <div class="container-fluid">
            <div class="row">       
                <!-- menu side -->	
                <%@include file = "libraries/adminSideMenus.jsp" %>
                <!-- menu side -->	
                <!-- main -->		
                <div class="main" style="background: #f2f4f8;">
                    <!-- menu top -->
                    <%@include file = "libraries/adminTopMenus.jsp" %>
                    <!-- menu top -->
                    <div class="row">
                        <div class="col-md-12">
                            <div  class="thumbnail">


                                <!-- Tab Menu -->
                                <div class="tabbable-panel">
                                    <div class="tabbable-line">
                                        <ul class="nav nav-tabs ">
                                            <li class="active">
                                                <a href="#tab_default_1" data-toggle="tab" >
                                                    HEALTH FACILITY</a>
                                            </li>                                            
                                        </ul>
                                        <!-- tab content -->
                                        <div class="tab-content">
                                            <div class="tab-pane active" id="tab_default_1">
                                                <div id="hfcMain">

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


        <!-- Placed at the end of the document so the pages load faster -->
        <%@include file = "libraries/footLibrary.jsp" %>
       
        <script type="text/javascript" src="../assets/js/rd.jquery.preventKey.js"></script>
        <script type="text/javascript" src="../assets/js/rd.jquery.check-file.js"></script>
        <script type="text/javascript" src="../assets/js/rd.jquery.validator.js"></script>
        <!-- Placed at the end of the document so the pages load faster -->


        <script>

            // createScreenLoading();
            $(function () {
                preventPipeKeyPress(document);
                preventPipeKeyUp("input");
                codeValidityKeyUp(".code-input");
            });



            $("#hfcMain").load("admin_hfc/hfc_main.jsp");
//            $("#risOrderListContent").load("risManageOrderListTable.jsp");
//            $("#risOrderDetailContent").load("risManageOrderListBasicInfoNew.jsp");

            // destroyScreenLoading();

        </script>

    </body>

</html>