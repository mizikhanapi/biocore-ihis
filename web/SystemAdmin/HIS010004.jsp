<%-- 
    Document   : Health_Facility_Maintenance
    Created on : Feb 3, 2017, 3:58:28 PM
    Author     : Ardhi Surya; rdsurya147@gmail.com; insta: @rdcfc
--%>


<%@include file="validateSession.jsp" %>
<%@include file="validateModuleAccess.jsp" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>iHIS | Health Facility Maintenance</title>
        <!-- header -->
        <!--    <div w3-include-html="libraries/header.html"></div>-->
        <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>-->
        <%@include file="libraries/headLibrary.jsp" %>
        <%@include file="../assets/header.html"%>
<!--        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
        <script src="bootstrap-3.3.6-dist/js/jquery.dataTables.min.js"></script>
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
                    <%@include file="libraries/topMenus.jsp" %>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="thumbnail">
                                <h3 style="margin: 0px;">Health Facility Maintenance</h3>
                                <hr class="pemisah" />
                                <div class="tabbable-panel">
                                    <div class="tabbable-line">
                                        <ul class="nav nav-tabs ">
                                            <li class="active">
                                                <a href="#HM_tab3" data-toggle="tab">
                                                    HEALTH FACILITY </a>
                                            </li>

                                            <li>
                                                <a href="#HM_tab1" data-toggle="tab">
                                                    DISCIPLINE </a>
                                            </li>

                                            <li>
                                                <a href="#HM_tab2" data-toggle="tab">
                                                    SUBDISCIPLINE </a>
                                            </li>

                                            <li>
                                                <a href="#HM_tab4" data-toggle="tab">
                                                    ASSIGN DISCIPLINE</a>
                                            </li>

                                        </ul>
                                        <!-- tab content -->
                                        <div class="tab-content">
                                            <div class="tab-pane" id="HM_tab1">

                                                <div id="discipline">

                                                    <div id="disciplineMain">
                                                    </div>
                                                    <div id="disciplineTable" class="table-guling">
                                                    </div>

                                                </div>

                                            </div>

                                            <div class="tab-pane" id="HM_tab2">

                                                <div id="subdiscipline">
                                                    <div id="subdisciplineMain">
                                                    </div>
                                                    <div id="subdisciplineTable" class="table-guling">
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="tab-pane active" id="HM_tab3">

                                                <div id="healthFacility">
                                                    <div id="healthFacilityMain">
                                                    </div>
                                                    <div id="healthFacilityTable" class="table-guling">
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="tab-pane" id="HM_tab4">

                                                <div id="assign">
                                                    <div id="assignDisciplineMain">
                                                    </div>
                                                    <div id="assignDisciplineTable" class="table-guling">
                                                    </div>
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
                    <script src="js/jquery.check-file.js" type="text/javascript"></script>





        <script>


            $(document).ready(function () {

                $("#disciplineMain").load("discipline_main.jsp");
                $("#disciplineTable").load("discipline_table.jsp");

                $("#subdisciplineMain").load("subdiscipline_main.jsp");
                //$("#subdisciplineTable").load("subdiscipline_table.jsp");

                $("#healthFacilityMain").load("healthFacility_main.jsp");
                $("#healthFacilityTable").load("healthFacility_table.jsp");

                $("#assignDisciplineMain").load("assignDiscipline_main.jsp");
                $("#assignDisciplineTable").load("assignDiscipline_table.jsp");

                $('a[data-toggle="tab"]').click(function (e) {
                    // $('#tab_a').find('a').removeAttr('data-toggle');
                    var target = $(e.target).attr("href");
                    e.preventDefault();
                    //console.log(target);
                    if (target === '#HM_tab2') {
                        $("#subdisciplineTable").load("subdiscipline_table.jsp");
                    }
                });

            });

        </script>

    </body>
</html>
