<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page session="true" %>




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

    <%        String sqlbed = "SELECT discipline_cd, ward_class_code, ward_id, bed_id, bed_status FROM wis_bed_id";
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
                        <label class="col-md-4 control-label" for="selectbasic">Discipline</label>
                        <div class="col-md-4">
                            <select id="updateDisciplineBed" name="selectbasic" class="form-control">
                                <option value="Select Discipline" >Select Discipline</option>


                                <%                                    String Discipline = "select * from lookup_detail where master_ref_code ='0072'";
                                    ArrayList<ArrayList<String>> dataDiscipline81;
                                    dataDiscipline81 = conn.getData(Discipline);

                                    for (int i = 0; i < dataDiscipline81.size(); i++) {%>
                                <option value="<%=dataDiscipline81.get(i).get(2)%>"><%=dataDiscipline81.get(i).get(2)%></option>
                                <%  }
                                %>

                            </select>
                        </div>
                    </div>

                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Ward Class</label>
                        <div class="col-md-4">
                            <select id="updateWard_ClassBed" name="selectbasic" class="form-control">
                                <option value="Ward Class" >Ward Class</option>

                                <%
                                    String sql101 = "SELECT ward_class_code, ward_class_name FROM wis_ward_class";
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
                            <textarea id="updateBedIDBed" class="form-control" rows="3" maxlength="200" placeholder="Generic Name"></textarea>
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




<script type="text/javascript">

    $(document).ready(function () {
        //function to edit facility type from table
        $('#AssignBedTable').off('click', '#assignBedTable #MWBed_edit').on('click', '#assignBedTable #MWBed_edit', function (e) {
            e.preventDefault();
            //go to the top

            //get the row value
            var row = $(this).closest("tr");
            var rowData = row.find("#dataAssignBedhidden").val();
            var arrayData = rowData.split("|");
            console.log(arrayData);
            //assign into seprated val

            var Disicipline = arrayData[0];
            var Ward_Class = arrayData[1];
            var Ward_ID = arrayData[2];
            var BedID = arrayData[3];
            var status = arrayData[4];
            $("#updateDisiciplineBed").val(Disicipline);
            $("#updateWard_ClassBed").val(Ward_Class);
            $("#updateWard_IDBed").val(Ward_ID);
            $("#updateBedIDBed").val(BedID);
            if (status === 'Available')
                $('#updatestatusBed').val("Available");
            else if (status === 'Pending')
                $('#updatestatusBed').val("Pending");
            else  if (status === 'Occupied')
                $('#updatestatusBed').val("Occupied");

        });

        $("#updateBedButton").off('click').on('click', function (e) {

            e.preventDefault();
            var Discipline = $("#updateDisciplineBed").val();
            var Ward_Class = $("#updateWard_ClassBed").val();
            var Ward_ID = $("#updateWard_IDBed").val();
            var BedID = $("#updateBedIDBed").val();
            var status = $("#updatestatusBed").val();
            //var hfc = $('#hfc').val();
            //var discipline = $('#discipline').val();
            //var subDicipline = $('#subDicipline').val();

            if (Discipline === "" || Discipline === null) {
                alert("Complete The Discipline Fields");
            } else if (Ward_Class === "" || Ward_Class === null) {
                alert("Complete The Fields");
            } else if (Ward_ID === "" || Ward_ID === null) {
                alert("Complete The Fields");
            } else if (BedID === "" || BedID === null) {
                alert("Complete The Fields");
            } else if (status !== "Available" && status !== "Pending" && status !== "Occupied") {
                alert("Select Any Status");
            } else {

                var data = {
                    Discipline: Discipline,
                    Ward_Class: Ward_Class,
                    Ward_ID: Ward_ID,
                    BedID: BedID,
                    status: status
                };
                $.ajax({
                    url: "assignBedUpdate.jsp",
                    type: "post",
                    data: data,
                    timeout: 10000,
                    success: function (datas) {

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
    $('#AssignBedTable').off('click', '#assignBedTable #BED_delete').on('click', '#assignBedTable #BED_delete', function (e) {

        e.preventDefault();
        var row = $(this).closest("tr");
        var rowData = row.find("#dataAssignBedhidden").val();
        var arrayData = rowData.split("|");
        console.log(arrayData);
        //assign into seprated val
        var idbed = arrayData[3];
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
                        idbed: idbed

                    };
                    $.ajax({
                        type: "post",
                        url: "assignBedDelete.jsp",
                        data: data,
                        timeout: 10000,
                        success: function (datas) {

                            if (datas.trim() === 'Success') {

                                $('#AssignBedTable').load('assign-bed-to-ward-table.jsp');
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

