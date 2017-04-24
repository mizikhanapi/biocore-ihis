<%-- 
    Document   : searchDataAnalysis
    Created on : Apr 23, 2017, 9:08:22 PM
    Author     : user
--%>

<%@page import="dBConn.Conn"%>  
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String idTYpe = "select * from adm_lookup_detail where master_reference_code = '0012' ";
    ArrayList<ArrayList<String>> dataIdType;
    Conn conn = new Conn();
    dataIdType = conn.getData(idTYpe);
    String dataSystemStatus = "1"; //session.getAttribute("SYSTEMSTAT").toString();
%>
<div class="thumbnail">
    <h4>Search Patient
<!--        <button id="button2id" name="button2id" class="btn btn-success pull-right"><i class="fa fa-user fa-lg"></i>&nbsp; Read MyKad Info</button>-->
    </h4>
    <form class="form-horizontal" name="myForm" id="myForm">
        <!-- Select Basic -->
        <div class="form-group">
            <label class="col-md-4 control-label" for="selectbasic">ID Type</label>
            <div class="col-md-4">
                <select id="daType" name="daType" class="form-control" required="">
                    <option selected="" disabled="" value="-"> Please select ID type</option>
                    <option value="pmino">PMI No</option>
                    <option value="icnew">IC No (NEW)</option>
                    <option value="icold">IC No (OLD)</option>
                    <option value="matricno">Matric No</option><!--
                    <option value="staffno">Staff No</option>-->
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
                <input type="text" class="form-control input-md" id="daInput" name="daInput" placeholder="ID" maxlength="0"/>
            </div>
        </div>
        <div class="text-center">
            <button class="btn btn-primary" type="button" id="searchPatient" name="searchPatient"><i class="fa fa-search fa-lg"></i>&nbsp; Search</button>

            <button id="clearSearch" name="clearSearch" type="button" class="btn btn-default"><i class="fa fa-ban fa-lg"></i>&nbsp; Clear</button>
        </div>
    </form>
</div>


<script>
    //validate max length of input
    $('#daType').on('change', function () {
        var id = $('#daType').val();
        if (id === "pmino") {
            $('#daInput').attr('maxlength', '13');
        } else if (id === "icnew") {
            $('#daInput').attr('maxlength', '12');
        } else if (id === "icold") {
            $('#daInput').attr('maxlength', '8');
        } else if (id === "004") {
            $('#daInput').attr('maxlength', '10');
        } else if (id === "005") {
            $('#daInput').attr('maxlength', '10');
        }
    });


    //event on click search button
    $('#searchPatient').on('click', function () {
        searchPatient();
    });


    //seaching patient function   
    function searchPatient() {

        var opt = $('#daType option[disabled]:selected').val();

        //check if the input text or the select box is empty.

        if ($('#daInput').val() === "" || $('#daInput').val() === " ") {
            //if the id/ic input is empty
            bootbox.alert('Please key in PMI no. or IC no. or IDENTIFICATION no. to continue seaching process');
        } else if (opt === "-") {
            //if the select box is not selected
            bootbox.alert('Please select ID Type first.');
        } else {
            //if the select box is choosen and the input in key-in.

            //get value from text box and select box
            var daType = $('#daType').find(":selected").val();
            var daInput = $('#daInput').val();

            //run the MAIN ajax function
            $.ajax({
                async: true,
                type: "POST",
                url: "mcTable.jsp",
                data: {'daType': daType, 'daInput': daInput},
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
    $("#daInput").on("keydown", function (e) {

        var code = e.keyCode;
        if (code === 13) {
            e.preventDefault();
            searchPatient();
        }

    });


    //event on click clear buton
    $('#clearSearch').click(function () {
        $('#daInput').prop('readonly', false);
        $('#myForm2')[0].reset();
        $('#myForm')[0].reset();
    });
</script>