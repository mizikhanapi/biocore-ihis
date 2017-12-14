<%-- 
    Document   : HIS220003
    Created on : Nov 13, 2017, 6:26:53 PM
    Author     : Shammugam
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="Config.Config"%>

<%@include file="../Entrance/validateSession.jsp" %>
<%@include file="validateModuleAccess.jsp" %>

<%    Config.getFile_url(session);
    Config.getBase_url(request);

%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- header -->
        <%@include file = "libraries/stockHeadLibrary.jsp" %>
        <%@include file = "../assets/header.html" %>
        <!-- header -->
    </head>

    <body>
        <div class="container-fluid">
            <div class="row">       
                <!-- menu side -->	
                <%@include file = "libraries/stockSideMenus.jsp" %>
                <!-- menu side -->	
                <!-- main -->		
                <div class="main" style="background: #f2f4f8;">
                    <!-- menu top -->
                    <%@include file = "libraries/stockTopMenus.jsp" %>
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
                                                    MANAGE STOCK CATEGORY
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#tab_default_2" data-toggle="tab">
                                                    MANAGE STOCK ITEM
                                                </a>
                                            </li>
                                        </ul>
                                        <!-- tab content -->
                                        <div class="tab-content">
                                            <div class="tab-pane active" id="tab_default_1">
                                                <div id="contentATC">
                                                    <div id="contentStockCategoryMain">
                                                    </div>
                                                    <div id="contentStockCategoryTable">
                                                    </div>
                                                    <%@include file="manageStockCodeCateCloneModal.jsp" %>
                                                    <%@include file="manageStockCodeCateModal.jsp" %>
                                                </div>
                                            </div>
                                            <div class="tab-pane" id="tab_default_2">
                                                <div id="contentMDC">
                                                    <div id="contentStockItemMain">
                                                    </div>
                                                    <div id="contentStockItemTable">
                                                    </div>
                                                    <%@include file="manageStockCodeItemCloneModal.jsp" %>
                                                    <%@include file="manageStockCodeItemModal.jsp" %>
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
        <%@include file = "libraries/stockFootLibrary.jsp" %>
        <!-- Placed at the end of the document so the pages load faster -->

        <script>

            $(document).ready(function () {

                $('<div class="loading">Loading</div>').appendTo('body');

                // Load Stock Category
                $("#contentStockCategoryMain").load("manageStockCodeCateMain.jsp");
                $("#contentStockCategoryTable").load("manageStockCodeCateTable.jsp");

                // Load Stock Item
                $("#contentStockItemMain").load("manageStockCodeItemMain.jsp");
                $("#contentStockItemTable").load("manageStockCodeItemTable.jsp");


            });


        </script>

    </body>

</html>