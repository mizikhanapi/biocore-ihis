<%-- 
    Document   : manageLabVerifyDetaillBasicInfo
    Created on : Jan 16, 2018, 1:44:36 AM
    Author     : Shammugam
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%
    Conn conn = new Conn();
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
    String subdis = session.getAttribute("SUB_DISCIPLINE_CODE").toString();

    String locationcode = hfc + "|" + dis + "|" + subdis;
%>

<h4>Basic Info</h4>
<form class="form-horizontal" name="patientOrderDetailContentBasicInfoForm" id="patientOrderDetailContentBasicInfoForm">
    <div class="row">

        <div class="col-md-4">

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-3 control-label" for="textinput">PMI No.</label>
                <div class="col-md-7">
                    <input id="patientpmino" name="patientpmino" type="text" placeholder="" readonly class="form-control input-md">
                </div>
            </div>
            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-3 control-label" for="textinput">Name</label>
                <div class="col-md-7">
                    <input id="patientName" name="patientName" type="text" readonly placeholder="" class="form-control input-md">
                </div>
            </div>

        </div>

        <div class="col-md-4">

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-3 control-label" for="textinput">New IC No.</label>
                <div class="col-md-7">
                    <input id="patientnic" name="patientnic" type="text" readonly placeholder="" class="form-control input-md">
                </div>
            </div>
            <!--Text input-->
            <div class="form-group">
                <label class="col-md-3 control-label" for="textinput">Gender</label>
                <div class="col-md-7">
                    <input id="patientGender" name="patientGender" type="text" readonly placeholder="" class="form-control input-md">
                </div>
            </div>

        </div>

        <div class="col-md-4">

            <!--Text input-->
            <div class="form-group">
                <label class="col-md-3 control-label" for="textinput">D.O.B</label>
                <div class="col-md-7">
                    <input id="patientBdate" name="patientBdate" type="text" readonly placeholder="" class="form-control input-md">
                </div>
            </div>
            <!--Text input-->
            <div class="form-group">
                <label class="col-md-3 control-label" for="textinput">Blood Type</label>
                <div class="col-md-7">
                    <input id="patientBtype" name="patientBtype" type="text" readonly placeholder="" class="form-control input-md">
                </div>
            </div>

        </div>

    </div>
</form>

<hr/>

<h4>
    Specimen Details
</h4>

<form class="form-horizontal" name="patientOrderDetailContentOrderInfoForm" id="patientOrderDetailContentOrderInfoForm">
    <div class="row">

        <div class="col-md-4">

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-3 control-label" for="textinput">Specimen No.</label>
                <div class="col-md-7">
                    <input id="specimenSpecimenNo" name="patientOrderLocationCode" type="text" readonly placeholder="" class="form-control input-md">
                </div>
            </div>

        </div>

        <div class="col-md-4">

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-3 control-label" for="textinput">Order No.</label>
                <div class="col-md-7">
                    <input id="specimenOrderNo" name="patientOrderNo" type="text" placeholder=" " readonly class="form-control input-md">   
                </div>
            </div>

        </div>

        <div class="col-md-4">

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-3 control-label" for="textinput">Order Date</label>
                <div class="col-md-7">
                    <input id="specimenOrderDate" name="patientOrderDate" type="text" readonly placeholder="" class="form-control input-md">
                    <input id="specimenEpisodeDate" name="patientOrderDate" type="hidden" readonly placeholder="" class="form-control input-md">
                    <input id="specimenEncounterDate" name="patientOrderDate" type="hidden" readonly placeholder="" class="form-control input-md">
                    <input id="patientOrderLocationCodeFull" name="patientOrderLocationCodeFull" type="hidden" readonly placeholder="" class="form-control input-md" value="<%= locationcode%>">
                    <input id="dataCallingID" name="dataCallingID" type="hidden" placeholder="" readonly class="form-control input-md">  
                </div>
            </div>

        </div>


    </div>
</form>

<div id="patientSpecimenDetailsListTableDiv" class="form-group table-guling">
    <table class="table table-filter table-striped table-bordered" style="background: #fff; border: 1px solid #ccc; width: 100%" id="patientSpecimenDetailsListTable">
        <thead>
        <th>Code</th>
        <th>Name</th>			 
        <th>Specimen Container</th>
        <th>Volume</th>
        <th>Specimen Source</th>
        <th>Requestor Comments</th>
        </thead>
        <tbody>

        </tbody>
    </table>
