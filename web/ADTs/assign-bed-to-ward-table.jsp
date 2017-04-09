<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page session="true" %>

<div id="tableassignBedTable" class="form-group">



    <table id="assignBedTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">


        <thead>


        <th>Discipline</th>
        <th>Ward Class</th>
        <th>Ward Name</th>
        <th>Bed ID</th>
        <th>Bed Status</th>
        <th>Update</th>
        <th>Delete</th>
        </thead>
        <tbody>

            <%
                Conn conn = new Conn();

                String sqlbed = "SELECT discipline_cd, ward_class_code, ward_id, bed_id, bed_status,hfc_cd FROM wis_bed_id";
                ArrayList<ArrayList<String>> databed = conn.getData(sqlbed);

                int size29 = databed.size();
                for (int i = 0; i < size29; i++) {
            %>


            <tr>

        <input id="dataAssignBedhidden" type="hidden" value="<%=String.join("|", databed.get(i))%>">
        <td><%= databed.get(i).get(0)%></td>
        <td><%= databed.get(i).get(1)%></td>
        <td><%= databed.get(i).get(2)%></td>
        <td><%= databed.get(i).get(3)%></td>
        <td><%= databed.get(i).get(4)%></td>
        <td>
            <!-- Update Part Start -->
            <a id="MWBed_edit" data-toggle="modal" data-target="#assignBedUpdateModal"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
            <!-- Update Part End -->
        </td>
        <td>
            <!-- Delete Button Start -->
            <a id="BED_delete" class="testing"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;" ></i></a>
            <!-- Delete Button End -->
        </td>
        </tr>
        <%
            }

        %>
        </tbody>
    </table>
