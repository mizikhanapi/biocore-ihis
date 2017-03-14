<%-- 
    Document   : atcTable
    Created on : Jan 25, 2017, 12:33:56 PM
    Author     : Shammugam
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>



<%
    Conn conn = new Conn();
%>


<table  id="supplierTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <th style="text-align: center;">ID</th>
    <th style="text-align: center;">NAME</th>
    <th style="text-align: center;">OFFICE NO.</th>
    <th style="text-align: center;">EMAIL</th>
    <th style="display: none">MOBILE NO</th>
    <th style="display: none">FAX NO</th>
    <th style="display: none">ADDRESS 1</th>
    <th style="display: none">ADDRESS 2</th>
    <th style="display: none">ADDRESS 3</th>
    <th style="display: none">DISTRICT CODE</th>
    <th style="display: none">TOWN CODE</th>
    <th style="display: none">POSTCODE</th>
    <th style="display: none">STATE CODE</th>
    <th style="display: none">COUNTRY CODE</th>
    <th style="text-align: center;">Update</th>
    <th style="text-align: center;">Delete</th>
</thead>
<tbody>

    <%
        String sql = " SELECT Supplier_ID, Supplier_Name,Office_Tel_No,IFNULL(Email,''),IFNULL(Mobile_No,''),IFNULL(Fax_No,''),IFNULL(ADDRESS1,''),IFNULL(ADDRESS2,''),"
                + "IFNULL(ADDRESS3,''),IFNULL(DISTRICT_CODE,''),IFNULL(TOWN_CODE,''),IFNULL(POSTCODE,''),IFNULL(STATE_CODE,''),IFNULL(COUNTRY_CODE,'') FROM pis_supplier_info";
        ArrayList<ArrayList<String>> dataSupplier = conn.getData(sql);

        int size = dataSupplier.size();
        for (int i = 0; i < size; i++) {
    %>

    <tr style="text-align: center;">
<input id="dataSupplierhidden" type="hidden" value="<%=String.join("|", dataSupplier.get(i))%>">
<td><%= dataSupplier.get(i).get(0)%></td>
<td><%= dataSupplier.get(i).get(1)%></td>
<td><%= dataSupplier.get(i).get(2)%></td>
<td><%= dataSupplier.get(i).get(3)%></td>
<td style="display: none"><%= dataSupplier.get(i).get(4)%></td>
<td style="display: none"><%= dataSupplier.get(i).get(5)%></td>
<td style="display: none"><%= dataSupplier.get(i).get(6)%></td>
<td style="display: none"><%= dataSupplier.get(i).get(7)%></td>
<td style="display: none"><%= dataSupplier.get(i).get(8)%></td>
<td style="display: none"><%= dataSupplier.get(i).get(9)%></td>
<td style="display: none"><%= dataSupplier.get(i).get(10)%></td>
<td style="display: none"><%= dataSupplier.get(i).get(11)%></td>
<td style="display: none"><%= dataSupplier.get(i).get(12)%></td>
<td style="display: none"><%= dataSupplier.get(i).get(13)%></td>
<td>
    <!-- Update Part Start -->
    <a id="supplierUpdateTButton" data-toggle="modal" data-target="#supplierUpdateModal"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
    <!-- Update Part End -->
</td>
<td>
    <!-- Delete Button Start -->
    <a id="supllierDeleteTButton" class="testing"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f; width: " ></i></a>
    <!-- Delete Button End -->
</td>
</tr>
<%
    }
%>
</tbody>
</table>



