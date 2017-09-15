<%-- 
    Document   : atcMain
    Created on : Jan 25, 2017, 9:59:32 AM
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
%>


<!-- Add Part Start -->
<!-- Add Button Start -->
<h4 style="padding-top: 30px;padding-bottom: 35px; font-weight: bold">
    ATC MEDICINE MANAGEMENT
    <span class="pull-right">
        <button id="addATCTriggerHFC" class="btn btn-success" data-status="pagado" data-toggle="modal" data-id="1" data-target="#detail" style=" padding-right: 10px;padding-left: 10px;color: white;"><a data-toggle="tooltip" data-placement="top" title="Add Items" id="test"><i class=" fa fa-plus" style=" padding-right: 10px;padding-left: 10px;color: white;"></i></a>ADD ATC</button>
        <button id="ATCClone_btnClone" class="btn btn-primary" data-status="pagado" data-toggle="modal" data-id="1" data-target="#atcCloneModal" style=" padding-right: 10px;padding-left: 10px;color: white;"><a data-toggle="tooltip" data-placement="top" title="Add Items"><i class=" fa fa-copy" style=" padding-right: 10px;padding-left: 10px;color: white;"></i></a>CLONE ATC CODE</button>
    </span>
</h4>
<!-- Add Button End -->


<!-- Add Modal Start -->
<div class="modal fade" id="detail" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h2 class="modal-title" id="lineModalLabel" align="center">Add New ATC Code</h2>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal" id="addForm" autocomplete="off">

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">ATC Code *</label>
                        <div class="col-md-8">
                            <input id="atcCode" name="atcCode" type="text" placeholder="Insert ATC Code" class="form-control input-md" maxlength="15" required>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">ATC Description *</label>
                        <div class="col-md-8">
                            <textarea id="atcDesc" name="atcDesc" class="form-control" rows="4" placeholder="Insert ATC Description" maxlength="200" required></textarea>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Category Code *</label>
                        <div class="col-md-8">
                            <input id="category" name="category" type="text" placeholder="Insert Category Code" class="form-control input-md" maxlength="50" required>
                        </div>
                    </div>


                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">HFC Code *</label>
                        <div class="col-md-8">
                            <input id="hfcFromSession" type="hidden" maxlength="30" class="form-control input-md" value="<%= hfc%>" readonly>
                            <input id="hfc" type="text" placeholder="Insert HFC Code" maxlength="30" value="<%= hfc%>" class="form-control input-md" readonly>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Discipline Code *</label>
                        <div class="col-md-8">
                            <input id="discipline" type="text" placeholder="Insert Discipline Code" value="<%= dis%>" maxlength="30" class="form-control input-md" readonly>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Sub-Discipline Code *</label>
                        <div class="col-md-8">
                            <input id="subdiscipline" type="text" placeholder="Insert Sub-Discipline Code" maxlength="30" value="<%= subdis%>" class="form-control input-md" readonly>
                        </div>
                    </div>


                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Status  *</label>
                        <div class="col-md-8">
                            <label class="radio-inline">
                                <input type="radio" name="status" id="status1" value="1">
                                Active 
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="status" id="status2" value="0">
                                Inactive
                            </label>
                        </div>
                    </div>


                </form>
                <!-- content goes here -->
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="addButton">Add</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="reset" id="addReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button" >Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Add Modal End -->                         
<!-- Add Part End -->


<!-- Clone Modal Start -->
<div class="modal fade" id="atcCloneModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 50%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h2 class="modal-title" id="lineModalLabel" align="center">Clone ATC Code</h2>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form style="width: 100%; margin: 0 auto;" id="atcClone_addForm" autocomplete="off">

                    <!-- Text input-->
                    <div class="form-group">


                        <div style="align-items: center; text-align: center">
                            <br>
                            <label>Select ATC Drug To Be Cloned</label>
                            <br><br>
                            <span>
                                <a href="#" class="btn btn-default" id="ATC_Code_selectAll">&nbsp; Select all &nbsp;</a>
                                &nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;
                                <a href="#" class="btn btn-default" id="ATC_Code_deselectAll">Deselect all</a>
                            </span>
                            <br><br>
                            <div>
                                <select id="ATC_DrugCode" multiple="multiple"></select>
                            </div>    
                        </div>
                    </div>


                </form>
                <!-- content goes here -->
            </div>
            <div class="modal-footer">
                <button class="btn btn-primary btn-block" type="button" id="ATC_btnClone"><i class=" fa fa-check"></i> Clone</button>
            </div>
        </div>
    </div>
