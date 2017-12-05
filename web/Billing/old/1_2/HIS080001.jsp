<%-- 
    Document   : newjsp
    Created on : Oct 11, 2017, 10:35:22 AM
    Author     : Shammugam
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dbConn1.Conn"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../Entrance/validateSession.jsp" %>
<%@include file="validateModuleAccess.jsp" %>

<!DOCTYPE html>
<html>

    <%@include file = "includes/header.jsp" %>
    <%@include file = "libraries/pharmacyHeadLibrary.jsp" %>

    <body>
        <div class="loading"></div>
        <div class="container-fluid">
            <div class="row">      
                <%@include file = "includes/sideMenus.jsp" %>
                <!-- main -->		

                <div class="main" style="background: #f2f4f8;">

                    <%@include file = "includes/topMenu.html" %>
                    <div class="row">
                        <!--body-->
                        <div class="col-md-12">
                            <div class="thumbnail">
                                <div id="generateBill">
                                    <h4><b>View Bill</b></h4>
                                    <form class="form-horizontal" name="myForm" id="myForm">
                                        <div id="custom-search-input">
                                            <div class="form-group">
                                                <label class="col-md-4 control-label" for="textinput">IC No.</label>
                                                <div class="col-md-4">
                                                    <input type="text" class="form-control input-md" id="ic" placeholder="IC No.">
                                                </div>
                                                <button class="btn btn-primary" type="button" id="searchPatient" name="searchPatient"><i class="fa fa-search fa-lg"></i>&nbsp; Search</button>
                                            </div>
                                        </div>
                                    </form>

                                    <hr/><br>

                                    <div id="patientDetails">
                                        <table class="table table-filter table-striped table-bordered">
                                            <thead>
                                            <th>Episode Date</th>
                                            <th>Order No.</th>
                                            <th>PMI No.</th>
                                            <th>IC No.</th>
                                            <th>Other ID</th>
                                            <th>Name</th>
                                            <th>Address</th>
                                            <th>Phone No.</th>
                                            <th>Action</th>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td colspan="9" align="center">No Record To Show<br>Please Search According to Your Need</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>

                                    <br>

                                    <div class="text-right" id="viewBillGenereteBillMasterButtonRightDiv" > 
                                        <button class="btn btn-success " type="button" id="btnViewBillGenereteBillMasterGenerateSelected" name="btnViewBillGenereteBillMasterGenerateSelected" > <i class="fa fa-file-text-o fa-lg" ></i>&nbsp; Generate Selected Bill &nbsp;</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%@include file = "includes/message.html" %>    

        <!--js-->

        <script src="assets/js/custom.js" type="text/javascript"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> 
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>



        <!-- Placed at the end of the document so the pages load faster -->
        <%@include file = "libraries/pharmacyFootLibrary.jsp" %>
        <!-- Placed at the end of the document so the pages load faster -->



        <script type="text/javascript">
            $(document).ready(function () {
                $('#ic').keypress(function (event) {
                    if ((event.which != 46 || $(this).val().indexOf('.') != 1) && (event.which < 48 || event.which > 57) && event.which != 8) {
                        event.preventDefault();
                    }
                });

                $('#searchPatient').click(function () {
                    var ic = document.getElementById('ic').value;

                    if (ic === "") {
                    } else {
                        $.ajax({
                            url: "searchPatient.jsp",
                            type: "post",
                            data: {
                                ic: ic
                            },
                            timeout: 10000,
                            success: function (data) {
                                var d = data.split("|");
                                $('#patientDetails').html(d[0]);
                                if (d[1] == '-1') {
                                    document.getElementById('messageHeader').innerHTML = "No record!";
                                    document.getElementById('messageContent').innerHTML = d[2];
                                    $("#alertMessage").modal();
                                }
                            },
                            error: function (err) {
                            }
                        });
                    }
                });
            });
        </script>
    </body>
</html>
