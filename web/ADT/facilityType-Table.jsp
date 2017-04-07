<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page session="true" %>



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

<div id="tablefacilityTypeTable" class="form-group">

    <table id="facilityTypeTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">


        <thead>


        <th style="text-align: center;">Ward Class</th>
        <th style="text-align: center;">Ward Class ID</th>
        <th style="text-align: center;">Status</th>
        <th style="text-align: center;">Update</th>
        <th style="text-align: center;">Delete</th>
        </thead>
        <tbody>

            <%
                Conn conn = new Conn();
                String sqlFacilityType = "SELECT ward_class_name,ward_class_code,ward_class_status, hfc_cd  FROM wis_ward_class where hfc_cd ="+hfc+";";
                ArrayList<ArrayList<String>> dataFacilityType = conn.getData(sqlFacilityType);

                int size = dataFacilityType.size();
                for (int i = 0; i < size; i++) {
            %>


            <tr>

        <input id="dataFacilityTypehidden" type="hidden" value="<%=String.join("|", dataFacilityType.get(i))%>">
        <td><%= dataFacilityType.get(i).get(0)%></td>
        <td><%= dataFacilityType.get(i).get(1)%></td>
        <td><%if (dataFacilityType.get(i).get(2).equals("1")) {
                out.print("Active");
            } else {
                out.print("Inactive");
            }%></td>
        <td>
            <!-- Update Part Start -->
            <a id="MW_edit" data-toggle="modal" data-target="#FacilityTypeUpdateModal"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
            <!-- Update Part End -->
        </td>
        <td>
            <!-- Delete Button Start -->
            <a id="MW_delete" class="testing"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;" ></i></a>
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
<div class="modal fade" id="FacilityTypeUpdateModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Update Facility Type Details</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal">
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Ward Class ID</label>
                        <div class="col-md-8">
                            <input id="updateWardClassID" class="form-control" readonly >
                        </div>
                    </div>
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Ward Class  *</label>
                        <div class="col-md-8">
                            <input id="updateWardClass" name="textinput" type="text" class="form-control input-md" maxlength="100" >
                        </div>
                    </div>




                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Status  *</label>
                        <div class="col-md-8">
                            <select class="form-control" name="tstatus" id="updatestatustype">
                                <option value="1" >Active</option>
                                <option value="0" >Inactive</option>
                            </select>
                        </div>
                    </div>
                </form>
                <!-- content goes here -->
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="updateModalButton">Update</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="reset" id="updateReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script src="bootstrap-3.3.6-dist/js/jquery.dataTables.min.js"></script>

<script type="text/javascript" charset="utf-8">

    $(document).ready(function () {
        //function to edit facility type from table
        $('#FacilityTypeTable').off('click', '#facilityTypeTable #MW_edit').on('click', '#facilityTypeTable #MW_edit', function (e) {
            e.preventDefault();
            //go to the top

            //get the row value
            var row = $(this).closest("tr");
            var rowData = row.find("#dataFacilityTypehidden").val();
            var arrayData = rowData.split("|");
            console.log(arrayData);
            //assign into seprated val
            var hfc = $("#Rhfc").val();
            var createdBy = $("#Rid").val();
            var dis = $("#Rdis").val();
            var sub = $("#Rsub").val();
            var MWClass = arrayData[0];
            var MWID = arrayData[1];
            var status = arrayData[2];
            $("#updateWardClass").val(MWClass);
            $("#updateWardClassID").val(MWID);
            if (status === '1')
                $('#updatestatustype').val(1);
            else
                $('#updatestatustype').val(0);
        });

        $("#updateModalButton").off('click').on('click', function (e) {

            e.preventDefault();
            var hfc = $("#Rhfc").val();
            var id = $("#Rid").val();
            var dis = $("#Rdis").val();
            var sub = $("#Rsub").val();
            var MWClass = $("#updateWardClass").val();
            var MWID = $("#updateWardClassID").val();
            var status = $("#updatestatustype").val();
            //var hfc = $('#hfc').val();
            //var discipline = $('#discipline').val();
            //var subDicipline = $('#subDicipline').val();

            if (MWClass === "" || MWClass === null) {
                bootbox.alert("Complete The Ward Class Fields");
//            } else if (MWID === "" || MWID === null) {
//                alert("Complete The Fields");
            } else if (status !== "1" && status !== "0") {
                alert("Select Any Status");
            } else {

                var data = {
                    MWClass: MWClass,
                    MWID: MWID,
                    status: status,
                    hfc: hfc,
                    id: id,
                    dis: dis,
                    sub: sub
                };
                $.ajax({
                    url: "facilityTypeUpdate.jsp",
                    type: "post",
                    data: data,
                    timeout: 10000,
                    success: function (data) {

                        if (data.trim() === 'Success') {

                            $('#FacilityTypeTable').load("facilityType-Table.jsp");
                            $(".modal-backdrop").hide();
                            bootbox.alert({
                                message: "Successfully updated",
                                title: "Process Result",
                                backdrop: true
                            });
                        } else if (data.trim() === 'Failed') {
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
    $('#tablefacilityTypeTable').on('click', '#facilityTypeTable #MW_delete', function (e) {

        e.preventDefault();
        var row = $(this).closest("tr");
        var rowData = row.find("#dataFacilityTypehidden").val();
        var arrayData = rowData.split("|");
        console.log(arrayData);
        //assign into seprated val
        var idtype = arrayData[1], hfc = arrayData[3];
        bootbox.confirm({
            message: "Are you sure want to delete facility type information?",
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
                        idtype: idtype,
                        hfc: hfc

                    };
                    $.ajax({
                        type: "post",
                        url: "facilityTypeDelete.jsp",
                        data: data,
                        timeout: 10000,
                        success: function (datas) {

                            if (datas.trim() === 'Success') {
                                row.remove();

                                $('#FacilityTypeTable').load('facilityType-Table.jsp');
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
        $('#facilityTypeTable').DataTable();

    });
</script>

