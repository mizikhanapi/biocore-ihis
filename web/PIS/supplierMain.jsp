<%-- 
    Document   : atcMain
    Created on : Jan 25, 2017, 9:59:32 AM
    Author     : Shammugam
--%>

<!-- Add Part Start -->
<!-- Add Button Start -->
<h4 style="padding-top: 30px;padding-bottom: 35px; font-weight: bold">
    VENDOR MANAGEMENT
    <span class="pull-right">
        <button id="addNewSupplierButton" class="btn btn-success" data-status="pagado" data-toggle="modal" data-id="1" data-target="#supplierModal" style=" padding-right: 10px;padding-left: 10px;color: white;"><a data-toggle="tooltip" data-placement="top" title="Add Items" id="test"><i class=" fa fa-plus" style=" padding-right: 10px;padding-left: 10px;color: white;"></i></a>ADD SUPPLIER</button>
    </span>
</h4>
<script>

    $(document).ready(function () {

        // Supplier Add Modal Button Function Start
        $('#addNewSupplierButton').on('click', function () {

            console.log("In mAdd Function");

            $('#supplierModalTitle').text("Add New Vendor");
            $('#vendor_ID').prop('readonly', false);
            $('#supplier_btnAdd_or_btnUpdate_div').html('<button type="submit" id="addSupplierButton" class="btn btn-success btn-block btn-lg" role="button">Add</button>');

            $('#supplierForm')[0].reset();

        });
        // Supplier Add Modal Button Function End


        // Supplier Reset Button Start
        $('#SupplierReset').on('click', function () {
            console.log("In Reset Function");
            $('#supplierForm')[0].reset();
        });
        // Supplier Reset Button End


 // Search Country Code Function Start
        $("#vendor_Bank_Code").on('keyup', function () { // everytime keyup event
            var input = $(this).val(); // We take the input value

            if (input.length >= 1) { // Minimum characters = 2 (you can change)
                $('#vendor_Bank_Code_Search').html('<img src="libraries/LoaderIcon.gif"  />'); // Loader icon apprears in the <div id="match"></div>
                var dataFields = {input: input}; // We pass input argument in Ajax
                $.ajax({
                    type: "POST",
                    url: "supplierSearchBANK.jsp", // call the php file ajax/tuto-autocomplete.php
                    data: dataFields, // Send dataFields var
                    timeout: 3000,
                    success: function (dataBack) { // If success
                        $('#vendor_Bank_Code_Search').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                        $('#matchListBANK li').on('click', function () { // When click on an element in the list
                            //$('#masterCode2').text($(this).text()); // Update the field with the new element
                            $('#vendor_Bank_Code').val($(this).text());
                            $('#vendor_Bank_Code_Search').text(''); // Clear the <div id="match"></div>
                            var arrayData = $('#vendor_Bank_Code').val().split("|");
                        });
                    },
                    error: function () { // if error
                        $('#vendor_Bank_Code_Search').text('Problem!');
                    }
                });
            } else {
                $('#vendor_Bank_Code_Search').text(''); // If less than 2 characters, clear the <div id="match"></div>
            }

        });
        // Search Country Code Function End


        // Search Country Code Function Start
        $("#vendor_Country").on('keyup', function () { // everytime keyup event
            var input = $(this).val(); // We take the input value

            if (input.length >= 1) { // Minimum characters = 2 (you can change)
                $('#vendor_Country_Search').html('<img src="libraries/LoaderIcon.gif"  />'); // Loader icon apprears in the <div id="match"></div>
                var dataFields = {input: input}; // We pass input argument in Ajax
                $.ajax({
                    type: "POST",
                    url: "supplierSearchCOUNTRY_CODE.jsp", // call the php file ajax/tuto-autocomplete.php
                    data: dataFields, // Send dataFields var
                    timeout: 3000,
                    success: function (dataBack) { // If success
                        $('#vendor_Country_Search').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                        $('#matchListCOUNTRY li').on('click', function () { // When click on an element in the list
                            //$('#masterCode2').text($(this).text()); // Update the field with the new element
                            $('#vendor_Country').val($(this).text());
                            $('#vendor_Country_Search').text(''); // Clear the <div id="match"></div>
                            var arrayData = $('#vendor_Country').val().split("|");
                        });
                    },
                    error: function () { // if error
                        $('#vendor_Country_Search').text('Problem!');
                    }
                });
            } else {
                $('#vendor_Country_Search').text(''); // If less than 2 characters, clear the <div id="match"></div>
            }

        });
        // Search Country Code Function End


        // Search State Code Function Start
        $("#vendor_State").on('keyup', function () { // everytime keyup event
            var input = $(this).val(); // We take the input value

            if (input.length >= 1) { // Minimum characters = 2 (you can change)
                $('#vendor_State_Search').html('<img src="libraries/LoaderIcon.gif"  />'); // Loader icon apprears in the <div id="match"></div>
                var dataFields = {input: input}; // We pass input argument in Ajax
                $.ajax({
                    type: "POST",
                    url: "supplierSearchSTATE_CODE.jsp", // call the php file ajax/tuto-autocomplete.php
                    data: dataFields, // Send dataFields var
                    timeout: 3000,
                    success: function (dataBack) { // If success
                        $('#vendor_State_Search').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                        $('#matchListSTATE li').on('click', function () { // When click on an element in the list
                            //$('#masterCode2').text($(this).text()); // Update the field with the new element
                            $('#vendor_State').val($(this).text());
                            $('#vendor_State_Search').text(''); // Clear the <div id="match"></div>
                            var arrayData = $('#vendor_State').val().split("|");
                        });
                    },
                    error: function () { // if error
                        $('#vendor_State_Search').text('Problem!');
                    }
                });
            } else {
                $('#vendor_State_Search').text(''); // If less than 2 characters, clear the <div id="match"></div>
            }

        });
        // Search State Code Function End


        // Search District Code Function Start
        $("#vendor_District").on('keyup', function () { // everytime keyup event
            var input = $(this).val(); // We take the input value

            if (input.length >= 1) { // Minimum characters = 2 (you can change)
                $('#vendor_District_Search').html('<img src="libraries/LoaderIcon.gif"  />'); // Loader icon apprears in the <div id="match"></div>
                var dataFields = {input: input}; // We pass input argument in Ajax
                $.ajax({
                    type: "POST",
                    url: "supplierSearchDISTRICT_CODE.jsp", // call the php file ajax/tuto-autocomplete.php
                    data: dataFields, // Send dataFields var
                    timeout: 3000,
                    success: function (dataBack) { // If success
                        $('#vendor_District_Search').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                        $('#matchListDISTRICT li').on('click', function () { // When click on an element in the list
                            //$('#masterCode2').text($(this).text()); // Update the field with the new element
                            $('#vendor_District').val($(this).text());
                            $('#vendor_District_Search').text(''); // Clear the <div id="match"></div>
                            var arrayData = $('#vendor_District').val().split("|");
                        });
                    },
                    error: function () { // if error
                        $('#vendor_District_Search').text('Problem!');
                    }
                });
            } else {
                $('#vendor_District_Search').text(''); // If less than 2 characters, clear the <div id="match"></div>
            }

        });
        // Search District Code Function End


        // Search Town Code Function Start
        $("#vendor_Towncode").on('keyup', function () { // everytime keyup event
            var input = $(this).val(); // We take the input value

            if (input.length >= 1) { // Minimum characters = 2 (you can change)
                $('#vendor_Towncode_Search').html('<img src="libraries/LoaderIcon.gif"  />'); // Loader icon apprears in the <div id="match"></div>
                var dataFields = {input: input}; // We pass input argument in Ajax
                $.ajax({
                    type: "POST",
                    url: "supplierSearchTOWN_CODE.jsp", // call the php file ajax/tuto-autocomplete.php
                    data: dataFields, // Send dataFields var
                    timeout: 3000,
                    success: function (dataBack) { // If success
                        $('#vendor_Towncode_Search').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                        $('#matchListTOWN li').on('click', function () { // When click on an element in the list
                            //$('#masterCode2').text($(this).text()); // Update the field with the new element
                            $('#vendor_Towncode').val($(this).text());
                            $('#vendor_Towncode_Search').text(''); // Clear the <div id="match"></div>
                            var arrayData = $('#vendor_Towncode').val().split("|");
                        });
                    },
                    error: function () { // if error
                        $('#vendor_Towncode_Search').text('Problem!');
                    }
                });
            } else {
                $('#vendor_Towncode_Search').text(''); // If less than 2 characters, clear the <div id="match"></div>
            }

        });
        // Search Town Code Function End


        // Search Post Code Function Start
        $("#vendor_Postcode").on('keyup', function () { // everytime keyup event
            var input = $(this).val(); // We take the input value

            if (input.length >= 1) { // Minimum characters = 2 (you can change)
                $('#vendor_Postcode_Search').html('<img src="libraries/LoaderIcon.gif"  />'); // Loader icon apprears in the <div id="match"></div>
                var dataFields = {input: input}; // We pass input argument in Ajax
                $.ajax({
                    type: "POST",
                    url: "supplierSearchPOST_CODE.jsp", // call the php file ajax/tuto-autocomplete.php
                    data: dataFields, // Send dataFields var
                    timeout: 3000,
                    success: function (dataBack) { // If success
                        $('#vendor_Postcode_Search').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                        $('#matchListPOST li').on('click', function () { // When click on an element in the list
                            //$('#masterCode2').text($(this).text()); // Update the field with the new element
                            $('#vendor_Postcode').val($(this).text());
                            $('#vendor_Postcode_Search').text(''); // Clear the <div id="match"></div>
                            var arrayData = $('#vendor_Postcode').val().split("|");
                        });
                    },
                    error: function () { // if error
                        $('#vendor_Postcode_Search').text('Problem!');
                    }
                });
            } else {
                $('#vendor_Postcode_Search').text(''); // If less than 2 characters, clear the <div id="match"></div>
            }

        });
        // Search Post Code Function End
        
        
        // Search Payment Type Function Start
        $("#vendor_Payment_Term").on('keyup', function () { // everytime keyup event
            var input = $(this).val(); // We take the input value

            if (input.length >= 1) { // Minimum characters = 2 (you can change)
                $('#vendor_Payment_Term_Search').html('<img src="libraries/LoaderIcon.gif"  />'); // Loader icon apprears in the <div id="match"></div>
                var dataFields = {input: input}; // We pass input argument in Ajax
                $.ajax({
                    type: "POST",
                    url: "supplierSearchPAYMENT_TERM.jsp", // call the php file ajax/tuto-autocomplete.php
                    data: dataFields, // Send dataFields var
                    timeout: 3000,
                    success: function (dataBack) { // If success
                        $('#vendor_Payment_Term_Search').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                        $('#matchListPAYMENT li').on('click', function () { // When click on an element in the list
                            //$('#masterCode2').text($(this).text()); // Update the field with the new element
                            $('#vendor_Payment_Term').val($(this).text());
                            $('#vendor_Payment_Term_Search').text(''); // Clear the <div id="match"></div>
                            var arrayData = $('#vendor_Payment_Term').val().split("|");
                        });
                    },
                    error: function () { // if error
                        $('#vendor_Payment_Term_Search').text('Problem!');
                    }
                });
            } else {
                $('#vendor_Payment_Term_Search').text(''); // If less than 2 characters, clear the <div id="match"></div>
            }

        });
         // Search Payment Type Function End
         
         
         // Search Accout Type Function Start
        $("#vendor_Account_Type").on('keyup', function () { // everytime keyup event
            var input = $(this).val(); // We take the input value

            if (input.length >= 1) { // Minimum characters = 2 (you can change)
                $('#vendor_Account_Type_Search').html('<img src="libraries/LoaderIcon.gif"  />'); // Loader icon apprears in the <div id="match"></div>
                var dataFields = {input: input}; // We pass input argument in Ajax
                $.ajax({
                    type: "POST",
                    url: "supplierSearchACCOUNT_TYPE.jsp", // call the php file ajax/tuto-autocomplete.php
                    data: dataFields, // Send dataFields var
                    timeout: 3000,
                    success: function (dataBack) { // If success
                        $('#vendor_Account_Type_Search').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                        $('#matchListACCOUNT li').on('click', function () { // When click on an element in the list
                            //$('#masterCode2').text($(this).text()); // Update the field with the new element
                            $('#vendor_Account_Type').val($(this).text());
                            $('#vendor_Account_Type_Search').text(''); // Clear the <div id="match"></div>
                            var arrayData = $('#vendor_Account_Type').val().split("|");
                        });
                    },
                    error: function () { // if error
                        $('#vendor_Account_Type_Search').text('Problem!');
                    }
                });
            } else {
                $('#vendor_Account_Type_Search').text(''); // If less than 2 characters, clear the <div id="match"></div>
            }

        });
         // Search Accout Type Function End
       

         // Search Currecy Type Function Start
        $("#vendor_Currency").on('keyup', function () { // everytime keyup event
            var input = $(this).val(); // We take the input value

            if (input.length >= 1) { // Minimum characters = 2 (you can change)
                $('#vendor_Currency_Search').html('<img src="libraries/LoaderIcon.gif"  />'); // Loader icon apprears in the <div id="match"></div>
                var dataFields = {input: input}; // We pass input argument in Ajax
                $.ajax({
                    type: "POST",
                    url: "supplierSearchCURRENCY.jsp", // call the php file ajax/tuto-autocomplete.php
                    data: dataFields, // Send dataFields var
                    timeout: 3000,
                    success: function (dataBack) { // If success
                        $('#vendor_Currency_Search').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                        $('#matchListCURRENCY li').on('click', function () { // When click on an element in the list
                            //$('#masterCode2').text($(this).text()); // Update the field with the new element
                            $('#vendor_Currency').val($(this).text());
                            $('#vendor_Currency_Search').text(''); // Clear the <div id="match"></div>
                            var arrayData = $('#vendor_Currency').val().split("|");
                        });
                    },
                    error: function () { // if error
                        $('#vendor_Currency_Search').text('Problem!');
                    }
                });
            } else {
                $('#vendor_Currency_Search').text(''); // If less than 2 characters, clear the <div id="match"></div>
            }

        });
         // Search Currency Type Function End


        // Add Supplier Function Start
        $('#supplier_btnAdd_or_btnUpdate_div').on('click', '#addSupplierButton', function (e) {


            var vendor_IDCheck = document.getElementById("vendor_ID");
            var vendor_NameCheck = document.getElementById("vendor_Name");
            var vendor_Bank_AccCheck = document.getElementById("vendor_Bank_Acc");
            var vendor_Bank_CodeCheck = document.getElementById("vendor_Bank_Code");
            var vendor_address1Check = document.getElementById("vendor_address1");
            var vendor_address2Check = document.getElementById("vendor_address2");
            var vendor_address3Check = document.getElementById("vendor_address3");

            var vendor_TowncodeCheck = document.getElementById("vendor_Towncode");
            var vendor_PostcodeCheck = document.getElementById("vendor_Postcode");
            var vendor_DistrictCheck = document.getElementById("vendor_District");
            var vendor_StateCheck = document.getElementById("vendor_State");
            var vendor_CountryCheck = document.getElementById("vendor_Country");
            var vendor_telephone_noCheck = document.getElementById("vendor_telephone_no");
            var vendor_fax_noCheck = document.getElementById("vendor_fax_no");
            var vendor_emailCheck = document.getElementById("vendor_email");
            var vendor_GL_CodeCheck = document.getElementById("vendor_GL_Code");
            var vendor_ROC_NoCheck = document.getElementById("vendor_ROC_No");

            var vendor_Contact_PersonCheck = document.getElementById("vendor_Contact_Person");
            var vendor_Payment_TermCheck = document.getElementById("vendor_Payment_Term");
            var vendor_Account_TypeCheck = document.getElementById("vendor_Account_Type");
            var vendor_Credit_LimitCheck = document.getElementById("vendor_Credit_Limit");
            var vendor_CurrencyCheck = document.getElementById("vendor_Currency");

            var vendor_ID = $('#vendor_ID').val();
            var vendor_Name = $('#vendor_Name').val();
            var vendor_Bank_Acc = $('#vendor_Bank_Acc').val();
            var vendor_Bank_Code = $('#vendor_Bank_Code').val();
            var vendor_address1 = $('#vendor_address1').val();
            var vendor_address2 = $('#vendor_address2').val();
            var vendor_address3 = $('#vendor_address3').val();

            var vendor_Towncode = $('#vendor_Towncode').val();
            var vendor_Postcode = $('#vendor_Postcode').val();
            var vendor_District = $('#vendor_District').val();
            var vendor_State = $('#vendor_State').val();
            var vendor_Country = $('#vendor_Country').val();
            var vendor_telephone_no = $('#vendor_telephone_no').val();
            var vendor_fax_no = $('#vendor_fax_no').val();
            var vendor_email = $('#vendor_email').val();
            var vendor_GL_Code = $('#vendor_GL_Code').val();
            var vendor_ROC_No = $('#vendor_ROC_No').val();

            var vendor_Contact_Person = $('#vendor_Contact_Person').val();
            var vendor_Payment_Term = $('#vendor_Payment_Term').val();
            var vendor_Account_Type = $('#vendor_Account_Type').val();
            var vendor_Credit_Limit = $('#vendor_Credit_Limit').val();
            var vendor_Currency = $('#vendor_Currency').val();
            var vendor_Status = $('#vendor_Status').val();


            if (vendor_ID === "" || vendor_ID === null) {
                bootbox.alert("Please Insert The Vendor ID");
            } else if (vendor_Name === "" || vendor_Name === null) {
                bootbox.alert("Please Insert The Vendor Name");
            } else if (vendor_Bank_Acc === "" || vendor_Bank_Acc === null) {
                bootbox.alert("Please Insert The Supplier Bank Account");
            } else if (vendor_Bank_Code === "" || vendor_Bank_Code === null) {
                bootbox.alert("Please Insert The Supplier Bank Code");
            } else if (vendor_address1 === "" || vendor_address1 === null) {
                bootbox.alert("Please Insert The Vendor Address 1");
            } else if (vendor_address2 === "" || vendor_address2 === null) {
                bootbox.alert("Please Insert The Vendor Address 2");
            } else if (vendor_address3 === "" || vendor_address3 === null) {
                bootbox.alert("Please Insert The Vendor Address 3");


            } else if (vendor_Towncode === "" || vendor_Towncode === null) {
                bootbox.alert("Please Search The Vendor Towncode");
            } else if (vendor_Postcode === "" || vendor_Postcode === null) {
                bootbox.alert("Please Search The Vendor Postcode");
            } else if (vendor_District === "" || vendor_District === null) {
                bootbox.alert("Please Search The Vendor District");
            } else if (vendor_State === "" || vendor_State === null) {
                bootbox.alert("Please Search The Vendor State");
            } else if (vendor_Country === "" || vendor_Country === null) {
                bootbox.alert("Please Search The Vendor Country");


            } else if (vendor_telephone_no === "" || vendor_telephone_no === null) {
                bootbox.alert("Please Insert The Vendor Telephone Number");
            } else if (vendor_fax_no === "" || vendor_fax_no === null) {
                bootbox.alert("Please Insert The Vendor Fax Number");
//            } else if (vendor_email === "" || vendor_email === null) {
//                bootbox.alert("Please Insert The Vendor Email");
            } else if (vendor_GL_Code === "" || vendor_GL_Code === null) {
                bootbox.alert("Please Insert The Vendor GL Code");
            } else if (vendor_ROC_No === "" || vendor_ROC_No === null) {
                bootbox.alert("Please Insert The Vendor ROC Number");
            } else if (vendor_Status === "" || vendor_Status === null) {
                bootbox.alert("Please Select A Status");

            } else if (vendor_IDCheck.checkValidity() === false) {
                bootbox.alert("Please Insert The Supplier ID Not More than 10 Characters");
            } else if (vendor_NameCheck.checkValidity() === false) {
                bootbox.alert("Please Insert The Supplier Name Not More than 100 Characters");
            } else if (vendor_Bank_AccCheck.checkValidity() === false) {
                bootbox.alert("Please Insert The Supplier Bank Account Number Between 6 to 20 Characters");
            } else if (vendor_Bank_CodeCheck.checkValidity() === false) {
                bootbox.alert("Please Insert The Supplier Bank Code Not More than 30 Characters");
            } else if (vendor_address1Check.checkValidity() === false) {
                bootbox.alert("Please Insert The Supplier Address 1 Not More than 100 Characters");
            } else if (vendor_address2Check.checkValidity() === false) {
                bootbox.alert("Please Insert The Supplier Address 2 Not More than 100 Characters");
            } else if (vendor_address3Check.checkValidity() === false) {
                bootbox.alert("Please Insert The Supplier Address 3 Not More than 100 Characters");
            } else if (vendor_DistrictCheck.checkValidity() === false) {
                bootbox.alert("Please Insert The Supplier District Code Not More than 10 Numbers");
            } else if (vendor_TowncodeCheck.checkValidity() === false) {
                bootbox.alert("Please Insert The Supplier Town Code Not More than 10 Numbers");
            } else if (vendor_PostcodeCheck.checkValidity() === false) {
                bootbox.alert("Please Insert The Supplier PostCode Not More than 10 Numbers");
            } else if (vendor_StateCheck.checkValidity() === false) {
                bootbox.alert("Please Insert The Supplier PostCode Not More than 10 Numbers");
            } else if (vendor_CountryCheck.checkValidity() === false) {
                bootbox.alert("Please Insert The Supplier Country Code Not More than 10 Numbers");
            } else if (vendor_telephone_noCheck.checkValidity() === false) {
                bootbox.alert("Please Insert The Supplier Mobile Number between 9 to 11 Numbers");
            } else if (vendor_fax_noCheck.checkValidity() === false) {
                bootbox.alert("Please Insert The Supplier Fax Number between 9 to 11 Numbers");
//            } else if (vendor_emailCheck.checkValidity() === false) {
//                bootbox.alert("Please Insert The Supplier Email Not More than 30 Characters");
            } else if (vendor_GL_CodeCheck.checkValidity() === false) {
                bootbox.alert("Please Insert The Supplier GL Code Not More than 10 Characters");
            } else if (vendor_ROC_NoCheck.checkValidity() === false) {
                bootbox.alert("Please Insert The Supplier ROC Code Not More than 30 Characters");
            } else if (vendor_Contact_PersonCheck.checkValidity() === false) {
                bootbox.alert("Please Insert The Supplier Contact Person Name Not More than 100 Characters");
            } else if (vendor_Payment_TermCheck.checkValidity() === false) {
                bootbox.alert("Please Insert The Supplier Payment Term Not More than 10 Characters");
            } else if (vendor_Account_TypeCheck.checkValidity() === false) {
                bootbox.alert("Please Insert The Supplier Account Type Not More than 10 Characters");
            } else if (vendor_Credit_LimitCheck.checkValidity() === false) {
                bootbox.alert("Please Insert The Supplier Account Limit Between 1 to 10 Numbers");
            } else if (vendor_CurrencyCheck.checkValidity() === false) {
                bootbox.alert("Please Insert The Supplier Account Type Not More than 10 Numbers");

            } else {

                var data = {
                    vendor_ID: vendor_ID,
                    vendor_Name: vendor_Name,
                    vendor_Bank_Acc: vendor_Bank_Acc,
                    vendor_Bank_Code: vendor_Bank_Code,
                    vendor_address1: vendor_address1,
                    vendor_address2: vendor_address2,
                    vendor_address3: vendor_address3,
                    vendor_Towncode: vendor_Towncode,
                    vendor_Postcode: vendor_Postcode,
                    vendor_District: vendor_District,
                    vendor_State: vendor_State,
                    vendor_Country: vendor_Country,
                    vendor_telephone_no: vendor_telephone_no,
                    vendor_fax_no: vendor_fax_no,
                    vendor_email: vendor_email,
                    vendor_GL_Code: vendor_GL_Code,
                    vendor_ROC_No: vendor_ROC_No,
                    vendor_Contact_Person: vendor_Contact_Person,
                    vendor_Payment_Term: vendor_Payment_Term,
                    vendor_Account_Type: vendor_Account_Type,
                    vendor_Credit_Limit: vendor_Credit_Limit,
                    vendor_Currency: vendor_Currency,
                    vendor_Status: vendor_Status
                };

                console.log(data);

                $.ajax({
                    url: "supplierInsert.jsp",
                    type: "post",
                    data: data,
                    timeout: 10000,
                    success: function (datas) {

                        if (datas.trim() === 'Success') {

                            $('#contentSupplierTable').load('supplierTableLoop.jsp');
                            $('#supplierModal').modal('hide');
                            bootbox.alert({
                                message: "Supllier is Added Successful",
                                title: "Process Result",
                                backdrop: true
                            });
                            $('#supplierForm')[0].reset();

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
                            $('#supplierModal').modal('hide');
                            $('#supplierForm')[0].reset();
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


        // Supplier Delete Function Start
        $('#contentSupplierTable').off('click', '#supplierTable #supplierUpdateTButton').on('click', '#supplierTable #supplierUpdateTButton', function (e) {

            e.preventDefault();

            var row = $(this).closest("tr");
            var rowData = row.find("#dataSupplierhidden").val();
            var arrayData = rowData.split("|");

            $('#supplierModalTitle').text("Update New Vendor");
            $('#vendor_ID').prop('readonly', true);
            $('#supplier_btnAdd_or_btnUpdate_div').html('<button type="submit" id="updateSupplierButton" class="btn btn-success btn-block btn-lg" role="button">Update</button>');

            $('#vendor_ID').val(arrayData[0]);
            $('#vendor_Name').val(arrayData[1]);
            $('#vendor_Bank_Acc').val(arrayData[2]);
            $('#vendor_Bank_Code').val(arrayData[3]);
            $('#vendor_address1').val(arrayData[4]);
            $('#vendor_address2').val(arrayData[5]);
            $('#vendor_address3').val(arrayData[6]);

            $('#vendor_Towncode').val(arrayData[7]);
            $('#vendor_Postcode').val(arrayData[8]);
            $('#vendor_District').val(arrayData[9]);
            $('#vendor_State').val(arrayData[10]);
            $('#vendor_Country').val(arrayData[11]);
            $('#vendor_telephone_no').val(arrayData[12]);
            $('#vendor_fax_no').val(arrayData[13]);
            $('#vendor_email').val(arrayData[14]);
            $('#vendor_GL_Code').val(arrayData[15]);
            $('#vendor_ROC_No').val(arrayData[16]);

            $('#vendor_Contact_Person').val(arrayData[18]);
            $('#vendor_Payment_Term').val(arrayData[19]);
            $('#vendor_Account_Type').val(arrayData[20]);
            $('#vendor_Credit_Limit').val(arrayData[21]);
            $('#vendor_Currency').val(arrayData[22]);
            $('#vendor_Status').val(arrayData[23]);

        });
        // Supplier Delete Function End


        // Supplier Update Function Start
        $('#supplier_btnAdd_or_btnUpdate_div').on('click', '#updateSupplierButton', function (e) {

            e.preventDefault();

            var vendor_IDCheck = document.getElementById("vendor_ID");
            var vendor_NameCheck = document.getElementById("vendor_Name");
            var vendor_Bank_AccCheck = document.getElementById("vendor_Bank_Acc");
            var vendor_Bank_CodeCheck = document.getElementById("vendor_Bank_Code");
            var vendor_address1Check = document.getElementById("vendor_address1");
            var vendor_address2Check = document.getElementById("vendor_address2");
            var vendor_address3Check = document.getElementById("vendor_address3");

            var vendor_TowncodeCheck = document.getElementById("vendor_Towncode");
            var vendor_PostcodeCheck = document.getElementById("vendor_Postcode");
            var vendor_DistrictCheck = document.getElementById("vendor_District");
            var vendor_StateCheck = document.getElementById("vendor_State");
            var vendor_CountryCheck = document.getElementById("vendor_Country");
            var vendor_telephone_noCheck = document.getElementById("vendor_telephone_no");
            var vendor_fax_noCheck = document.getElementById("vendor_fax_no");
            var vendor_emailCheck = document.getElementById("vendor_email");
            var vendor_GL_CodeCheck = document.getElementById("vendor_GL_Code");
            var vendor_ROC_NoCheck = document.getElementById("vendor_ROC_No");

            var vendor_Contact_PersonCheck = document.getElementById("vendor_Contact_Person");
            var vendor_Payment_TermCheck = document.getElementById("vendor_Payment_Term");
            var vendor_Account_TypeCheck = document.getElementById("vendor_Account_Type");
            var vendor_Credit_LimitCheck = document.getElementById("vendor_Credit_Limit");
            var vendor_CurrencyCheck = document.getElementById("vendor_Currency");

            var vendor_ID = $('#vendor_ID').val();
            var vendor_Name = $('#vendor_Name').val();
            var vendor_Bank_Acc = $('#vendor_Bank_Acc').val();
            var vendor_Bank_Code = $('#vendor_Bank_Code').val();
            var vendor_address1 = $('#vendor_address1').val();
            var vendor_address2 = $('#vendor_address2').val();
            var vendor_address3 = $('#vendor_address3').val();

            var vendor_Towncode = $('#vendor_Towncode').val();
            var vendor_Postcode = $('#vendor_Postcode').val();
            var vendor_District = $('#vendor_District').val();
            var vendor_State = $('#vendor_State').val();
            var vendor_Country = $('#vendor_Country').val();
            var vendor_telephone_no = $('#vendor_telephone_no').val();
            var vendor_fax_no = $('#vendor_fax_no').val();
            var vendor_email = $('#vendor_email').val();
            var vendor_GL_Code = $('#vendor_GL_Code').val();
            var vendor_ROC_No = $('#vendor_ROC_No').val();

            var vendor_Contact_Person = $('#vendor_Contact_Person').val();
            var vendor_Payment_Term = $('#vendor_Payment_Term').val();
            var vendor_Account_Type = $('#vendor_Account_Type').val();
            var vendor_Credit_Limit = $('#vendor_Credit_Limit').val();
            var vendor_Currency = $('#vendor_Currency').val();
            var vendor_Status = $('#vendor_Status').val();


            if (vendor_ID === "" || vendor_ID === null) {
                bootbox.alert("Please Insert The Vendor ID");
            } else if (vendor_Name === "" || vendor_Name === null) {
                bootbox.alert("Please Insert The Vendor Name");
            } else if (vendor_Bank_Acc === "" || vendor_Bank_Acc === null) {
                bootbox.alert("Please Insert The Supplier Bank Account");
            } else if (vendor_Bank_Code === "" || vendor_Bank_Code === null) {
                bootbox.alert("Please Insert The Supplier Bank Code");
            } else if (vendor_address1 === "" || vendor_address1 === null) {
                bootbox.alert("Please Insert The Vendor Address 1");
            } else if (vendor_address2 === "" || vendor_address2 === null) {
                bootbox.alert("Please Insert The Vendor Address 2");
            } else if (vendor_address3 === "" || vendor_address3 === null) {
                bootbox.alert("Please Insert The Vendor Address 3");


            } else if (vendor_Towncode === "" || vendor_Towncode === null) {
                bootbox.alert("Please Search The Vendor Towncode");
            } else if (vendor_Postcode === "" || vendor_Postcode === null) {
                bootbox.alert("Please Search The Vendor Postcode");
            } else if (vendor_District === "" || vendor_District === null) {
                bootbox.alert("Please Search The Vendor District");
            } else if (vendor_State === "" || vendor_State === null) {
                bootbox.alert("Please Search The Vendor State");
            } else if (vendor_Country === "" || vendor_Country === null) {
                bootbox.alert("Please Search The Vendor Country");


            } else if (vendor_telephone_no === "" || vendor_telephone_no === null) {
                bootbox.alert("Please Insert The Vendor Telephone Number");
            } else if (vendor_fax_no === "" || vendor_fax_no === null) {
                bootbox.alert("Please Insert The Vendor Fax Number");
//            } else if (vendor_email === "" || vendor_email === null) {
//                bootbox.alert("Please Insert The Vendor Email");
            } else if (vendor_GL_Code === "" || vendor_GL_Code === null) {
                bootbox.alert("Please Insert The Vendor GL Code");
            } else if (vendor_ROC_No === "" || vendor_ROC_No === null) {
                bootbox.alert("Please Insert The Vendor ROC Number");
            } else if (vendor_Status === "" || vendor_Status === null) {
                bootbox.alert("Please Select A Status");

            } else if (vendor_IDCheck.checkValidity() === false) {
                bootbox.alert("Please Insert The Supplier ID Not More than 10 Characters");
            } else if (vendor_NameCheck.checkValidity() === false) {
                bootbox.alert("Please Insert The Supplier Name Not More than 100 Characters");
            } else if (vendor_Bank_AccCheck.checkValidity() === false) {
                bootbox.alert("Please Insert The Supplier Bank Account Number Between 6 to 20 Characters");
            } else if (vendor_Bank_CodeCheck.checkValidity() === false) {
                bootbox.alert("Please Insert The Supplier Bank Code Not More than 30 Characters");
            } else if (vendor_address1Check.checkValidity() === false) {
                bootbox.alert("Please Insert The Supplier Address 1 Not More than 100 Characters");
            } else if (vendor_address2Check.checkValidity() === false) {
                bootbox.alert("Please Insert The Supplier Address 2 Not More than 100 Characters");
            } else if (vendor_address3Check.checkValidity() === false) {
                bootbox.alert("Please Insert The Supplier Address 3 Not More than 100 Characters");
            } else if (vendor_DistrictCheck.checkValidity() === false) {
                bootbox.alert("Please Insert The Supplier District Code Not More than 10 Numbers");
            } else if (vendor_TowncodeCheck.checkValidity() === false) {
                bootbox.alert("Please Insert The Supplier Town Code Not More than 10 Numbers");
            } else if (vendor_PostcodeCheck.checkValidity() === false) {
                bootbox.alert("Please Insert The Supplier PostCode Not More than 10 Numbers");
            } else if (vendor_StateCheck.checkValidity() === false) {
                bootbox.alert("Please Insert The Supplier PostCode Not More than 10 Numbers");
            } else if (vendor_CountryCheck.checkValidity() === false) {
                bootbox.alert("Please Insert The Supplier Country Code Not More than 10 Numbers");
            } else if (vendor_telephone_noCheck.checkValidity() === false) {
                bootbox.alert("Please Insert The Supplier Mobile Number between 9 to 11 Numbers");
            } else if (vendor_fax_noCheck.checkValidity() === false) {
                bootbox.alert("Please Insert The Supplier Fax Number between 9 to 11 Numbers");
//            } else if (vendor_emailCheck.checkValidity() === false) {
//                bootbox.alert("Please Insert The Supplier Email Not More than 30 Characters");
            } else if (vendor_GL_CodeCheck.checkValidity() === false) {
                bootbox.alert("Please Insert The Supplier GL Code Not More than 10 Characters");
            } else if (vendor_ROC_NoCheck.checkValidity() === false) {
                bootbox.alert("Please Insert The Supplier ROC Code Not More than 30 Characters");
            } else if (vendor_Contact_PersonCheck.checkValidity() === false) {
                bootbox.alert("Please Insert The Supplier Contact Person Name Not More than 100 Characters");
            } else if (vendor_Payment_TermCheck.checkValidity() === false) {
                bootbox.alert("Please Insert The Supplier Payment Term Not More than 10 Characters");
            } else if (vendor_Account_TypeCheck.checkValidity() === false) {
                bootbox.alert("Please Insert The Supplier Account Type Not More than 10 Characters");
            } else if (vendor_Credit_LimitCheck.checkValidity() === false) {
                bootbox.alert("Please Insert The Supplier Account Limit Between 1 to 10 Numbers");
            } else if (vendor_CurrencyCheck.checkValidity() === false) {
                bootbox.alert("Please Insert The Supplier Account Type Not More than 10 Numbers");

            } else {

                var data = {
                    vendor_ID: vendor_ID,
                    vendor_Name: vendor_Name,
                    vendor_Bank_Acc: vendor_Bank_Acc,
                    vendor_Bank_Code: vendor_Bank_Code,
                    vendor_address1: vendor_address1,
                    vendor_address2: vendor_address2,
                    vendor_address3: vendor_address3,
                    vendor_Towncode: vendor_Towncode,
                    vendor_Postcode: vendor_Postcode,
                    vendor_District: vendor_District,
                    vendor_State: vendor_State,
                    vendor_Country: vendor_Country,
                    vendor_telephone_no: vendor_telephone_no,
                    vendor_fax_no: vendor_fax_no,
                    vendor_email: vendor_email,
                    vendor_GL_Code: vendor_GL_Code,
                    vendor_ROC_No: vendor_ROC_No,
                    vendor_Contact_Person: vendor_Contact_Person,
                    vendor_Payment_Term: vendor_Payment_Term,
                    vendor_Account_Type: vendor_Account_Type,
                    vendor_Credit_Limit: vendor_Credit_Limit,
                    vendor_Currency: vendor_Currency,
                    vendor_Status: vendor_Status
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
                            $('#supplierModal').modal('hide');
                            $('#supplierForm')[0].reset();
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

                            $('#supplierModal').modal('hide');
                            $('#supplierForm')[0].reset();

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

    });

</script>

