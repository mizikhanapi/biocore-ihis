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
                                <h3 style="margin: 0px;">List of Procedure Category</h3>
                                <hr class="pemisah"/>
                                <div style="width:100%; margin: auto;">
                                    <div class="form-horizontal">
                                        <div class="form-group">
                                            <div class="text-center">
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
                    type: 'GET',
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
            
            //------------------ load procedure of the selected category -------------------------------
            $('#viewProcedure').on('click', '.clickable_tr', function(){
                var datArr = $(this).closest('tr').find('#CAT_hidden').val().split("|");
                var data={
                    cat_cd: datArr[0],
                    cat_name: datArr[1]
                };
                
                createScreenLoading();
                
                $.ajax({
                    type: 'POST',
                    timeout: 60000,
                    url: "report_control/getListOfProcedure.jsp",
                    data: data,
                    success: function (data, textStatus, jqXHR) {
                        if(data.trim()==='0'){
                            bootbox.alert("There is no procedure under category "+datArr[1]);
                        }
                        else{
                            $('#REP_modalBody').html(data);
                            $('#modal_report').modal('show');
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        bootbox.alert("Oops! "+errorThrown);
                    },
                    complete: function (jqXHR, textStatus ) {
                        destroyScreenLoading();
                    }
                });
            });
            //================= end load procedure ===================================================

        </script>
        
        

    </body>

</html>