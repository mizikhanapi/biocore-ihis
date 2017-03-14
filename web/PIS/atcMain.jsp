<%-- 
    Document   : atcMain
    Created on : Jan 25, 2017, 9:59:32 AM
    Author     : Shammugam
--%>


<!-- Add Part Start -->
<!-- Add Button Start -->
<h4 style="padding-top: 30px;padding-bottom: 35px; font-weight: bold">
    ATC MEDICINE MANAGEMENT
    <span class="pull-right">
        <button class="btn btn-success" data-status="pagado" data-toggle="modal" data-id="1" data-target="#detail" style=" padding-right: 10px;padding-left: 10px;color: white;"><a data-toggle="tooltip" data-placement="top" title="Add Items" id="test"><i class=" fa fa-plus" style=" padding-right: 10px;padding-left: 10px;color: white;"></i></a>ADD ATC</button>
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
                            <input id="hfc" type="text" placeholder="Insert HFC Code" maxlength="30" class="form-control input-md" >
                            <div id="atcHFCSearch">
                                <!--for search area-->
                            </div>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Discipline Code *</label>
                        <div class="col-md-8">
                            <input id="discipline" type="text" placeholder="Insert Discipline Code" maxlength="30" class="form-control input-md" >
                            <div id="atcDisciplineSearch">
                                <!--for search area-->
                            </div>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Sub-Discipline Code *</label>
                        <div class="col-md-8">
                            <input id="subdiscipline" type="text" placeholder="Insert Sub-Discipline Code" maxlength="30" class="form-control input-md" >
                            <div id="atcSubDisciplineSearch">
                                <!--for search area-->
                            </div>
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


<script>


    $(document).ready(function () {

        // Search HFC Function Start
        $("#hfc").on('keyup', function () { // everytime keyup event
            var input = $(this).val(); // We take the input value

            if (input.length >= 1) { // Minimum characters = 2 (you can change)
                $('#atcHFCSearch').html('<img src="libraries/LoaderIcon.gif"  />'); // Loader icon apprears in the <div id="match"></div>
                var dataFields = {input: input}; // We pass input argument in Ajax
                $.ajax({
                    type: "POST",
                    url: "atcSearchHFC.jsp", // call the php file ajax/tuto-autocomplete.php
                    data: dataFields, // Send dataFields var
                    timeout: 3000,
                    success: function (dataBack) { // If success
                        $('#atcHFCSearch').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                        $('#matchListHFC li').on('click', function () { // When click on an element in the list
                            //$('#masterCode2').text($(this).text()); // Update the field with the new element
                            $('#hfc').val($(this).text());
                            $('#atcHFCSearch').text(''); // Clear the <div id="match"></div>
                            var arrayData = $('#hfc').val().split("|");
                            //console.log(arrayData);
                            //console.log(arrayData[0].trim());
                            //console.log(arrayData[1].trim());
                        });
                    },
                    error: function () { // if error
                        $('#atcHFCSearch').text('Problem!');
                    }
                });
            } else {
                $('#atcHFCSearch').text(''); // If less than 2 characters, clear the <div id="match"></div>
            }

        });
        // Search FHC Function End


        // Search Discipline Function Start
        $("#discipline").on('keyup', function () { // everytime keyup event
            var input = $(this).val(); // We take the input value
            var hfc = $('#hfc').val();

            if (hfc === "" || hfc === null) {
                $('#discipline').val("");
                bootbox.alert("Please Search For HFC Code Before Proceeding");
            } else {
                if (input.length >= 1) { // Minimum characters = 2 (you can change)
                    $('#atcDisciplineSearch').html('<img src="libraries/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
                    var dataFields = {input: input}; // We pass input argument in Ajax
                    $.ajax({
                        type: "POST",
                        url: "atcSearchDiscipline.jsp", // call the php file ajax/tuto-autocomplete.php
                        data: dataFields, // Send dataFields var
                        timeout: 3000,
                        success: function (dataBack) { // If success
                            $('#atcDisciplineSearch').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                            $('#matchListDis li').on('click', function () { // When click on an element in the list
                                //$('#masterCode2').text($(this).text()); // Update the field with the new element
                                $('#discipline').val($(this).text());
                                $('#atcDisciplineSearch').text(''); // Clear the <div id="match"></div>
                                var arrayData = $('#discipline').val().split("|");
                                //console.log(arrayData);
                                //console.log(arrayData[0].trim());
                                //console.log(arrayData[1].trim());
                            });
                        },
                        error: function () { // if error
                            $('#atcDisciplineSearch').text('Problem!');
                        }
                    });
                } else {
                    $('#atcDisciplineSearch').text(''); // If less than 2 characters, clear the <div id="match"></div>
                }
            }
        });
        // Search Sub Discipline Function End


        // Search Sub Discipline Function Start
        $("#subdiscipline").on('keyup', function () { // everytime keyup event
            var input = $(this).val(); // We take the input value

            var hfc = $('#hfc').val();
            var discipline = $('#discipline').val();

            if (hfc === "" || hfc === null) {
                $('#subdiscipline').val("");
                bootbox.alert("Please Search For HFC Code Before Proceeding");
            } else if (discipline === "" || discipline === null) {
                $('#subdiscipline').val("");
                bootbox.alert("Please Search For Discipline Code Before Proceeding");
            } else {
                if (input.length >= 1) { // Minimum characters = 2 (you can change)
                    $('#atcSubDisciplineSearch').html('<img src="libraries/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
                    var dataFields = {input: input}; // We pass input argument in Ajax
                    $.ajax({
                        type: "POST",
                        url: "atcSearchSubDiscipline.jsp", // call the php file ajax/tuto-autocomplete.php
                        data: dataFields, // Send dataFields var
                        timeout: 3000,
                        success: function (dataBack) { // If success
                            $('#atcSubDisciplineSearch').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                            $('#matchListSubDis li').on('click', function () { // When click on an element in the list
                                //$('#masterCode2').text($(this).text()); // Update the field with the new element
                                $('#subdiscipline').val($(this).text());
                                $('#atcSubDisciplineSearch').text(''); // Clear the <div id="match"></div>
                                var arrayData = $('#subdiscipline').val().split("|");
                                //console.log(arrayData);
                                //console.log(arrayData[0].trim());
                                //console.log(arrayData[1].trim());
                            });
                        },
                        error: function () { // if error
                            $('#atcSubDisciplineSearch').text('Problem!');
                        }
                    });
                } else {
                    $('#atcSubDisciplineSearch').text(''); // If less than 2 characters, clear the <div id="match"></div>
                }
            }
        });
        // Search Sub Discipline Function End


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

                var arrayDataHFC = $('#hfc').val().split("|");
                var arrayDataDiscipline = $('#discipline').val().split("|");
                var arrayDataSubDiscipline = $('#subdiscipline').val().split("|");

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
                    url: "atcInsert.jsp",
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
            document.getElementById("hfc").value = "";
            document.getElementById("atcHFCSearch").innerHTML = "";
            document.getElementById("discipline").value = "";
            document.getElementById("atcDisciplineSearch").innerHTML = "";
            document.getElementById("subdiscipline").value = "";
            document.getElementById("atcSubDisciplineSearch").innerHTML = "";
            document.getElementById("status1").checked = false;
            document.getElementById("status2").checked = false;
        }
        // Reset Function End

    });



</script>

