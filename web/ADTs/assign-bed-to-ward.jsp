


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
    <link rel="stylesheet" href="old/assets/datepicker/jquery-ui.css">
    <script src="old/assets/js/jquery.min.js"></script>
    <!-- Custom styles for this template -->

    <link rel="stylesheet" href="old/assets/css/loading.css">
    <link href="old/assets/datepicker/jquery-ui.css" rel="stylesheet">    
    <script src="old/assets/datepicker/jquery-ui.js"></script>
    <script src="old/assets/js/form-validator.min.js"></script>
    <script src="old/assets/js/bootstrap.min.js"></script> 

    <script src="old/assets/js/w3data.js"></script>
    <script src="old/assets/js/bootbox.min.js"></script>   

    <!-- header -->
    <%@include file = "../assets/header.html" %>

    <!-- header -->
</head>

<%
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String id = session.getAttribute("USER_ID").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
    String sub = session.getAttribute("SUB_DISCIPLINE_CODE").toString();

%>
<input type="hidden" value="<%=hfc%>" id="Rhfc">
<input type="hidden" value="<%=id%>" id="Rid">
<input type="hidden" value="<%=dis%>" id="Rdis">
<input type="hidden" value="<%=sub%>" id="Rsub">
<%
    Conn conn = new Conn();

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