</div>
<!-- Clone Modal End -->   


<script>


    $(document).ready(function () {


        // Add Function Start
        $('#addButton').on('click', function () {

            var atcCodeCheck = document.getElementById("atcCode");
            var atcDescCheck = document.getElementById("atcDesc");
            var categoryCheck = document.getElementById("category");
            var hfcCheck = document.getElementById("hfc");
            var disciplineCheck = document.getElementById("discipline");
            var subdisciplineCheck = document.getElementById("subdiscipline");

            var atcCode = $('#atcCode').val();
            var atcDesc = $('#atcDesc').val();
            var category = $('#category').val();
            var hfc = $('#hfc').val();
            var discipline = $('#discipline').val();
            var subdiscipline = $('#subdiscipline').val();
            var status = $('input[name="status"]:checked').val();

            if (atcCode === "" || atcCode === null) {
                bootbox.alert("Please Insert ATC Code Name");
            } else if (atcCodeCheck.checkValidity() === false) {
                bootbox.alert("Please Insert ATC Code Name That Is Not More Than 15 Characters");
            } else if (atcDesc === "" || atcDesc === null) {
                bootbox.alert("Please Insert ATC Code Description");
            } else if (atcDescCheck.checkValidity() === false) {
                bootbox.alert("Please Insert ATC Code Description Name That Is Not More Than 200 Characters");
            } else if (category === "" || category === null) {
                bootbox.alert("Please Insert ATC Code Category");
            } else if (categoryCheck.checkValidity() === false) {
                bootbox.alert("Please Insert ATC Code Category Name That Is Not More Than 50 Characters");
            } else if (hfc === "" || hfc === null) {
                bootbox.alert("Please Search ATC HFC Code");
            } else if (hfcCheck.checkValidity() === false) {
                bootbox.alert("Please Select ATC HFC Code That Is Not More Than 30 Characters");
            } else if (discipline === "" || discipline === null) {
                bootbox.alert("Please Search ATC Discipline Code");
            } else if (disciplineCheck.checkValidity() === false) {
                bootbox.alert("Please Select ATC Discipine Code Name That Is Not More Than 30 Characters");
            } else if (subdiscipline === "" || subdiscipline === null) {
                bootbox.alert("Please Search ATC Sub-Discipline Code");
            } else if (subdisciplineCheck.checkValidity() === false) {
                bootbox.alert("Please Select ATC Sub-Discipline Code Name That Is Not More Than 30 Characters");
            } else if (status !== "1" && status !== "0") {
                bootbox.alert("Please Select Any Status");
            } else {

                var data = {
                    atcCode: atcCode,
                    atcDesc: atcDesc,
                    category: category,
                    hfc: hfc,
                    discipline: discipline,
                    subdiscipline: subdiscipline,
                    status: status
                };

                console.log(data);

                $.ajax({
                    url: "controllerProcess/atcInsert.jsp",
                    type: "post",
                    data: data,
                    timeout: 10000,
                    success: function (datas) {

                        if (datas.trim() === 'Success') {

                            $('#contentATCTable').load('atcTableLoop.jsp');
                            $('#detail').modal('hide');
                            bootbox.alert({
                                message: "ATC Code is Added Successful",
                                title: "Process Result",
                                backdrop: true
                            });
                            reset();

                        } else if (datas.trim() === 'Duplicate') {

                            bootbox.alert({
                                message: "ATC Code Duplication Detected. Please use diffrerent ATC code",
                                title: "Process Result",
                                backdrop: true
                            });

                        } else if (datas.trim() === 'Failed') {

                            bootbox.alert({
                                message: "ATC Code Add Failed",
                                title: "Process Result",
                                backdrop: true
                            });
                            $('#detail').modal('hide');
                            reset();

                        }

                    },
                    error: function (err) {
                        //console.log("Ajax Is Not Success");
                    }

                });
            }

        });
        // Add Function End


        // Reset Button Function Start
        $('#addReset').on('click', function () {
            reset();
        });
        // Reset Button Function End


        // Reset Function Start
        function reset() {
            document.getElementById("atcCode").value = "";
            document.getElementById("atcDesc").value = "";
            document.getElementById("category").value = "";
            document.getElementById("status1").checked = false;
            document.getElementById("status2").checked = false;
        }
        // Reset Function End


        // Clone ATC Function Start

        var User_hfcCode = "<%= hfc%>";
        var User_disCode = "<%= dis%>";

        // Clone ATC Button Click Function Start
        $('#ATCClone_btnClone').on('click', function () {
            ATCCloneReset();
            createATCCodeList();
        });
        // Clone ATC Button Click Function End


        // Clone ATC Reset Function Start
        function ATCCloneReset() {
            document.getElementById("atcClone_addForm").reset();
        }
        // Clone ATC Reset Function End


        // Clone ATC Create List Function Start
        function createATCCodeList() {

            var data = {
                hfc: User_hfcCode,
                dis: User_disCode
            };

            $('#ATC_DrugCode').multiSelect('destroy');
            $('<div class="loading">Loading</div>').appendTo('#atcCloneModal');

            $.ajax({
                type: 'POST',
                url: "controllerSearch/atcCloneDrugList.jsp",
                data: data,
                success: function (data, textStatus, jqXHR) {

                    $('#ATC_DrugCode').html(data);
                    $('#ATC_DrugCode').multiSelect({
                        selectableHeader: "<div style='display:block; color:white; background-color:#2196f3; '>Selectable ATC Code</div>",
                        selectionHeader: "<div style='display:block; color:white; background-color:#2196f3'>Selected ATC Code</div>",
                        keepOrder: true
                    });

                },
                error: function (jqXHR, textStatus, errorThrown) {
                    bootbox.alert("Opps! " + errorThrown);
                },
                complete: function (jqXHR, textStatus) {
                    $('.loading').hide();
                }
            });

        }
        // Clone MDC Create List Function End


        // Clone MDC Clone Function Start
        $('#ATC_btnClone').on('click', function () {

            var arraySelect = [];
            $("#ATC_DrugCode option:selected").each(function () {
                arraySelect.push($(this));
            });

            var strATCClone = arraySelect.map(function (elem) {
                return elem.val();
            }).join("|");

            console.log(strATCClone);

            if (strATCClone === "") {
                bootbox.alert("Select at least one MDC Medcine to be cloned");
            } else {
                $('<div class="loading">Loading</div>').appendTo('#atcCloneModal');

                var data = {
                    strATCClone: strATCClone
                };

                $.ajax({
                    url: "controllerProcess/atcCloneDrugListInsert.jsp",
                    type: "post",
                    data: data,
                    timeout: 15000,
                    success: function (datas) {
                        console.log(datas.trim());
                        if (datas.trim() === 'Success') {

                            $("#contentATCTable").load("atcTableLoop.jsp");
                            $('#atcCloneModal').modal('hide');

                            bootbox.alert({
                                message: "ATC Medcine is successfully cloned",
                                title: "Process Result",
                                backdrop: true
                            });
                            ATCCloneReset();

                        } else if (datas.trim() === 'Failed') {

                            bootbox.alert("Insertion failed!");
                            ATCCloneReset();

                        } else {

                            bootbox.alert(datas.trim());
                            $('#ATC_DrugCode').val("");

                        }

                    },
                    error: function (err) {
                        console.log("Ajax Is Not Success");
                    },
                    complete: function (jqXHR, textStatus) {
                        $('.loading').hide();
                    }

                });
            }

        });
        // Clone MDC Clone Function End


        // Clone MDC Select All Function Start
        $('#ATC_Code_selectAll').on('click', function (e) {
            e.preventDefault();
            $('#ATC_DrugCode').multiSelect('select_all');
            return false;
        });
        // Clone MDC Select All Function End


        // Clone MDC Un-Select All Function Start
        $('#ATC_Code_deselectAll').on('click', function (e) {
            e.preventDefault();
            $('#ATC_DrugCode').multiSelect('deselect_all');
            return false;
        });
        // Clone MDC Un-Select All Function End

        // Clone MDC Function End


    });



</script>

