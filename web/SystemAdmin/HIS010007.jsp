<%-- 
    Document   : HIS010007
    Created on : Aug 4, 2017, 8:10:06 PM
    Author     : Ardhi Surya; rdsurya147@gmail.com; insta: @rdcfc
--%>



<%@include file="validateSession.jsp" %>
<%@include file="validateModuleAccess.jsp" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>iHIS | Report</title>
        <!-- header -->
       
        <%@include file="libraries/headLibrary.jsp" %>
        <%@include file="../assets/header.html"%>

        <link rel="stylesheet" href="bootstrap-3.3.6-dist/css/dataTables.bootstrap.min.css">
        <link rel="stylesheet" href="css/table.css">
        <!--<link rel="stylesheet" href="css/loading_sham.css">-->

        <!-- Bootstrap core JavaScript
      ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        
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
                    <%@include file="libraries/topMenus.jsp" %>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="thumbnail">
                                <h3 style="margin: 0px;">Report</h3>
                                <hr class="pemisah" />
                                <div class="tabbable-panel">
                                    <div class="tabbable-line">
                                        <ul class="nav nav-tabs ">
                                            <li class="active">
                                                <a href="#REP_tab1" data-toggle="tab">
                                                     User List </a>
                                            </li>

                                            <li>
                                                <a href="#REP_tab2" data-toggle="tab">
                                                    Lookup List </a>
                                            </li>

                                           
                                        </ul>
                                        <!-- tab content -->
                                        <div class="tab-content">
                                            <div class="tab-pane active" id="REP_tab1">

                                                <div id="USR">

                                                    <div id="USRMain">
                                                    </div>
                                                    
                                                    <div id="USRTable" class="table-guling">
                                                        
                                                    </div>
                                                    

                                                </div>

                                            </div>

                                            <div class="tab-pane" id="REP_tab2">

                                                <div id="Lookup">
                                                    <div id="LookupMain">
                                                    </div>
                                                    
                                                    <div id="LookupTable" class="table-guling">
                                                    
                                                    </div>

                                            </div>

                                        </div>
                                    </div>
                                </div>
                                    <jsp:include page="modal/report_modal.jsp"/>
                                <!-- Tab Menu -->


                            </div>
                        </div>
                    </div>

                </div>

            </div>
            <!-- main -->		

        </div>

                    <%@include file="libraries/footLibrary.jsp" %>
                    <script src="js/jquery.check-file.js" type="text/javascript"></script>





        <script>

            $(document).ready(function () {
                
                $("#USRMain").load("report_user_main.jsp");
                $("#LookupMain").load("report_lookup_main.jsp");
                destroyScreenLoading();

                //$("#PMSMain").load("setting_PMS.jsp");
                

                

            });

        </script>

    </body>
</html>