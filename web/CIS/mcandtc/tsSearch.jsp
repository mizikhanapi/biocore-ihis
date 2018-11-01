<%-- 
    Document   : tsSearch
    Created on : Nov 1, 2018, 3:59:19 AM
    Author     : Shammugam
--%>

<%@page import="dBConn.Conn"%>  
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String idTYpe = "select * from adm_lookup_detail where master_reference_code = '0012' AND hfc_cd = '" + hfc + "'";
    ArrayList<ArrayList<String>> dataIdType;
    Conn conn = new Conn();
    dataIdType = conn.getData(idTYpe);
    String dataSystemStatus = "1"; //session.getAttribute("SYSTEMSTAT").toString();
%>

<h4>Search Patient</h4>

<form class="form-horizontal" name="myForm" id="myForm">
    <!-- Select Basic -->
    <div class="form-group">
        <label class="col-md-4 control-label" for="selectbasic">ID Type</label>
        <div class="col-md-4">
            <select id="tsType" name="tsType" class="form-control" required="">
                <option selected="" disabled="" value="-"> Please select ID type</option>
                <%                                if (dataSystemStatus.equals("0")) {

                    } else if (dataSystemStatus.equals("1")) {
                        for (int i = 0; i < dataIdType.size(); i++) {%>
                <option value="<%=dataIdType.get(i).get(1)%>"><%=dataIdType.get(i).get(2)%></option>
                <%  }
                    }

                %>
            </select>
        </div>
    </div>

    <!-- Text input-->
    <div class="form-group">
        <label class="col-md-4 control-label" for="textinput">IC No. / ID No.</label>
        <div class="col-md-4">
            <input type="text" class="form-control input-md" id="tsInput" name="tsInput" placeholder="ID" maxlength=""/>
        </div>
    </div>
    <div class="text-center">
        <button class="btn btn-primary" type="button" id="searchPatientTs" name="searchPatient"><i class="fa fa-search fa-lg"></i>&nbsp; Search</button>

        <button id="clearSearchTs" name="clearSearch" type="clear" class="btn btn-default"><i class="fa fa-ban fa-lg"></i>&nbsp; Clear</button>
    </div>
</form>

<div id="tsTableDivisionDiv"></div>

<script>

    //validate max length of input
    $('#tsType').on('change', function () {

        var id = $('#tsType').val();

        if (id === "001") {
            $('#tsInput').attr('maxlength', '13');
        } else if (id === "002") {
            $('#tsInput').attr('maxlength', '12');
        } else if (id === "003") {
            $('#tsInput').attr('maxlength', '8');
        } else if (id === "004") {
            $('#tsInput').attr('maxlength', '10');
        } else if (id === "005") {
            $('#tsInput').attr('maxlength', '10');
        }

    });


    //event on click search button
    $('#searchPatientTs').on('click', function () {
        searchPatientTs();
    });


    //seaching patient function   
    function searchPatientTs() {

        var opt = $('#tsType option[disabled]:selected').val();

        //check if the input text or the select box is empty.

        if ($('#tsInput').val() === "" || $('#tsInput').val() === " ") {
            //if the id/ic input is empty
            alert('Please key in PMI no. or IC no. or IDENTIFICATION no. to continue seaching process');
        } else if (opt === "-") {
            //if the select box is not selected
            alert('Please select ID Type first.');
        } else {
            //if the select box is choosen and the input in key-in.
            $('<div class="loading">Loading</div>').appendTo('body');

            //get value from text box and select box
            var tsType = $('#tsType').find(":selected").val();
            var tsInput = $('#tsInput').val();

            var data = {
                'tsType': tsType,
                'tsInput': tsInput
            };

            $.ajax({
                async: true,
                type: "POST",
                url: "mcandtc/tsTable.jsp",
                data: data,
                timeout: 10000,
                success: function (list) {
                    $('#tsTableDivisionDiv').html(list);
                    $('.loading').hide();
                },
                error: function (xhr, status, error) {
                    var err = eval("(" + xhr.responseText + ")");
                    bootbox.alert(err.Message);
                }
            });


        }

    }


    //event on click clear buton
    $('#clearSearchTs').click(function () {
        $('#tsInput').prop('readonly', false);
        $('#myForm2')[0].reset();
        $('#myForm')[0].reset();
    });


    $('#tsTableDivisionDiv').off('click', '#tsTableDivision #TS_btnPrint').on('click', '#tsTableDivision #TS_btnPrint', function (e) {

        var row = $(this).closest("tr");
        var rowData = row.find("#dataTSListhidden").val();
        var arrayData = rowData.split("|");

        var data = {
            'name': arrayData[0],
            'episode': arrayData[1],
            'pmi': arrayData[2],
            'start_time': arrayData[3],
            'end_time': arrayData[4],
            'comment': arrayData[5],
            'ic': arrayData[6],
            'id': arrayData[7],
            'episodeDate': arrayData[8]
        };


        $.ajax({
            async: true,
            type: "POST",
            url: "mcandtc/tsReport.jsp",
            timeout: 10000,
            data: data,
            success: function (list) {

                $('#tsDisplayModalPrintContent').html(list);
                $('#tsDisplayModal').modal('show');

            },
            error: function (xhr, status, error) {
                var err = eval("(" + xhr.responseText + ")");
                bootbox.alert(err.Message);
            }
        });

    });


    $('#tsDisplayModal').off('click', '#tsDisplayModalPrintBtn').on('click', '#tsDisplayModalPrintBtn', function (e) {

        printMCSlip();

    });



    function printMCSlip() {

        var divElements = $('#tsDisplayModalPrintContent').html();
        var popupWin = window.open('', '_blank');
        popupWin.document.open();
        popupWin.document.write('<html><head><title>Print Time Slip</title></head><body>' + divElements + '</body></html>');
        popupWin.document.close();
        popupWin.focus();
        popupWin.print();
        popupWin.close();

    }



</script>