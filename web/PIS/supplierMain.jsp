<%-- 
    Document   : atcMain
    Created on : Jan 25, 2017, 9:59:32 AM
    Author     : Shammugam
--%>

<!-- Add Part Start -->
<!-- Add Button Start -->
<h4 style="padding-top: 30px;padding-bottom: 35px; font-weight: bold">
    SUPPLIER MEDICINE MANAGEMENT
    <span class="pull-right">
        <button class="btn btn-success" data-status="pagado" data-toggle="modal" data-id="1" data-target="#supplierAddModal" style=" padding-right: 10px;padding-left: 10px;color: white;"><a data-toggle="tooltip" data-placement="top" title="Add Items" id="test"><i class=" fa fa-plus" style=" padding-right: 10px;padding-left: 10px;color: white;"></i></a>ADD SUPPLIER</button>
    </span>
</h4>
<!-- Add Button End -->
<div class="modal fade" id="supplierAddModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:50%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h2 class="modal-title" id="lineModalLabel" align="center">Add Supplier</h2>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal" autocomplete="off">
                    <div class="row">
                        <div class="col-md-6">

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Supplier ID &nbsp; *</label>
                                <div class="col-md-8">
                                    <input id="addSupplier_ID" type="text" class="form-control" placeholder="Please Insert Supplier ID" maxlength="10">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Supplier Name &nbsp; *</label>
                                <div class="col-md-8">
                                    <input id="addSupplier_Name" type="text" class="form-control" placeholder="Please Insert Supplier Name" maxlength="100" >
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Office No &nbsp; *</label>
                                <div class="col-md-8">
                                    <input id="addOffice_Tel_No" type="text" class="form-control" placeholder="Please Insert Office No" pattern="[0-9]{9,11}"  maxlength="30">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Email &nbsp; *</label>
                                <div class="col-md-8">
                                    <input id="addEmail" type="email" class="form-control" placeholder="Please Insert Email" maxlength="30">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Address 1</label>
                                <div class="col-md-8">
                                    <input id="addADDRESS1" type="text" class="form-control"  placeholder="Please Insert Address 1 (Optional)" maxlength="100">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Address 2</label>
                                <div class="col-md-8">
                                    <input id="addADDRESS2" type="text" class="form-control" placeholder="Please Insert Address 2 (Optional)" maxlength="100">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Address 3</label>
                                <div class="col-md-8">
                                    <input id="addADDRESS3" type="text" class="form-control" placeholder="Please Insert Address 3 (Optional)" maxlength="100">
                                </div>
                            </div>


                        </div>

                        <div class="col-md-6">


                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Country Code</label>
                                <div class="col-md-8">
                                    <input id="addCOUNTRY_CODE" type="text" class="form-control" placeholder="Please Search Country Code (Optional)" maxlength="10">
                                    <div id="addCOUNTRY_CODESearch" class="search-drop">
                                        <!--for search area-->
                                    </div>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">State Code</label>
                                <div class="col-md-8">
                                    <input id="addSTATE_CODE" type="text" class="form-control" placeholder="Please Search State Code (Optional)" maxlength="10">
                                    <div id="addSTATE_CODESearch" class="search-drop">
                                        <!--for search area-->
                                    </div>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">District Code</label>
                                <div class="col-md-8">
                                    <input id="addDISTRICT_CODE" type="text" class="form-control" placeholder="Please Search District Code (Optional)" maxlength="10">
                                    <div id="addDISTRICT_CODESearch" class="search-drop">
                                        <!--for search area-->
                                    </div>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Town Code</label>
                                <div class="col-md-8">
                                    <input id="addTOWN_CODE" type="text" class="form-control" placeholder="Please Search Town Code (Optional)" maxlength="10">
                                    <div id="addTOWN_CODESearch" class="search-drop">
                                        <!--for search area-->
                                    </div>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Postcode</label>
                                <div class="col-md-8">
                                    <input id="addPOSTCODE" type="number" class="form-control" placeholder="Please Search Postcode (Optional)" maxlength="10">
                                    <div id="addPOSTCODESearch" class="search-drop">
                                        <!--for search area-->
                                    </div>
                                </div>
                            </div>


                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Mobile No</label>
                                <div class="col-md-8">
                                    <input id="addMobile_No" type="text" class="form-control" placeholder="Please Insert Mobile No (Optional)" pattern="[0-9]{9,11}" maxlength="15">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Fax No</label>
                                <div class="col-md-8">
                                    <input id="addFax_No" type="text" class="form-control" placeholder="Please Insert Fax No (Optional)" pattern="[0-9]{9,11}" maxlength="15">
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
                        <button type="submit" id="addSupplierButton" class="btn btn-success btn-block btn-lg" role="button">Add</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="addSupplierReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Clear</button>
                    </div>
                </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Modal Add Supplier End -->
