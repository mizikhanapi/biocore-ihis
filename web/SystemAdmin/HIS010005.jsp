<%-- 
    Document   : System_Maintenance
    Created on : Feb 7, 2017, 10:50:08 AM
    Author     : Ardhi Surya; rdsurya147@gmail.com; insta: @rdcfc
--%>

<%@include file="validateSession.jsp" %>
<%@include file="validateModuleAccess.jsp" %>
<%    String temp_hfc_99 = (String) session.getAttribute("HFC_99");
    String temp_user_id = (String) session.getAttribute("USER_ID");

    MySession SYS_mys = new MySession(temp_user_id, temp_hfc_99);

    // String temp_last_9 = temp_user_id.substring(temp_user_id.length() - 1);
    if (!SYS_mys.isSuperUser()) {
        response.sendRedirect("../Entrance/dashboard.jsp");
        return;
    }

%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>iHIS | System Code Maintenance</title>
        <!-- header -->
        <%@include file="libraries/headLibrary.jsp" %>
        <%@include file="../assets/header.html" %>
        <!--        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
                <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
                <link rel="stylesheet" href="bootstrap-3.3.6-dist/css/dataTables.bootstrap.min.css">-->
        <link rel="stylesheet" href="css/table.css">
        <link rel="stylesheet" href="css/loading_sham.css">

        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <!--        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
                <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/4.4.0/bootbox.min.js"></script>
                <script src="bootstrap-3.3.6-dist/js/jquery.dataTables.min.js"></script>
                <script src="bootstrap-3.3.6-dist/js/dataTables.bootstrap.min.js" type="text/javascript"></script>-->



        <!-- header -->
    </head>

    <body>


        <div class="container-fluid">
            <div class="row">       
                <!-- menu side -->		

                <%@include file="libraries/sideMenus.jsp" %>
                <!-- menu side -->	

                <!-- main -->	

                <div class="main" style="background: #f2f4f8;">
                    <!-- menu top -->
                    <%@include file="libraries/topMenus.jsp" %>
                    <!-- menu top -->
                    <div class="row">
                        <div class="col-md-12">
                            <div class="thumbnail">

                                <div class="tabbable-panel">
                                    <h1>System Code Maintenance</h1>
                                    <div class="tabbable-line">
                                        <ul class="nav nav-tabs ">
                                            <li class="active">
                                                <a href="#S_tab1" data-toggle="tab">
                                                    SYSTEM </a>
                                            </li>

                                            <li>
                                                <a href="#S_tab2" data-toggle="tab">
                                                    MODULE </a>
                                            </li>

                                            <li>
                                                <a href="#S_tab3" data-toggle="tab">
                                                    TRANSACTION CODE </a>
                                            </li>

                                            <li>
                                                <a href="#S_tab4" data-toggle="tab">
                                                    PAGE </a>
                                            </li>

                                            <li>
                                                <a href="#S_tab5" data-toggle="tab">
                                                    SESSION </a>
                                            </li>

                                        </ul>
                                        <!-- tab content -->
                                        <div class="tab-content">
                                            <div class="tab-pane active" id="S_tab1">

                                                <div id="system">

                                                    <div id="systemMain">
                                                    </div>
                                                    <div id="systemTable" class="table-guling">
                                                    </div>

                                                </div>

                                            </div>

                                            <div class="tab-pane" id="S_tab2">

                                                <div id="module">
                                                    <div id="moduleMain">
                                                    </div>
                                                    <div id="moduleTable" class="table-guling">
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="tab-pane" id="S_tab3">

                                                <div id="transaction">
                                                    <div id="transactionMain">
                                                    </div>
                                                    <div id="transactionTable" class="table-guling">
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="tab-pane" id="S_tab4">

                                                <div id="page">
                                                    <div id="pageMain">
                                                    </div>
                                                    <div id="pageTable" class="table-guling">
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="tab-pane" id="S_tab5">

                                                <div id="session">
                                                    <div id="sessionMain">
                                                    </div>
                                                    <!--                                                    <div id="pageTable">
                                                                                                        </div>-->
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
        <%@include file="libraries/footLibrary.jsp" %>

        <script type="text/javascript" src="../assets/js/rd.jquery.preventKey.js"></script>
        <script>


            //        $(function(){
            //            setInterval(sayHai, 10000);
            //            
            //            function sayHai(){
            //                console.log("Hai");
            //                
            //            }
            //        });

            $(function () {
                preventPipeKeyPress(document);
                preventPipeKeyUp("input");
                codeValidityKeyUp(".code-input");
                $('.modal').css("overflow", "auto");
            });



            $("#systemMain").load("system_main.jsp");
            $("#systemTable").load("system_table.jsp");

            $("#moduleMain").load("module_main.jsp");
            $("#moduleTable").load("module_table.jsp");

            $("#transactionMain").load("transaction_main.jsp");
            $("#transactionTable").load("transaction_table.jsp");

            $("#pageMain").load("page_main.jsp");
            $("#pageTable").load("page_table.jsp");

            $('#sessionMain').load("session_main.jsp");






        </script>

    </body>
</html>

