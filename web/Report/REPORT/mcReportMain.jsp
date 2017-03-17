<%-- 
    Document   : mcReportMain
    Created on : Feb 19, 2017, 8:40:57 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <title>Print MC</title>
    </head>
    <body>
        <%@include file = "../../assets/header.html" %>

        <div class="main" style="background: #f2ff4f8;"> 
            <!-- menu top -->
            <%@ include file ="libraries/reportTopMenus.jsp" %>
            <!-- menu top -->

            <!-- side bar -->
            <%@ include file ="libraries/reportSideMenus.jsp" %>
            <!-- side bar -->
        </div>

        <div class="container"> 
            <div class="row">   

                <div class="row">
                    <div class="col-md-12">
                        <div class="thumbnail">

                            <h2 style="text-align: center"> Print MC </h2>
                            </br>

                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">ID Type:</label>


                                <div class="form-group">
                                    <div class="col-md-8">
                                        <select class="form-control" name="mcType" id="mcType">
                                            <option value="0" id="0" >Please select</option>
                                            <option value="PMI_NO" id="PMI_NO" >PMI NO.</option>
                                            <option value="OLD_IC_NO" id="OLD_IC_NO">OLD IC NO.</option>
                                            <option value="NEW_IC_NO" id="NEW_IC_NO">NEW IC NO.</option>
                                            <option value="ID_NO" id="ID_NO">MATRIC NO.</option>
                                            <option value="ID_NO" id="ID_NO">STAFF NO.</option>

                                        </select>
                                    </div>
                                </div>
                            </div>
                            </br></br></br>

                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">IC NO/ ID NO :</label>
                                <div class="col-md-8">
                                    <input id="mcInput" name="mcInput" type="text" placeholder="" class="form-control input-md">
                                </div>
                            </div>

                            </br></br></br>

                            <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                                <div class="btn-group" role="group">
                                    <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="searchPatient">Generate MC</button>
                                </div>
                                <div class="btn-group" role="group">
                                    <button type="reset" id="clearSearch" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button" >Clear</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>

<script>

    $('#mcType').on('change', function () {
        var id = $('#mcType').val();
        if (id === "PMI_NO") {
            $('#mcInput').attr('maxlength', '13');
        } else if (id === "NEW_IC_NO") {
            $('#mcInput').attr('maxlength', '12');
        } else if (id === "OLD_IC_NO") {
            $('#mcInput').attr('maxlength', '8');
        } else if (id === "004") {
            $('#mcInput').attr('maxlength', '10');
        } else if (id === "005") {
            $('#mcInput').attr('maxlength', '10');
        }
    });

    $('#searchPatient').on('click', function (e) {
        e.preventDefault();
        searchPatient();
    });

    function searchPatient() {

        var mcType = $("#mcType").val();
        var mcInput = $("#mcInput").val();
        
        var opt = $('#mcType option[disabled]:selected').val();

        //check if the input text or the select box is empty.

        if ($('#mcInput').val() === "" || $('#mcInput').val() === " ") {
            //if the id/ic input is empty
            bootbox.alert('Please key in PMI no. or IC no. or IDENTIFICATION no. to continue seaching process');
        } else if (opt === "-") {
            //if the select box is not selected
            bootbox.alert('Please select ID Type first.');
        } else {

            var mcType = $("#mcType").val();
            var mcInput = $("#mcInput").val();
            console.log(mcType);
            console.log(mcInput);

            window.open("mcReport.jsp?mcType=" + mcType + "&mcInput=" + mcInput);
        }
    }

    //event on click clear buton
    $('#clearSearch').click(function () {
        $('#mcType').reset();
        $('#mcInput').reset();
    });


</script>
