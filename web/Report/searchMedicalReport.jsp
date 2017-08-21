<%-- 
    Document   : searchMc
    Created on : Augt,15 2017, 3:16:53 PM
    Author     : shay
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

<h4>Search Patient
    <!--        <button id="button2id" name="button2id" class="btn btn-success pull-right"><i class="fa fa-user fa-lg"></i>&nbsp; Read MyKad Info</button>-->
</h4>
<form class="form-horizontal" name="myForm" id="myForm">
    <!-- Select Basic -->
    <div class="form-group">
        <label class="col-md-4 control-label" for="selectbasic">ID Type</label>
        <div class="col-md-4">
            <select id="mcType" name="mcType" class="form-control" required="">
                <option selected="" disabled="" value="-"> Please select ID type</option>
                <%  if (dataSystemStatus.equals("0")) {

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
            <input type="text" class="form-control input-md" id="mcInput" name="mcInput" placeholder="ID" maxlength=""/>
        </div>
    </div>
    <div class="text-center">
        <button class="btn btn-primary" type="button" id="searchPatient" name="searchPatient"><i class="fa fa-search fa-lg"></i>&nbsp; Search</button>

        <button id="clearSearch" name="clearSearch" type="clear" class="btn btn-default"><i class="fa fa-ban fa-lg"></i>&nbsp; Clear</button>
    </div>
</form>


<script>
    //validate max length of input
    $('#mcType').on('change', function () {
        var id = $('#mcType').val();
        if (id === "001") {
            $('#mcInput').attr('maxlength', '13');
        } else if (id === "002") {
            $('#mcInput').attr('maxlength', '12');
        } else if (id === "003") {
            $('#mcInput').attr('maxlength', '8');
        } else if (id === "004") {
            $('#mcInput').attr('maxlength', '10');
        } else if (id === "005") {
            $('#mcInput').attr('maxlength', '10');
        }
    });


    //event on click search button
    $('#searchPatient').on('click', function () {
        searchPatient();
    });


    //seaching patient function   
    function searchPatient() {
        var opt = $('#mcType option[disabled]:selected').val();

        //check if the input text or the select box is empty.

        if ($('#mcInput').val() === "" || $('#mcInput').val() === " ") {
            //if the id/ic input is empty
            alert('Please key in PMI no. or IC no. or IDENTIFICATION no. to continue seaching process');
        } else if (opt === "-") {
            //if the select box is not selected
            alert('Please select ID Type first.');
        } else {
            //if the select box is choosen and the input in key-in.

            //get value from text box and select box
            var mcType = $('#mcType').find(":selected").val();
            var mcInput = $('#mcInput').val();

            //run the MAIN ajax function
            $.ajax({
                async: true,
                type: "POST",
                url: "medicalTable.jsp",
                data: {'mcType': mcType, 'mcInput': mcInput},
                timeout: 10000,
                success: function (list) {

                    //split the data into an array
                    //function when the value that returned either empty/null or has value.
                    //customize this part only
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                    $('#mcTableDivision').html(list);

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                },
                error: function (xhr, status, error) {
                    var err = eval("(" + xhr.responseText + ")");
                    bootbox.alert(err.Message);
                }
            });
        }
    }


    //event when press ENTER after inserting the ID
    $("#mcInput").on("keydown", function (e) {

        var code = e.keyCode;
        if (code === 13) {
            e.preventDefault();
            searchPatient();
        }

    });


    //event on click clear buton
    $('#clearSearch').click(function () {
        $('#mcInput').prop('readonly', false);
        $('#myForm2')[0].reset();
        $('#myForm')[0].reset();
    });
</script>