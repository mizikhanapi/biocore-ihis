<%-- 
    Document   : manageLabOrderDetaillBasicInfo
    Created on : Jan 13, 2018, 10:16:48 AM
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

<h4>
    Basic Info
    <div class="pull-right">
        <button id="patientOrderShowVitalSign" name="patientOrderShowVitalSign" class="btn btn-link" data-toggle="modal" ><i class="fa fa-info-circle fa-lg"></i> &nbsp; Show Vital Signs </button>
    </div>
</h4>
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
                <label class="col-md-3 control-label" for="textinput">IC/ID No.</label>
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

<h5>
    ALLERGY LIST
</h5>

<div id="patientAllergyListTableDiv" class="form-group">
    <table class="table table-filter table-striped table-bordered" style="background: #fff; border: 1px solid #ccc; width: 100%; text-align: left;" id="patientAllergyListTable">
        <thead>
        <th style="display: none">PMI NO</th>
        <th>HFC CODE</th>
        <th>EPISODE DATE</th>
        <th>ENCOUNTER DATE</th>
        <th>ALLERGY CODE</th>
        <th style="text-align: left; width: 50%;">ALLERGY DESCRIPTION</th>
        <th style="text-align: left; width: 20%;">COMMENT</th>
        </thead>
        <tbody>

        </tbody>
    </table>
</div>

<hr/>
<h4>Diagnosis Info</h4>

<div id="patientDiagnosisListTableDiv" class="form-group">
    <table class="table table-filter table-striped table-bordered" style="background: #fff; border: 1px solid #ccc; width: 100%" id="patientDiagnosisListTable">
        <thead>
        <th style="display: none">PMI NO</th>
        <th >HFC CODE</th>
        <th>EPISODE DATE</th>
        <th>ENCOUNTER DATE</th>
        <th>DIAGNOSIS CODE</th>
        <th style="text-align: left; width: 50%;">DIAGNOSIS DESCRIPTION</th>
        <th style="text-align: left; width: 20%;">COMMENT</th>
        </thead>
        <tbody>

        </tbody>
    </table>
</div>

<hr/>
<h4>
    Order Info
    <div class="pull-right">
        <button id="patientOrderNewLabRequestButton" name="patientOrderNewDrugButton" class="btn btn-primary" data-toggle="modal" ><i class="fa fa-plus fa-lg"></i>&nbsp; New Order</button>
    </div>

</h4>

<form class="form-horizontal" name="patientOrderDetailContentOrderInfoForm" id="patientOrderDetailContentOrderInfoForm">
    <div class="row">

        <div class="col-md-4">

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-3 control-label" for="textinput">Order No.</label>
                <div class="col-md-7">
                    <input id="patientOrderNo" name="patientOrderNo" type="text" placeholder=" " readonly class="form-control input-md">   
                </div>
            </div>

        </div>


        <div class="col-md-4">

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-3 control-label" for="textinput">Order Date</label>
                <div class="col-md-7">
                    <input id="patientOrderDate" name="patientOrderDate" type="hidden" readonly placeholder="" class="form-control input-md">
                    <input id="patientOrderDateShow" name="patientOrderDateShow" type="text" readonly placeholder="" class="form-control input-md">
                    <input id="patientEpisodeDate" name="patientOrderDate" type="hidden" readonly placeholder="" class="form-control input-md">
                    <input id="patientEncounterDate" name="patientOrderDate" type="hidden" readonly placeholder="" class="form-control input-md">
                </div>
            </div>

        </div>


        <div class="col-md-4">

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-3 control-label" for="textinput">Location</label>
                <div class="col-md-7">
                    <input id="patientOrderLocationCode" name="patientOrderLocationCode" type="text" readonly placeholder="" class="form-control input-md">
                    <input id="patientOrderLocationCodeFull" name="patientOrderLocationCodeFull" type="hidden" readonly placeholder="" class="form-control input-md" value="<%= locationcode%>">
                </div>
            </div>

        </div>

    </div>
</form>

<div id="patientOrderDetailsListTableDiv" class="form-group table-guling">
    <table class="table table-filter table-striped table-bordered" style="background: #fff; border: 1px solid #ccc; width: 100%" id="patientOrderDetailsListTable">
        <thead>
        <th>Code</th>
        <th>Name</th>			 
        <th>S. Source</th>
        <th>S. Container</th>
        <th>Volume</th>
        <th>Special Instruction</th>
        <th>Status</th>
        <th>Verification</th>
        <th>Collection Date</th>
        <th>Comments</th>
        <th>Set Collection Date</th>
        <th>Requestor Comments</th>
        <th>Action</th>
        </thead>
        <tbody>

        </tbody>
    </table>
</div>

<hr>

<div style="float: left;" id="patientOrderAssignLeftButtonDiv" > 
    <button class="btn btn-default " type="button" id="btnClearAssignSpecimen" ><i class="fa fa-angle-left fa-lg"></i>&nbsp; Back &nbsp;</button>
</div>

<div class="text-right" id="patientOrderAssignRightButtonDiv" > 
    <button class="btn btn-primary " type="button" id="btnOrderAssignSpecimen" > <i class="fa fa-check-square-o fa-lg"></i>&nbsp; Assign Specimen &nbsp;</button>
</div>


