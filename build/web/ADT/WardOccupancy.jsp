
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="Config.connect"%>
<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>

<%--<%@page contentType="text/html" pageEncoding="UTF-8"%>--%>

<%
    String idTYpe = "select * from adm_lookup_detail where master_reference_code = '0012' ";
    ArrayList<ArrayList<String>> dataIdType;
//    Conn conn = new Conn();
    dataIdType = conn.getData(idTYpe);
    String dataSystemStatus15 = session.getAttribute("SYSTEMSTAT").toString();


%>



<div class="row" id="transfer_Patient">
    <div class="col-md-12">
         <%@include file = "searchPatientTransfer.jsp" %>

            <%@include file = "searchWardTransfer.jsp" %>

        <div class="text-center">
            <button id="clearSearch" name="clearSearch" type="button" class="btn btn-default"><i class="fa fa-ban fa-lg"></i>&nbsp; Clear</button>
            <button id="button2id" name="button2id" type="button" class="btn btn-success "><i class="fa fa-user fa-lg"></i>&nbsp; Read MyKad Info</button>

        </div>
        </form>
    </div>







</div>
</div>

<!--</div>-->

<!--</div>-->
<!-- main -->		

<!--</div>-->





<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://www.w3schools.com/lib/w3data.js"></script>
<script src="bootstrap-3.3.6-dist/js/jquery.dataTables.min.js"></script>

<script src="assets/js/IPMain.js" type="text/javascript"></script>
<script src="assets/js/onKeyPress.js" type="text/javascript"></script>
<script>w3IncludeHTML();</script>  
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
        $('#myOccupancyForm')[0].reset();


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
    $('#clearSearch').click(function () {
        $('#myForm2')[0].reset();
        $("table tbody").remove();
    });
</script>
</body>



