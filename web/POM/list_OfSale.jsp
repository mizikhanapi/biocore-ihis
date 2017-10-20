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
        <title>iHIS | POS</title>
        <!-- header -->
        <%@include file = "libraries/headLibrary.jsp" %>
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
                                <h3 style="margin: 0px;">List of Sale</h3>
                                <hr class="pemisah"/>
                                <div style="width:30%; margin: auto;">
                                    <div class="form-horizontal">
                                        <div class="form-group">
                                            
                                            <div class="col-md-10" style=" text-align: center;">
                                                <label class="col-md-4 control-label" for="textinput">View by: </label>
                                                <div class="col-md-8">
                                                    <select class="form-control" name="test" id="selectTimeframe">
                                                        <option value="%d/%m/%Y">Daily</option>
                                                        <option value="%M %Y">Monthly</option>
                                                        <option value="%Y">Yearly</option>
                                                    </select>
                                                </div>
                                            </div> 
                                            
                                            <div class="col-md-2">
                                                <button id="REP_btnRefresh" class="btn btn-default" style=" padding-right: 10px;padding-left: 10px;color: black;"><i class=" fa fa-refresh" style=" padding-right: 10px;padding-left: 10px;color: black;"></i>Refresh</button>

                                            </div>
                                            
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="table-guling" id='viewSale'>
                                 
                                   
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- main -->		

        </div>
    <!-- Add Modal Start -->
    <div class="modal fade" id="modal_report" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
        <div class="modal-dialog" style="width: 80%">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                    <h3 class="modal-title" id="REP_modalTitle"></h3>
                </div>
                <div class="modal-body" id="REP_modalBody">


                    <!-- content goes here -->
                </div>
                <div class="modal-footer">

                </div>
            </div>
        </div>
    </div>
    <!-- Add Modal End -->  

        <!-- Placed at the end of the document so the pages load faster -->
        <%@include file = "libraries/footLibrary.jsp" %>
        <!-- Placed at the end of the document so the pages load faster -->
     
        <script src="../assets/js/buttons.print.min.js" type="text/javascript"></script>
        
        <script type="text/javascript">
            $(function(){
                load_sale();
            });
            
            function load_sale(){
                createScreenLoading();
                var timeFrame = $('#selectTimeframe').val();
                var strName = $("#selectTimeframe option:selected").text(); 
                
                var data={
                    timeFrame : timeFrame,
                    strName : strName
                };
                
                $.ajax({
                    type: 'POST',
                    url: "report_control/getListOfSale.jsp",
                    data: data,
                    success: function (data) {

                        $('#viewSale').html(data);

                        },
                    error: function (jqXHR, textStatus, errorThrown) {
                             $('#viewSale').html("Oopps! "+ errorThrown);
                        },
                    complete: function (jqXHR, textStatus ) {
                            destroyScreenLoading();
                    }

                });
            }
            
            $('#REP_btnRefresh').on('click', function(){
                load_sale();
            });
            
            $('#viewSale').on('click', '.clickable_tr', function(){
                var tr = $(this).closest('tr');
                var leDate = tr.find('#hiddenDate').val();
                var leTimeFrame = tr.find('#hiddenTimeFrame').val();
              
                var data = {
                    date : leDate,
                    timeFrame : leTimeFrame
                }    
                console.log(data);

                createScreenLoading();

                $.ajax({
                    type: 'POST',
                    timeout: 60000,
                    url: "report_control/getListOfSaleDetail.jsp",
                    data: data,
                    success: function (data, textStatus, jqXHR) {
                            $('#REP_modalBody').html(data);
                            $('#modal_report').modal('show');
                        },
                    error: function (jqXHR, textStatus, errorThrown) {
                            bootbox.alert("Oops! "+errorThrown);
                        },
                    complete: function (jqXHR, textStatus ) {
                            destroyScreenLoading();
                    }
                });
            });
        </script>
        
    </body>

</html>