
<%@page import="Config.Config"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="main.RMIConnector"%>
<%@page import="Config.connect"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.sql.*"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!--    <link rel="stylesheet" href="old/assets/datepicker/jquery-ui.css">-->
    <!--    <script src="old/assets/js/jquery.min.js"></script>-->
    <!-- Custom styles for this template -->

    <link rel="stylesheet" href="old/assets/css/loading.css">
    <link href="old/assets/datepicker/jquery-ui.css" rel="stylesheet">    
    <script src="old/assets/datepicker/jquery-ui.js"></script>
    <script src="old/assets/js/form-validator.min.js"></script>
    <script src="old/assets/js/bootstrap.min.js"></script> 

    <script src="old/assets/js/w3data.js"></script>
    <script src="old/assets/js/bootbox.min.js"></script>   

    <!-- header -->
    <%@include file = "../assets/header.html" %>

    <!-- header -->
</head>

<%
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String id = session.getAttribute("USER_ID").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
    String sub = session.getAttribute("SUB_DISCIPLINE_CODE").toString();


%>
<input type="hidden" value="<%=hfc%>" id="Rhfc">
<input type="hidden" value="<%=id%>" id="Rid">
<input type="hidden" value="<%=dis%>" id="Rdis">
<input type="hidden" value="<%=sub%>" id="Rsub">


<h4 style="padding-top: 30px;padding-bottom: 35px; font-weight: bold">
   ELIGIBILITY LIST
    <span class="pull-right">
        <button class="btn btn-success" data-status="pagado" data-toggle="modal" data-id="1" data-target="#detailID" style=" padding-right: 10px;padding-left: 10px;color: white;"><a data-toggle="tooltip" data-placement="top" title="Add Items" id="C_ADD"><i class=" fa fa-plus" style=" padding-right: 10px;padding-left: 10px;color: white;"></i></a>ADD ElIGIBILITY</button>
    </span>
</h4>
<!-- Add Button End -->


<!-- Add Modal Start -->
<div class="modal fade" id="detailID" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineIDLabel">Add Hospital Charges</h3>
            </div>
            <div class="modal-body" >

                <!-- content goes here -->
                <form class="form-horizontal" id="addIDForm">

                    <div class="row">
                        <div class="col-md-6">
                            <!-- Select Basic -->
                            <div class="form-group">
                                <label class="col-md-6 control-label" for="selectbasic">Discipline *</label>
                                <div class="col-md-6">
                                    <input id="Dis" name="Dis" placeholder="Insert Discipline Code" maxlength="30" type="text"  class="form-control input-md">
                                    <div id="disList" class="search-drop"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-md-6 control-label" for="textinput">Subdiscipline *</label>
                                <div class="col-md-6">
                                    <input id="sub" name="sub" type="text" placeholder="" class="form-control input-md">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-md-6 control-label" for="textinput">Eligibility Sources *</label>
                                <div class="col-md-6">
                                    <input id="eliSrc" name="eliSrc" type="text" placeholder="" class="form-control input-md">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-md-6 control-label" for="textinput">Eligibility Type*</label>
                                <div class="col-md-6">
                                    <input id="eliTy" name="eliTy" type="text" placeholder="" class="form-control input-md">
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="row">
                        <div class="col-md-6">
                            <!-- Select Basic -->
                            <div class="form-group">
                                <label class="col-md-6 control-label" for="selectbasic">Charges Type *</label>
                                <div class="col-md-6">
                                    <input id="ChargeType" name="ChargeType" placeholder="Insert Charges Type" maxlength="30" type="text"  class="form-control input-md">

                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-md-6 control-label" for="textinput">Charge Fees *</label>
                                <div class="col-md-6">
                                    <input id="ChargeFees" name="ChargeFees" type="text" placeholder="" class="form-control input-md">
                                </div>
                            </div>
                        </div>
                    </div>




                </form>
            </div>
            <!-- content goes here -->

            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="MWID_add">Add</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="reset" id="MWID_clear" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button" >Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!--<script src="bootstrap-3.3.6-dist/js/jquery-2.1.4.js" type="text/javascript"></script>
<script src="bootstrap-3.3.6-dist/js/bootstrap.min.js" type="text/javascript"></script>

<script src="http://www.w3schools.com/lib/w3data.js"></script>-->
<script src="bootstrap-3.3.6-dist/js/jquery.dataTables.min.js"></script>
<!--<script src="searchDiscipline.jsp"></script>
<script src="old/assets/js/searchDisipline.js" type="text/javascript"></script>-->


