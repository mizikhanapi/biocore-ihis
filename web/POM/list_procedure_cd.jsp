<%-- 
    Document   : HIS060001
    Created on : Mar 28, 2017, 12:18:51 PM
    Author     : Ardhi Surya; rdsurya147@gmail.com; insta: @rdcfc
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="Config.Config"%>

<%@include file="../Entrance/validateSession.jsp" %>
<%@include file="validateModuleAccess.jsp" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>iHIS | Procedure Order Management</title>
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
                <%@include file = "libraries/sideMenus.jsp" %>
                <!-- menu side -->	
                <!-- main -->		
                <div class="main" style="background: #f2f4f8;">
                    <!-- menu top -->
                    <%@include file = "libraries/topMenus.jsp" %>
                    <!-- menu top -->
                    <div class="row">
                        <div class="col-md-12">
                            <div class="thumbnail">
                                <h3 style="margin: 0px;">List of Procedure Code</h3>
                                <hr class="pemisah"/>
                                <div style="width:20%; margin: auto;">
                                    <div class="form-horizontal">
                                        <div class="form-group">
                                            
                                            <div class="col-md-12">
                                                <button id="REP_btnRefresh" class="btn btn-default" style=" padding-right: 10px;padding-left: 10px;color: black;"><i class=" fa fa-refresh" style=" padding-right: 10px;padding-left: 10px;color: black;"></i>Refresh</button>

                                            </div>
                                            
                                        </div>
                                    </div>
                                </div>
                               
                                <div class="table-guling" id='viewProcedure'>
                                   
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- main -->		

        </div>


        <!-- Placed at the end of the document so the pages load faster -->
        <%@include file = "libraries/footLibrary.jsp" %>
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="../assets/js/buttons.print.min.js" type="text/javascript"></script>
        <script src="../assets/js/buttons.colVis.min.js" type="text/javascript"></script>
        <script>
            $(function(){
                load_code();
            });
            
            function load_code(){
                createScreenLoading();
                 $.ajax({
                    type: 'GET',
                    url: "report_control/getListOfCode.jsp",
                    success: function (data) {
                        //$("#viewProcedure").val(data.trim());
                        $('#viewProcedure').html(data);
                       // $('#viewProcedure').trigger('contentchanged');
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        $('#viewProcedure').html("Oopps! "+errorThrown);
                    },
                    complete: function (jqXHR, textStatus ) {
                        destroyScreenLoading();
                    }

                });
            }
            
            $('#REP_btnRefresh').on('click', function(){
                load_code();
            });
            
        </script>        

    </body>

</html>