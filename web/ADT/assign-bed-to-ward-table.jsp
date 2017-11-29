<%@page import="ADM_helper.MySessionKey"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page session="true" %>

<div id="tableassignBedTable">



    <table id="assignBedTable"  class="table table-striped table-bordered" style="width: 100%;">


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
                Conn conn4 = new Conn();
                String hfcASS = (String) session.getAttribute("HEALTH_FACILITY_CODE");
                String disAss = (String) session.getAttribute(MySessionKey.DISCIPLINE_CD);
                //                              0                       1              2         3          4               5               6                   7
                String sqlbed = "SELECT  d.discipline_name ,  b.ward_class_name,c.ward_name, a.bed_id,a.bed_status,  a.discipline_cd,  a.ward_class_code, a.ward_id, "
                        //      8           9               10          11              12                      13
                        + "a.hfc_cd,b.ward_class_code, c.ward_id, d.discipline_cd, sd.subdiscipline_cd, sd.subdiscipline_name "
                        + "FROM wis_bed_id a "
                        + "LEFT JOIN wis_ward_class b ON a.ward_class_code = b.ward_class_code AND b.hfc_cd=a.hfc_cd "
                        + "LEFT JOIN wis_ward_name c ON a.ward_id = c.ward_id  AND c.hfc_cd=a.hfc_cd AND c.discipline_cd=a.discipline_cd "
                        + "LEFT JOIN adm_discipline d ON a.discipline_cd = d.discipline_cd AND d.discipline_hfc_cd=a.hfc_cd "
                        + "LEFT JOIN adm_subdiscipline sd ON sd.subdiscipline_hfc_cd = d.discipline_hfc_cd AND sd.discipline_cd = d.discipline_cd AND sd.subdiscipline_cd = a.subdiscipline_cd "
                        + "where a.hfc_cd = '"+hfcASS+"' AND a.discipline_cd='"+disAss+"' group by a.bed_id; ";

            /*    String sqlbed = "SELECT  d.discipline_name ,  b.ward_class_name,c.ward_name, a.bed_id,a.bed_status,  a.discipline_cd,  a.ward_class_code, a.ward_id, "
                        + "a.hfc_cd,b.ward_class_code,  c.ward_id, d.discipline_cd "
                        + "FROM wis_bed_id a "
                        + "LEFT JOIN wis_ward_class b ON a.ward_class_code = b.ward_class_code AND b.hfc_cd=a.hfc_cd AND b.discipline_cd=a.discipline_cd "
                        + "LEFT JOIN wis_ward_name c ON a.ward_id = c.ward_id  AND c.hfc_cd=a.hfc_cd AND c.discipline_cd=a.discipline_cd "
                        + "LEFT JOIN adm_discipline d ON a.discipline_cd = d.discipline_cd AND d.discipline_hfc_cd=a.hfc_cd "
                        + "where a.hfc_cd = '"+hfcASS+"' group by a.bed_id; ";
            */
                ArrayList<ArrayList<String>> databed = conn4.getData(sqlbed);

                int size29 = databed.size();
                for (int i = 0; i < size29; i++) {
            %>


            <tr>

        <input id="dataAssignBedhidden" type="hidden" value="<%=String.join("|", databed.get(i))%>">
        <td><%= databed.get(i).get(0)%> - <%= databed.get(i).get(13)%></td>
        <td><%= databed.get(i).get(1)%></td>
        <td><%= databed.get(i).get(2)%></td>
        <td><%= databed.get(i).get(3)%></td>
        <td><%= databed.get(i).get(4)%></td>
        <td>
            <!-- Update Part Start -->
            <a id="MWBed_edit" ><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
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
                        <label class="col-md-4 control-label" for="selectbasic">Discipline </label>
                        <div class="col-md-6">
                            <input id="DisB" readonly  class="form-control">
                        </div>

                    </div>

                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Ward Class</label>
                        <div class="col-md-6">
                            <input id="updateWard_ClassBed" readonly class="form-control">
                        </div>
                    </div>

                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Ward ID/Name</label>
                        <div class="col-md-6">
                            <input id="updateWard_IDBed" readonly class="form-control">

                        </div>
                    </div>   

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Bed ID</label>
                        <div class="col-md-6">
                            <input id="updateBedIDBed" readonly class="form-control" >
                        </div>
                    </div>
                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Bed Status *</label>
                        <div class="col-md-6">
                            <select class="form-control" name="status" id="updatestatusBed">
                                <option value="Available">Available</option>
                               
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

<!--<script src="bootstrap-3.3.6-dist/js/jquery.dataTables.min.js"></script>-->
<!--<script src="searchDiscipline.jsp"></script>-->
<script src="old/assets/js/searchDisipline.js" type="text/javascript"></script>
<!--      <script src="old/assets/js/dataTables.bootstrap.min.js"></script>-->

<script type="text/javascript">

    $(document).ready(function () {
        //function to edit facility type from table

        // var row;

        $('#AssignBedTable').off('click', '#assignBedTable #MWBed_edit').on('click', '#assignBedTable #MWBed_edit', function (e) {
            e.preventDefault();
            //go to the top
            $('#assignBedUpdateModal').modal('show');
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
//            Dis = $('#Dis').val();
//            var array_dis = Dis.split("|");
//            var Dis = array_dis[0];
//            var hfc = $("#Rhfc").val();
//            var createdBy = $("#Rid").val();
//            var dis = $("#Rdis").val();
//            var sub = $("#Rsub").val();
            $("#DisB").val(Dis);
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

            var Dis = $("#DisB").val();
            var Ward_Class = $("#updateWard_ClassBed").val();
            var Ward_ID = $("#updateWard_IDBed").val();
            var BedID = $("#updateBedIDBed").val();
            var status = $("#updatestatusBed").val();
            var hfc = $("#Rhfc").val();
            var createdBy = $("#Rid").val();
            var dis = $("#Rdis").val();
            var sub = $("#Rsub").val();


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
                                message: "Bed information successfully updated",
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
        var idbed = arrayData[3], hfc = arrayData[8];
        bootbox.confirm({
            message: "Are you sure to delete bed information?",
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

