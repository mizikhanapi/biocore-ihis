

<%@include file="../Entrance/validateSession.jsp" %>
<%@include file="validateModuleAccess.jsp" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>iHIS | Health Facility Maintenance</title>
        <!-- header -->
        <%@include file = "libraries/radiologyHeadLibrary.jsp" %>
        <%@include file="../assets/header.html"%>

        <!-- header -->
    </head>

    <body>

        <div class="container-fluid">
            <div class="row">       
                <!-- menu side -->		

                <%@include file="libraries/radiologySideMenus.jsp" %>
                <!-- menu side -->	

                <!-- main -->	

                <div class="main" style="background: #f2f4f8;">
                    <%@include file="libraries/radiologyTopMenus.jsp" %>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="thumbnail">

                                <div class="tabbable-panel">
                                    <h1>Health Facility Maintenance</h1>
                                    <div class="tabbable-line">
                                        <ul class="nav nav-tabs ">
                                            <li class="active">
                                                <a href="#BS_tab1" data-toggle="tab">
                                                    BODY SYSTEM </a>
                                            </li>

                                            <li>
                                                <a href="#BS_tab2" data-toggle="tab">
                                                    MODALITY </a>
                                            </li>

                                            <li>
                                                <a href="#BS_tab3" data-toggle="tab">
                                                    RIS PROCEDURE </a>
                                            </li>

                                        </ul>
                                        <!-- tab content -->
                                        <div class="tab-content">
                                            <div class="tab-pane active" id="BS_tab1">

                                                <div id="bodySystem">

                                                    <div id="bodySystemMain">
                                                    </div>
                                                    <div id="bodySystemTable">
                                                    </div>
                                                    <%@include file="modal/bodySystem_modal.jsp" %>

                                                </div>

                                            </div>

                                            <div class="tab-pane" id="BS_tab2">

                                                <div id="subdiscipline">
                                                    <div id="subdisciplineMain">
                                                    </div>
                                                    <div id="subdisciplineTable">
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="tab-pane" id="BS_tab3">

                                                <div id="healthFacility">
                                                    <div id="healthFacilityMain">
                                                    </div>
                                                    <div id="healthFacilityTable">
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="tab-pane" id="BS_tab4">

                                                <div id="assign">
                                                    <div id="assignDisciplineMain">
                                                    </div>
                                                    <div id="assignDisciplineTable">
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


        <!-- Placed at the end of the document so the pages load faster -->
        <%@include file = "libraries/radiologyFootLibrary.jsp" %>
        <!-- Placed at the end of the document so the pages load faster -->



        <script>


          $('<div class="loading">Loading</div>').appendTo('body');

            $("#bodySystemMain").load("bodySystem_main.jsp");
            //$("#bodySystemTable").load("discipline_table.jsp");

//                $("#subdisciplineMain").load("subdiscipline_main.jsp");
//                $("#subdisciplineTable").load("subdiscipline_table.jsp");
//
//                $("#healthFacilityMain").load("healthFacility_main.jsp");
//                $("#healthFacilityTable").load("healthFacility_table.jsp");
//
//                $("#assignDisciplineMain").load("assignDiscipline_main.jsp");
//                $("#assignDisciplineTable").load("assignDiscipline_table.jsp");



        </script>

    </body>
</html>
