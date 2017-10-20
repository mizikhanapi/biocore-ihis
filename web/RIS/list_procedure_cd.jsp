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
                                <h3 style="margin: 0px;">List of Procedure Code</h3>
                                <hr class="pemisah"/>
                                <div style="width:100%; margin: auto;">
                                    <div class="form-horizontal">
                                        <div class="form-group">
                                            <div class="col-md-6">
                                                <label class="col-md-4 control-label" for="textinput">Select by body system: </label>
                                                <div class="col-md-8">
                                                    <%  Conn conn = new Conn();
                                                        String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();

                                                        String test_ca = "SELECT body_system_cd,body_system_name FROM ris_body_system WHERE hfc_cd = '"+hfc_cd+"'";
                                                        ArrayList<ArrayList<String>> test_cd = conn.getData(test_ca);
                                                    %>

                                                    <select class="form-control" name="test" id="body_System">
                                                        <option value="all">All</option>
                                                        <%if (test_cd.size() > 0) {
                                                                for (int i = 0; i < test_cd.size(); i++) {%>
                                                        <option value="<%=test_cd.get(i).get(0)%>"><%=test_cd.get(i).get(1)%></option>
                                                        <%
                                                                }
                                                            }
                                                        %>
                                                    </select>
                                                </div>
                                            </div>
                                            
                                            <div class="col-md-4">
                                                <label class="col-md-4 control-label" for="textinput">Select by modality: </label>
                                                <div class="col-md-8">
                                                    <%
                                                        String test_ca1 = "SELECT modality_cd,modality_name FROM ris_modality WHERE hfc_cd = '"+hfc_cd+"'";
                                                        ArrayList<ArrayList<String>> test_cd1 = conn.getData(test_ca1);
                                                    %>
                                                    <select class="form-control" name="test" id="Select_modality">
                                                        <option value="all">All</option>
                                                        <%if (test_cd1.size() > 0) {
                                                                for (int i = 0; i < test_cd1.size(); i++) {%>
                                                        <option value="<%=test_cd1.get(i).get(0)%>"><%=test_cd1.get(i).get(1)%></option>
                                                        <%
                                                                }
                                                            }
                                                        %>
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
        <%@include file = "libraries/radiologyFootLibrary.jsp" %>
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="../assets/js/buttons.print.min.js" type="text/javascript"></script>
        <script src="../assets/js/buttons.colVis.min.js" type="text/javascript"></script>
        
         <script>
             
            $(function () {
                load_proCode();
            });
            
            function load_proCode(){
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
                    url: "report_control/getListOfCode.jsp",
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
                load_proCode();
            });

        </script>
        
        

    </body>

</html>