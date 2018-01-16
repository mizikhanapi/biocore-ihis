<%-- 
    Document   : risManageOrderListBasicInfoNew
    Created on : Mar 28, 2017, 4:43:19 PM
    Author     : Shammugam
--%>

<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
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
<h5>ALLERGY LIST</h5>
<div id="ManageAllergyListTable" class="form-group" style="margin-bottom: 40px;">
    <table class="table table-filter table-striped table-bordered" style="background: #fff; border: 1px solid #ccc; width: 100%" id="patientAllergyListTable">
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
<div id="ManageDiagnosisListTable" class="form-group" style="margin-bottom: 40px;">
    <table class="table table-filter table-striped table-bordered" style="background: #fff; border: 1px solid #ccc; width: 100%" id="patientDiagnosisListTable">
        <thead>
        <th style="display: none">PMI NO</th>
        <th >HFC CODE</th>
        <th>EPISODE DATE</th>
        <th>ENCOUNTER DATE</th>
        <th>DIAGNOSIS CODE</th>
        <th style="text-align: left; width: 40%;">DIAGNOSIS DESCRIPTION</th>
        <th style="text-align: left; width: 20%;">COMMENT</th>
        </thead>
        <tbody>
        </tbody>
    </table>
</div>

<hr/>
<h4>Order Detail
    <span class="pull-right">

        <button id="risOrderNewRequestButton" class="btn btn-primary" data-toggle="modal" data-id="1" data-target="#NewRequest">
            <i class="fa fa-plus fa-lg"></i>&nbsp; New Request
        </button>
    </span>
</h4>
<div class="modal fade" id="NewRequest" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 600px !important; ">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="RNO_modalTitle">Request New Order</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal" id="RNO_addForm" autocomplete="off">
                    <%
                        String my_1_hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
                        Conn conn = new Conn();
                        String itemName = "SELECT item_cd,item_name,spe_source FROM lis_item_detail WHERE hfc_cd = '" + my_1_hfc_cd + "' ORDER BY item_name";
                        ArrayList<ArrayList<String>> q1 = conn.getData(itemName);
                    %>
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Item Name*</label>
                        <div class="col-md-8">
                            <select class="form-control" id="RNO_bodySystem" onchange="leaveChange(this)" name="itemName">
                                <option value="NoItem">Please Select Item Name</option>
                                <%
                                    if (q1.size() > 0) {
                                        for (int i = 0; i < q1.size(); i++) {

                                %>
                                <option value="<%=q1.get(i).get(0)%>"><%=q1.get(i).get(0) + " | " + q1.get(i).get(1) + " | " + q1.get(i).get(2)%></option>


                                <%        }
                                    }
                                %>
                            </select>

                        </div>
                    </div>


                    <div id="itemCD" >

                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Item Code*</label>
                            <div class="col-md-8" >
                                <input type="text" placeholder="-" class="form-control" maxlength="330" id="itemCode1" disabled="disabled" value="">
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">spe_source*</label>
                            <div class="col-md-8">
                                <input type="text" placeholder="-" class="form-control" maxlength="330" id="spe_source" value="">
                                <div id="RNO_pro_match" class="search-drop">
                                    <!--search result-->
                                </div>
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">spe_container*</label>
                            <div class="col-md-8">
                                <input type="text" placeholder="-" class="form-control" maxlength="330" id="spe_container" value="">
                                <div id="RNO_pro_match" class="search-drop">
                                    <!--search result-->
                                </div>
                            </div>
                        </div>
                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">volume*</label>
                            <div class="col-md-8">
                                <input type="text" placeholder="-" class="form-control" maxlength="330" id="volume" value="">
                                <div id="RNO_pro_match" class="search-drop">
                                    <!--search result-->
                                </div>
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">special_inst*</label>
                            <div class="col-md-8">
                                <input type="text" placeholder="-" class="form-control" maxlength="330" id="special_inst" value="">
                                <div id="RNO_pro_match" class="search-drop">
                                    <!--search result-->
                                </div>
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Comment</label>
                            <div class="col-md-8">
                                <textarea id="requestComment" placeholder="Write your Comment here (Optional)" class="form-control input-md" maxlength="500" rows="4" spellcheck="true" style="z-index: auto; position: relative; line-height: 20px; font-size: 14px; transition: none; background: none 0% 0% / auto repeat scroll padding-box border-box rgb(255, 255, 255);"></textarea>
                            </div>
                        </div>
                    </div>
                </form>
                <!-- content goes here -->
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group" id="RNO_div_btnAdd_or_update"><button type="button" class="btn btn-success btn-block btn-lg" role="button" id="btnAdd">Add</button></div>
                    <div class="btn-group" role="group">
                        <button type="reset" id="RNO_btnReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
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
                </div>
            </div>

        </div>


        <div class="col-md-4">

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-3 control-label" for="textinput">Location</label>
                <div class="col-md-7">
                    <input id="patientOrderLocationCode" name="patientOrderLocationCode" type="text" readonly placeholder="" class="form-control input-md">
                </div>
            </div>

        </div>

    </div>
