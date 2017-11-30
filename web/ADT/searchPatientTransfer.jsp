<%-- 
    Document   : searchPatient
    Created on : Feb 6, 2017, 2:53:34 PM
    Author     : shay
--%>

<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    String idTYpe2 = "select * from adm_lookup_detail where master_reference_code = '0012' AND hfc_cd = '" + hfc + "' ";
    ArrayList<ArrayList<String>> dataIdType2;
    ArrayList<ArrayList<String>> data2 = new ArrayList();
    //String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    //Conn conn = new Conn();
    dataIdType2 = conn.getData(idTYpe2);
    //out.print(dataIdType);
    String dataSystemStatus2 = session.getAttribute("SYSTEM_PARAMETER").toString();
    //out.print(dataSystemStatus2);
%>

<form class="form-horizontal" name="myForm" id="searchByIdForm">
    <!-- Select Basic -->
    <div class="form-group">
        <label class="col-md-4 control-label" for="selectbasic">ID Type</label>
        <div class="col-md-4">
            <select id="idType" name="idType" class="form-control" required="">
                <option selected="" disabled="" value="-"> Please select ID type</option>
                <!--                <option value="pmino">PMI No</option>
                                <option value="icnew">IC No (NEW)</option>
                                <option value="icold">IC No (OLD)</option>
                                <option value="matricno">Matric No</option>
                                <option value="staffno">Staff No</option>-->
                <%  if (dataSystemStatus2.equals("0")) {

                    } else if (dataSystemStatus2.equals("1")) {
                        data2 = dataIdType2;
                    }
                    for (int i = 0; i < data2.size(); i++) {%>
                <option value="<%=data2.get(i).get(1)%>"><%=data2.get(i).get(2)%></option>
                <%  }
                %>
            </select>
        </div>
    </div>

    <!-- Text input-->
    <div class="form-group">
        <label class="col-md-4 control-label" for="textinput">IC No. / ID No.</label>
        <div class="col-md-4">
            <input type="text" class="form-control input-md" id="idInput" name="idInput" placeholder="ID" maxlength="0"/>
        </div>
    </div>
    <div class="text-center">
        <button class="btn btn-primary" type="button" id="searchPatient" name="searchPatient"><i class="fa fa-search"></i>&nbsp; Search</button>

        <button id="clearSearchByID" name="clearSearch" type="button" class="btn btn-default"><i class="fa fa-times"></i>&nbsp; Clear</button>
    </div>
</form>



<script>

    $(function () {

        //validate max length of input
        $('#idType').on('change', function (e) {
            var id = $('#idType').val();
            console.log(id);
            if (id === "001") {
                $('#idInput').attr('maxlength', '13');

//            $("#idInput").on('keydown',function (e) {
//                //if the letter is not digit then display error and don't type anything
//                if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
//                    //display error message
//                    $("#errmsg").html("Digits Only").show().fadeOut("slow");
//                    return false;
//                }
//            });
            } else if (id === "002") {
                $('#idInput').attr('maxlength', '12');

//            $("#idInput").on('keydown',function (e) {
//                //if the letter is not digit then display error and don't type anything
//                if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
//                    //display error message
//                    return false;
//                }
//            });
            } else if (id === "003") {
                $('#idInput').attr('maxlength', '8');
//            $("#idInput").on('keydown',function (e) {
//                if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57) &&(e.which <97 || e.which > 122)) {
//                    //display error message
//                    $("#errmsg").html("Digits Only").show().fadeOut("slow");
//                    return false;
//                }
//            });

            } else {
                $('#idInput').attr('maxlength', '10');
//            $("#idInput").on('keydown',function (e) {
//                if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57) && (e.which <97 || e.which > 122)) {
//                    //display error message
//                    $("#errmsg").html("Digits Only").show().fadeOut("slow");
//                    return false;
//                }
//            });
            }
        });
        //seaching patient function   
        function searchPatient() {
            var methodSearch = "1";
            var opt = $('#idType option[disabled]:selected').val();

            //check if the input text or the select box is empty.

            if ($('#idInput').val() === "" || $('#idInput').val() === " ") {
                //if the id/ic input is empty
                bootbox.alert('Please key in PMI no. or IC no. or IDENTIFICATION no. to continue seaching process');
            } else if (opt === "-") {
                //if the select box is not selected
                bootbox.alert('Please select ID Type first.');
            } else {
                //if the select box is choosen and the input in key-in.
              
                //get value from text box and select box
                var idType = $('#idType').find(":selected").val();
                var idInput = $('#idInput').val();

                //run the MAIN ajax function
                createScreenLoading();
                $.ajax({
                    type: "POST",
                    url: "resultWard.jsp",
                    data: {'idType': idType, 'idInput': idInput, 'methodSearch': methodSearch},
                    timeout: 10000,
                    success: function (databack) {
                        $("#WardOccuTable").html(databack);
                    },
                    error: function (xhr, status, error) {
                        var err = eval("(" + xhr.responseText + ")");
                        //bootbox.alert(err.Message);
                    },
                    complete: function (jqXHR, textStatus ) {
                        destroyScreenLoading();
                    }
                });
            }

        }        

        //event on click search button
        $('#searchPatient').on('click', function () {
            //console.log("lalu sini");
            searchPatient();
            //console.log(" sudah lalu sini");
        });

        //event when press ENTER after inserting the ID
        $("#idInput").on("keydown", function (e) {
            var code = e.keyCode;

            if (code === 13) {
                e.preventDefault();
                searchPatient();

            }
        });

        //event on click clear buton
        $('#clearSearchByID').click(function () {

            $('#searchByIdForm')[0].reset();
           
        });

    });



</script>