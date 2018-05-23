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
                    <input id="patientOrderDate" name="patientOrderDate" type="text" readonly placeholder="" class="form-control input-md">
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

<hr/>

<div style="float: left;" id="patientOrderAssignLeftButtonDiv" > 
    <button class="btn btn-default " type="button" id="btnClearAssignSpecimen" ><i class="fa fa-backward fa-lg"></i>&nbsp; Back &nbsp;</button>
</div>

<div class="text-right" id="patientOrderAssignRightButtonDiv" > 
    <button class="btn btn-success " type="button" id="btnOrderAssignSpecimen" > <i class="fa fa-check-square-o fa-lg"></i>&nbsp; Assign Specimen &nbsp;</button>
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
                "paging": true,
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

            if (labRequestOrderNo === "" || labRequestOrderNo === null) {

                $('.nav-tabs a[href="#tab_default_1"]').tab('show');

                bootbox.alert("Please Select A Order First");

            } else {

                $("#orderLabRequestDetailsID").val(labRequestOrderNo);
                $("#orderLabRequestDetailsDate").val(labRequestOrderDate);

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

                            $('#orderLabRequestDetailsSearchItemInputDisplayResult').text('No Eecord Found !');

                        }
                    });
                } else {

                    $('#orderLabRequestDetailsSearchItemInputDisplayResult').text('Search For More Than Two Characters !!'); // If less than 2 characters, clear the <div id="match"></div>

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

                bootbox.alert("Please Search The Drug Before Continue");

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
                                        title: "Process Result",
                                        backdrop: true
                                    });

                                    resetAddOrder();

                                    datatablesDestroyAndRecreate();


                                }
                            });



                        } else if (datas.trim() === 'Duplicate') {

                            bootbox.alert({
                                message: "Lab Request Code Duplication Detected. Please Order diffrent lab item as the data already there !!!",
                                title: "Process Result",
                                backdrop: true
                            });


                        } else if (datas.trim() === 'Failed') {

                            bootbox.alert({
                                message: "Lab Request Add Failed",
                                title: "Process Result",
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
                                    title: "Process Result",
                                    backdrop: true
                                });

                                datatablesDestroyAndRecreate();


                            }
                        });

                    } else if (datas.trim() === 'Failed') {

                        bootbox.alert({
                            message: "Lab Request Update Failed",
                            title: "Process Result",
                            backdrop: true
                        });


                    }

                },
                error: function (err) {
                    alert("Error! Update Ajax failed!!");
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
                title: "Delete Item?",
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
                                                title: "Process Result",
                                                backdrop: true
                                            });

                                            datatablesDestroyAndRecreate();


                                        }
                                    });

                                } else if (datas.trim() === 'Failed') {

                                    bootbox.alert({
                                        message: "Lab Request Delete Failed",
                                        title: "Process Result",
                                        backdrop: true
                                    });


                                }

                            },
                            error: function (err) {
                                alert("Error! Deletion Ajax failed!!");
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

                bootbox.alert("Please Select At Least A Laboratory Request To Assign Specimen !!!");

            } else {

                bootbox.confirm({
                    message: "Are you sure want to assign specimen the selected order ?",
                    title: "Assign Specimen?",
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

                                                bootbox.alert("Assign Specimen Is Successfull !!!");

                                            } else if (datas.trim() === "Failed") {

                                                resetPage();

                                                bootbox.alert("Assign Specimen Failed !!!");

                                            }



                                        },
                                        error: function (err) {
                                            alert("Error! Ajax failed!!");
                                        }

                                    });


                                },
                                error: function (err) {
                                    alert("Error! Ajax failed!!");
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

            $("#lisLabRequestOrderMasterContent").load("manageLabOrderMasterTable.jsp");

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



    });

</script>