</form>


<div id="ManageOrderDetailsListTable" class="form-group" style="margin-bottom: 40px;">
    <table class="table table-filter table-striped table-bordered" style="background: #fff; border: 1px solid #ccc; width: 100%" id="patientOrderDetailsListTable">
        <thead>
        <th class="col-sm-1">Assign Specimen</th>
        <th class="col-sm-1">Item Code</th>
        <th class="col-sm-1">Item Name</th>			 
        <th class="col-sm-1">S. Source</th>
        <th class="col-sm-1">S. Container</th>
        <th class="col-sm-1">Volume</th>
        <th class="col-sm-1">Special Instruction</th>
        <th class="col-sm-1">Status</th>
        <th class="col-sm-1">Verification</th>
        <th class="col-sm-1">Collection Date</th>
        <th class="col-sm-1">Comments</th>
        <th class="col-sm-1">Set Collection Date</th>
        <th class="col-sm-1">Requestor Comments</th>
        </thead>
        <tbody>

        </tbody>
    </table>
</div>

<script>

    function leaveChange(control) {
        var msg = control.value;
        var order = $("#patientOrderNo").val();
        //document.getElementById("itemCD").innerHTML = "<input type='text' placeholder='Search radiology procedure name' class='form-control' maxlength='330' id='itemCode1' disabled='disabled' value='" + msg + "'>";

        $.ajax({
            url: "OrderDetailInfo.jsp",
            type: "post",
            data: {itemCd: msg,
                orderNo: order
            },
            timeout: 3000,
            success: function (itemCd1) {
                $('#itemCD').html(itemCd1);
                $('#itemCD').trigger('contentchanged');
                //$('.nav-tabs a[href="#tab_default_2"]').tab('show');
            }
        });
    }


