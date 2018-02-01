<%-- 
    Document   : MainPage
    Created on : Nov 4, 2016, 4:07:05 PM
    Author     : Ahmed
--%>
<%@page import="java.text.DateFormat"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="main.RMIConnector"%>
<%@page import="Config.connect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="../Entrance/validateSession.jsp" %>
<%@include file="validateModuleAccess.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <script src="../assets/js/jquery.min.js" type="text/javascript"></script>
        <script src="../assets/js/bootstrap.min.js" type="text/javascript"></script>

        <%@include file = "../assets/header.html" %>
        <link href="../assets/css/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../assets/css/buttons.dataTables.min.css" rel="stylesheet" type="text/css"/>
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
                                <h3 style="margin: 0px;">List of Test Code</h3>
                                <hr class="pemisah"/>
                                <div style="width:50%; margin: auto;">
                                    <div class="form-horizontal">
                                        <div class="form-group">
                                            <label class="col-md-3 control-label" for="textinput">Show list of test code by category: </label>
                                            <div class="col-md-3">
                                                <%  Conn conn = new Conn();
                                                    String test_ca = "SELECT category_code,category_name FROM lis_item_category";
                                                    ArrayList<ArrayList<String>> test_cd = conn.getData(test_ca);
                                                %>
                                                <select class="form-control" name="test" id="RMOM_oderTime">
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

                                            var process = $('#RMOM_oderTime').val();
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



                                <div class="table-guling" id='viewTC'>
                                    <%
                                        String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
                                        String sql = "SELECT lic.category_code,lic.category_name,lid.item_cd,lid.item_name,lid.spe_source,lid.spe_container,lid.volume,lid.special_inst,lid.buy_price,lid.ser_price FROM lis_item_category lic, lis_item_detail lid WHERE lic.category_code = lid.test_cat AND lid.hfc_cd = '04010103' ORDER BY lic.category_code";
                                        ArrayList<ArrayList<String>> dataPatientApp = conn.getData(sql);
                                    %>
                                    <table id="TC"  class="table table-striped table-bordered" cellspacing="0" width="100%">
                                        <thead>
                                            <tr>
                                                <th >Category Code</th>
                                                <th >Category Name</th>
                                                <th >Item Code</th>	 
                                                <th >Item Name</th>
                                                <th >Specimen Source</th>
                                                <th >Specimen Container</th>
                                                <th >Volume</th>
                                                <th> Special Instruction</th>
                                                <th> Price</th>
                                                <th> Service Price</th>
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
                                                <td><%=dataPatientApp.get(i).get(9)%></td>

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


        </div> 


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
                $('#TC').DataTable({
                    language: {
                        emptyTable: "No receive specimen for today"
                    }, initComplete: function (settings, json) {
                        $('.loading').hide();
                    }
                });
            });

        </script>
    </body>
</html>
