<%-- 
    Document   : manageLabSpecimenDetaillBasicInfo
    Created on : Jan 15, 2018, 5:57:39 PM
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
    <button class="btn btn-default " type="button" id="btnSpecimenBackSpecimen" ><i class="fa fa-backward fa-lg"></i>&nbsp; Back &nbsp;</button>
    <button class="btn btn-warning " type="button" id="btnSpecimenRejectSpecimen" ><i class="fa fa-times fa-lg"></i>&nbsp; Reject Specimen &nbsp;</button>
    <button class="btn btn-danger " type="button" id="btnSpecimenCancelSpecimen" ><i class="fa fa-ban fa-lg"></i>&nbsp; Cancel Specimen &nbsp;</button>
</div>

<div class="text-right" id="patientOrderSpecimenRightButtonDiv" > 
    <button class="btn btn-success " type="button" id="btnSpecimenSendSpecimenAccept" > <i class="fa fa-check-square-o fa-lg"></i>&nbsp; Accept Specimen &nbsp;</button>
</div>



<script>


    $(document).ready(function () {


//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//


        var episodeDate;
        var encounterDate;

        // Move to Order Details Fetch Details Start
        $('#lisLabRequestSpecimenMasterContent').off('click', '#assignLabSpecimenMasterTable #moveToSpecimenDetailsTButton').on('click', '#assignLabSpecimenMasterTable #moveToSpecimenDetailsTButton', function (e) {

            $('<div class="loading">Loading</div>').appendTo('body');

            e.preventDefault();

            var row = $(this).closest("tr");
            var rowData = row.find("#dataAssignLabSpecimenMasterListhidden").val();
            var arrayData = rowData.split("|");
            console.log(arrayData);

            //Assign Array into seprated val
            var patientpmino = arrayData[0];
            var patientName = arrayData[18];
            var patientnic = arrayData[19];
            var patientGender = arrayData[23];
            var patientBdate = arrayData[20];
            var patientBtype = arrayData[24];

            var patientOrderNo = arrayData[3];
            var patientOrderDate = arrayData[7];
            var patientOrderEpisodeDate = arrayData[5];
            var patientOrderEncounterDate = arrayData[6];

            var patientSpecimenNo = arrayData[4];


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
                url: "manageLabSpecimenDetailsTable.jsp",
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







//-------------------------------------------------------------------------------  Reject Specimen Start  --------------------------------------------------------------------------------//



        $('#lisLabRequestSpecimenDetailContent').off('click', '#patientOrderSpecimenLeftButtonDiv #btnSpecimenRejectSpecimen').on('click', '#patientOrderSpecimenLeftButtonDiv #btnSpecimenRejectSpecimen', function (e) {


            var customer_id = $("#patientpmino").val();
            var txt_date = $("#specimenOrderDate").val();
            var specimen_no = $("#specimenSpecimenNo").val();
            var order_no = $("#specimenOrderNo").val();
            var order_date = $("#specimenOrderDate").val();
            var episode_date = $("#specimenEpisodeDate").val();
            var encounter_date = $("#specimenEncounterDate").val();

            var stringMaster = "";
            var stringDetail = "";

            var stringMaster = customer_id + "|" + txt_date + "|" + specimen_no + "|" + order_no + "|" + order_date + "|" + episode_date + "|" + encounter_date;
            var stringDetail = "";

            var table = $("#patientSpecimenDetailsListTable tbody");

            var specimenCheckedC, specimenCheckedD, item_cd, item_name;

            var checkSpecimenList = [];

            table.find('tr').each(function (i) {

                var $tds = $(this).find('td');

                // Get The Data
                specimenCheckedC = $(this).find("#labSpecimenChecked").is(':checked');
                specimenCheckedD = $(this).find("#labSpecimenChecked").is(':not(:disabled)');
                item_cd = $tds.eq(1).text();
                item_name = $tds.eq(2).text();

                if (specimenCheckedC === true && specimenCheckedD === true) {

                    checkSpecimenList.push(item_cd + "^" + item_name);
                    stringDetail = checkSpecimenList.join("|");

                }

            });

            if (stringDetail === "") {

                bootbox.alert("Please Select At Least A Specimen Request To Reject !!!");

            } else {

                bootbox.confirm({
                    message: "Are you sure want to reject this specimen ?",
                    title: "Reject Specimen ?",
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


                            var data = {
                                stringMaster: stringMaster,
                                stringDetail: stringDetail
                            };

                            console.log(data);

                            $.ajax({
                                url: "controllerProcessReceiveSpecimen/receiveSpecimenReject.jsp",
                                type: "post",
                                data: data,
                                timeout: 10000, // 10 seconds
                                success: function (datas) {

                                    $('#myLoadingModal').modal('hide');

                                    if (datas.trim() === "Success") {

                                        resetPage();

                                        bootbox.alert("Reject Specimen Is Successfull !!!");

                                    } else if (datas.trim() === "Failed") {

                                        resetPage();

                                        bootbox.alert("Reject Specimen Failed !!!");

                                    }



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



//-------------------------------------------------------------------------------  Reject Specimen End  --------------------------------------------------------------------------------//




//-------------------------------------------------------------------------------  Cancel Specimen Start  --------------------------------------------------------------------------------//



        $('#lisLabRequestSpecimenDetailContent').off('click', '#patientOrderSpecimenLeftButtonDiv #btnSpecimenCancelSpecimen').on('click', '#patientOrderSpecimenLeftButtonDiv #btnSpecimenCancelSpecimen', function (e) {


            var customer_id = $("#patientpmino").val();
            var txt_date = $("#specimenOrderDate").val();
            var specimen_no = $("#specimenSpecimenNo").val();
            var order_no = $("#specimenOrderNo").val();
            var order_date = $("#specimenOrderDate").val();
            var episode_date = $("#specimenEpisodeDate").val();
            var encounter_date = $("#specimenEncounterDate").val();

            var stringMaster = "";
            var stringDetail = "";

            var stringMaster = customer_id + "|" + txt_date + "|" + specimen_no + "|" + order_no + "|" + order_date + "|" + episode_date + "|" + encounter_date;
            var stringDetail = "";

            var table = $("#patientSpecimenDetailsListTable tbody");

            var specimenCheckedC, specimenCheckedD, item_cd, item_name;

            var checkSpecimenList = [];

            table.find('tr').each(function (i) {

                var $tds = $(this).find('td');

                // Get The Data
                specimenCheckedC = $(this).find("#labSpecimenChecked").is(':checked');
                specimenCheckedD = $(this).find("#labSpecimenChecked").is(':not(:disabled)');
                item_cd = $tds.eq(1).text();
                item_name = $tds.eq(2).text();

                if (specimenCheckedC === true && specimenCheckedD === true) {

                    checkSpecimenList.push(item_cd + "^" + item_name);
                    stringDetail = checkSpecimenList.join("|");

                }

            });

            if (stringDetail === "") {

                bootbox.alert("Please Select At Least A Specimen Request To Cancel !!!");

            } else {

                bootbox.confirm({
                    message: "Are you sure want to cancel this specimen ?",
                    title: "Cancel Specimen ?",
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


                            var data = {
                                stringMaster: stringMaster,
                                stringDetail: stringDetail
                            };

                            console.log(data);

                            $.ajax({
                                url: "controllerProcessReceiveSpecimen/receiveSpecimenCancel.jsp",
                                type: "post",
                                data: data,
                                timeout: 10000, // 10 seconds
                                success: function (datas) {

                                    $('#myLoadingModal').modal('hide');

                                    if (datas.trim() === "Success") {

                                        resetPage();

                                        bootbox.alert("Cancel Specimen Is Successfull !!!");

                                    } else if (datas.trim() === "Failed") {

                                        resetPage();

                                        bootbox.alert("Cancel Specimen Failed !!!");

                                    }



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



//-------------------------------------------------------------------------------  Cancel Specimen End  --------------------------------------------------------------------------------//




//-------------------------------------------------------------------------------  Accept Specimen Start  --------------------------------------------------------------------------------//



        $('#lisLabRequestSpecimenDetailContent').off('click', '#patientOrderSpecimenRightButtonDiv #btnSpecimenSendSpecimenAccept').on('click', '#patientOrderSpecimenRightButtonDiv #btnSpecimenSendSpecimenAccept', function (e) {


            var customer_id = $("#patientpmino").val();
            var txt_date = $("#specimenOrderDate").val();
            var specimen_no = $("#specimenSpecimenNo").val();
            var order_no = $("#specimenOrderNo").val();
            var order_date = $("#specimenOrderDate").val();
            var episode_date = $("#specimenEpisodeDate").val();
            var encounter_date = $("#specimenEncounterDate").val();

            var stringMaster = "";
            var stringDetail = "";

            var stringMaster = customer_id + "|" + txt_date + "|" + specimen_no + "|" + order_no + "|" + order_date + "|" + episode_date + "|" + encounter_date;
            var stringDetail = "";

            var table = $("#patientSpecimenDetailsListTable tbody");

            var specimenCheckedC, specimenCheckedD, item_cd, item_name;

            var checkSpecimenList = [];

            table.find('tr').each(function (i) {

                var $tds = $(this).find('td');

                // Get The Data
                specimenCheckedC = $(this).find("#labSpecimenChecked").is(':checked');
                specimenCheckedD = $(this).find("#labSpecimenChecked").is(':not(:disabled)');
                item_cd = $tds.eq(1).text();
                item_name = $tds.eq(2).text();

                if (specimenCheckedC === true && specimenCheckedD === true) {

                    checkSpecimenList.push(item_cd + "^" + item_name);
                    stringDetail = checkSpecimenList.join("|");

                }

            });

            if (stringDetail === "") {

                bootbox.alert("Please Select At Least A Specimen Request To Cancel !!!");

            } else {

                bootbox.confirm({
                    message: "Are you sure want to accept this specimen ?",
                    title: "Accept Specimen ?",
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


                            var data = {
                                stringMaster: stringMaster,
                                stringDetail: stringDetail
                            };

                            console.log(data);

                            $.ajax({
                                url: "controllerProcessReceiveSpecimen/receiveSpecimenAccept.jsp",
                                type: "post",
                                data: data,
                                timeout: 10000, // 10 seconds
                                success: function (datas) {

                                    $('#myLoadingModal').modal('hide');

                                    if (datas.trim() === "Success") {

                                        resetPage();

                                        bootbox.alert("Accept Specimen Is Successfull !!!");

                                    } else if (datas.trim() === "Failed") {

                                        resetPage();

                                        bootbox.alert("Accept Specimen Failed !!!");

                                    }



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



//-------------------------------------------------------------------------------  Accept Specimen End  --------------------------------------------------------------------------------//





//-------------------------------------------------------------------------------  Reset Part Start  --------------------------------------------------------------------------------//



        // Clear Button Function Start
        $('#lisLabRequestSpecimenDetailContent').on('click', '#btnSpecimenBackSpecimen', function (e) {
            resetPage();
        });
        // Clear Button Function End



        // Reset The Page Start
        function resetPage() {

            $("#lisLabRequestSpecimenMasterContent").load("manageLabSpecimenMasterTable.jsp");

            $('#LAB_SpecimenTime').prop('selectedIndex', 0);

            document.getElementById("patientOrderDetailContentOrderInfoForm").reset();
            document.getElementById("patientOrderDetailContentBasicInfoForm").reset();

            $("#lisLabRequestSpecimenDetailContent #patientSpecimenDetailsListTableDiv").load("manageLabSpecimenDetaillBasicInfo.jsp #patientSpecimenDetailsListTableDiv");

            $('.nav-tabs a[href="#tab_default_1"]').tab('show');

        }
        // Reset The Page End




//=================================================================================  Reset Part End  ==================================================================================//



    });

</script>