//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//


    // Move to Order Details Fetch Details Start
    $('#OrderMaster').off('click', '#risManageOrderListTable #moveToRISOrderDetailsTButton').on('click', '#risManageOrderListTable #moveToRISOrderDetailsTButton', function (e) {

        e.preventDefault();

        var row = $(this).closest("tr");
        var rowData = row.find("#dataRISOrderListhidden").val();
        var arrayData = rowData.split("|");
        console.log(arrayData);

        //Assign Array into seprated val
        var pmino = arrayData[1];
        var Name = arrayData[13];
        var nic = arrayData[14];
        var Gender = arrayData[19];
        var Bdate = arrayData[15];
        var Btype = arrayData[20];
        var OrderNo = arrayData[0];
        var OrderDate = arrayData[5];
        var OrderLocationCode = arrayData[2];

        //alert(pmino+" "+OrderNo);
        //Set value to the Second Tab 
        $("#patientpmino").val(pmino);
        $("#patientName").val(Name);
        $("#patientnic").val(nic);
        $("#patientGender").val(Gender);
        $("#patientBdate").val(Bdate);
        $("#patientBtype").val(Btype);
        $("#patientOrderNo").val(OrderNo);
        $("#patientOrderDate").val(OrderDate);
        $("#patientOrderLocationCode").val(OrderLocationCode);

        loadAllergyDiagnosisOrder(OrderNo, pmino);

        $("#btnAdd").click(function () {
            var order = $("#patientOrderNo").val();
            var itemCD = $("#itemCode1").val();
            var pmiNo = pmino;
            var Comment = $("#requestComment").val();
            var episodeDate = OrderDate;
            var itemName = $("#RNO_bodySystem").val();
            //alert(itemName);
            //alert(Comment);
            if (itemName == "NoItem")
            {
                bootbox.alert("Please select the item name.");
            } else
            {
                $.ajax({
                    url: "addOrder.jsp",
                    type: "post",
                    data: {
                        order: order,
                        pmiNo: pmiNo,
                        itemCD: itemCD,
                        Comment: Comment,
                        episodeDate: episodeDate
                    },
                    timeout: 10000,
                    success: function (returnOrderHTML) {
                        var dataOrder = {
                            orderNo: order,
                            pmino: pmiNo
                        };
                        $.ajax({
                            url: "ManageOrderListDetails.jsp",
                            type: "post",
                            data: dataOrder,
                            timeout: 3000,
                            success: function (returnOrderDetailsTableHTML) {
                                $('#ManageOrderDetailsListTable').html(returnOrderDetailsTableHTML);
                                $('#ManageOrderDetailsListTable').trigger('contentchanged');
                                $('.nav-tabs a[href="#tab_default_2"]').tab('show');
                                $('#NewRequest').modal('toggle');
                                $("#NewRequest").hide();
                                $(".modal-backdrop").hide();
                                bootbox.alert("New item successfully added.");
                                
                                $('#RNO_bodySystem').val("NoItem");
                                $('#itemCode1').val("-");
                                $('#spe_container').val("-");
                                $('#volume').val("-");
                                $('#special_inst').val("-");
                                $('#spe_source').val("-");
                                $('#requestComment').val("-");
                            }
                        });


                    },
                    error: function (err) {
                        bootbox.alert("Error update!");
                    }
                });
            }
        });
    });
    // Move to Order Details Fetch Details End

    // Move to Order Details And Load All Table Data Start
    function loadAllergyDiagnosisOrder(orderNo, pmino, episodeDate) {

        var dataDiagnosis = {
            pmino: pmino
        };

        var dataAllergy = {
            pmino: pmino
        };

        var dataOrder = {
            orderNo: orderNo,
            pmino: pmino,
            episodeDate: episodeDate
        };


        $.ajax({
            url: "ManageOrderListAllergyTable.jsp",
            type: "post",
            data: dataAllergy,
            timeout: 3000,
            success: function (returnAllergyTableHTML) {
                console.log(returnAllergyTableHTML);
                $('#ManageAllergyListTable').html(returnAllergyTableHTML);

                $.ajax({
                    url: "ManageOrderListDiagnosisTable.jsp",
                    type: "post",
                    data: dataDiagnosis,
                    timeout: 3000,
                    success: function (returnDiagnosisTableHTML) {
                        console.log(returnDiagnosisTableHTML);
                        $('#ManageDiagnosisListTable').html(returnDiagnosisTableHTML);

                        $.ajax({
                            url: "ManageOrderListDetails.jsp",
                            type: "post",
                            data: dataOrder,
                            timeout: 3000,
                            success: function (returnOrderDetailsTableHTML) {
                                $('#ManageOrderDetailsListTable').html(returnOrderDetailsTableHTML);
                                $('#ManageOrderDetailsListTable').trigger('contentchanged');
                                $('.nav-tabs a[href="#tab_default_2"]').tab('show');
                            }
                        });

                    }
                });

            }
        });

    }
    // Move to Order Details And Load All Table Data End


    // Load Datatable To Tables Start
    $(document).on('contentchanged', '#patientOrderDetailsListTableDiv', function () {

        $('#ManageOrderDetailsListTable').DataTable().destroy();

        // do something after the div content has changed
        $('#ManageOrderDetailsListTable').DataTable({
            "paging": false,
            "searching": false,
            "info": false,
            "language": {
                "emptyTable": "No Request Available To Display"
            }
        });

    });
</script>