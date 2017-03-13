<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="Config.Config"%>
<%@page import="main.RMIConnector"%>
<%@ page session="true" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="old/assets/datepicker/jquery-ui.css">
        <script src="old/assets/js/jquery.min.js"></script>
        <!-- Custom styles for this template -->
        
        <link rel="stylesheet" href="old/assets/css/loading.css">
        <link href="old/assets/datepicker/jquery-ui.css" rel="stylesheet">    
        <script src="old/assets/datepicker/jquery-ui.js"></script>
        <script src="old/assets/js/form-validator.min.js"></script>
        <script src="old/assets/js/bootstrap.min.js"></script> 
        
        <script src="old/assets/js/w3data.js"></script>
        <script src="old/assets/js/bootbox.min.js"></script>   

        <!-- header -->
        <%@include file = "../assets/header.html" %>
    
        <!-- header -->
</head>

<body>


    <%  String hfc = "04010101";
        String dataSystemStatus = "1";
        String disc = "Inpatient";
        String subdis = "-";

        session.setAttribute("HFC", hfc);
        session.setAttribute("SYSTEMSTAT", dataSystemStatus);
        session.setAttribute("discipline", disc);
        session.setAttribute("subDicipline", subdis);
        Config.getFile_url(session);
            Config.getBase_url(request);
            Conn conn = new Conn();

    %>


    <!-- header -->
   

    <div class="container-fluid">
        <div class="row">       
            <!-- menu side -->		
             <%@include file = "libraries/sideMenus.jsp" %>
            <!-- menu side -->	

            <!-- main -->		
            <div class="main" style="background: #f2f4f8;">

 <!-- menu top -->
   <%@include file = "libraries/topMenus.html" %>
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
                                                Maintain Ward/ facility type </a>
                                        </li>
                                        <li>
                                            <a href="#tab_default_2" data-toggle="tab">
                                                Maintain Ward/ facility ID </a>
                                        </li>
                                        <li>
                                            <a href="#tab_default_3" data-toggle="tab">
                                                Assign bed to ward </a>
                                        </li>
                                    </ul>
                                    <!-- tab content -->
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="tab_default_1">

                                            <div id="FaciltyType">

                                                <div>
                                                    <%@include file = "facility-type.jsp" %>
                                                 
                                                </div>
                                                    <div>
                                                    
                                                     <%@include file = "facilityType-Table.jsp" %>
                                                
                                                </div>
                                            </div>



                                        </div>
                                        <div class="tab-pane" id="tab_default_2">

                                            <div id="FacilityID">
                                                
                                                <div>  <%@include file = "facility-id.jsp" %>

                                                </div>
                                                
                                                
                                                <div> 
                                                   <%@include file = "facilityID-Table.jsp" %>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="tab-pane" id="tab_default_3">

                                            <div id="MWAssignBed">

                                                <div>  <%@include file = "assign-bed-to-ward.jsp" %>
                                                </div>
                                                <div id="FacilityTypeTable">  <%@include file = "assign-bed-to-ward-table.jsp" %>
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





    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->

<!--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="http://www.w3schools.com/lib/w3data.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/4.4.0/bootbox.min.js"></script>

-->    <script src="bootstrap-3.3.6-dist/js/jquery.dataTables.min.js"></script>


    <script>
        w3IncludeHTML();

        $(document).ready(function () {
//            $("#headerindex").load("libraries/header.html");
//            $("#topmenuindex").load("libraries/topMenus.html");
//            $("#sidemenus").load("libraries/sideMenus.jsp");

//            $("#FacilityTypeMain").load("facility-type.jsp");
//            $("#FacilityTypeTable").load("facilityType-Table.jsp");
//
//            $("#FacilityIDMain").load("facility-id.jsp");
//            $("#FacilityIDTable").load("facilityID-Table.jsp");
//
//
//            $("#AssignBed").load("assign-bed-to-ward.jsp");
//            $("#AssignBedTable").load("assign-bed-to-ward-table.jsp");

        });

    </script>

</body>
</html>