<script>


    $(document).ready(function () {


//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//


        var episodeDate;
        var encounterDate;

        // Move to Order Details Fetch Details Start
        $('#lisLabRequestOrderMasterContent').off('click', '#assignLabOrderMasterTable #moveToOrderDetailsTButton').on('click', '#assignLabOrderMasterTable #moveToOrderDetailsTButton', function (e) {

            $('<div class="loading">Loading</div>').appendTo('body');

            e.preventDefault();

            var row = $(this).closest("tr");
            var rowData = row.find("#dataAssignLabOrderMasterListhidden").val();
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
            var patientOrderDateShow = arrayData[25];
            var patientOrderLocationCode = arrayData[3];
            var patientOrderEpisodeDate = arrayData[5];
            var patientOrderEncounterDate = arrayData[6];
            var patientOrderLocationCodeName = arrayData[23];


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
            $("#patientOrderNo").val(patientOrderNo);
            $("#patientOrderDate").val(patientOrderDate);
            $("#patientOrderDateShow").val(patientOrderDateShow);
            $("#patientOrderLocationCode").val(patientOrderLocationCodeName);
            $("#patientEpisodeDate").val(patientOrderEpisodeDate);
            $("#patientEncounterDate").val(patientOrderEncounterDate);


            // Load Table
            loadAllergyDiagnosisOrder(patientOrderNo, patientpmino);

        });
        // Move to Order Details Fetch Details End



        // Move to Order Details And Load All Table Data Start
        function loadAllergyDiagnosisOrder(orderNo, pmino) {


            var dataDiagnosisAllergy = {
                pmino: pmino
            };


            var dataOrder = {
                orderNo: orderNo
            };

            $.ajax({
                url: "controllerProcessAssignSpecimen/assignSpecimenOrderListAllergyDiagnosisTable.jsp",
                type: "post",
                data: dataDiagnosisAllergy,
                timeout: 3000,
                success: function (returnAllergyTableHTML) {

                    var array_data = String(returnAllergyTableHTML.trim()).split("<ShammugamRamasamySeperator></ShammugamRamasamySeperator>");

                    var allergyTable = array_data[0];
                    var diagnosisTable = array_data[1];

                    $('#patientAllergyListTable').html(allergyTable);
                    $('#patientDiagnosisListTable').html(diagnosisTable);

                    $.ajax({
                        url: "manageLabOrderDetailsTable.jsp",
                        type: "post",
                        data: dataOrder,
                        timeout: 3000,
                        success: function (returnOrderDetailsTableHTML) {

                            $('#patientOrderDetailsListTable').html(returnOrderDetailsTableHTML);
                            datatablesDestroyAndRecreate();
                            $('.nav-tabs a[href="#tab_default_2"]').tab('show');
                            $('.loading').hide();

                        }
                    });

                }
            });


        }
        // Move to Order Details And Load All Table Data End



        // Destroy And Create Datatable Start
        function datatablesDestroyAndRecreate() {


            console.log("Destroying Datatable");

            $('#patientAllergyListTable').DataTable().destroy();
            $('#patientDiagnosisListTable').DataTable().destroy();
            $('#patientOrderDetailsListTable').DataTable().destroy();



            console.log("Creating Datatable");

            // do something after the div content has changed
            $('#patientAllergyListTable').DataTable({
                "paging": true,
                "searching": false,
                "info": false,
                "lengthChange": false,
                "pageLength": 5,
                "language": {
                    "emptyTable": "No Allergy Record Available To Display"
                }
            });

            // do something after the div content has changed
            $('#patientDiagnosisListTable').DataTable({
                "paging": true,
                "searching": false,
                "info": false,
                "lengthChange": false,
                "pageLength": 5,
                "language": {
                    "emptyTable": "No Diagnosis Record Available To Display"
                }
            });

            // do something after the div content has changed
            $('#patientOrderDetailsListTable').DataTable({
                "paging": false,
                "searching": false,
                "info": false,
                "lengthChange": false,
                "pageLength": 5,
                "language": {
                    "emptyTable": "No Order Available To Display"
                }
            });


        }
        // Destroy And Create Datatable End




//======================================================================================================================================================================================//






//-------------------------------------------------------------------------------  Add Part Start  --------------------------------------------------------------------------------//



        // Getting Order Id And Date Start
        $('#lisLabRequestOrderDetailContent').off('click', '#patientOrderNewLabRequestButton').on('click', '#patientOrderNewLabRequestButton', function (e) {

            e.preventDefault();


            var labRequestOrderNo = $("#patientOrderNo").val();
            var labRequestOrderDate = $("#patientOrderDate").val();
            var labRequestOrderDateShow = $("#patientOrderDateShow").val();

            if (labRequestOrderNo === "" || labRequestOrderNo === null) {

                $('.nav-tabs a[href="#tab_default_1"]').tab('show');

                bootbox.alert("Please Select A Order First");

            } else {

                $("#orderLabRequestDetailsID").val(labRequestOrderNo);
                $("#orderLabRequestDetailsDate").val(labRequestOrderDate);
                $("#orderLabRequestDetailsDateShow").val(labRequestOrderDateShow);

                $('#addLabRequestModal').modal('show');

            }

        });
        // Getting Order Id And Date End


        //JS Search in Add Stock Item Start
        $(function () {

            $("#orderLabRequestDetailsSearchItemInput").on('keyup', function () { // everytime keyup event

                var input = $(this).val(); // We take the input value

                if (input.length >= 1) { // Minimum characters = 2 (you can change)

                    $('#orderLabRequestDetailsSearchItemInputDisplayResult').html('<img src="libraries/LoaderIcon.gif"/>');

                    var dataFields = {'input': input}; // We pass input argument in Ajax

                    console.log(dataFields);

                    $.ajax({
                        type: "POST",
                        url: "controllerProcessAssignSpecimen/assignSpecimenOrderInsertSearchItem.jsp", // call the jsp file ajax/auto-autocomplete.php
                        data: dataFields, // Send dataFields var
                        timeout: 3000,
                        success: function (dataBack) { // If success

                            $('#orderLabRequestDetailsSearchItemInputDisplayResult').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>

                            $('#orderLabRequestDetailsSearchItemInputDisplayResult li').on('click', function () { // When click on an element in the list

                                $('#orderLabRequestDetailsSearchItemInput').val($(this).text()); // Update the field with the new element
                                $('#orderLabRequestDetailsSearchItemInputDisplayResult').text(''); // Clear the <div id="match"></div>


                            });

                        },
                        error: function () { // if error

                            $('#orderLabRequestDetailsSearchItemInputDisplayResult').text('No Eecord Found');

                        }
                    });
                } else {

                    $('#orderLabRequestDetailsSearchItemInputDisplayResult').text('Search For More Than Two Characters'); // If less than 2 characters, clear the <div id="match"></div>

                }
            });
        });
        //JS Search in Add Stock Item End


        //JS Get Add Stock Item Start
        $('#orderLabRequestDetailsSearchItemInputDisplayResult').on('click', function () {

            $('<div class="loading">Loading</div>').appendTo('body');

            var id = $('#orderLabRequestDetailsSearchItemInput').val();

            var arrayData = $('#orderLabRequestDetailsSearchItemInput').val().split("|");

            id = arrayData[0];

            var data = {
                id: id
            };


            $.ajax({
                type: 'post',
                url: 'controllerProcessAssignSpecimen/assignSpecimenOrderInsertSearchItemResult.jsp',
                data: data,
                success: function (reply_data) {

                    console.log(reply_data.trim());

                    var array_data = String(reply_data.trim()).split("|");

                    var itemCode = array_data[0];
                    var itemName = array_data[1];
                    var itemSpeSource = array_data[2];
                    var itemSpeContain = array_data[3];
                    var itemVolume = array_data[4];
                    var itemSpecialInstruc = array_data[5];


                    $('#orderLabRequestItemDisplayItemCode').val(itemCode);
                    $('#orderLabRequestItemDisplayItemName').val(itemName);
                    $('#orderLabRequestItemDisplayItemSpeSource').val(itemSpeSource);
                    $('#orderLabRequestItemDisplayItemSpeContainer').val(itemSpeContain);
                    $('#orderLabRequestItemDisplayItemVolume').val(itemVolume);
                    $('#orderLabRequestItemDisplayItemSpecialIntruct').val(itemSpecialInstruc);

                    $('#orderLabRequestDetailsSearchItemInput').val('');

                    $('.loading').hide();

                }
            });
        });
        //JS Get Add Stock Item End


        // Add Order Start
        $('#orderLabRequestAddButton').on('click', function (e) {

            e.preventDefault();

            var order_no = $('#orderLabRequestDetailsID').val();
            var txn_date = $('#orderLabRequestDetailsDate').val();

            var item_cd = $('#orderLabRequestItemDisplayItemCode').val();
            var item_name = $('#orderLabRequestItemDisplayItemName').val();
            var item_SpeSrc = $('#orderLabRequestItemDisplayItemSpeSource').val();
            var item_SpeCont = $('#orderLabRequestItemDisplayItemSpeContainer').val();
            var item_volume = $('#orderLabRequestItemDisplayItemVolume').val();
            var item_SpeInst = $('#orderLabRequestItemDisplayItemSpecialIntruct').val();
            var comment = $('#orderLabRequestItemInputComment').val();

            var customer_id = $('#patientpmino').val();


            if (item_cd === "" || item_cd === null) {

                bootbox.alert("Please Search The Item Before Continue");

            } else {


                var datas = {
                    order_no: order_no,
                    txn_date: txn_date,
                    customer_id: customer_id,
                    item_cd: item_cd,
                    item_name: item_name,
                    item_SpeSrc: item_SpeSrc,
                    item_SpeCont: item_SpeCont,
                    item_volume: item_volume,
                    item_SpeInst: item_SpeInst,
                    comment: comment
                };

                console.log(datas);

                $.ajax({
                    url: "controllerProcessAssignSpecimen/assignSpecimenOrderInsert.jsp",
                    type: "post",
                    data: datas,
                    timeout: 10000,
                    success: function (datas) {

                        if (datas.trim() === 'Success') {

                            $('#addLabRequestModal').modal('hide');

                            var dataRefres = {
                                orderNo: order_no
                            };

                            $.ajax({
                                url: "manageLabOrderDetailsTable.jsp",
                                type: "post",
                                data: dataRefres,
                                timeout: 3000,
                                success: function (returnOrderDetailsTableHTML) {

                                    $('#patientOrderDetailsListTable').html(returnOrderDetailsTableHTML);

                                    bootbox.alert({
                                        message: "Lab Request is Added Successfully",
                                        title: "Information",
                                        backdrop: true
                                    });

                                    resetAddOrder();

                                    datatablesDestroyAndRecreate();


                                }
                            });



                        } else if (datas.trim() === 'Duplicate') {

                            bootbox.alert({
                                message: "Lab Request Code Duplication Detected. Please Order diffrent lab item as the data already there.",
                                title: "Information",
                                backdrop: true
                            });


                        } else if (datas.trim() === 'Failed') {

                            bootbox.alert({
                                message: "Lab Request Add Failed",
                                title: "Information",
                                backdrop: true
                            });

                            $('#addStockOrder').modal('hide');
                            resetAddOrder();

                        }

                    },
                    error: function (err) {
                        console.log("Ajax Is Not Success");
                    }

                });
            }

        });
        // Add Order End


        // Reset Order Button Start
        $('#orderLabRequestResetButton').on('click', function (e) {
            resetAddOrder();
        });
        // Reset Order Button End


        // Reset Order Function Start
        function resetAddOrder() {
            document.getElementById("addLabRequestModalForm").reset();
            document.getElementById("orderLabRequestDetailsSearchItemInputDisplayResult").innerHTML = "";
        }
        // Reset Order Function End



//-------------------------------------------------------------------------------  Add Part End  --------------------------------------------------------------------------------//






//-------------------------------------------------------------------------  Update And Delete Part Start  ----------------------------------------------------------------------------//



        // global variable declaration
        var row;


        // Get Data For Delete And Update To Load On the Modal
        $('#lisLabRequestOrderDetailContent').off('click', '#patientOrderDetailsListTable #updateOrderDetailsTButton').on('click', '#patientOrderDetailsListTable #updateOrderDetailsTButton', function (e) {

            e.preventDefault();

            row = $(this).closest("tr");
            var rowData = row.find("#dataPatientOrderDetailsListhidden").val();
            var arrayData = rowData.split("|");

            var updateLabRequestOrderNo = arrayData[0];
            var updateLabRequestOrderCode = arrayData[2];
            var updateLabRequestOrderName = arrayData[11];
            var updateLabRequestOrderComment = arrayData[14];

            $("#updateLabRequestOrderNo").val(updateLabRequestOrderNo);
            $("#updateLabRequestOrderCode").val(updateLabRequestOrderCode);
            $("#updateLabRequestOrderName").val(updateLabRequestOrderName);
            $("#updateLabRequestOrderComment").val(updateLabRequestOrderComment);

        });
        // Get Data For Delete And Update To Load On the Modal End



        // Update Order Data
        $('#updateLabRequestOrder').off('click', '#updateLabRequestOrderMButton').on('click', '#updateLabRequestOrderMButton', function (e) {

            e.preventDefault();

            var orderNo = $("#updateLabRequestOrderNo").val();
            var itemCode = $("#updateLabRequestOrderCode").val();
            var itemName = $("#updateLabRequestOrderName").val();
            var itemComment = $("#updateLabRequestOrderComment").val();


            var data = {
                orderNo: orderNo,
                itemCode: itemCode,
                itemName: itemName,
                itemComment: itemComment
            };

            console.log(data);


            $.ajax({
                url: "controllerProcessAssignSpecimen/assignSpecimenOrderUpdateItem.jsp",
                type: "post",
                data: data,
                timeout: 10000, // 10 seconds
                success: function (datas) {

                    if (datas.trim() === 'Success') {

                        $.ajax({
                            url: "manageLabOrderDetailsTable.jsp",
                            type: "post",
                            data: data,
                            timeout: 3000,
                            success: function (returnOrderDetailsTableHTML) {

                                $('#patientOrderDetailsListTable').html(returnOrderDetailsTableHTML);

                                $('#updateLabRequestOrder').modal('hide');

                                bootbox.alert({
                                    message: "Lab Request is Updated Successfully",
                                    title: "Information",
                                    backdrop: true
                                });

                                datatablesDestroyAndRecreate();


                            }
                        });

                    } else if (datas.trim() === 'Failed') {

                        bootbox.alert({
                            message: "Lab Request Update Failed",
                            title: "Information",
                            backdrop: true
                        });


                    }

                },
                error: function (err) {
                    alert("Error: Update Ajax failed");
                }

            });


        });
        // Update Order Data End



        // Delete Order Data 
        $('#updateLabRequestOrder').off('click', '#deleteLabRequestOrderMButton').on('click', '#deleteLabRequestOrderMButton', function (e) {

            var orderNo = $("#updateLabRequestOrderNo").val();
            var itemCode = $("#updateLabRequestOrderCode").val();

            var data = {
                orderNo: orderNo,
                itemCode: itemCode
            };

            console.log(data);

            $('#updateLabRequestOrder').modal('hide');

            bootbox.confirm({
                message: "Are you sure want to delete this item ?",
                title: "Please Confirm ?",
                buttons: {
                    confirm: {
                        label: 'Yes',
                        className: 'btn-primary'
                    },
                    cancel: {
                        label: 'No',
                        className: 'btn-default'
                    }
                },
                callback: function (result) {

                    if (result === true) {


                        $.ajax({
                            url: "controllerProcessAssignSpecimen/assignSpecimenOrderDeleteItem.jsp",
                            type: "post",
                            data: data,
                            timeout: 10000, // 10 seconds
                            success: function (datas) {

                                if (datas.trim() === 'Success') {

                                    $.ajax({
                                        url: "manageLabOrderDetailsTable.jsp",
                                        type: "post",
                                        data: data,
                                        timeout: 3000,
                                        success: function (returnOrderDetailsTableHTML) {

                                            $('#patientOrderDetailsListTable').html(returnOrderDetailsTableHTML);

                                            bootbox.alert({
                                                message: "Lab Request is Deleted Successfully",
                                                title: "Information",
                                                backdrop: true
                                            });

                                            datatablesDestroyAndRecreate();


                                        }
                                    });

                                } else if (datas.trim() === 'Failed') {

                                    bootbox.alert({
                                        message: "Lab Request Delete Failed",
                                        title: "Information",
                                        backdrop: true
                                    });


                                }

                            },
                            error: function (err) {
                                alert("Error: Deletion Ajax failed");
                            }

                        });



                    } else {
                        console.log("Process Is Canceled");
                    }

                }
            });

        });
        // Delete Order Data End



//-------------------------------------------------------------------------------  Update And Delete Part End  --------------------------------------------------------------------------------//








//-------------------------------------------------------------------------------  Assign Specimen Start  --------------------------------------------------------------------------------//



        $('#lisLabRequestOrderDetailContent').off('click', '#patientOrderAssignRightButtonDiv #btnOrderAssignSpecimen').on('click', '#patientOrderAssignRightButtonDiv #btnOrderAssignSpecimen', function (e) {


            var customer_id = $("#patientpmino").val();
            var txt_date = $("#patientOrderDate").val();
            var order_no = $("#patientOrderNo").val();
            var order_date = $("#patientOrderDate").val();
            var episode_date = $("#patientEpisodeDate").val();
            var encounter_date = $("#patientEncounterDate").val();

            var stringMaster = "";
            var stringDetail = "";

            var stringMaster = customer_id + "|" + txt_date + "|" + order_no + "|" + order_date + "|" + episode_date + "|" + encounter_date;
            var stringDetail = "";

            var table = $("#patientOrderDetailsListTable tbody");

            var assignCheckedC, assignCheckedD, item_cd, item_name, comment, status;

            var assignSpecimenList = [];

            table.find('tr').each(function (i) {

                var $tds = $(this).find('td');

                // Get The Data
                assignCheckedC = $(this).find("#labRequestChecked").is(':checked');
                assignCheckedD = $(this).find("#labRequestChecked").is(':not(:disabled)');
                item_cd = $tds.eq(2).text();
                item_name = $tds.eq(3).text();
                comment = $tds.eq(10).text();
                status = $tds.eq(11).text();

                if (assignCheckedC === true && assignCheckedD === true) {

                    assignSpecimenList.push(item_cd + "^" + item_name + "^" + comment + "^" + status);
                    stringDetail = assignSpecimenList.join("|");

                }

            });

            if (stringDetail === "") {

                bootbox.alert("Please select at least a laboratory request to assign specimen");

            } else {

                bootbox.confirm({
                    message: "Are you sure want to assign specimen the selected order ?",
                    title: "Please Confirm ?",
                    buttons: {
                        confirm: {
                            label: 'Yes',
                            className: 'btn-primary'
                        },
                        cancel: {
                            label: 'No',
                            className: 'btn-default'
                        }
                    },
                    callback: function (result) {

                        if (result === true) {

                            $('#myLoadingModal').modal('show');

                            $.ajax({
                                url: "controllerProcessAssignSpecimen/assignSpecimenOrderGetSeqNoN.jsp",
                                type: "get",
                                timeout: 10000, // 10 seconds
                                success: function (seqNo) {


                                    var data = {
                                        stringMaster: stringMaster,
                                        stringDetail: stringDetail,
                                        seqNo: seqNo.trim()
                                    };

                                    console.log(data);

                                    $.ajax({
                                        url: "controllerProcessAssignSpecimen/assignSpecimenOrderAssign.jsp",
                                        type: "post",
                                        data: data,
                                        timeout: 10000, // 10 seconds
                                        success: function (datas) {

                                            $('#myLoadingModal').modal('hide');

                                            if (datas.trim() === "Success") {

                                                resetPage();

                                                bootbox.alert("The specimen is accepted successfully");

                                            } else if (datas.trim() === "Failed") {

                                                resetPage();

                                                bootbox.alert("Assign specimen failed");

                                            }



                                        },
                                        error: function (err) {
                                            alert("Error: Ajax failed");
                                        }

                                    });


                                },
                                error: function (err) {
                                    alert("Error: Ajax failed");
                                }

                            });

                        } else {
                            console.log("Process Is Canceled");
                        }

                    }
                });
            }


        });




//-------------------------------------------------------------------------------  Assign Specimen End  --------------------------------------------------------------------------------//







//-------------------------------------------------------------------------------  Reset Part Start  --------------------------------------------------------------------------------//



        // Clear Button Function Start
        $('#lisLabRequestOrderDetailContent').on('click', '#btnClearAssignSpecimen', function (e) {
            resetPage();
        });
        // Clear Button Function End



        // Reset The Page Start
        function resetPage() {

            //$("#lisLabRequestOrderMasterContent").load("manageLabOrderMasterTable.jsp");

            var table = '<table class="table table-filter table-striped table-bordered" style="width: 100%">\n\
                            <thead>\n\
                                <th style="text-align: left;">Order No.</th>\n\
                                <th style="text-align: left;">PMI No.</th>\n\
                                <th style="text-align: left;">Name</th>\n\
                                <th style="text-align: left;">Order Date</th>\n\
                                <th style="text-align: left;">Doctor\'s Name</th>\n\
                            </thead>\n\
                            <tbody>\n\
                                <tr>\n\
                                    <td colspan="5" align="center">Please Select Correct Filter And Press Refresh Button</td>\n\
                                </tr> \n\
                            </tbody>\n\
                        </table>';

            $("#lisLabRequestOrderMasterContent").html(table);

            $('#LAB_OrderTime').prop('selectedIndex', 0);

            document.getElementById("patientOrderDetailContentOrderInfoForm").reset();
            document.getElementById("patientOrderDetailContentBasicInfoForm").reset();

            $("#lisLabRequestOrderDetailContent #patientAllergyListTableDiv").load("manageLabOrderDetaillBasicInfo.jsp #patientAllergyListTableDiv");
            $("#lisLabRequestOrderDetailContent #patientDiagnosisListTableDiv").load("manageLabOrderDetaillBasicInfo.jsp #patientDiagnosisListTableDiv");
            $("#lisLabRequestOrderDetailContent #patientOrderDetailsListTableDiv").load("manageLabOrderDetaillBasicInfo.jsp #patientOrderDetailsListTableDiv");

            $('.nav-tabs a[href="#tab_default_1"]').tab('show');

        }
        // Reset The Page End




//=================================================================================  Reset Part End  ==================================================================================//


        function ANL_getRandomColor() {
            var letters = '0123456789ABCDEF'.split('');
            var color = '#';
            for (var i = 0; i < 6; i++) {
                color += letters[Math.floor(Math.random() * 16)];
            }
            return color;
        }

        function ANL_getUniqueColors(t)
        {
            t = parseInt(t);
            if (t < 2) {
//                throw new Error("'t' must be greater than 1.");
                var err = [];
                err.push(ANL_hsvToRgb(360, 200, 100));
                return err;
            }


            // distribute the colors evenly on
            // the hue range (the 'H' in HSV)
            var i = 360 / (t - 1);

            // hold the generated colors
            var r = [];
            var sv = 70;
            for (var x = 0; x < t; x++) {
                // alternate the s, v for more
                // contrast between the colors.
                sv = sv > 90 ? 70 : sv + 10;
                r.push(ANL_hsvToRgb(i * x, sv, sv));
            }
            return r;
        }

        function ANL_hsvToRgb(h, s, v) {
            var r, g, b;
            var i;
            var f, p, q, t;

            // Make sure our arguments stay in-range
            h = Math.max(0, Math.min(360, h));
            s = Math.max(0, Math.min(100, s));
            v = Math.max(0, Math.min(100, v));

            // We accept saturation and value arguments from 0 to 100 because that's
            // how Photoshop represents those values. Internally, however, the
            // saturation and value are calculated from a range of 0 to 1. We make
            // That conversion here.
            s /= 100;
            v /= 100;

            if (s == 0) {
                // Achromatic (grey)
                r = g = b = v;
                return [Math.round(r * 255), Math.round(g * 255), Math.round(b * 255)];
            }

            h /= 60; // sector 0 to 5
            i = Math.floor(h);
            f = h - i; // factorial part of h
            p = v * (1 - s);
            q = v * (1 - s * f);
            t = v * (1 - s * (1 - f));

            switch (i) {
                case 0:
                    r = v;
                    g = t;
                    b = p;
                    break;

                case 1:
                    r = q;
                    g = v;
                    b = p;
                    break;

                case 2:
                    r = p;
                    g = v;
                    b = t;
                    break;

                case 3:
                    r = p;
                    g = q;
                    b = v;
                    break;

                case 4:
                    r = t;
                    g = p;
                    b = v;
                    break;

                default: // case 5:
                    r = v;
                    g = p;
                    b = q;
            }

            return [Math.round(r * 255), Math.round(g * 255), Math.round(b * 255)];
        }



        // Getting Order Id And Date Start
        $('#lisLabRequestOrderDetailContent').off('click', '#patientOrderShowVitalSign').on('click', '#patientOrderShowVitalSign', function (e) {

            e.preventDefault();

            var patientPMINo = $("#patientpmino").val();

            if (patientPMINo === "" || patientPMINo === null) {

                $('.nav-tabs a[href="#tab_default_1"]').tab('show');
                bootbox.alert("Please Select A Order First");

            } else {

                $('<div class="loading">Loading</div>').appendTo('body');

                var data = {
                    patientPMINo: patientPMINo
                };

                $.ajax({
                    url: "patientGetAllVitalSigns.jsp",
                    type: 'POST',
                    data: data,
                    timeout: 3000,
                    success: function (data) {

                        $("#patientOrderDetailsVitalSignContent").html(data);
                        $('#patientOrderDetailsVitalSignModal').modal('show');
                        $('.loading').hide();

                    }
                });



            }

        });
        // Getting Order Id And Date End



        $('#patientOrderDetailsVitalSignModal').on('click', '#ANL_viewDiv #ANL_btnGraphBP', function () {

            Chart.helpers.each(Chart.instances, function (instance) {
                instance.destroy();
            });

            var dataArr = $(this).closest('td').find('.hidden');
            var chartTitle = $(this).closest('td').find('#ANL_chartTitle').text();
            $('#ANL_canvas').html("");
            var canvas = $('#ANL_canvas');

            var sitSysArr = [];
            var sitDiasArr = [];
            var sitPulseArr = [];
            var standSysArr = [];
            var standDiasArr = [];
            var standPulseArr = [];
            var supSysArr = [];
            var supDiasArr = [];
            var supPulseArr = [];
            var dateArr = [];
            var lhrColour = [];


            dataArr.each(function () {
                var tempArr = $(this).text().split("|");
                sitSysArr.push(tempArr[3]);
                sitDiasArr.push(tempArr[4]);
                sitPulseArr.push(tempArr[5]);
                standSysArr.push(tempArr[6]);
                standDiasArr.push(tempArr[7]);
                standPulseArr.push(tempArr[8]);
                supSysArr.push(tempArr[9]);
                supDiasArr.push(tempArr[10]);
                supPulseArr.push(tempArr[11]);
                dateArr.push(tempArr[12]);

            });


            var lhrColourTemp = ANL_getUniqueColors(9);

            for (var tempI = 0; tempI < lhrColourTemp.length; tempI++) {
                var strRGBA = "rgba(" + lhrColourTemp[tempI][0] + ", " + lhrColourTemp[tempI][1] + ", " + lhrColourTemp[tempI][2] + ", 0.8)";
                lhrColour.push(strRGBA);
            }


            var dataSitSys = {
                label: "Sit Systol (mmHg)",
                data: sitSysArr,
                lineTension: 0.3,
                fill: false,
                borderColor: lhrColour[0],
                backgroundColor: 'transparent',
                pointBorderColor: lhrColour[0],
                pointBackgroundColor: lhrColour[0],
                pointRadius: 5,
                pointHoverRadius: 10,
                pointHitRadius: 30,
                pointBorderWidth: 2,
                yAxisID: "y-axis-1"
            };

            var dataSitDias = {
                label: "Sit Diastol (mmHg)",
                data: sitDiasArr,
                lineTension: 0.3,
                fill: false,
                borderColor: lhrColour[1],
                backgroundColor: 'transparent',
                pointBorderColor: lhrColour[1],
                pointBackgroundColor: lhrColour[1],
                pointRadius: 5,
                pointHoverRadius: 10,
                pointHitRadius: 30,
                pointBorderWidth: 2,
                yAxisID: "y-axis-1"
            };

            var dataSitPulse = {
                label: "Sit pulse (bpm)",
                data: sitPulseArr,
                lineTension: 0.3,
                fill: false,
                borderColor: lhrColour[2],
                backgroundColor: 'transparent',
                pointBorderColor: lhrColour[2],
                pointBackgroundColor: lhrColour[2],
                pointRadius: 5,
                pointHoverRadius: 10,
                pointHitRadius: 30,
                pointBorderWidth: 2,
                yAxisID: "y-axis-1"
            };

            var dataStandSys = {
                label: "Stand Systol (mmHg)",
                data: standSysArr,
                lineTension: 0.3,
                fill: false,
                borderColor: lhrColour[3],
                backgroundColor: 'transparent',
                pointBorderColor: lhrColour[3],
                pointBackgroundColor: lhrColour[3],
                pointRadius: 5,
                pointHoverRadius: 10,
                pointHitRadius: 30,
                pointBorderWidth: 2,
                yAxisID: "y-axis-1"
            };

            var dataStandDias = {
                label: "Stand Diastol (mmHg)",
                data: standDiasArr,
                lineTension: 0.3,
                fill: false,
                borderColor: lhrColour[4],
                backgroundColor: 'transparent',
                pointBorderColor: lhrColour[4],
                pointBackgroundColor: lhrColour[4],
                pointRadius: 5,
                pointHoverRadius: 10,
                pointHitRadius: 30,
                pointBorderWidth: 2,
                yAxisID: "y-axis-1"
            };

            var dataStandPulse = {
                label: "Stand pulse (bpm)",
                data: standPulseArr,
                lineTension: 0.3,
                fill: false,
                borderColor: lhrColour[5],
                backgroundColor: 'transparent',
                pointBorderColor: lhrColour[5],
                pointBackgroundColor: lhrColour[5],
                pointRadius: 5,
                pointHoverRadius: 10,
                pointHitRadius: 30,
                pointBorderWidth: 2,
                yAxisID: "y-axis-1"
            };

            var dataSupSys = {
                label: "Supine Systol (mmHg)",
                data: supSysArr,
                lineTension: 0.3,
                fill: false,
                borderColor: lhrColour[6],
                backgroundColor: 'transparent',
                pointBorderColor: lhrColour[6],
                pointBackgroundColor: lhrColour[6],
                pointRadius: 5,
                pointHoverRadius: 10,
                pointHitRadius: 30,
                pointBorderWidth: 2,
                yAxisID: "y-axis-1"
            };

            var dataSupDias = {
                label: "Supine Diastol (mmHg)",
                data: supDiasArr,
                lineTension: 0.3,
                fill: false,
                borderColor: lhrColour[7],
                backgroundColor: 'transparent',
                pointBorderColor: lhrColour[7],
                pointBackgroundColor: lhrColour[7],
                pointRadius: 5,
                pointHoverRadius: 10,
                pointHitRadius: 30,
                pointBorderWidth: 2,
                yAxisID: "y-axis-1"
            };

            var dataSupPulse = {
                label: "Supine pulse (bpm)",
                data: supPulseArr,
                lineTension: 0.3,
                fill: false,
                borderColor: lhrColour[8],
                backgroundColor: 'transparent',
                pointBorderColor: lhrColour[8],
                pointBackgroundColor: lhrColour[8],
                pointRadius: 5,
                pointHoverRadius: 10,
                pointHitRadius: 30,
                pointBorderWidth: 2,
                yAxisID: "y-axis-1"
            };

            var chartOptions = {
                plugins: {
                    valueOnGraph: false
                },
                legend: {
                    display: true,
                    position: 'top',
                    labels: {
                        boxWidth: 40,
                        fontColor: 'black'
                    }
                },
                title: {
                    display: true,
                    fontSize: 20,
                    fontFamily: 'Arial',
                    text: chartTitle
                },
                tooltips: {
                    mode: 'index',
                    intersect: true,
                    position: 'nearest'
                },
                responsive: true,
                maintainAspectRatio: true,
                scales: {
                    yAxes: [{
                            type: "linear", // only linear but allow scale type registration. This allows extensions to exist solely for log scale for instance
                            display: true,
                            position: "left",
                            id: "y-axis-1"
                        }]
                }
            };

            var chartData = {
                labels: dateArr,
                datasets: [dataSitSys, dataSitDias, dataSitPulse, dataStandSys, dataStandDias, dataStandPulse, dataSupSys, dataSupDias, dataSupPulse]
            };


            var lineChart = new Chart(canvas, {
                type: 'line',
                data: chartData,
                options: chartOptions
            });

            $('#patientOrderDetailsVitalSignGrafhModal').modal('show');

        });



        $('#patientOrderDetailsVitalSignModal').on('click', '#ANL_viewDiv #ANL_btnGraphLine', function () {

            Chart.helpers.each(Chart.instances, function (instance) {
                instance.destroy();
            });

            var dataArr = $(this).closest('td').find('.hidden');
            var chartTitle = $(this).closest('td').find('#ANL_chartTitle').text();

            $('#ANL_canvas').html("");

            var canvas = $('#ANL_canvas');

            var lhrData = [];
            var lhrLabel = [];


            dataArr.each(function () {
                var tempArr = $(this).text().split("|");
                lhrLabel.push(tempArr[4]);
                lhrData.push(tempArr[3]);


            });


            var dataReading = {
                label: chartTitle,
                data: lhrData,
                lineTension: 0.3,
                fill: false,
                borderColor: 'purple',
                backgroundColor: 'transparent',
                pointBorderColor: 'purple',
                pointBackgroundColor: 'purple',
                pointRadius: 5,
                pointHoverRadius: 10,
                pointHitRadius: 30,
                pointBorderWidth: 2,
                yAxisID: "y-axis-1"
            };

            var chartOptions = {
                legend: {
                    display: false,
                    position: 'top',
                    labels: {
                        boxWidth: 40,
                        fontColor: 'black'
                    }
                },
                title: {
                    display: true,
                    fontSize: 20,
                    fontFamily: 'Arial',
                    text: chartTitle
                },
                tooltips: {
                    mode: 'index',
                    intersect: true
                },
                responsive: true,
                scales: {
                    yAxes: [{
                            type: "linear", // only linear but allow scale type registration. This allows extensions to exist solely for log scale for instance
                            display: true,
                            position: "left",
                            id: "y-axis-1"
                        }]
                }
            };

            var chartData = {
                labels: lhrLabel,
                datasets: [dataReading]
            };


            var lineChart = new Chart(canvas, {
                type: 'line',
                data: chartData,
                options: chartOptions
            });

            $('#patientOrderDetailsVitalSignGrafhModal').modal('show');

        });




        $('#patientOrderDetailsVitalSignModal').on('click', '#ANL_viewDiv #ANL_btnGraphHtWt', function () {

            Chart.helpers.each(Chart.instances, function (instance) {
                instance.destroy();
            });

            var dataArr = $(this).closest('td').find('.hidden');
            var chartTitle = $(this).closest('td').find('#ANL_chartTitle').text();
            $('#ANL_canvas').html("");
            var canvas = $('#ANL_canvas');

            var heightArr = [];
            var weightArr = [];
            var dateArr = [];
            var lhrColour = [];


            dataArr.each(function () {
                var tempArr = $(this).text().split("|");
                weightArr.push(tempArr[3]);
                heightArr.push(tempArr[4]);
                dateArr.push(tempArr[5]);

            });


            var lhrColourTemp = ANL_getUniqueColors(2);

            for (var tempI = 0; tempI < lhrColourTemp.length; tempI++) {
                var strRGBA = "rgba(" + lhrColourTemp[tempI][0] + ", " + lhrColourTemp[tempI][1] + ", " + lhrColourTemp[tempI][2] + ", 0.8)";
                lhrColour.push(strRGBA);
            }


            var dataWeight = {
                label: "Weight(kg)",
                data: weightArr,
                lineTension: 0.3,
                fill: false,
                borderColor: lhrColour[0],
                backgroundColor: 'transparent',
                pointBorderColor: lhrColour[0],
                pointBackgroundColor: lhrColour[0],
                pointRadius: 5,
                pointHoverRadius: 10,
                pointHitRadius: 30,
                pointBorderWidth: 2,
                yAxisID: "y-axis-1"
            };


            var chartOptions = {
                legend: {
                    display: true,
                    position: 'top',
                    labels: {
                        boxWidth: 40,
                        fontColor: 'black'
                    }
                },
                title: {
                    display: true,
                    fontSize: 20,
                    fontFamily: 'Arial',
                    text: chartTitle
                },
                tooltips: {
                    mode: 'index',
                    intersect: true,
                    position: 'nearest'
                },
                responsive: true,
                maintainAspectRatio: true,
                scales: {
                    yAxes: [{
                            type: "linear", // only linear but allow scale type registration. This allows extensions to exist solely for log scale for instance
                            display: true,
                            position: "left",
                            id: "y-axis-1"
                        }]
                }
            };

            var chartData = {
                labels: dateArr,
                datasets: [dataWeight]
            };


            var lineChart = new Chart(canvas, {
                type: 'line',
                data: chartData,
                options: chartOptions
            });

            $('#patientOrderDetailsVitalSignGrafhModal').modal('show');

        });




    });

</script>