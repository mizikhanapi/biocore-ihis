<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="Config.Config"%>
<%@page import="main.RMIConnector"%>
<%@ page session="true" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../Entrance/validateSession.jsp" %>
<%@include file="validateModuleAccess.jsp" %>

<!DOCTYPE html>
<html lang="en">
    <head>
       
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- header -->
        
        <%@include file="libraries/headLibrary.jsp"%>
        <%@include file = "../assets/header.html" %>
            
    </head>

    <body>
        <div class="loading"></div>
        
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
                                                <a href="#a" data-toggle="tab">
                                                    Maintain Ward/ facility Type</a>
                                            </li>

                                            <li>
                                                <a href="#b" data-toggle="tab">
                                                    Maintain Ward/ facility ID </a>
                                            </li>
                                            <li>
                                                <a href="#c" data-toggle="tab">
                                                    Assign bed to ward </a>
                                            </li>
                                        </ul>
                                        <!-- tab content -->
                                        <div class="tab-content">
                                            <div class="tab-pane active" id="a">
                                                <div>
                                                    <div  id="FacilityTypeMain"> 
                                                      
                                                    </div>

                                                    <div id="FacilityTypeTable"> 
                                                       
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="tab-pane" id="b">

                                                <div  id="FacilityIDMain"> 
                                                   
                                                </div>

                                                <div id="FacilityIDTable"> 
                                                    
                                                </div>
                                            </div>
                                            <div class="tab-pane" id="c">

                                                <div>
                                                    <div id="AssignBed">  
                                                       
                                                    </div>
                                                    <div id="AssignBedTable">  
                                                        
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

        <!-- Script Goes Here -->
        <%@include file="libraries/footLibrary.jsp"%>
       
        <script src="PMS/libraries/lib/js/onKeyPress.js" type="text/javascript"></script>
        <script src="old/assets/js/onKeyPress.js" type="text/javascript"></script>
        <script src="../assets/js/create_destroy_loading.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(function(){
                $('#FacilityTypeMain').load('facility-type.jsp');
                $('#FacilityTypeTable').load('facilityType-Table.jsp');
                
                $('#FacilityIDMain').load('facility-id.jsp');
                $("#FacilityIDTable").load('facilityID-Table.jsp');
                
                $('#AssignBed').load('assign-bed-to-ward.jsp');
                $('#AssignBedTable').load('assign-bed-to-ward-table.jsp');
            });
        </script>
    </body>
</html>