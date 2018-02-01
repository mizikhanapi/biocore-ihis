<%-- 
    Document   : view_order
    Created on : Nov 24, 2016, 12:24:01 PM
    Author     : Ahmed
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.connect"%>
<%@page import="dBConn.Conn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Order</title>


        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">   
        <title>Main Page</title>
        <%@include file="../assets/header.html"%>


        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="assets/js/jquery.min.js"></script>
        <!-- Custom styles for this template -->
        <link rel="stylesheet" href="assets/css/loading.css">
        <link href="assets/datepicker/jquery-ui.css" rel="stylesheet">    
        <link href="assets/datepicker/jquery-ui.css" rel="stylesheet">
        <script src="assets/datepicker/jquery-ui.js"></script>
        <script src="assets/js/form-validator.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script> 
        <script src="assets/js/w3data.js"></script>
        <script src="assets/js/bootbox.min.js"></script>  

    </head>
    <body>
        <!-- menu side -->		
        <%@include file = "libraries/sideMenus.jsp" %>
        <!-- menu side -->
        <form action="/AssignResult.jsp" method="get"> 
            <div class="container-fluid">
                <div class="row">
                    <div class="main" style="background: #f2f4f8;">
                        <!-- menu top -->
                        <%@include file = "libraries/topMenus.html" %>
                        <!-- menu top -->
                        <div class="row">

                            <div class="col-md-12">
                                <div class="thumbnail">
                                    <h3 style="margin: 0px;">Perform Test</h3>
                                    <hr class="pemisah" />
                                    <%                                                    session.setAttribute("item_cd", null);
                                        session.setAttribute("item_name", null);
                                        session.setAttribute("specimen_no", null);
                                        session.setAttribute("order_no", null);
                                        session.setAttribute("order_date", null);
                                        Conn conn = new Conn();
                                        String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
                                        String pmi = request.getParameter("pmi");
                                        session.setAttribute("pmi", pmi);

                                        String specimen_no1 = request.getParameter("specimen_no");
                                        session.setAttribute("specimen_no", specimen_no1);

                                        String query1 = "SELECT pb.`PMI_NO`, pb.`NEW_IC_NO`, pb.`PATIENT_NAME`,ls.order_no,ls.specimen_no,ls.`Collection_date`,ls.`Collection_time`,lom.order_date,AU.`USER_NAME`,AHF.hfc_name FROM pms_patient_biodata pb,lis_specimen ls,lis_order_master lom JOIN adm_health_facility AHF ON AHF.hfc_cd = lom.hfc_cd JOIN adm_users AU ON AU.`USER_ID` = lom.order_by WHERE pb.`PMI_NO` = ls.pmi_no AND ls.pmi_no =lom.pmi_no AND pb.`PMI_NO` = '" + pmi + "' AND ls.specimen_no = '" + specimen_no1 + "' GROUP BY(ls.specimen_no)";
                                        ArrayList<ArrayList<String>> q2 = conn.getData(query1);
                                        session.setAttribute("order_no", q2.get(0).get(3));
                                    %>  

                                    <div class="row">
                                        <%if (q2.size() > 0) {
                                                for (int i = 0; i < q2.size(); i++) {%> 


                                        <div class="col-xs-3 col-sm-3 col-md-3">
                                            <address>
                                                <p>
                                                    Name: <span class="p-label"><%=q2.get(i).get(2)%></span>

                                                </p>
                                                <p>
                                                    PMI No: <span class="p-label"><%=q2.get(i).get(0)%> <input type="text" name="pmi" id="pmi" value="<%=q2.get(i).get(0)%>" style="display: none;"> </span>
                                                </p>
                                                <p>
                                                    IC No: <span class="p-label"><%=q2.get(i).get(1)%></span>
                                                </p>
                                                
                                            </address>  
                                        </div>

                                        <div class="col-xs-3 col-sm-3 col-md-3">
                                            <address>
                                                <p>
                                                    Order No: <span class="p-label"><%=q2.get(i).get(3)%> <input type="text" name="order_no" id="order_no" value="<%=q2.get(i).get(3)%>" style="display: none;"></span>
                                                </p>
                                                <p>
                                                    Order Date: <span class="p-label"><%=q2.get(i).get(7)%></span>
                                                </p>
                                                <p>
                                                    Order Time: <span class="p-label"><%=q2.get(i).get(7)%></span>
                                                </p>
                                            </address>  
                                        </div>

                                        <div class="col-xs-3 col-sm-3 col-md-3">
                                            <address>
                                                <p>
                                                    Specimen No: <span class="p-label"><%=q2.get(i).get(4)%> <input type="text" name="Specimen_no" id="specimen_no" value="<%=q2.get(i).get(4)%>" style="display: none;"></span>
                                                </p>    
                                                <p>
                                                    Collection Date: <span class="p-label"><%=q2.get(i).get(5)%></span>
                                                </p>
                                                <p>
                                                    Collection Time: <span class="p-label"><%=q2.get(i).get(6)%></span>
                                                </p>
                                            </address>
                                        </div>          

                                        <div class="col-xs-3 col-sm-3 col-md-3">
                                            <address>
                                                <p>
                                                    Requestor Name: <span class="p-label"><%=q2.get(i).get(8)%></span>
                                                </p>
                                                <p>
                                                    Requestor Location: <span class="p-label"><%=q2.get(i).get(9)%></span>
                                                </p>
                                            </address>
                                        </div> 
                                        <%
                                                }
                                            }
                                        %>
                                    </div>         
                                    <hr class="pemisah" />
                                    <div class="table-guling" id='viewVODpage'>
                                        <div id="view_VS"></div>
                                    </div>

                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

            <script type="text/javascript" charset="utf-8">

                $(document).ready(function () {
                    $('#orderRecieve').DataTable();

                });
            </script>
            <script>
                w3IncludeHTML();
                $(document).ready(function () {

                    $("#sub_reject").click(function () {
                        var fcomment = $("#fcomment").val();
                        var pmi = $("#pmi").val();
                        var specimen_no = $("#specimen_no").val();

                        $.ajax({
                            url: "tRejectSpecimen.jsp",
                            type: "post",
                            data: {
                                fcomment: fcomment,
                                pmi: pmi,
                                specimen_no: specimen_no
                            },
                            timeout: 10000,
                            success: function (data) {
                                alert("Specimen reject succesfully");
                                window.location.reload();
                                $("#basicModal").hide();
                                $(".modal-backdrop").hide();

                            },
                        });

                    });

                    $("#sendAccept").click(function () {
                        var healthCentre = $("#healthCentre").val();
                        var pmi = $("#pmi").val();
                        var specimen_no = $("#specimen_no").val();

                        $.ajax({
                            url: "tAcceptSpecimen.jsp",
                            type: "post",
                            data: {
                                healthCentre: healthCentre,
                                pmi: pmi,
                                specimen_no: specimen_no
                            },
                            timeout: 10000,
                            success: function (data) {
                                alert("Specimen Accept succesfully");
                                window.location.reload();
                                $("#basicModal").hide();
                                $(".modal-backdrop").hide();

                            },
                        });

                    });
                });
                $(document).ready(function () {

                    $("#view_VS").load("viewVS.jsp");
                    $("#headerindex").load("libraries/header.html");
                    $("#topmenuindex").load("libraries/topMenus.html");
                    $("#sidemenus").load("libraries/sideMenus.jsp");
                });

            </script>
    </body>

</form>
</html>
