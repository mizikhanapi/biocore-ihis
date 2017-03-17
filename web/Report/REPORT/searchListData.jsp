<%-- 
    Document   : searchPatient
    Created on : Feb 6, 2017, 2:53:34 PM
    Author     : shay
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="/resources/demos/style.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    </head>
    <body>
        <div class="thumbnail">
            <form class="form-horizontal">
                <!-- Select Basic -->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="selectbasic">Jabatan/Discpline</label>
                    <div class="col-md-4">
                        <select id="idType" name="idType" class="form-control" required="">
                            <option selected="" disabled="" value="-"> Please select ID type</option>
                            <option value="outpatient">Outpatient</option>
                            <option value="inpatient">Inpatient</option>
                            <option value="all">All</option>           
                        </select>
                    </div>
                </div>

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Start</label>
                    <div class="col-md-4">
                        <input id="startDate" name="startDate" type="text" class="form-control datepicker" placeholder="" readonly>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">To</label>
                    <div class="col-md-4">
                        <input id="endDate" name="endDate" type="text" class="form-control datepicker" placeholder="" readonly>
                    </div>
                </div>
                <div class="text-center">
                    <button class="btn btn-primary" type="button" id="searchListData" name="searchListData"><i class="fa fa-search fa-lg"></i>&nbsp; List Data</button>

                    <button class="btn btn-primary" type="button" id="statistics" name="statistics"><i class="fa fa-search fa-lg"></i>&nbsp; Statistics</button>

                    <button id="clearSearch" name="clearSearch" type="button" class="btn btn-default"><i class="fa fa-ban fa-lg"></i>&nbsp; Clear</button>
                </div>
            </form>
        </div>
    </body>
</html>


<script>

    $(document).ready(function () {

        $("#startDate").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'yy-mm-dd',
        });
        $("#endDate").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'yy-mm-dd',
        });

        $('#searchListData').on('click', function () {

            var startDate = document.getElementById("startDate").value;
            var endDate = document.getElementById("endDate").value;

            console.log(startDate);
            console.log(endDate);

            window.open("listData.jsp?startDate=" + startDate + "&endDate=" + endDate);

        });
    });
</script>
<!--    //event on click search button
//        $('#searchListData').on('click', function () {
//            searchListData();
//        });
//
//        $('#statistics').on('click', function () {
//            statistics();
//        });
//
//
//        //seaching patient function   
//        function searchListData() {
//
//            var opt = $('#idType option[disabled]:selected').val();
//
//            //check if the input text or the select box is empty.
//
//            if (opt === "-") {
//                //if the select box is not selected
//                bootbox.alert('Please select ID Type first.');
//            } else {
//                //if the select box is choosen and the input in key-in.
//
//                //get value from text box and select box
//                var idType = $('#idType').find(":selected").val();
//                var idInput = $('#idInput').val();
//
//                //run the MAIN ajax function
//                $.ajax({
//                    async: true,
//                    type: "POST",
//                    url: "pmhTable.jsp",
//                    data: {'idType': idType, 'idInput': idInput},
//                    timeout: 10000,
//                    success: function (list) {
//
//                        //split the data into an array
//
//                        //function when the value that returned either empty/null or has value.
//                        //customize this part only
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//                        $('#pmhTablediv').html(list);
//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                    },
//                    error: function (xhr, status, error) {
//                        var err = eval("(" + xhr.responseText + ")");
//                        bootbox.alert(err.Message);
//                    }
//                });
//            }
//        }-->