<!-- Add Modal Start -->
<div class="modal fade" id="beddetail" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Assign Bed To Ward</h3>
            </div>
            <div class="modal-body">
                <div class="thumbnail" id="maintainBED">

                    <!-- content goes here -->
                    <form class="form-horizontal" id="addForm">

                      <!-- Select Basic -->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="selectbasic">Discipline *</label>
                                <div class="col-md-6">
                                    <input id="Dis" name="Dis" type="text"  class="form-control input-md">
                                    <div id="disList"></div>
                                </div>

                            </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Ward Class</label>
                            <div class="col-md-4">
                                <select id="Ward_Class" name="selectbasic" class="form-control">
                                    <option value="Ward Class" >Ward Class</option>

                                    <%
                                        String sql124 = "SELECT ward_class_code, ward_class_name FROM wis_ward_class";
                                        ArrayList<ArrayList<String>> dataClass = conn.getData(sql124);

                                        int size124 = dataClass.size();

                                        for (int i = 0; i < size124; i++) {
                                    %>
                                    <option value="<%= dataClass.get(i).get(0)%>"><%= dataClass.get(i).get(0)%> ( <%= dataClass.get(i).get(1)%> )</option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Ward ID/Name</label>
                            <div class="col-md-4">
                                <select id="Ward_ID" name="selectbasic" class="form-control">
                                    <option value="null" selected="" disabled="">Select Ward ID/Name</option>
                                    <%
                                        String sql312 = "SELECT ward_id, ward_name FROM wis_ward_name";
                                        ArrayList<ArrayList<String>> dataID = conn.getData(sql312);

                                        int size312 = dataID.size();

                                        for (int i = 0; i < size312; i++) {
                                    %>
                                    <option value="<%= dataID.get(i).get(0)%>"><%= dataID.get(i).get(0)%> ( <%= dataID.get(i).get(1)%> ) </option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                        </div>   

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Bed ID</label>
                            <div class="col-md-8">
                                <textarea id="BedID" class="form-control" rows="3" maxlength="200" placeholder="Generic Name"></textarea>
                                </br>

                                <!--
                                                                <button id="gen_bedID" class="btn btn-success" data-status="pagado" data-toggle="modal" data-id="1" data-target="#detail" 
                                                                        style=" padding-right: 10px;padding-left: 10px;color: white;"><a data-toggle="tooltip" data-placement="top" title="Add Items" id="test">
                                                                        <i class=" fa fa-plus" style=" padding-right: 10px;padding-left: 10px;color: white;"></i></a>Generate Bed ID</button>-->

                            </div>
                        </div>
                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Bed Status</label>
                            <div class="col-md-8">
                                <label class="radio-inline">
                                    <input type="radio" name="status" id="status1" value="Available">
                                    Available 
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="status" id="status2" value="Pending">
                                    Pending
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="status" id="status3" value="Occupied">
                                    Occupied
                                </label>
                            </div>
                        </div>
                    </form>
                    <!-- content goes here -->
                </div>
                <div class="modal-footer">
                    <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                        <div class="btn-group" role="group">
                            <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="MWBED_add">Add</button>
                        </div>
                        <div class="btn-group" role="group">
                            <button type="reset" id="MWBED_clear" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button" >Cancel</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="bootstrap-3.3.6-dist/js/jquery.dataTables.min.js"></script>
<script src="searchDiscipline.jsp"></script>
<script src="old/assets/js/searchDisipline.js" type="text/javascript"></script>

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


        var BedID = "";


//        $('#Dis').on('change', function () {
//            //bootbox.alert("Discipline Ward");
//            BedID = $('#Dis').val() + "/";
//            $('#BedID').val(BedID);
//        });
        $('#Ward_Class').on('change', function () {
            //bootbox.alert("Ward Class");
            BedID = $('#Ward_Class').val() + "/";
            $('#BedID').val(BedID);
        });
        $('#Ward_ID').on('change', function () {
            //bootbox.alert("Ward ID");
            BedID += $('#Ward_ID').val() + "/";
            $('#BedID').val(BedID);
        });
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


        $('#MWBED_add').on('click', function () {
            var Dis = $('#Dis').val();
            var array_dis = Dis.split("|");
            var Dis = array_dis[0];
            var Ward_Class = $('#Ward_Class').val();
            var Ward_ID = $('#Ward_ID').val();
            var BedID = $('#BedID').val();
            var status = $('input[name="status"]:checked').val();
            var hfc = $("#Rhfc").val();
            var createdBy = $("#Rid").val();
            var dis = $("#Rdis").val();
            var sub = $("#Rsub").val();
            //var hfc = $('#hfc').val();
            // var discipline = $('#discipline').val();
            //var subDicipline = $('#subDicipline').val();


            console.log(Dis);
//            if (Dis === "") {
//                bootbox.alert("Complete The Discipline Fields");
//            } else
             if (Ward_Class === "") {
                bootbox.alert("Complete Ward Class The Fields");
            } else if (Ward_ID === "") {
                bootbox.alert("Complete The Ward ID Fields");
            } else if (BedID === "") {
                bootbox.alert("Complete The Bed ID Fields");
            } else if (status !== "Available" && status !== "Pending" && status !== "Occupied") {
                bootbox.alert("Select Any Status");
            } else {

                var data = {
                    Dis: Dis,
                    Ward_Class: Ward_Class,
                    Ward_ID: Ward_ID,
                    BedID: BedID,
                    status: status,
                    hfc: hfc,
                    createdBy: createdBy,
                    dis: dis,
                    sub: sub
                };
                console.log(data);

                $.ajax({
                    url: "assignBedInsert.jsp",
                    type: "post",
                    data: data,
                    timeout: 10000,
                    success: function (data) {

                        console.log(data);

                        if (data.trim() === 'Success') {

                            $("#AssignBedTable").load("assign-bed-to-ward-table.jsp");
                            $('#beddetail').modal('hide');
                            $(".modal-backdrop").hide();

                            bootbox.alert({
                                message: "Successfully added",
                                title: "Process Result",
                                backdrop: true
                            });
                            reset();

                        } else if (data.trim() === 'Failed') {
                            bootbox.alert({
                                message: "Add Failed",
                                title: "Process Result",
                                backdrop: true
                            });
                            $('#beddetail').modal('hide');
                            reset();

                        } else if (data.trim() === 'Duplicate') {
                            bootbox.alert({
                                message: "Bed ID Duplication Detected. Please Coose A Different Bed ID",
                                title: "Process Result",
                                backdrop: true
                            });

                        }

                    }, error: function (err) {
                        console.log("Ajax Is Not Success");

                    }

                });

            }

        });


        //function to clear the form when click clear button

        function reset() {
//            document.getElementById("Discipline").value = "";
//            document.getElementById("Ward_Class").value = "";
//            document.getElementById("Ward_ID").value = "";
//            document.getElementById("BedID").value = "";
//            document.getElementById("status1").checked = false;
//            document.getElementById("status2").checked = false;
//            document.getElementById("status3").checked = false;

            document.getElementById("addForm").reset();
        }

        $('#MWBED_clear').on('click', function (e) {
            e.preventDefault();
            reset();


        });


    });


</script> 
<br>



</body>
</html>