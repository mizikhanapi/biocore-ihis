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
                                <div style="width:50%; margin: auto;">
                                    <div class="form-horizontal">
                                        <div class="form-group">
                                            <label class="col-md-2 control-label" for="textinput">Select by body system: </label>
                                            <div class="col-md-3">
                                                <%  Conn conn = new Conn();
                                                    String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
                                                    String hfc_logo = "SELECT logo FROM adm_health_facility WHERE hfc_cd='" + hfc_cd + "'";
                                                    ArrayList<ArrayList<String>> logo = conn.getData(hfc_logo);
                                                    
                                                    
                                                    LocalDate localDate = LocalDate.now();
                                                    String newdate = DateTimeFormatter.ofPattern("dd/MM/yyyy").format(localDate);
//                                                    String test_ca = "SELECT rbs.body_system_name,rm.modality_name,rpm.body_system_cd,rpm.modality_cd,rpm.ris_procedure_name,rpm.selling_price,rpm.buying_price,rpm.quantity,rpm.status FROM ris_body_system rbs,ris_modality rm, ris_procedure_master rpm WHERE rbs.body_system_cd = rpm.body_system_cd AND rm.modality_cd = rpm.modality_cd";
//                                                    ArrayList<ArrayList<String>> test_cd = conn.getData(test_ca);
                                                %>
                                                
                                                <select class="form-control" name="test" id="body_System">
                                                    <option value="all">All</option>

                                                </select>
                                            </div>
                                            
                                            <div class="col-md-2">
                                                <button id="RMOM_btnRefresh" class="btn btn-default" style=" padding-right: 10px;padding-left: 10px;color: black;"><i class=" fa fa-refresh" style=" padding-right: 10px;padding-left: 10px;color: black;"></i>Refresh</button>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <script>
                                    $(function () {

                                        //-------------------------refresh the order table ---------------------------------------
                                        $('#RMOM_btnRefresh').on('click', function () {
                                            //$('#risOrderListContent').html('<div class="loading">Loading</div>');

                                            var process = $('#Select_modality').val();
                                            //alert(process);
                                            var data = {
                                                process: process
                                            };

                                            $.ajax({
                                                type: 'POST',
                                                url: "viewTC.jsp",
                                                data: data,
                                                success: function (data) {
                                                    $("#viewTC").val(data.trim());
                                                    $('#viewTC').html(data);
                                                    $('#viewTC').trigger('contentchanged');
                                                }

                                            });

                                        });
                                    });

                                </script>



                                <div class="table-guling" id='viewProcedure'>
                                    <%                                        
                                        String sql = "SELECT rpm.body_system_cd,rbs.body_system_name,rpm.modality_cd,rm.modality_name,rpm.ris_procedure_name,rpm.selling_price,rpm.buying_price,rpm.quantity,rpm.status FROM ris_body_system rbs,ris_modality rm, ris_procedure_master rpm WHERE rbs.hfc_cd = rpm.hfc_cd AND rpm.hfc_cd = rm.hfc_cd AND rpm.body_system_cd = rbs.body_system_cd AND rpm.modality_cd = rm.modality_cd AND rpm.hfc_cd = '" + hfc_cd + "'";
                                        ArrayList<ArrayList<String>> dataPatientApp = conn.getData(sql);
                                    %>
                                    <table id="procedure"  class="table table-striped table-bordered" cellspacing="0" width="100%">
                                        <thead>
                                            <tr>
                                                <th >Body System Code</th>
                                                <th >Body System Name</th>
                                                <th >Modality Code</th>
                                                <th >Modality Name</th>	 
                                                <th >Procedure Name</th>
                                                <th >Selling Price</th>
                                                <th >Buying Price</th>
                                                <th> Quantity</th>
                                                <th> Status</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <%if (dataPatientApp.size() > 0) {
                                                    for (int i = 0; i < dataPatientApp.size(); i++) {%>
                                            <tr>
                                                <td><%=dataPatientApp.get(i).get(0)%></td>
                                                <td><%=dataPatientApp.get(i).get(1)%></td>
                                                <td><%=dataPatientApp.get(i).get(2)%></td>
                                                <td><%=dataPatientApp.get(i).get(3)%></td>
                                                <td><%=dataPatientApp.get(i).get(4)%></td>
                                                <td><%=dataPatientApp.get(i).get(5)%></td>
                                                <td><%=dataPatientApp.get(i).get(6)%></td>
                                                <td><%=dataPatientApp.get(i).get(7)%></td>
                                                <td><%=dataPatientApp.get(i).get(8)%></td>
                                            </tr>
                                            <%
                                                    }
                                                }
                                            %>
                                        </tbody>
                                    </table>
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
        <script src="libraries/js/jquery.check-file.js" type="text/javascript"></script>
        <script src="../assets/js/jquery-ui.js" type="text/javascript"></script>
        <script src="../assets/js/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="../assets/js/dataTables.bootstrap.min.js" type="text/javascript"></script>
        <script src="../assets/js/dataTables.buttons.min.js" type="text/javascript"></script>
        <script src="../assets/js/buttons.flash.min.js" type="text/javascript"></script>
        <script src="../assets/js/jszip.min.js" type="text/javascript"></script>
        <script src="../assets/js/pdfmake.min.js" type="text/javascript"></script>
        <script src="../assets/js/vfs_fonts.js" type="text/javascript"></script>
        <script src="../assets/js/buttons.html5.min.js" type="text/javascript"></script>
        <script src="../assets/js/buttons.print.min.js" type="text/javascript"></script>
        
        <script>

                                    $(document).ready(function () {
                                        //$("#WardOccupancy").load("WardOccupancy.jsp");
                                        //$("#viewTC").load("viewTC.jsp");
//                                        $('#procedure').DataTable({
//                                            language: {
//                                                emptyTable: "No data"
//                                            }, initComplete: function (settings, json) {
//                                                $('.loading').hide();
//                                            }
//                                        });

                                        $('#procedure').DataTable({
                                            dom: 'Bfrtip',
                                            buttons: [
                                                'csv', 'excel', 'pdf',
                                                {
                                                    extend: 'print',
                                                    title: $('h1').text(),
                                                    customize: function (win) {
                                                        $(win.document.body)
                                                                .css('font-size', '10pt')
                                                                .prepend(
                                                                        '<div class="logo-hfc asset-print-img" style="z-index: 0; top: 0px; opacity: 1.0;">\n\
                                        <img src="<%=logo.get(0).get(0)%>" style="text-align: center; height: 100%; " /></div> <div class="mesej">List of Code Procedure</div>\n\
                                        <div class="info_kecik">\n\
                                        <dd>Date: <strong><%=newdate%></strong></dd>\n\
                                        <dd>Report No: <strong><%=newdate%></strong></dd>\n\
                                        </div> '
                                                                        );
                                                        $(win.document.body).find('table')
                                                                .addClass('compact')
                                                                .css('font-size', 'inherit');
                                                        $(win.document.body)
                                                                .css('font-size', '10pt')
                                                                .append('<div style="text-align: center;padding-top:30px;"><br> ***** &nbsp;&nbsp;  End Of Report  &nbsp;&nbsp;  ***** </div>');
                                                    }
                                                }

                                            ]
                                        });

                                    });

        </script>

    </body>

</html>