<!-- Modal Update Supplier New Start -->
<div class="modal fade" id="supplierUpdateModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog"  style="width:50%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Update Supplier</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal" >
                    <div class="row">
                        <div class="col-md-6">

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Supplier ID &nbsp; *</label>
                                <div class="col-md-8">
                                    <input id="updateSupplier_ID" type="text" class="form-control" placeholder="Please Insert Supplier ID" readonly maxlength="10">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Supplier Name &nbsp; *</label>
                                <div class="col-md-8">
                                    <input id="updateSupplier_Name" type="text" class="form-control" placeholder="Please Insert Supplier NAME" maxlength="100">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Office No &nbsp; *</label>
                                <div class="col-md-8">
                                    <input id="updateOffice_Tel_No" type="text" class="form-control" placeholder="Please Insert Office No" pattern="[0-9]{9,11}"  maxlength="30">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Email &nbsp; *</label>
                                <div class="col-md-8">
                                    <input id="updateEmail" type="email" class="form-control" placeholder="Please Insert Email" maxlength="30">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Address 1</label>
                                <div class="col-md-8">
                                    <input id="updateADDRESS1" type="text" class="form-control" placeholder="Please Insert Address 1 (Optional)" maxlength="100">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Address 2</label>
                                <div class="col-md-8">
                                    <input id="updateADDRESS2" type="text" class="form-control" placeholder="Please Insert Address 2 (Optional)" maxlength="100">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Address 3</label>
                                <div class="col-md-8">
                                    <input id="updateADDRESS3" type="text" class="form-control" placeholder="Please Insert Address 3 (Optional)" maxlength="100">
                                </div>
                            </div>


                        </div>

                        <div class="col-md-6">

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Country Code</label>
                                <div class="col-md-8">
                                    <input id="updateCOUNTRY_CODE" type="text" class="form-control" placeholder="Please Search Country Code (Optional)" maxlength="10">
                                    <div id="updateCOUNTRY_CODESearch">
                                        <!--for search area-->
                                    </div>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">State Code</label>
                                <div class="col-md-8">
                                    <input id="updateSTATE_CODE" type="text" class="form-control" placeholder="Please Search State Code (Optional)" maxlength="10">
                                    <div id="updateSTATE_CODESearch">
                                        <!--for search area-->
                                    </div>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">District Code</label>
                                <div class="col-md-8">
                                    <input id="updateDISTRICT_CODE" type="text" class="form-control" placeholder="Please Search District Code (Optional)" maxlength="10">
                                    <div id="updateDISTRICT_CODESearch">
                                        <!--for search area-->
                                    </div>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Town Code</label>
                                <div class="col-md-8">
                                    <input id="updateTOWN_CODE" type="text" class="form-control" placeholder="Please Search Town Code (Optional)" maxlength="10">
                                    <div id="updateTOWN_CODESearch">
                                        <!--for search area-->
                                    </div>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Postcode</label>
                                <div class="col-md-8">
                                    <input id="updatePOSTCODE" type="number" class="form-control" placeholder="Please Search Postcode (Optional)" maxlength="10">
                                    <div id="updatePOSTCODESearch">
                                        <!--for search area-->
                                    </div>
                                </div>
                            </div>


                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Mobile No</label>
                                <div class="col-md-8">
                                    <input id="updateMobile_No" type="text" class="form-control" placeholder="Please Insert Mobile No (Optional)" pattern="[0-9]{9,11}" maxlength="15">
                                </div>
                            </div>


                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Fax No</label>
                                <div class="col-md-8">
                                    <input id="updateFax_No" type="text" class="form-control" placeholder="Please Insert Fax No (Optional)" pattern="[0-9]{9,11}" maxlength="15">
                                </div>
                            </div>

                        </div>

                    </div>
                </form>
                <!-- content goes here -->
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="submit" id="updateSupplierModalButton" class="btn btn-success btn-block btn-lg" role="button">Update</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="updateSupplierReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Clear</button>
                    </div>
                </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Modal Update Supplier New End -->