<script>
    w3IncludeHTML();
    $(document).ready(function () {

        $("#Dis").on('keyup', function () { // everytime keyup event
            var input = $(this).val(); // We take the input value
            var hfc = $("#Rhfc").val();



            if (input.length >= 1) { // Minimum characters = 2 (you can change)
                $('#disList').html('<img src="libraries/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
                var dataFields = {input: input, hfc: hfc}; // We pass input argument in Ajax
                $.ajax({
                    type: "POST",
                    url: "searchDiscipline.jsp", // call the php file ajax/tuto-autocomplete.php
                    data: dataFields, // Send dataFields var
                    timeout: 3000,
                    success: function (dataBack) { // If success
                        $('#disList').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                        $('#matchListDis li').on('click', function () { // When click on an element in the list
                            //$('#masterCode2').text($(this).text()); // Update the field with the new element
                            $('#Dis').val($(this).text());
                            $('#disList').text(''); // Clear the <div id="match"></div>
                            var arrayData = $('#Dis').val().split("|");
                            //console.log(arrayData);
                            //console.log(arrayData[0].trim());
                            //console.log(arrayData[1].trim());
                        });
                    },
                    error: function () { // if error
                        $('#disList').text('Problem!');
                    }
                });
            } else {
                $('#disList').text(''); // If less than 2 characters, clear the <div id="match"></div>
            }

        });

        $('#C_ADD').on('click', function (e) {
            e.preventDefault();






            var eliSrc = $('#eliSrc').val();
            var eliTy = $('#eliTy').val();
            var Dis = $('#Dis').val();
            var array_dis = Dis.split("|");
            var Dis = array_dis[0];
            var ChargeType = $('#ChargeType').val();
            var ChargeFees = $('#ChargeFees').val();
            var hfc = $("#Rhfc").val();
            var createdBy = $("#Rid").val();
            var dis = $("#Rdis").val();


            $('#Dis').val(Dis);
            $('#sub').val(hfc);
            $('#ChargeType').val(createdBy);
            $('#ChargeFees').val(dis);
        });


        $('#MWID_add').on('click', function () {

            var eliSrc = $('#eliSrc').val();
            var eliTy = $('#eliTy').val();
            var Dis = $('#Dis').val();
            var array_dis = Dis.split("|");
            var Dis = array_dis[0];
            var ChargeType = $('#ChargeType').val();
            var ChargeFees = $('#ChargeFees').val();
            var hfc = $("#Rhfc").val();
            var createdBy = $("#Rid").val();
            var dis = $("#Rdis").val();
            var sub = $("#Rsub").val();



            if (ChargeType === "") {
                bootbox.alert("Complete The Fields of Ward Class");
                return false;
            }
            if (ChargeFees === "") {
                bootbox.alert("Complete The Fields of Ward ID");
                return false;
            }
            if (Dis === "") {
                bootbox.alert("Complete The Fields of Discipline");
                return false;
            }
            if (eliSrc === "") {
                bootbox.alert("Complete The Fields of Ward Name");
                return false;
            }
            if (eliTy === "") {
                bootbox.alert("Complete The Fields of Citizen Rates");
                return false;
            } else {
                var data = {
                    eliSrc: eliSrc,
                    eliTy: eliTy,
                    ChargeType: ChargeType,
                    ChargeFees: ChargeFees,
                    Dis: Dis,

                    hfc: hfc,
                    createdBy: createdBy,
                    dis: dis,
                    sub: sub
                };

                console.log(data);

                $.ajax({
                    url: "hospitalCharges-insert.jsp",
                    type: "post",
                    data: data,
                    timeout: 10000,
                    success: function (data) {
                        if (data.trim() === 'Success') {
                            $("#FacilityIDTable").load("hospitalCharges-Table.jsp");
                            $('#detailID').modal('hide');
                            $(".modal-backdrop").hide();

                            bootbox.alert({
                                message: "Successfully added",
                                title: "Process Result",
                                backdrop: true
                            });
                            reset();
                        } else if (data.trim() === 'Duplicate') {

                            bootbox.alert({
                                message: "Facility ID Duplication Detected. Please use different Facility ID",
                                title: "Process Result",
                                backdrop: true
                            });

                        } else if (data.trim() === 'Failed') {
                            bootbox.alert({
                                message: "Add Failed",
                                title: "Process Result",
                                backdrop: true
                            });
                            $('#detailID').modal('hide');
                            reset();
                        }
                    }, error: function (err) {
                        console.log("Ajax Is Not Success " + err);
                    }

                });

            }
        });


        function reset() {
            document.getElementById("WardClass").value = "";
            document.getElementById("WardID").value = "";
            document.getElementById("Dis").value = "";
            document.getElementById("WardName").value = "";
            document.getElementById("CitizenRates").value = "";
            document.getElementById("CitizenDeposit").value = "";
            document.getElementById("CitizenDiscount").value = "";
            document.getElementById("NonCitizenRates").value = "";
            document.getElementById("NonCitizenDeposit").value = "";
            document.getElementById("NonCitizenDiscount").value = "";
            document.getElementById("PensionerDeposit").value = "";
            document.getElementById("PensionerDiscount").value = "";
            document.getElementById("PensionerRates").value = "";
            document.getElementById("NoOfBed").value = "";
//            document.getElementById("bathroom").checked = false;
//            document.getElementById("toilet").checked = false;
//            document.getElementById("televison").checked = false;
//            document.getElementById("telephone").checked = false;
            document.getElementById("status1").checked = false;
            document.getElementById("status2").checked = false;

        }
        $('#MWID_clear').on('click', function (e) {
            e.preventDefault();
            reset();


        });




    });


</script> 
<br>


</body>
</html>
