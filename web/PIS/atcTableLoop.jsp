<%-- 
    Document   : atcTable
    Created on : Jan 24, 2017, 12:33:56 PM
    Author     : Shammugam
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%
    Conn conn = new Conn();
%>


<table  id="atcTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <th style="text-align: center;">ATC CODE</th>
    <th style="text-align: center;">ATC CODE DESCRIPTION</th>
    <th style="text-align: center;">CATEGORY CODE</th>
    <th style="text-align: center;">HFC CODE</th>
    <th style="text-align: center;">DISCIPLINE CODE</th>
    <th style="text-align: center;">SUBDISCIPLINE CODE</th>
    <th style="text-align: center;">STATUS</th>
    <th style="text-align: center;">UPDATE</th>
    <th style="text-align: center;">DELETE</th>
</thead>
<tbody>

    <%
        String sql = " SELECT UD_ATC_Code, UD_ATC_Desc, Category_Code,hfc_cd,discipline_cd,subdiscipline_cd,Status FROM pis_atc ";
        ArrayList<ArrayList<String>> dataATC = conn.getData(sql);

        int size = dataATC.size();
        for (int i = 0; i < size; i++) {
    %>

    <tr style="text-align: center;">
<input id="dataATChidden" type="hidden" value="<%=String.join("|", dataATC.get(i))%>">
<td><%= dataATC.get(i).get(0)%></td>
<td><%= dataATC.get(i).get(1)%></td>
<td><%= dataATC.get(i).get(2)%></td>
<td><%= dataATC.get(i).get(3)%></td>
<td><%= dataATC.get(i).get(4)%></td>
<td><%= dataATC.get(i).get(5)%></td>
<td><%if (dataATC.get(i).get(6).equals("1")) {
        out.print("Active");
    } else {
        out.print("Inactive");
    } %></td> <!--status 3 --> 
<td>
    <!-- Update Part Start -->
    <a id="updateTButton" data-toggle="modal" data-target="#atcUpdateModal"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
    <!-- Update Part End -->
</td>
<td>
    <!-- Delete Button Start -->
    <a id="deleteTButton" class="testing"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;" ></i></a>
    <!-- Delete Button End -->
</td>
</tr>
<%
    }
%>
</tbody>
</table>


<!-- Modal Update -->
<div class="modal fade" id="atcUpdateModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h2 class="modal-title" id="lineModalLabel" align="center">Update ATC Code Details</h2>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal" autocomplete="off" id="atcUpdateForm">

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">ATC Code</label>
                        <div class="col-md-8">
                            <input id="updateatcCode" type="text" placeholder="ATC Code" class="form-control input-md" maxlength="15" readonly>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">ATC Description</label>
                        <div class="col-md-8">
                            <textarea id="updateatcDesc" class="form-control" rows="4" placeholder="ATC Description" maxlength="200" ></textarea>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Category Code</label>
                        <div class="col-md-8">
                            <input id="updateatccategory" type="text" placeholder="Category Code" maxlength="50" class="form-control input-md" >
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">HFC Code</label>
                        <div class="col-md-8">
                            <input id="updateatchfc" type="text" placeholder="HFC Code" maxlength="30" class="form-control input-md" >
                            <div id="updateatcHFCSearch">
                                <!--for search area-->
                            </div>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Discipline Code</label>
                        <div class="col-md-8">
                            <input id="updateatcdiscipline" type="text" placeholder="Discipline Code" maxlength="30" class="form-control input-md" >
                            <div id="updateatcDisciplineSearch">
                                <!--for search area-->
                            </div>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Sub-Discipline Code</label>
                        <div class="col-md-8">
                            <input id="updateatcsubdiscipline" type="text" placeholder="Sub-Discipline Code" maxlength="30" class="form-control input-md" >
                            <div id="updateatcSubDisciplineSearch">
                                <!--for search area-->
                            </div>
                        </div>
                    </div>


                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Status</label>
                        <div class="col-md-8">
                            <select class="form-control" name="tstatus" id="updatestatus">
                                <option value="1" >Active</option>
                                <option value="0" >Inactive</option>
                            </select>
                        </div>
                    </div>
                </form>
                <!-- content goes here -->
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="updateModalButton">Update</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="reset" id="updateResetButton" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Modal Update -->

