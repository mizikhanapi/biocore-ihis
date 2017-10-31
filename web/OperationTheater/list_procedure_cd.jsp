<%-- 
    Document   : list_procedure_cd
    Created on : Oct 31, 2017, 6:01:30 PM
    Author     : user
--%>

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
                                <h3 style="margin: 0px;">List of Procedure Category Code</h3>
                                <hr class="pemisah"/>
                                <div style="width:100%; margin: auto;">
                                    <div class="form-horizontal">
                                        <div class="form-group">
                                            <div class="col-md-6">
                                                <label class="col-md-4 control-label" for="textinput">Select by body system: </label>
                                                <div class="col-md-8">
                                                    
                                                    <select class="form-control" name="test" id="body_System">
                                                        <option value="all">All</option>
                                                       
                                                    </select>
                                                </div>
                                            </div>
                                            
                                            <div class="col-md-4">
                                                <label class="col-md-4 control-label" for="textinput">Select by modality: </label>
                                                <div class="col-md-8">
                                                    
                                                    <select class="form-control" name="test" id="Select_modality">
                                                        <option value="all">All</option>
                                                       
                                                    </select>

                                                </div>
                                            </div>
                                           
                                            <div class="col-md-2">
                                                <button id="RMOM_btnRefresh" class="btn btn-default" style=" padding-right: 10px;padding-left: 10px;color: black;"><i class=" fa fa-refresh" style=" padding-right: 10px;padding-left: 10px;color: black;"></i>Refresh</button>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                               
                                <hr class="pemisah"/>                    
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
             
            $(function () {
                load_catCode();
            });
            
            function load_catCode(){
                var Select_modality = $('#Select_modality').val();
                var body_System = $('#body_System').val();
                //alert(process);
                var data = {
                    Select_modality : Select_modality,
                    body_System : body_System
                };
                createScreenLoading();
                $.ajax({
                    type: 'POST',
                    url: "report_control/getListOfCategory.jsp",
                    data: data,
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
            
           //-------------------------refresh the order table ---------------------------------------
            $('#RMOM_btnRefresh').on('click', function () {
                //$('#risOrderListContent').html('<div class="loading">Loading</div>');
                load_catCode();
            });

        </script>
        
        

    </body>

</html>