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
        <title>iHIS | RIS</title>
        <!-- header -->
        <%@include file = "libraries/radiologyHeadLibrary.jsp" %>
        <%@include file = "../assets/header.html" %>
        <!-- header -->
    </head>

    <body>
        <div class="loading"></div>
        <div class="container-fluid">
            <div class="row">       
                <!-- menu side -->	
                <%@include file = "libraries/radiologySideMenus.jsp" %>
                <!-- menu side -->	
                <!-- main -->		
                <div class="main" style="background: #f2f4f8;">
                    <!-- menu top -->
                    <%@include file = "libraries/radiologyTopMenus.jsp" %>
                    <!-- menu top -->
                    <div class="row">
                        <div class="col-md-12">
                            <div class="thumbnail">
                                <h3 style="margin: 0px;">List of Order Status</h3>
                                <hr class="pemisah"/>
                                
                                <div style="width: 70%; margin: auto;">
                                    <div class="form-horizontal">
                                        <div class="form-group">
                                            <div class="col-md-5">
                                                <label class="col-md-5 control-label" for="textinput">Select by order status: </label>
                                                <div class="col-md-7">
                                                    <select class="form-control" name="test" id="selectStatus">
                                                        <option value="0">Pending</option>
                                                        <option value="1">In progress</option>
                                                        <option value="2">Complete</option>
                                                        <option value="3">Cancel</option>
                                                     </select>
                                                </div>


                                            </div>

                                            <div class="col-md-5" style=" text-align: center;">
                                               <label class="col-md-4 control-label" for="textinput">View by: </label>
                                                <div class="col-md-8">
                                                    <select class="form-control" name="test" id="selectTimeframe">
                                                        <option value="%d/%m/%Y">Daily</option>
                                                        <option value="%m/%Y">Monthly</option>
                                                        <option value="%Y">Yearly</option>
                                                    </select>
                                                </div>
                                            </div> 

                                            <div class="col-md-2">
                                                <button id="RMOM_btnRefresh" class="btn btn-default" style=" padding-right: 10px;padding-left: 10px;color: black;"><i class=" fa fa-refresh" style=" padding-right: 10px;padding-left: 10px;color: black;"></i>Refresh</button>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                    
                                <div class="table-guling" id="viewOrder">
                                   
                                </div>
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
        
        <script src="../assets/js/buttons.print.min.js" type="text/javascript"></script>
        
        <script>
        $(function(){
            load_orderStatus();           
        });
        
        function load_orderStatus(){
            createScreenLoading();
            $('#viewOrder').html("");
             var status = $('#selectStatus').val();
             var timeFrame = $('#selectTimeframe').val();
            //alert(process);
            var data = {
                status : status,
                timeFrame : timeFrame
            };
            
            $.ajax({
                type: 'POST',
                url: "report_control/getListOfOrder.jsp",
                data: data,
                success: function (data) {
                    
                    $('#viewOrder').html(data);
                   
                    },
                error: function (jqXHR, textStatus, errorThrown) {
                         $('#viewOrder').html("Oopps! "+ errorThrown);
                    },
                complete: function (jqXHR, textStatus ) {
                        destroyScreenLoading();
                }

            });
            
             //-------------------------refresh the order table ---------------------------------------
            $('#RMOM_btnRefresh').on('click', function () {
                //$('#risOrderListContent').html('<div class="loading">Loading</div>');
                 load_orderStatus();               

            });
        }

    </script>

        

    </body>

</html>