<script type="text/javascript" charset="utf-8">

    $(document).ready(function () {


        // Supplier Get Data For Update Start
        $('#contentSupplierTable').off('click', '#supplierTable #supplierUpdateTButton').on('click', '#supplierTable #supplierUpdateTButton', function (e) {
            e.preventDefault();

            //get the row value
            var row = $(this).closest("tr");
            var rowData = row.find("#dataSupplierhidden").val();

            var arrayData = rowData.split("|");
            console.log(arrayData);

            var Supplier_ID = arrayData[0];
            var Supplier_Name = arrayData[1];
            var Office_Tel_No = arrayData[2];
            var Email = arrayData[3];
            var ADDRESS1 = arrayData[6];
            var ADDRESS2 = arrayData[7];
            var ADDRESS3 = arrayData[8];

            var DISTRICT_CODE = arrayData[9];
            var TOWN_CODE = arrayData[10];
            var POSTCODE = arrayData[11];
            var STATE_CODE = arrayData[12];
            var COUNTRY_CODE = arrayData[13];
            var Mobile_No = arrayData[4];
            var Fax_No = arrayData[5];


            $('#updateSupplier_ID').val(Supplier_ID);
            $('#updateSupplier_Name').val(Supplier_Name);
            $('#updateOffice_Tel_No').val(Office_Tel_No);
            $('#updateEmail').val(Email);
            $('#updateADDRESS1').val(ADDRESS1);
            $('#updateADDRESS2').val(ADDRESS2);
            $('#updateADDRESS3').val(ADDRESS3);

            $('#updateDISTRICT_CODE').val(DISTRICT_CODE);
            $('#updateTOWN_CODE').val(TOWN_CODE);
            $('#updatePOSTCODE').val(POSTCODE);
            $('#updateSTATE_CODE').val(STATE_CODE);
            $('#updateCOUNTRY_CODE').val(COUNTRY_CODE);
            $('#updateMobile_No').val(Mobile_No);
            $('#updateFax_No').val(Fax_No);

        });
        // Supplier Get Data For Update End


        // Search Country Code Function Start
        $("#updateCOUNTRY_CODE").on('keyup', function () { // everytime keyup event
            var input = $(this).val(); // We take the input value

            if (input.length >= 1) { // Minimum characters = 2 (you can change)
                $('#updateCOUNTRY_CODESearch').html('<img src="libraries/LoaderIcon.gif"  />'); // Loader icon apprears in the <div id="match"></div>
                var dataFields = {input: input}; // We pass input argument in Ajax
                $.ajax({
                    type: "POST",
                    url: "supplierSearchCOUNTRY_CODE.jsp", // call the php file ajax/tuto-autocomplete.php
                    data: dataFields, // Send dataFields var
                    timeout: 3000,
                    success: function (dataBack) { // If success
                        $('#updateCOUNTRY_CODESearch').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                        $('#matchListCOUNTRY li').on('click', function () { // When click on an element in the list
                            //$('#masterCode2').text($(this).text()); // Update the field with the new element
                            $('#updateCOUNTRY_CODE').val($(this).text());
                            $('#updateCOUNTRY_CODESearch').text(''); // Clear the <div id="match"></div>
                            var arrayData = $('#updateCOUNTRY_CODE').val().split("|");
                        });
                    },
                    error: function () { // if error
                        $('#updateCOUNTRY_CODESearch').text('Problem!');
                    }
                });
            } else {
                $('#updateCOUNTRY_CODESearch').text(''); // If less than 2 characters, clear the <div id="match"></div>
            }

        });
        // Search Country Code Function End


        // Search State Code Function Start
        $("#updateSTATE_CODE").on('keyup', function () { // everytime keyup event
            var input = $(this).val(); // We take the input value

            if (input.length >= 1) { // Minimum characters = 2 (you can change)
                $('#updateSTATE_CODESearch').html('<img src="libraries/LoaderIcon.gif"  />'); // Loader icon apprears in the <div id="match"></div>
                var dataFields = {input: input}; // We pass input argument in Ajax
                $.ajax({
                    type: "POST",
                    url: "supplierSearchSTATE_CODE.jsp", // call the php file ajax/tuto-autocomplete.php
                    data: dataFields, // Send dataFields var
                    timeout: 3000,
                    success: function (dataBack) { // If success
                        $('#updateSTATE_CODESearch').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                        $('#matchListSTATE li').on('click', function () { // When click on an element in the list
                            //$('#masterCode2').text($(this).text()); // Update the field with the new element
                            $('#updateSTATE_CODE').val($(this).text());
                            $('#updateSTATE_CODESearch').text(''); // Clear the <div id="match"></div>
                            var arrayData = $('#updateSTATE_CODE').val().split("|");
                        });
                    },
                    error: function () { // if error
                        $('#updateSTATE_CODESearch').text('Problem!');
                    }
                });
            } else {
                $('#updateSTATE_CODESearch').text(''); // If less than 2 characters, clear the <div id="match"></div>
            }

        });
        // Search State Code Function End


        // Search District Code Function Start
        $("#updateDISTRICT_CODE").on('keyup', function () { // everytime keyup event
            var input = $(this).val(); // We take the input value

            if (input.length >= 1) { // Minimum characters = 2 (you can change)
                $('#updateDISTRICT_CODESearch').html('<img src="libraries/LoaderIcon.gif"  />'); // Loader icon apprears in the <div id="match"></div>
                var dataFields = {input: input}; // We pass input argument in Ajax
                $.ajax({
                    type: "POST",
                    url: "supplierSearchDISTRICT_CODE.jsp", // call the php file ajax/tuto-autocomplete.php
                    data: dataFields, // Send dataFields var
                    timeout: 3000,
                    success: function (dataBack) { // If success
                        $('#updateDISTRICT_CODESearch').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                        $('#matchListDISTRICT li').on('click', function () { // When click on an element in the list
                            //$('#masterCode2').text($(this).text()); // Update the field with the new element
                            $('#updateDISTRICT_CODE').val($(this).text());
                            $('#updateDISTRICT_CODESearch').text(''); // Clear the <div id="match"></div>
                            var arrayData = $('#updateDISTRICT_CODE').val().split("|");
                        });
                    },
                    error: function () { // if error
                        $('#updateDISTRICT_CODESearch').text('Problem!');
                    }
                });
            } else {
                $('#updateDISTRICT_CODESearch').text(''); // If less than 2 characters, clear the <div id="match"></div>
            }

        });
        // Search District Code Function End


        // Search Town Code Function Start
        $("#updateTOWN_CODE").on('keyup', function () { // everytime keyup event
            var input = $(this).val(); // We take the input value

            if (input.length >= 1) { // Minimum characters = 2 (you can change)
                $('#updateTOWN_CODESearch').html('<img src="libraries/LoaderIcon.gif"  />'); // Loader icon apprears in the <div id="match"></div>
                var dataFields = {input: input}; // We pass input argument in Ajax
                $.ajax({
                    type: "POST",
                    url: "supplierSearchTOWN_CODE.jsp", // call the php file ajax/tuto-autocomplete.php
                    data: dataFields, // Send dataFields var
                    timeout: 3000,
                    success: function (dataBack) { // If success
                        $('#updateTOWN_CODESearch').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                        $('#matchListTOWN li').on('click', function () { // When click on an element in the list
                            //$('#masterCode2').text($(this).text()); // Update the field with the new element
                            $('#updateTOWN_CODE').val($(this).text());
                            $('#updateTOWN_CODESearch').text(''); // Clear the <div id="match"></div>
                            var arrayData = $('#updateTOWN_CODE').val().split("|");
                        });
                    },
                    error: function () { // if error
                        $('#updateTOWN_CODESearch').text('Problem!');
                    }
                });
            } else {
                $('#updateTOWN_CODESearch').text(''); // If less than 2 characters, clear the <div id="match"></div>
            }

        });
        // Search Town Code Function End


        // Search Post Code Function Start
        $("#updatePOSTCODE").on('keyup', function () { // everytime keyup event
            var input = $(this).val(); // We take the input value

            if (input.length >= 1) { // Minimum characters = 2 (you can change)
                $('#updatePOSTCODESearch').html('<img src="libraries/LoaderIcon.gif"  />'); // Loader icon apprears in the <div id="match"></div>
                var dataFields = {input: input}; // We pass input argument in Ajax
                $.ajax({
                    type: "POST",
                    url: "supplierSearchPOST_CODE.jsp", // call the php file ajax/tuto-autocomplete.php
                    data: dataFields, // Send dataFields var
                    timeout: 3000,
                    success: function (dataBack) { // If success
                        $('#updatePOSTCODESearch').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                        $('#matchListPOST li').on('click', function () { // When click on an element in the list
                            //$('#masterCode2').text($(this).text()); // Update the field with the new element
                            $('#updatePOSTCODE').val($(this).text());
                            $('#updatePOSTCODESearch').text(''); // Clear the <div id="match"></div>
                            var arrayData = $('#updatePOSTCODE').val().split("|");
                        });
                    },
                    error: function () { // if error
                        $('#updatePOSTCODESearch').text('Problem!');
                    }
                });
            } else {
                $('#updatePOSTCODESearch').text(''); // If less than 2 characters, clear the <div id="match"></div>
            }

        });
        // Search Post Code Function End


        // Supplier Update Function Start
        $("#updateSupplierModalButton").off('click').on('click', function (e) {

            e.preventDefault();

            var Supplier_IDCheck = document.getElementById("updateSupplier_ID");
            var Supplier_NameCheck = document.getElementById("updateSupplier_Name");
            var Office_Tel_NoCheck = document.getElementById("updateOffice_Tel_No");
            var EmailCheck = document.getElementById("updateEmail");
            var ADDRESS1Check = document.getElementById("updateADDRESS1");
            var ADDRESS2Check = document.getElementById("updateADDRESS2");
            var ADDRESS3Check = document.getElementById("updateADDRESS3");

            var DISTRICT_CODECheck = document.getElementById("updateDISTRICT_CODE");
            var TOWN_CODECheck = document.getElementById("updateTOWN_CODE");
            var POSTCODECheck = document.getElementById("updatePOSTCODE");
            var STATE_CODECheck = document.getElementById("updateSTATE_CODE");
            var COUNTRY_CODECheck = document.getElementById("updateCOUNTRY_CODE");
            var Mobile_NoCheck = document.getElementById("updateMobile_No");
            var Fax_NoCheck = document.getElementById("updateFax_No");



            var Supplier_ID = $('#updateSupplier_ID').val();
            var Supplier_Name = $('#updateSupplier_Name').val();
            var Office_Tel_No = $('#updateOffice_Tel_No').val();
            var Email = $('#updateEmail').val();
            var ADDRESS1 = $('#updateADDRESS1').val();
            var ADDRESS2 = $('#updateADDRESS2').val();
            var ADDRESS3 = $('#updateADDRESS3').val();

            var DISTRICT_CODE = $('#updateDISTRICT_CODE').val();
            var TOWN_CODE = $('#updateTOWN_CODE').val();
            var POSTCODE = $('#updatePOSTCODE').val();
            var STATE_CODE = $('#updateSTATE_CODE').val();
            var COUNTRY_CODE = $('#updateCOUNTRY_CODE').val();
            var Mobile_No = $('#updateMobile_No').val();
            var Fax_No = $('#updateFax_No').val();

            if (Supplier_ID === "") {
                bootbox.alert("Please Insert The Supplier ID");
            } else if (Supplier_Name === "") {
                bootbox.alert("Please Insert The Supplier Name");
            } else if (Office_Tel_No === "") {
                bootbox.alert("Please Insert The Supplier Office Number");
            } else if (Email === "") {
                bootbox.alert("Please Insert The Supplier Email");


            } else if (Supplier_IDCheck.checkValidity() === false) {
                bootbox.alert("Please Insert The Supplier ID Not More than 10 Characters");
            } else if (Supplier_NameCheck.checkValidity() === false) {
                bootbox.alert("Please Insert The Supplier Name Not More than 100 Characters");
            } else if (Office_Tel_NoCheck.checkValidity() === false) {
                bootbox.alert("Please Insert The Supplier Office Number between 9 to 11 Numbers");
            } else if (EmailCheck.checkValidity() === false) {
                bootbox.alert("Please Insert The Supplier Email Not More than 30 Characters");
            } else if (ADDRESS1Check.checkValidity() === false) {
                bootbox.alert("Please Insert The Supplier Address 1 Not More than 100 Characters");
            } else if (ADDRESS2Check.checkValidity() === false) {
                bootbox.alert("Please Insert The Supplier Address 2 Not More than 100 Characters");
            } else if (ADDRESS3Check.checkValidity() === false) {
                bootbox.alert("Please Insert The Supplier Address 3 Not More than 100 Characters");
            } else if (DISTRICT_CODECheck.checkValidity() === false) {
                bootbox.alert("Please Insert The Supplier District Code Not More than 15 Numbers");
            } else if (TOWN_CODECheck.checkValidity() === false) {
                bootbox.alert("Please Insert The Supplier Town Code Not More than 15 Numbers");
            } else if (POSTCODECheck.checkValidity() === false) {
                bootbox.alert("Please Insert The Supplier PostCode Not More than 15 Numbers");
            } else if (STATE_CODECheck.checkValidity() === false) {
                bootbox.alert("Please Insert The Supplier PostCode Not More than 15 Numbers");
            } else if (COUNTRY_CODECheck.checkValidity() === false) {
                bootbox.alert("Please Insert The Supplier Country Code Not More than 15 Numbers");
            } else if (Mobile_NoCheck.checkValidity() === false) {
                bootbox.alert("Please Insert The Supplier Mobile Number between 9 to 11 Numbers");
            } else if (Fax_NoCheck.checkValidity() === false) {
                bootbox.alert("Please Insert The Supplier Fax Number between 9 to 11 Numbers");
            } else {
                

                var data = {
                    Supplier_ID: Supplier_ID,
                    Supplier_Name: Supplier_Name,
                    Office_Tel_No: Office_Tel_No,
                    Email: Email,
                    ADDRESS1: ADDRESS1,
                    ADDRESS2: ADDRESS2,
                    ADDRESS3: ADDRESS3,
                    DISTRICT_CODE: DISTRICT_CODE,
                    TOWN_CODE: TOWN_CODE,
                    POSTCODE: POSTCODE,
                    STATE_CODE: STATE_CODE,
                    COUNTRY_CODE: COUNTRY_CODE,
                    Mobile_No: Mobile_No,
                    Fax_No: Fax_No
                };

                console.log(data);

                $.ajax({
                    url: "supplierUpdate.jsp",
                    type: "post",
                    data: data,
                    timeout: 10000,
                    success: function (datas) {
                        if (datas.trim() === 'Success') {
                            $('#contentSupplierTable').load('supplierTableLoop.jsp');
                            $(".modal-backdrop").hide();
                            bootbox.alert({
                                message: "Supplier is Updated Successful",
                                title: "Process Result",
                                backdrop: true
                            });
                        } else if (datas.trim() === 'Failed') {
                            bootbox.alert({
                                message: "Supplier Update Failed",
                                title: "Process Result",
                                backdrop: true
                            });

                        }
                    },
                    error: function (err) {
                        alert("Error Ajax Update!");
                    }

                });

            }
        });
        // Supplier Update Function End


        // Supplier Delete Function Start
        $('#contentSupplierTable').off('click', '#supplierTable #supllierDeleteTButton').on('click', '#supplierTable #supllierDeleteTButton', function (e) {

            e.preventDefault();

            var row = $(this).closest("tr");
            var rowData = row.find("#dataSupplierhidden").val();
            var arrayData = rowData.split("|");
            console.log(arrayData);

            //assign into seprated val
            var iditem = arrayData[0];
            console.log(iditem);


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
                            url: "supplierDelete.jsp",
                            type: "post",
                            data: data,
                            timeout: 10000, // 10 seconds
                            success: function (datas) {

                                if (datas.trim() === 'Success') {
                                    $('#contentSupplierTable').load('supplierTableLoop.jsp');
                                    bootbox.alert({
                                        message: "Supplier is Deleted Successful",
                                        title: "Process Result",
                                        backdrop: true
                                    });
                                } else if (datas.trim() === 'Failed') {
                                    bootbox.alert({
                                        message: "Supplier Delete Failed",
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
        // Supplier Delete Function End


        // Supplier DataTables Start
        $('#supplierTable').DataTable({
            pageLength: 15,
            dom: 'Bfrtip',
            buttons: [
                {
                    extend: 'excelHtml5',
                    text: 'Export To Excel',
                    title: 'Supplier Data Export',
                    exportOptions: {
                        columns: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
                    }
                }, {
                    extend: 'csvHtml5',
                    text: 'Export To Excel CSV',
                    title: 'Supplier Data Export',
                    exportOptions: {
                        columns: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
                    }
                }
            ]
        });
        // Supplier DataTables End



    });

</script>
