<%@page import="Config.Config"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="main.RMIConnector"%>
<%@page import="Config.connect"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.sql.*"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!--    <script src="old/assets/js/jquery.min.js"></script>-->
    <!--    <link rel="stylesheet" href="old/assets/datepicker/jquery-ui.css">-->

    <!-- Custom styles for this template -->

    <!--    <link rel="stylesheet" href="old/assets/css/loading.css">
        <link href="old/assets/datepicker/jquery-ui.css" rel="stylesheet">    
        <script src="old/assets/datepicker/jquery-ui.js"></script>
        <script src="old/assets/js/form-validator.min.js"></script>
        <script src="old/assets/js/bootstrap.min.js"></script> 
    
        <script src="old/assets/js/w3data.js"></script>
        <script src="old/assets/js/bootbox.min.js"></script>   -->

    <!-- header -->


    <!-- header -->
</head>
<%
    String hfcAS = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String idAS = session.getAttribute("USER_ID").toString();
    String disAS = session.getAttribute("DISCIPLINE_CODE").toString();
    String subAS = session.getAttribute("SUB_DISCIPLINE_CODE").toString();

%>
<input type="hidden" value="<%=hfcAS%>" id="Rhfc">
<input type="hidden" value="<%=idAS%>" id="Rid">
<input type="hidden" value="<%=disAS%>" id="Rdis">
<input type="hidden" value="<%=subAS%>" id="Rsub">
<%
//    Conn conn = new Conn();

//    String sql25 = "SELECT DISTINCT discipline_cd FROM adm_hfc_discipline";
//    ArrayList<ArrayList<String>> dataDiscipline44 = conn.getData(sql25);
%>

<h4 style="padding-top: 30px;padding-bottom: 35px; font-weight: bold">
    MAINTAIN WARD/ ASSIGN BED
    <span class="pull-right">
        <button class="btn btn-success" data-status="pagado" data-toggle="modal" data-id="1" data-target="#beddetail" style=" padding-right: 10px;padding-left: 10px;color: white;"><a data-toggle="tooltip" data-placement="top" title="Add Items" id="test"><i class=" fa fa-plus" style=" padding-right: 10px;padding-left: 10px;color: white;"></i></a>ASSIGN BED</button>
    </span>
</h4>
<!-- Add Button End -->



<script>

//        $('#Ward_Class').on('change', function () {
//            alert("ff");
//            BedID = $('#Ward_Class').val();
//            $('#BedID').val(BedID);
//        });

    $(document).ready(function () {
//        $('#Discipline').on('change',function(){
//           console.log(this.val());
//        });






//        $('#Dis').on('change', function () {
//            //bootbox.alert("Discipline Ward");
//            BedID = $('#Dis').val() + "/";
//            $('#BedID').val(BedID);
//        });



//        $('#gen_bedID').on('click', function () {
//
//            $.ajax({
//                url: 'genBedID.jsp',
//                type: 'POST',
//                timeout: 5000,
//                success: function (data) {
//
//                    $('#BedID').val(data.trim());
//                },
//                error: function (err) {
//
//                    console.log("Ajax Is Not Success");
//                }
//            });
//        });


        $('#test').on('click', function () {
          
           

                var data = {
                   
                };
                console.log(data);

                $.ajax({
                    url: "assign-bed-to-ward.jsp",
                    type: "post",
                    data: data,
                    timeout: 10000,
                    success: function (data) {

                        console.log(data);

                     

                    }, error: function (err) {
                        console.log("Ajax Is Not Success");

                    }

                });

            }

        });


        //function to clear the form when click clear button





    });


</script> 
<br>



</body>
</html>