</div>
<!-- Modal Update -->
<div class="modal fade" id="assignBedUpdateModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Update Assign Bed Details</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal">

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
                            <select id="updateWard_ClassBed" name="selectbasic" class="form-control">
                                <option value="Ward Class" >Ward Class</option>

                                <%                                    String sql101 = "SELECT ward_class_code, ward_class_name FROM wis_ward_class";
                                    ArrayList<ArrayList<String>> dataClass02 = conn.getData(sql101);

                                    int size304 = dataClass02.size();

                                    for (int i = 0; i < size304; i++) {
                                %>
                                <option value="<%= dataClass02.get(i).get(0)%>"><%= dataClass02.get(i).get(0)%> ( <%= dataClass02.get(i).get(1)%> )</option>
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
                            <select id="updateWard_IDBed" name="selectbasic" class="form-control">
                                <option value="null" selected="" disabled="">Select Ward ID/Name</option>
                                <%
                                    String sql223 = "SELECT ward_id, ward_name FROM wis_ward_name";
                                    ArrayList<ArrayList<String>> dataID223 = conn.getData(sql223);

                                    int size26 = dataID223.size();

                                    for (int i = 0; i < size26; i++) {
                                %>
                                <option value="<%= dataID223.get(i).get(0)%>"><%= dataID223.get(i).get(0)%> ( <%= dataID223.get(i).get(1)%> ) </option>
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
                            <textarea id="updateBedIDBed" class="form-control" readonly rows="3" maxlength="200" placeholder="Generic Name"></textarea>
                        </div>
                    </div>
                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Bed Status</label>
                        <div class="col-md-4">
                            <select class="form-control" name="status" id="updatestatusBed">
                                <option value="Available">Available</option>
                                <option value="Pending">Pending</option>
                                <option value="Occupied">Occupied</option>
                            </select>
                        </div>
                    </div>
                </form>
                <!-- content goes here -->
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="updateBedButton">Update</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="reset" id="BedReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="bootstrap-3.3.6-dist/js/jquery.dataTables.min.js"></script>
<script src="searchDiscipline.jsp"></script>
<script src="old/assets/js/searchDisipline.js" type="text/javascript"></script>

<script type="text/javascript">

    $(document).ready(function () {
        //function to edit facility type from table

        // var row;

        $('#AssignBedTable').off('click', '#assignBedTable #MWBed_edit').on('click', '#assignBedTable #MWBed_edit', function (e) {
            e.preventDefault();
            //go to the top

            //get the row value
            var row = $(this).closest("tr");
            var rowData = row.find("#dataAssignBedhidden").val();
            var arrayData = rowData.split("|");
            console.log(arrayData);
            //assign into seprated val

            var Dis = arrayData[0];
            var Ward_Class = arrayData[1];
            var Ward_ID = arrayData[2];
            var BedID = arrayData[3];
            var status = arrayData[4];
            Dis = $('#Dis').val();
            var array_dis = Dis.split("|");
            var Dis = array_dis[0];
            var hfc = $("#Rhfc").val();
            var createdBy = $("#Rid").val();
            var dis = $("#Rdis").val();
            var sub = $("#Rsub").val();

            $("#updateWard_ClassBed").val(Ward_Class);
            $("#updateWard_IDBed").val(Ward_ID);
            $("#updateBedIDBed").val(BedID);
            if (status === 'Available')
                $('#updatestatusBed').val("Available");
            else if (status === 'Pending')
                $('#updatestatusBed').val("Pending");
            else if (status === 'Occupied')
                $('#updatestatusBed').val("Occupied");

        });

        $("#updateBedButton").off('click').on('click', function (e) {



            e.preventDefault();
//            console.log(row);
//
//            var rowData = row.find("#dataAssignBedhidden").val();
//            var arrayData = rowData.split("|");
//
//            console.log(arrayData);
//
//            var DisciplineOld = arrayData[0];
//            var Ward_ClassOld = arrayData[1];
//            var Ward_IDOld = arrayData[2];
//            var BedIDOld = arrayData[3];
//            var statusOld = arrayData[4];
//            var hfcOld = arrayData[5];
            var Dis = $("#Dis").val();
            var Ward_Class = $("#updateWard_ClassBed").val();
            var Ward_ID = $("#updateWard_IDBed").val();
            var BedID = $("#updateBedIDBed").val();
            var status = $("#updatestatusBed").val();
            var hfc = $("#Rhfc").val();
            var createdBy = $("#Rid").val();
            var dis = $("#Rdis").val();
            var sub = $("#Rsub").val();
            //var hfc = $('#hfc').val();
            //var discipline = $('#discipline').val();
            //var subDicipline = $('#subDicipline').val();

            if (Dis === "Select Discipline" || Dis === null) {
                bootbox.alert("Complete The Discipline Fields");
            } else if (Ward_Class === "" || Ward_Class === null) {
                bootbox.alert("Complete The Ward_Class Fields");
            } else if (Ward_ID === "" || Ward_ID === null) {
                bootbox.alert("Complete The Ward_ID Fields");
            } else if (BedID === "" || BedID === null) {
                bootbox.alert("Complete The BedID Fields");
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
//                    hfcOld: hfcOld
//                    DisciplineOld: DisciplineOld,
//                    Ward_ClassOld: Ward_ClassOld,
//                    Ward_IDOld: Ward_IDOld,
//                    BedIDOld: BedIDOld,
//                    statusOld: statusOld
                };
                //console.log(data);
                $.ajax({
                    url: "assignBedUpdate.jsp",
                    type: "post",
                    data: data,
                    timeout: 10000,
                    success: function (datas) {
                        console.log(datas);

                        if (datas.trim() === 'Success') {

                            $('#AssignBedTable').load("assign-bed-to-ward-table.jsp");
                            $(".modal-backdrop").hide();
                            bootbox.alert({
                                message: "Successfully updated",
                                title: "Process Result",
                                backdrop: true
                            });
                        } else if (datas.trim() === 'Failed') {
                            bootbox.alert({
                                message: "Update Failed",
                                title: "Process Result",
                                backdrop: true
                            });
                        }

                    },
                    error: function (err) {
                        alert("Error update!");
                    }
                });
            }
        });
    });
//delete function when click delete on next of kin
    $('#tableassignBedTable').on('click', '#assignBedTable #BED_delete', function (e) {

        e.preventDefault();
        var row = $(this).closest("tr");
        var rowData = row.find("#dataAssignBedhidden").val();
        var arrayData = rowData.split("|");
        console.log(arrayData);
        //assign into seprated val
        var idbed = arrayData[3], hfc = arrayData[5];
        bootbox.confirm({
            message: "Are you sure want to delete information?",
            title: "Delete Item?",
            buttons: {
                confirm: {
                    label: 'Yes',
                    className: 'btn-success'
                },
                cancel: {
                    label: 'No',
                    className: 'btn-danger'
                }
            },
            callback: function (result) {

                if (result === true) {

                    var data = {
                        idbed: idbed,
                        hfc: hfc

                    };
                    $.ajax({
                        type: "post",
                        url: "assignBedDelete.jsp",
                        data: data,
                        timeout: 10000,
                        success: function (datas) {

                            if (datas.trim() === 'Success') {

                                row.remove();
                                bootbox.alert({
                                    message: "Successfully deleted",
                                    title: "Process Result",
                                    backdrop: true
                                });
                            } else if (datas.trim() === 'Failed') {
                                bootbox.alert({
                                    message: "Delete Failed",
                                    title: "Process Result",
                                    backdrop: true

                                });
                            }


                        }, error: function (err) {
                            alert("Error! Deletion Ajax failed!!");
                        }

                    });
                } else {
                    console.log("Process Is Canceled");
                }
            }
        });
    });
</script>

<script type="text/javascript" charset="utf-8">
    $(document).ready(function () {
        $('#assignBedTable').DataTable();

    });
</script>