<!-- Add Part End -->


<script>

    $(document).ready(function () {


        // Supplier Reset Function Start
        function reset() {
            document.getElementById("addSupplier_ID").value = "";
            document.getElementById("addSupplier_Name").value = "";
            document.getElementById("addOffice_Tel_No").value = "";
            document.getElementById("addEmail").value = "";
            document.getElementById("addADDRESS1").value = "";
            document.getElementById("addADDRESS2").value = "";
            document.getElementById("addADDRESS3").value = "";

            document.getElementById("addDISTRICT_CODE").value = "";
            document.getElementById("addDISTRICT_CODESearch").innerHTML = "";
            document.getElementById("addTOWN_CODE").value = "";
            document.getElementById("addTOWN_CODESearch").innerHTML = "";
            document.getElementById("addPOSTCODE").value = "";
            document.getElementById("addPOSTCODESearch").innerHTML = "";
            document.getElementById("addSTATE_CODE").value = "";
            document.getElementById("addSTATE_CODESearch").innerHTML = "";
            document.getElementById("addCOUNTRY_CODE").value = "";
            document.getElementById("addCOUNTRY_CODESearch").innerHTML = "";
            document.getElementById("addMobile_No").value = "";
            document.getElementById("addFax_No").value = "";
        }
        // Supplier Reset Function End


        // Supplier Reset Button Start
        $('#addSupplierReset').on('click', function () {
            reset();
        });
        // Supplier Reset Button End


        // Search Country Code Function Start
        $("#addCOUNTRY_CODE").on('keyup', function () { // everytime keyup event
            var input = $(this).val(); // We take the input value

            if (input.length >= 1) { // Minimum characters = 2 (you can change)
                $('#addCOUNTRY_CODESearch').html('<img src="libraries/LoaderIcon.gif"  />'); // Loader icon apprears in the <div id="match"></div>
                var dataFields = {input: input}; // We pass input argument in Ajax
                $.ajax({
                    type: "POST",
                    url: "supplierSearchCOUNTRY_CODE.jsp", // call the php file ajax/tuto-autocomplete.php
                    data: dataFields, // Send dataFields var
                    timeout: 3000,
                    success: function (dataBack) { // If success
                        $('#addCOUNTRY_CODESearch').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                        $('#matchListCOUNTRY li').on('click', function () { // When click on an element in the list
                            //$('#masterCode2').text($(this).text()); // Update the field with the new element
                            $('#addCOUNTRY_CODE').val($(this).text());
                            $('#addCOUNTRY_CODESearch').text(''); // Clear the <div id="match"></div>
                            var arrayData = $('#addCOUNTRY_CODE').val().split("|");
                        });
                    },
                    error: function () { // if error
                        $('#addCOUNTRY_CODESearch').text('Problem!');
                    }
                });
            } else {
                $('#addCOUNTRY_CODESearch').text(''); // If less than 2 characters, clear the <div id="match"></div>
            }

        });
        // Search Country Code Function End


        // Search State Code Function Start
        $("#addSTATE_CODE").on('keyup', function () { // everytime keyup event
            var input = $(this).val(); // We take the input value

            if (input.length >= 1) { // Minimum characters = 2 (you can change)
                $('#addSTATE_CODESearch').html('<img src="libraries/LoaderIcon.gif"  />'); // Loader icon apprears in the <div id="match"></div>
                var dataFields = {input: input}; // We pass input argument in Ajax
                $.ajax({
                    type: "POST",
                    url: "supplierSearchSTATE_CODE.jsp", // call the php file ajax/tuto-autocomplete.php
                    data: dataFields, // Send dataFields var
                    timeout: 3000,
                    success: function (dataBack) { // If success
                        $('#addSTATE_CODESearch').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                        $('#matchListSTATE li').on('click', function () { // When click on an element in the list
                            //$('#masterCode2').text($(this).text()); // Update the field with the new element
                            $('#addSTATE_CODE').val($(this).text());
                            $('#addSTATE_CODESearch').text(''); // Clear the <div id="match"></div>
                            var arrayData = $('#addSTATE_CODE').val().split("|");
                        });
                    },
                    error: function () { // if error
                        $('#addSTATE_CODESearch').text('Problem!');
                    }
                });
            } else {
                $('#addSTATE_CODESearch').text(''); // If less than 2 characters, clear the <div id="match"></div>
            }

        });
        // Search State Code Function End


        // Search District Code Function Start
        $("#addDISTRICT_CODE").on('keyup', function () { // everytime keyup event
            var input = $(this).val(); // We take the input value

            if (input.length >= 1) { // Minimum characters = 2 (you can change)
                $('#addDISTRICT_CODESearch').html('<img src="libraries/LoaderIcon.gif"  />'); // Loader icon apprears in the <div id="match"></div>
                var dataFields = {input: input}; // We pass input argument in Ajax
                $.ajax({
                    type: "POST",
                    url: "supplierSearchDISTRICT_CODE.jsp", // call the php file ajax/tuto-autocomplete.php
                    data: dataFields, // Send dataFields var
                    timeout: 3000,
                    success: function (dataBack) { // If success
                        $('#addDISTRICT_CODESearch').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                        $('#matchListDISTRICT li').on('click', function () { // When click on an element in the list
                            //$('#masterCode2').text($(this).text()); // Update the field with the new element
                            $('#addDISTRICT_CODE').val($(this).text());
                            $('#addDISTRICT_CODESearch').text(''); // Clear the <div id="match"></div>
                            var arrayData = $('#addDISTRICT_CODE').val().split("|");
                        });
                    },
                    error: function () { // if error
                        $('#addDISTRICT_CODESearch').text('Problem!');
                    }
                });
            } else {
                $('#addDISTRICT_CODESearch').text(''); // If less than 2 characters, clear the <div id="match"></div>
            }

        });
        // Search District Code Function End


        // Search Town Code Function Start
        $("#addTOWN_CODE").on('keyup', function () { // everytime keyup event
            var input = $(this).val(); // We take the input value

            if (input.length >= 1) { // Minimum characters = 2 (you can change)
                $('#addTOWN_CODESearch').html('<img src="libraries/LoaderIcon.gif"  />'); // Loader icon apprears in the <div id="match"></div>
                var dataFields = {input: input}; // We pass input argument in Ajax
                $.ajax({
                    type: "POST",
                    url: "supplierSearchTOWN_CODE.jsp", // call the php file ajax/tuto-autocomplete.php
                    data: dataFields, // Send dataFields var
                    timeout: 3000,
                    success: function (dataBack) { // If success
                        $('#addTOWN_CODESearch').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                        $('#matchListTOWN li').on('click', function () { // When click on an element in the list
                            //$('#masterCode2').text($(this).text()); // Update the field with the new element
                            $('#addTOWN_CODE').val($(this).text());
                            $('#addTOWN_CODESearch').text(''); // Clear the <div id="match"></div>
                            var arrayData = $('#addTOWN_CODE').val().split("|");
                        });
                    },
                    error: function () { // if error
                        $('#addTOWN_CODESearch').text('Problem!');
                    }
                });
            } else {
                $('#addTOWN_CODESearch').text(''); // If less than 2 characters, clear the <div id="match"></div>
            }

        });
        // Search Town Code Function End


        // Search Post Code Function Start
        $("#addPOSTCODE").on('keyup', function () { // everytime keyup event
            var input = $(this).val(); // We take the input value

            if (input.length >= 1) { // Minimum characters = 2 (you can change)
                $('#addPOSTCODESearch').html('<img src="libraries/LoaderIcon.gif"  />'); // Loader icon apprears in the <div id="match"></div>
                var dataFields = {input: input}; // We pass input argument in Ajax
                $.ajax({
                    type: "POST",
                    url: "supplierSearchPOST_CODE.jsp", // call the php file ajax/tuto-autocomplete.php
                    data: dataFields, // Send dataFields var
                    timeout: 3000,
                    success: function (dataBack) { // If success
                        $('#addPOSTCODESearch').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                        $('#matchListPOST li').on('click', function () { // When click on an element in the list
                            //$('#masterCode2').text($(this).text()); // Update the field with the new element
                            $('#addPOSTCODE').val($(this).text());
                            $('#addPOSTCODESearch').text(''); // Clear the <div id="match"></div>
                            var arrayData = $('#addPOSTCODE').val().split("|");
                        });
                    },
                    error: function () { // if error
                        $('#addPOSTCODESearch').text('Problem!');
                    }
                });
            } else {
                $('#addPOSTCODESearch').text(''); // If less than 2 characters, clear the <div id="match"></div>
            }

        });
        // Search Post Code Function End


        // Add Supplier Function Start
        $('#addSupplierButton').on('click', function () {

            var Supplier_IDCheck = document.getElementById("addSupplier_ID");
            var Supplier_NameCheck = document.getElementById("addSupplier_Name");
            var Office_Tel_NoCheck = document.getElementById("addOffice_Tel_No");
            var EmailCheck = document.getElementById("addEmail");
            var ADDRESS1Check = document.getElementById("addADDRESS1");
            var ADDRESS2Check = document.getElementById("addADDRESS2");
            var ADDRESS3Check = document.getElementById("addADDRESS3");

            var DISTRICT_CODECheck = document.getElementById("addDISTRICT_CODE");
            var TOWN_CODECheck = document.getElementById("addTOWN_CODE");
            var POSTCODECheck = document.getElementById("addPOSTCODE");
            var STATE_CODECheck = document.getElementById("addSTATE_CODE");
            var COUNTRY_CODECheck = document.getElementById("addCOUNTRY_CODE");
            var Mobile_NoCheck = document.getElementById("addMobile_No");
            var Fax_NoCheck = document.getElementById("addFax_No");


            var Supplier_ID = $('#addSupplier_ID').val();
            var Supplier_Name = $('#addSupplier_Name').val();
            var Office_Tel_No = $('#addOffice_Tel_No').val();
            var Email = $('#addEmail').val();
            var ADDRESS1 = $('#addADDRESS1').val().trim();
            var ADDRESS2 = $('#addADDRESS2').val();
            var ADDRESS3 = $('#addADDRESS3').val();

            var DISTRICT_CODE = $('#addDISTRICT_CODE').val();
            var TOWN_CODE = $('#addTOWN_CODE').val();
            var POSTCODE = $('#addPOSTCODE').val();
            var STATE_CODE = $('#addSTATE_CODE').val();
            var COUNTRY_CODE = $('#addCOUNTRY_CODE').val();
            var Mobile_No = $('#addMobile_No').val();
            var Fax_No = $('#addFax_No').val();


            if (Supplier_ID === "" || Supplier_ID === null) {
                bootbox.alert("Please Insert The Supplier ID");
            } else if (Supplier_Name === "" || Supplier_Name === null) {
                bootbox.alert("Please Insert The Supplier Name");
            } else if (Office_Tel_No === "" || Office_Tel_No === null) {
                bootbox.alert("Please Insert The Supplier Office Number");
            } else if (Email === "" || Email === null) {
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

                $.ajax({
                    url: "supplierInsert.jsp",
                    type: "post",
                    data: data,
                    timeout: 10000,
                    success: function (datas) {

                        if (datas.trim() === 'Success') {

                            $('#contentSupplierTable').load('supplierTableLoop.jsp');
                            $('#supplierAddModal').modal('hide');
                            $('#detail').modal('hide');
                            bootbox.alert({
                                message: "Supllier is Added Successful",
                                title: "Process Result",
                                backdrop: true
                            });
                            reset();

                        } else if (datas.trim() === 'Duplicate') {

                            bootbox.alert({
                                message: "Supplier ID Duplication Detected. Please use diffrerent Supplier ID",
                                title: "Process Result",
                                backdrop: true
                            });

                        } else if (datas.trim() === 'Failed') {

                            bootbox.alert({
                                message: "Supplier Add Failed",
                                title: "Process Result",
                                backdrop: true
                            });
                            $('#supplierAddModal').modal('hide');
                            reset();

                        }

                    },
                    error: function (err) {
                        console.log("Ajax Is Not Success");
                        console.log(err);
                    }

                });
            }

        });
        // Add Supplier Function End


    });

</script>

