<%-- 
    Document   : HIS060001
    Created on : Mar 28, 2017, 12:18:51 PM
    Author     : Ardhi Surya; rdsurya147@gmail.com; insta: @rdcfc
--%>

<%@include file="../Entrance/validateSession.jsp" %>
<%@include file="validateModuleAccess.jsp" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>iHIS | Radiology Code Maintenance</title>
        <!-- header -->
        <link href="libraries/css/table.css">
        <link href="libraries/css/multi-select.css" rel="stylesheet" type="text/css"/>
        <%@include file = "libraries/radiologyHeadLibrary.jsp" %>
        
        <%@include file="../assets/header.html"%>

        <!-- header -->
    </head>

    <body>
        <div class="loading"></div>
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
                                <h3 style="margin: 0px;">Radiology Maintenance</h3>
                                <hr class="pemisah" />
                                <div class="tabbable-panel">

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
                                                    <div id="bodySystemTable" class="table-guling">
                                                    </div>
                                                    <%@include file="modal/bodySystem_modal.jsp" %>

                                                </div>

                                            </div>

                                            <div class="tab-pane" id="BS_tab2">

                                                <div id="modality">
                                                    <div id="modalityMain">
                                                    </div>
                                                    <div id="modalityTable" class="table-guling">
                                                    </div>
                                                    <%@include file="modal/modality_modal.jsp" %>

                                                </div>

                                            </div>

                                            <div class="tab-pane" id="BS_tab3">

                                                <div id="procedure">
                                                    <div id="procedureMain">
                                                    </div>
                                                    <div id="procedureTable" class="table-guling">
                                                    </div>
                                                    <%@include file="modal/procedure_modal.jsp" %>
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
        <script src="libraries/js/jquery.multi-select.js"></script>
        <script src="../assets/js/rd.jquery.preventKey.js"></script>
        <!-- Placed at the end of the document so the pages load faster -->



        <script>
            
            $(function(){
                preventPipeKeyPress(document);
                preventPipeKeyUp("input");
                codeValidityKeyUp(".code-input");
            });

            $('<div class="loading">Loading</div>').appendTo('body');

            $("#bodySystemMain").load("bodySystem_main.jsp");
            $("#bodySystemTable").load("bodySystem_table.jsp");

            $("#modalityMain").load("modality_main.jsp");
            $("#modalityTable").load("modality_table.jsp");

            $("#procedureMain").load("procedure_main.jsp");
            $("#procedureTable").load("procedure_table.jsp");
//
//                $("#assignDisciplineMain").load("assignDiscipline_main.jsp");
//                $("#assignDisciplineTable").load("assignDiscipline_table.jsp");



        </script>

    </body>
</html>
