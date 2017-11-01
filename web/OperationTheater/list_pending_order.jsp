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
        <title>iHIS | Operation Theater</title>
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
                <%@include file = "libraries/SideMenus.jsp" %>
                <!-- menu side -->	
                <!-- main -->		
                <div class="main" style="background: #f2f4f8;">
                    <!-- menu top -->
                    <%@include file = "libraries/TopMenus.jsp" %>
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
                                                        <option value="%M %Y">Monthly</option>
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
                       
        }
        
      //-------------------------refresh the order table ---------------------------------------
        $('#RMOM_btnRefresh').on('click', function () {
            //$('#risOrderListContent').html('<div class="loading">Loading</div>');
             load_orderStatus();               

        });
        
        //------------ get details on tr click --------------------------------
        $('#viewOrder').on('click', '.clickable_tr', function(){
            var tr = $(this).closest('tr');
            var leDate = tr.find('#leDate').val();
            var leTimeFrame = tr.find('#leTimeFrame').val();
            var leStatus = tr.find('#leStatus').val();
            
            var data = {
                date : leDate,
                timeFrame : leTimeFrame,
                status : leStatus
            };
            
            //console.log(data);
            
            createScreenLoading();
            
            $.ajax({
                type: 'POST',
                timeout: 60000,
                url: "report_control/getListOfOrderDetail.jsp",
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