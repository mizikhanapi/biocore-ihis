<%@page import="ADM_helper.MySessionKey"%>
<%@page import="Config.Config"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="main.RMIConnector"%>
<%@page import="Config.connect"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.sql.*"%>

<%
            //Conn conn = new Conn();
    String hfcAS = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String idAS = session.getAttribute("USER_ID").toString();
    String disAS = session.getAttribute("DISCIPLINE_CODE").toString();
    String subAS = session.getAttribute("SUB_DISCIPLINE_CODE").toString();
    String disNameAS = (String) session.getAttribute(MySessionKey.DISCIPLINE_NAME);
    
    Conn conn = new Conn();

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
        <button class="btn btn-success" id="BED_btnModalAdd" style=" padding-right: 10px;padding-left: 10px;color: white;"><a data-toggle="tooltip" data-placement="top" title="Add Items" id="test"><i class=" fa fa-plus" style=" padding-right: 10px;padding-left: 10px;color: white;"></i></a>ASSIGN BED</button>
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
                <div id="maintainBED">

                    <!-- content goes here -->
                    <form class="form-horizontal" id="addForm">

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Discipline *</label>
                            <div class="col-md-6">
                                <input id="DisAss" name="Dis" placeholder="Insert Discipline Code"  type="text"  class="form-control input-md" readonly value="<%=disAS%> | <%=disNameAS%>">
                                <div id="disListAss" class="search-drop"></div>
                            </div>

                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Ward Class</label>
                            <div class="col-md-6">
                                <select id="Ward_Class" name="selectbasic" class="form-control">
                                    <option value="Ward Class" >Ward Class</option>

                                    <%                                       
                                  //       String sql124 = "SELECT ward_class_code, ward_class_name FROM wis_ward_class where hfc_cd ='" + hfcAS + "' AND discipline_cd='"+disAS+"';";
                                        String sql124 = "SELECT ward_class_code, ward_class_name FROM wis_ward_class where hfc_cd ='" + hfcAS + "' ;";
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
                            <div class="col-md-6" id="divwardName">
                                <select id="Ward_ID" name="selectbasic" class="form-control">
                                    <option value="null" selected="" disabled="">Select Ward ID/Name</option>
                                    <%
                                        String sql312 = "SELECT ward_id, ward_name FROM wis_ward_name where hfc_cd = '" + hfcAS + "' AND discipline_cd='"+disAS+"' ;";
                                        //String sql312 = "SELECT ward_id, ward_name FROM wis_ward_name where hfc_cd = '" + hfcAS + "'";
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
                            <div class="col-md-6">
                                <input id="BedID" class="form-control" maxlength="200" placeholder="Generic Name">
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
                                    <input type="radio" name="status" id="status1" value="Available" checked>
                                    Available 
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
<!--<script src="bootstrap-3.3.6-dist/js/jquery.dataTables.min.js"></script>-->
<!--
<script src="searchDiscipline.jsp"></script>
<script src="old/assets/js/searchDisipline.js" type="text/javascript"></script>-->
<!--      <script src="old/assets/js/dataTables.bootstrap.min.js"></script>-->
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
     $('#BED_btnModalAdd').on('click', function(){
            $('#beddetail').modal('show');
        });

        $("#DisAss").on('keyup', function () { // everytime keyup event
            var input = $(this).val(); // We take the input value
            var hfc = $("#Rhfc").val();

            if (input.length >= 1) { // Minimum characters = 2 (you can change)
                $('#disListAss').html('<img src="libraries/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
                var dataFields = {input: input, hfc: hfc}; // We pass input argument in Ajax
                $.ajax({
                    type: "POST",
                    url: "searchDiscipline.jsp", // call the php file ajax/tuto-autocomplete.php
                    data: dataFields, // Send dataFields var
                    timeout: 3000,
                    success: function (dataBack) { // If success
                        $('#disListAss').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                        $('#matchListDis li').on('click', function () { // When click on an element in the list
                            //$('#masterCode2').text($(this).text()); // Update the field with the new element
                            $('#DisAss').val($(this).text());
                            $('#disListAss').text(''); // Clear the <div id="match"></div>
                            var arrayData = $('#DisAss').val().split("|");
                            //console.log(arrayData);
                            //console.log(arrayData[0].trim());
                            //console.log(arrayData[1].trim());
                        });
                    },
                    error: function () { // if error
                        $('#disListAss').text('Problem!');
                    }
                });
            } else {
                $('#disListAss').text(''); // If less than 2 characters, clear the <div id="match"></div>
            }

        });

        var BedID = "";


//        $('#Dis').on('change', function () {
//            //bootbox.alert("Discipline Ward");
//            BedID = $('#Dis').val() + "/";
//            $('#BedID').val(BedID);
//        });
        $('#Ward_Class').on('change', function () {
            //bootbox.alert("Ward Class");
            var ward = $('#Ward_Class').val();
            console.log(ward);
            $.ajax({
                url: 'listWardName.jsp',
                type: 'post',
                data: {ward: ward},
                timeout: 3000,
                success: function (databack) {
                    $('#divwardName').html(databack);
                    //console.log(databack);
                },
                error: function () {
                    bootbox.alert('error when retrieving the data');
                }
            });
            BedID = $('#Ward_Class').val() + "/";
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
            var Dis = $('#DisAss').val();
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


            console.log(status);
//            if (Dis === "") {
//                bootbox.alert("Complete The Discipline Fields");
//            } else
            if (Ward_Class === "") {
                bootbox.alert("Complete Ward Class The Fields");
            } else if (Ward_ID === "") {
                bootbox.alert("Complete The Ward ID Fields");
            } else if (BedID === "") {
                bootbox.alert("Complete The Bed ID Fields");
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
                                message: "Bed information successfully added",
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
                                message: "Sorry, the Bed ID already exist. Would you mind choosing a different Bed ID.",
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