</div>

<hr/>

<div style="float: left;" id="patientOrderSpecimenLeftButtonDiv" > 
    <button class="btn btn-default " type="button" id="btnVerifyBackSpecimen" ><i class="fa fa-backward fa-lg"></i>&nbsp; Back &nbsp;</button>
</div>


<div class="text-right" id="patientOrderSpecimenRightButtonDiv" > 
    <button class="btn btn-warning" type="button" id="btnVerifySpecimenCallPatient" name="btnVerifySpecimenCallPatient" > <i class="fa fa-phone fa-lg" ></i>&nbsp; Call Patient &nbsp;</button>
    <button class="btn btn-danger" type="button" id="btnVerifySpecimenDeclineCallPatient" name="btnVerifySpecimenDeclineCallPatient" > <i class="fa fa-phone fa-lg" ></i>&nbsp; Decline Call Patient &nbsp;</button>
</div>


<script>


    $(document).ready(function () {


//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//


        var episodeDate;
        var encounterDate;

        // Move to Order Details Fetch Details Start
        $('#lisLabRequestVerifyMasterContent').off('click', '#verifyLabOrderMasterTable #moveToOrderDetailsTButton').on('click', '#verifyLabOrderMasterTable #moveToOrderDetailsTButton', function (e) {

            $('<div class="loading">Loading</div>').appendTo('body');

            // Disable And Enable Button
            document.getElementById("btnVerifySpecimenCallPatient").disabled = false;
            document.getElementById("btnVerifySpecimenDeclineCallPatient").disabled = true;

            e.preventDefault();

            var row = $(this).closest("tr");
            var rowData = row.find("#dataVerifyLabOrderMasterListhidden").val();
            var arrayData = rowData.split("|");
            console.log(arrayData);

            //Assign Array into seprated val
            var patientpmino = arrayData[0];
            var patientName = arrayData[16];
            var patientnic = arrayData[17];
            var patientGender = arrayData[21];
            var patientBdate = arrayData[18];
            var patientBtype = arrayData[22];

            var patientOrderNo = arrayData[1];
            var patientOrderDate = arrayData[7];
            var patientOrderEpisodeDate = arrayData[5];
            var patientOrderEncounterDate = arrayData[6];

            var patientSpecimenNo = arrayData[25];


            var pmiNo = patientpmino;
            var orderNo = patientOrderNo;
            var orderDate = patientOrderDate;
            episodeDate = patientOrderEpisodeDate;
            encounterDate = patientOrderEncounterDate;


            // Set value to the Second Tab 
            $("#patientpmino").val(patientpmino);
            $("#patientName").val(patientName);
            $("#patientnic").val(patientnic);
            $("#patientGender").val(patientGender);
            $("#patientBdate").val(patientBdate);
            $("#patientBtype").val(patientBtype);

            $("#specimenSpecimenNo").val(patientSpecimenNo);
            $("#specimenOrderNo").val(patientOrderNo);
            $("#specimenOrderDate").val(patientOrderDate);
            $("#specimenEpisodeDate").val(patientOrderEpisodeDate);
            $("#specimenEncounterDate").val(patientOrderEncounterDate);


            // Load Table
            loadOrder(patientSpecimenNo);

        });
        // Move to Order Details Fetch Details End



        // Move to Order Details And Load All Table Data Start
        function loadOrder(specimenNo) {


            var dataOrder = {
                specimenNo: specimenNo
            };


            $.ajax({
                url: "manageLabVerifyDetailsTable.jsp",
                type: "post",
                data: dataOrder,
                timeout: 3000,
                success: function (returnOrderDetailsTableHTML) {

                    $('#patientSpecimenDetailsListTable').html(returnOrderDetailsTableHTML);
                    datatablesDestroyAndRecreate();
                    $('.nav-tabs a[href="#tab_default_2"]').tab('show');
                    $('.loading').hide();

                }
            });



        }
        // Move to Order Details And Load All Table Data End



        // Destroy And Create Datatable Start
        function datatablesDestroyAndRecreate() {


            console.log("Destroying Datatable");

            $('#patientSpecimenDetailsListTable').DataTable().destroy();




            console.log("Creating Datatable");

            // do something after the div content has changed
            $('#patientSpecimenDetailsListTable').DataTable({
                "paging": true,
                "searching": false,
                "info": false,
                "lengthChange": false,
                "pageLength": 5,
                "language": {
                    "emptyTable": "No Specimen Available To Display"
                }
            });


        }
        // Destroy And Create Datatable End




//======================================================================================================================================================================================//







//-------------------------------------------------------------------------------  Enter Specimen Start  --------------------------------------------------------------------------------//



        $('#lisLabRequestVerifyDetailContent').off('click', '#patientSpecimenDetailsListTable #btnVerifySpecimenEnterResult').on('click', '#patientSpecimenDetailsListTable #btnVerifySpecimenEnterResult', function (e) {


            var customer_id = $("#patientpmino").val();
            var txt_date = $("#specimenOrderDate").val();
            var specimen_no = $("#specimenSpecimenNo").val();
            var order_no = $("#specimenOrderNo").val();
            var order_date = $("#specimenOrderDate").val();
            var episode_date = $("#specimenEpisodeDate").val();
            var encounter_date = $("#specimenEncounterDate").val();


            var row = $(this).closest("tr");
            var rowData = row.find("#dataPatientOrderDetailsListhidden").val();
            var arrayData = rowData.split("|");
            console.log(arrayData);

            var item_cd = arrayData[2];
            var item_name = arrayData[8];

            $("#addSpecimenResultSpecimenNo").val(specimen_no);
            $("#addSpecimenResultOrderNo").val(order_no);
            $("#addSpecimenResultItemCode").val(item_cd);
            $("#addSpecimenResultItemName").val(item_name);

            $("#addSpecimenResultResult").val('');
            $("#addSpecimenResultRemark").val('');

            $('#inputFileToLoad').val("");
            $('#dym').html("");
            gambarURI = "";




        });



//-------------------------------------------------------------------------------  Insert Specimen End  --------------------------------------------------------------------------------//



//-------------------------------------------------------------------------------  Verify Specimen Start  --------------------------------------------------------------------------------//



        $('#lisLabRequestVerifyDetailContent').off('click', '#patientSpecimenDetailsListTable #btnVerifySpecimenVerifyResult').on('click', '#patientSpecimenDetailsListTable #btnVerifySpecimenVerifyResult', function (e) {


            var customer_id = $("#patientpmino").val();
            var txt_date = $("#specimenOrderDate").val();
            var specimen_no = $("#specimenSpecimenNo").val();
            var order_no = $("#specimenOrderNo").val();
            var order_date = $("#specimenOrderDate").val();
            var episode_date = $("#specimenEpisodeDate").val();
            var encounter_date = $("#specimenEncounterDate").val();


            var row = $(this).closest("tr");
            var rowData = row.find("#dataPatientOrderDetailsListhidden").val();
            var arrayData = rowData.split("|");
            console.log(arrayData);

            var result_no = arrayData[12];
            var item_cd = arrayData[2];
            var item_name = arrayData[8];

            $("#verifySpecimenResultSpecimenNo").val(specimen_no);
            $("#verifySpecimenResultOrderNo").val(order_no);
            $("#verifySpecimenResultResultNo").val(result_no);
            $("#verifySpecimenResultItemCode").val(item_cd);
            $("#verifySpecimenResultItemName").val(item_name);




        });



//-------------------------------------------------------------------------------  Verify Specimen End  --------------------------------------------------------------------------------//






        //------------------------------------------------------------------------------  Call patient Part Start  -------------------------------------------------------------------------------//


        // Call or Decline Part Start
        // 
        // 
        // Call Button Start
        $('#lisLabRequestVerifyDetailContent').off('click', '#patientOrderSpecimenRightButtonDiv #btnVerifySpecimenCallPatient').on('click', '#patientOrderSpecimenRightButtonDiv #btnVerifySpecimenCallPatient', function (e) {


            var specimenSpecimenNo = $("#specimenSpecimenNo").val();


            if (specimenSpecimenNo === "" || specimenSpecimenNo === null) {

                $('.nav-tabs a[href="#tab_default_1"]').tab('show');

                bootbox.alert("Please Select A Order First !!!");

            } else {


                var patientOrderLocationCodeFull = $("#patientOrderLocationCodeFull").val();
                var patientpmino = $("#patientpmino").val();
                var patientName = $("#patientName").val();
                var dataCallPatientFull = patientOrderLocationCodeFull + "|" + patientpmino + "|" + patientName + "|" + specimenSpecimenNo;


                bootbox.confirm({
                    message: "Are You Sure ?",
                    title: "Call Patient ?",
                    buttons: {
                        confirm: {
                            label: 'Yes',
                            className: 'btn-success'
                        },
                        cancel: {
                            label: 'No',
                            className: 'btn-danger'
                        }
                    },
                    callback: function (result) {

                        if (result === true) {


                            var data = {
                                dataCallPatientFull: dataCallPatientFull
                            };


                            $.ajax({
                                url: "controllerProcessVerifySpecimen/verifySpecimenOrderCallPatientInsert.jsp",
                                type: "post",
                                data: data,
                                timeout: 3000,
                                success: function (result) {

                                    var insertResult = result.trim();

                                    console.log(insertResult);

                                    var arrayData = insertResult.split("|");

                                    var message = arrayData[0];
                                    var callingNo = arrayData[1];

                                    $("#dataCallingID").val(callingNo);

                                    if (message === 'Success') {

                                        bootbox.alert({
                                            message: "Patient Call Successful",
                                            title: "Process Result",
                                            backdrop: true
                                        });

                                    }

                                    document.getElementById("btnVerifySpecimenDeclineCallPatient").disabled = false;
                                    document.getElementById("btnVerifySpecimenCallPatient").disabled = true;

                                }
                            });


                        } else {
                            console.log("Process Is Canceled");
                        }

                    }
                });


            }


        });
        // Call Button End




        // Decline Call Button Start
        $('#lisLabRequestVerifyDetailContent').off('click', '#patientOrderSpecimenRightButtonDiv #btnVerifySpecimenDeclineCallPatient').on('click', '#patientOrderSpecimenRightButtonDiv #btnVerifySpecimenDeclineCallPatient', function (e) {


            var specimenSpecimenNo = $("#specimenSpecimenNo").val();


            if (specimenSpecimenNo === "" || specimenSpecimenNo === null) {

                $('.nav-tabs a[href="#tab_default_1"]').tab('show');

                bootbox.alert("Please Select A Order First !!!");

            } else {


                var callDeclineNo = $("#dataCallingID").val();


                bootbox.confirm({
                    message: "Are You Sure ?",
                    title: "Decline Call Patient ?",
                    buttons: {
                        confirm: {
                            label: 'Yes',
                            className: 'btn-success'
                        },
                        cancel: {
                            label: 'No',
                            className: 'btn-danger'
                        }
                    },
                    callback: function (result) {

                        if (result === true) {


                            var data = {
                                callDeclineNo: callDeclineNo
                            };

                            $.ajax({
                                url: "controllerProcessVerifySpecimen/verifySpecimenOrderCallPatientDelete.jsp",
                                type: "post",
                                data: data,
                                timeout: 3000,
                                success: function (result) {

                                    var deleteResult = result.trim();

                                    console.log(deleteResult);

                                    if (deleteResult === 'Success') {

                                        bootbox.alert({
                                            message: "Decline Call Patient Successful",
                                            title: "Process Result",
                                            backdrop: true
                                        });

                                    }

                                    document.getElementById("btnVerifySpecimenDeclineCallPatient").disabled = true;
                                    document.getElementById("btnVerifySpecimenCallPatient").disabled = false;

                                }
                            });


                        } else {
                            console.log("Process Is Canceled");
                        }

                    }
                });


            }


        });
        // Decline Call Button End
        // 
        // 
        // Call or Decline Part End


        //==============================================================================  Call Patient Part End  ================================================================================//




//-------------------------------------------------------------------------------  Reset Part Start  --------------------------------------------------------------------------------//



        // Clear Button Function Start
        $('#lisLabRequestVerifyDetailContent').on('click', '#btnVerifyBackSpecimen', function (e) {
            resetPage();
        });
        // Clear Button Function End



        // Reset The Page Start
        function resetPage() {

            $("#lisLabRequestVerifyMasterContent").load("manageLabVerifyMasterTable.jsp");

            $('#LAB_VerifyTime').prop('selectedIndex', 0);

            document.getElementById("patientOrderDetailContentOrderInfoForm").reset();
            document.getElementById("patientOrderDetailContentBasicInfoForm").reset();

            $("#lisLabRequestVerifyDetailContent #patientSpecimenDetailsListTableDiv").load("manageLabVerifyDetaillBasicInfo.jsp #patientSpecimenDetailsListTableDiv");

            $('.nav-tabs a[href="#tab_default_1"]').tab('show');

        }
        // Reset The Page End




//=================================================================================  Reset Part End  ==================================================================================//



    });

</script>