<%-- 
    Document   : searchPatient
    Created on : Feb 6, 2017, 2:53:34 PM
    Author     : shay
--%>

<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

        Conn conn = new Conn();

     String idTYpe11 = "select * from adm_lookup_detail where master_reference_code = '0012' ";
    ArrayList<ArrayList<String>> dataIdType12;
    dataIdType12 = conn.getData(idTYpe11);
    String dataSystemStatus155 = session.getAttribute("SYSTEMSTAT").toString();
%>
<div class="thumbnail">
    <form class="form-horizontal" name="myForm" id="myForm">
        <!-- Select Basic -->
        <div class="form-group">
            <label class="col-md-4 control-label" for="selectbasic">ID Type</label>
            <div class="col-md-4">
                <select id="idType" name="idType" class="form-control" required="">
                    <option selected="" disabled="" value="-"> Please select ID type</option>
                    <option value="pmino">PMI No</option>
                    <option value="icnew">IC No (NEW)</option>
                    <option value="icold">IC No (OLD)</option>
                    <!--<option value="matricno">Matric No</option>
                    <option value="staffno">Staff No</option>-->
                    <%                                if (dataSystemStatus155.equals("0")) {

                        } else if (dataSystemStatus155.equals("1")) {
                            for (int i = 0; i < dataIdType12.size(); i++) {%>
                    <option value="<%=dataIdType12.get(i).get(1)%>"><%=dataIdType12.get(i).get(2)%></option>
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
                <input type="text" class="form-control input-md" id="idInput" name="idInput" placeholder="ID" maxlength="0"/>
            </div>
            <button class="btn btn-primary" type="button" id="searchPatientOccu" name="searchPatientOccu"><i class="fa fa-search fa-lg"></i>&nbsp; Search</button>

        </div>

    </form>
</div>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<script type="text/javascript" src="./javascript.js"></script>
<script src="old/assets/js/OccuPatient.js" type="text/javascript"></script>
<script src="old/assets/js/onKeyPress.js" type="text/javascript"></script>
<script>
        //validate max length of input
        $('#idType').on('change', function (e) {
            var id = $('#idType').val();
            console.log(id);
            if (id === "pmino") {
                $('#idInput').attr('maxlength', '13');
                $('#idInput').on('keydown', function (evt) {
                    isNumberKey(evt);
                });
            } else if (id === "icnew") {
                $('#idInput').attr('maxlength', '12');
                $('#idInput').keypress(function (evt) {
                    isNumberKey(evt);
                });
            } else if (id === "icold") {
                $('#idInput').attr('maxlength', '8');
            } else if (id === "004") {
                $('#idInput').attr('maxlength', '10');
            } else if (id === "005") {
                $('#idInput').attr('maxlength', '10');
            }
        });
        //seaching patient function   
        function searchPatient() {

            var opt = $('#idType option[disabled]:selected').val();
            document.getElementById("ward").value = "";
            document.getElementById("bed").value = "";
            document.getElementById("pname").value = "";
            document.getElementById("pidno").value = "";
            document.getElementById("spn").value = "";

            $('#TransferForm')[0].reset();
//        $('#formPMI')[0].reset();
//        $('#kinform')[0].reset();
//        $('#empform')[0].reset();
//        $('#famForm')[0].reset();
//        $('#formMed')[0].reset();
//        $("table tbody").remove();

            //check if the input text or the select box is empty.

            if ($('#idInput').val() === "" || $('#idInput').val() === " ") {
                //if the id/ic input is empty
                bootbox.alert('Please key in PMI no. or IC no. or IDENTIFICATION no. to continue seaching process');
            } else if (opt === "-") {
                //if the select box is not selected
                bootbox.alert('Please select ID Type first.');
            } else {
                //if the select box is choosen and the input in key-in.

                //show loading icon
                $body.addClass("loading");

                //get value from text box and select box
                var idType = $('#idType').find(":selected").val();
                var idInput = $('#idInput').val();

                //run the MAIN ajax function
                $.ajax({
                    async: true,
                    type: "POST",
                    url: "resultPatientOccu.jsp",
                    data: {'idType': idType, 'idInput': idInput},
                    timeout: 10000,
                    success: function (list) {
                        //remove the loading 
                        $body.removeClass("loading");
                        console.log(list);
                        //show console the returned data


                        //split the data into an array
                        var array_data = String(list).split("|");

                        //function when the value that returned either empty/null or has value.
                        //customize this part only
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////           
                        Main(array_data);

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////                    
                    },
                    error: function (xhr, status, error) {
                        var err = eval("(" + xhr.responseText + ")");
                        bootbox.alert(err.Message);
                    }
                });
            }

        }
        ;

        //event on click search button
        $('#searchPatientOccu').on('click', function () {
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
        $('#clearSearch').click(function () {
            document.getElementById("ward").value = "";
            document.getElementById("bed").value = "";
            document.getElementById("pname").value = "";
            document.getElementById("pidno").value = "";
            document.getElementById("spn").value = "";
//        $('#myForm2')[0].reset();
            $("table tbody").remove();
        });
</script>