<script type="text/javascript" >


    // Getting Data Part Start
    $('#contentATCTable').off('click', '#atcTable #updateTButton').on('click', '#atcTable #updateTButton', function (e) {
        e.preventDefault();

        //get the row value
        var row = $(this).closest("tr");
        var rowData = row.find("#dataATChidden").val();

        var arrayData = rowData.split("|");

        //assign into seprated val
        var atcCode = arrayData[0];
        var atcDesc = arrayData[1];
        var category = arrayData[2];
        var hfc = arrayData[3];
        var discipline = arrayData[4];
        var subdiscipline = arrayData[5];
        var status = arrayData[6];

        //set value to the modal 
        $("#updateatcCode").val(atcCode);
        $("#updateatcDesc").val(atcDesc);
        $("#updateatccategory").val(category);
        $("#updateatchfc").val(hfc);
        $("#updateatcdiscipline").val(discipline);
        $("#updateatcsubdiscipline").val(subdiscipline);

        if (status === '1')
            $('#updatestatus').val(1);
        else
            $('#updatestatus').val(0);

    });
    // Getting Data Part End


    // Search HFC Function Start
    $("#updateatchfc").on('keyup', function () { // everytime keyup event
        var input = $(this).val(); // We take the input value

        if (input.length >= 1) { // Minimum characters = 2 (you can change)
            $('#updateatcHFCSearch').html('<img src="libraries/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
            var dataFields = {input: input}; // We pass input argument in Ajax
            $.ajax({
                type: "POST",
                url: "atcSearchHFC.jsp", // call the php file ajax/tuto-autocomplete.php
                data: dataFields, // Send dataFields var
                timeout: 3000,
                success: function (dataBack) { // If success
                    $('#updateatcHFCSearch').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                    $('#matchListHFC li').on('click', function () { // When click on an element in the list
                        //$('#masterCode2').text($(this).text()); // Update the field with the new element
                        $('#updateatchfc').val($(this).text());
                        $('#updateatcHFCSearch').text(''); // Clear the <div id="match"></div>
                        var arrayData = $('#updateatchfc').val().split("|");
                        console.log(arrayData);
                        console.log(arrayData[0].trim());
                        console.log(arrayData[1].trim());
                    });
                },
                error: function () { // if error
                    $('#updateatcHFCSearch').text('Problem!');
                }
            });
        } else {
            $('#updateatcHFCSearch').text(''); // If less than 2 characters, clear the <div id="match"></div>
        }

    });
    // Search FHC Function End


    // Search Discipline Function Start
    $("#updateatcdiscipline").on('keyup', function () { // everytime keyup event
        var input = $(this).val(); // We take the input value
        var hfc = $('#updateatchfc').val();

        if (hfc === "" || hfc === null) {
            $('#updateatchfc').val("");
            bootbox.alert("Please Search For HFC Code Before Proceeding");
        } else {
            if (input.length >= 1) { // Minimum characters = 2 (you can change)
                $('#updateatcDisciplineSearch').html('<img src="libraries/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
                var dataFields = {input: input}; // We pass input argument in Ajax
                $.ajax({
                    type: "POST",
                    url: "atcSearchDiscipline.jsp", // call the php file ajax/tuto-autocomplete.php
                    data: dataFields, // Send dataFields var
                    timeout: 3000,
                    success: function (dataBack) { // If success
                        $('#updateatcDisciplineSearch').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                        $('#matchListDis li').on('click', function () { // When click on an element in the list
                            //$('#masterCode2').text($(this).text()); // Update the field with the new element
                            $('#updateatcdiscipline').val($(this).text());
                            $('#updateatcDisciplineSearch').text(''); // Clear the <div id="match"></div>
                            var arrayData = $('#updateatcdiscipline').val().split("|");
                            console.log(arrayData);
                            console.log(arrayData[0].trim());
                            console.log(arrayData[1].trim());
                        });
                    },
                    error: function () { // if error
                        $('#updateatcDisciplineSearch').text('Problem!');
                    }
                });
            } else {
                $('#updateatcDisciplineSearch').text(''); // If less than 2 characters, clear the <div id="match"></div>
            }
        }
    });
    // Search Sub Discipline Function End


    // Search Sub Discipline Function Start
    $("#updateatcsubdiscipline").on('keyup', function () { // everytime keyup event
        var input = $(this).val(); // We take the input value

        var hfc = $('#updateatchfc').val();
        var discipline = $('#updateatcdiscipline').val();

        if (hfc === "" || hfc === null) {
            $('#updateatcsubdiscipline').val("");
            bootbox.alert("Please Search For HFC Code Before Proceeding");
        } else if (discipline === "" || discipline === null) {
            $('#updateatcsubdiscipline').val("");
            bootbox.alert("Please Search For Discipline Code Before Proceeding");
        } else {
            if (input.length >= 1) { // Minimum characters = 2 (you can change)
                $('#updateatcSubDisciplineSearch').html('<img src="libraries/LoaderIcon.gif"/>'); // Loader icon apprears in the <div id="match"></div>
                var dataFields = {input: input}; // We pass input argument in Ajax
                $.ajax({
                    type: "POST",
                    url: "atcSearchSubDiscipline.jsp", // call the php file ajax/tuto-autocomplete.php
                    data: dataFields, // Send dataFields var
                    timeout: 3000,
                    success: function (dataBack) { // If success
                        $('#updateatcSubDisciplineSearch').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                        $('#matchListSubDis li').on('click', function () { // When click on an element in the list
                            //$('#masterCode2').text($(this).text()); // Update the field with the new element
                            $('#updateatcsubdiscipline').val($(this).text());
                            $('#updateatcSubDisciplineSearch').text(''); // Clear the <div id="match"></div>
                            var arrayData = $('#updateatcsubdiscipline').val().split("|");
                            console.log(arrayData);
                            console.log(arrayData[0].trim());
                            console.log(arrayData[1].trim());
                        });
                    },
                    error: function () { // if error
                        $('#updateatcSubDisciplineSearch').text('Problem!');
                    }
                });
            } else {
                $('#updateatcSubDisciplineSearch').text(''); // If less than 2 characters, clear the <div id="match"></div>
            }
        }
    });
    // Search Sub Discipline Function End


    // Update Data Part Start
    $("#updateModalButton").off('click').on('click', function (e) {

        e.preventDefault();

        var atcCodeCheck = document.getElementById("updateatcCode");
        var atcDescCheck = document.getElementById("updateatcDesc");
        var categoryCheck = document.getElementById("updateatccategory");
        var hfcCheck = document.getElementById("updateatchfc");
        var disciplineCheck = document.getElementById("updateatcdiscipline");
        var subdisciplineCheck = document.getElementById("updateatcsubdiscipline");

        var atcCode = $("#updateatcCode").val();
        var atcDesc = $("#updateatcDesc").val();
        var category = $("#updateatccategory").val();
        var hfc = $("#updateatchfc").val();
        var discipline = $("#updateatcdiscipline").val();
        var subdiscipline = $("#updateatcsubdiscipline").val();
        var status = $("#updatestatus").val();

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

            var arrayDataHFC = $('#updateatchfc').val().split("|");
            var arrayDataDiscipline = $('#updateatcdiscipline').val().split("|");
            var arrayDataSubDiscipline = $('#updateatcsubdiscipline').val().split("|");

            hfc = arrayDataHFC[0].trim();
            discipline = arrayDataDiscipline[0].trim();
            subdiscipline = arrayDataSubDiscipline[0].trim();

            var data = {
                atcCode: atcCode,
                atcDesc: atcDesc,
                category: category,
                hfc: hfc,
                discipline: discipline,
                subdiscipline: subdiscipline,
                status: status
            };

            $.ajax({
                url: "atcUpdate.jsp",
                type: "post",
                data: data,
                timeout: 10000,
                success: function (datas) {
                    if (datas.trim() === 'Success') {
                        $('#contentATCTable').load('atcTableLoop.jsp');
                        $(".modal-backdrop").hide();
                        bootbox.alert({
                            message: "ATC Code is Updated Successful",
                            title: "Process Result",
                            backdrop: true
                        });
                    } else if (datas.trim() === 'Failed') {
                        bootbox.alert({
                            message: "ATC Code Update Failed",
                            title: "Process Result",
                            backdrop: true
                        });

                    }
                },
                error: function (err) {
                    alert("Error update!");
                }

            });

        }
    });
    // Update Data Part End


    // Delete Data Part Start
    $('#contentATCTable').off('click', '#atcTable #deleteTButton').on('click', '#atcTable #deleteTButton', function (e) {

        e.preventDefault();

        var row = $(this).closest("tr");
        var rowData = row.find("#dataATChidden").val();
        var arrayData = rowData.split("|");

        //assign into seprated val
        var iditem = arrayData[0];

        bootbox.confirm({
            message: "Are you sure want to delete this item?",
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
                    var data = {
                        iditem: iditem
                    };

                    $.ajax({
                        url: "atcDelete.jsp",
                        type: "post",
                        data: data,
                        timeout: 10000, // 10 seconds
                        success: function (datas) {

                            if (datas.trim() === 'Success') {
                                $('#contentATCTable').load('atcTableLoop.jsp');
                                bootbox.alert({
                                    message: "ATC Code is Deleted Successful",
                                    title: "Process Result",
                                    backdrop: true
                                });
                            } else if (datas.trim() === 'Failed') {
                                bootbox.alert({
                                    message: "ATC Code Delete Failed",
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
    // Delete Data Part End


    // Reset Data Part Start
    $("#updateResetButton").off('click').on('click', function (e) {
        document.getElementById("atcUpdateForm").reset();
    });
    // Reset Data Part End


</script>



<script type="text/javascript" charset="utf-8">

    $(document).ready(function () {

        $('#atcTable').DataTable({
            pageLength: 15,
            dom: 'Bfrtip',
            buttons: [
                {
                    extend: 'excelHtml5',
                    text: 'Export To Excel',
                    title: 'ATC Data Export'
                }, {
                    extend: 'csvHtml5',
                    text: 'Export To Excel CSV',
                    title: 'ATC Data Export'
                }
            ]
        });

    });

</script>

