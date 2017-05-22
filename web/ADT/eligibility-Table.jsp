<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="Config.connect"%>

<%@ page session="true" %>

<%
    String hfcID = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String idID = session.getAttribute("USER_ID").toString();
    String disID = session.getAttribute("DISCIPLINE_CODE").toString();
    String subID = session.getAttribute("SUB_DISCIPLINE_CODE").toString();

    Conn conn3 = new Conn();

%>
<input type="hidden" value="<%=hfcID%>" id="Rhfc">
<input type="hidden" value="<%=idID%>" id="Rid">
<input type="hidden" value="<%=disID%>" id="Rdis">
<input type="hidden" value="<%=subID%>" id="Rsub">


<div id="tablefacilityIDTable" class="form-group">


    <table id="facilityIDTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">


        <thead>

        <th style="text-align: center;">Eligibility Sources</th>
        <th style="text-align: center;">Eligibility Type</th>
        <th style="text-align: center;">Charges Type</th>
        <th style="text-align: center;">Charges Fees (RM) </th>

        <th style="text-align: center;">Update</th>
        <th style="text-align: center;">Delete</th>
        </thead>
        <tbody>

            <% //                Conn conn = new Conn();
                String sqlFacilityID = "SELECT eligibility_sources_cd, eligibility_type_cd, charges_type, charges_fees from wis_hospital_charges where discipline_cd = '" + disID + "' and hfc_cd ='" + hfcID + "' ;";
                ArrayList<ArrayList<String>> dataFacilityID = conn3.getData(sqlFacilityID);

                int size11 = dataFacilityID.size();
                for (int i = 0; i < size11; i++) {
            %>


            <tr>

        <input id="dataFacilityIDhidden" type="hidden" value="<%=String.join("|", dataFacilityID.get(i))%>">
        <td><%= dataFacilityID.get(i).get(0)%></td>
        <td><%= dataFacilityID.get(i).get(1)%></td>
        <td><%= dataFacilityID.get(i).get(2)%></td>
        <td><%= dataFacilityID.get(i).get(3)%></td>


        <td>
            <!-- Update Part Start -->
            <a id="MWID_edit" data-toggle="modal" data-target="#FacilityIDUpdateModal"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
            <!-- Update Part End -->
        </td>
        <td>
            <!-- Delete Button Start -->
            <a id="MWID_delete" class="testing"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;" ></i></a>
            <!-- Delete Button End -->
        </td>
        </tr>
        <%
            }

        %>
        </tbody>
    </table>
</div>



<tr>


    <!-- Modal Update -->
<div class="modal fade" id="FacilityIDUpdateModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" style="width: 175%">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineIDLabel">Update Hospital Charges Details</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal" id="editIDForm">


                    <div class="col-md-12">

                        <div class="col-md-12"> 

                            <!-- Select Basic -->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Eligibility Sources</label>
                                <div class="col-md-4">
                                    <input disabled="" id="updateEliSrc" type="text"  readonly class="form-control input-md" >
                                </div>
                            </div>

                            <!-- Select Basic -->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Eligibility Type </label>
                                <div class="col-md-4">
                                    <input disabled="" id="updateEliTy" name="updateEliTy"  readonly class="form-control input-md">

                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Charge Type</label>
                                <div class="col-md-4">
                                    <input disabled="" id="updateChargeType" name="updateChargeType" readonly class="form-control input-md">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Charge Fees *</label>
                                <div class="col-md-4">
                                    <input  id="updateChargeFees" name="updateChargeFees" type="text" placeholder="" class="form-control input-md">
                                </div>
                            </div>





                        </div>

                    </div>








                    <!-- Select Basic -->


                </form>
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="updateIDButton">Update</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="reset" id="updateReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!--<script src="bootstrap-3.3.6-dist/js/jquery.dataTables.min.js"></script>
<script src="searchDiscipline.jsp"></script>
<script src="old/assets/js/searchDisipline.js" type="text/javascript"></script>-->



<script type="text/javascript">

    $(document).ready(function () {



        //function to edit facility type from table
        $('#FacilityIDTable').off('click', '#facilityIDTable #MWID_edit').on('click', '#facilityIDTable #MWID_edit', function (e) {
            e.preventDefault();
            //go to the top

            //get the row value
            var row = $(this).closest("tr");
            var rowData = row.find("#dataFacilityIDhidden").val();
            var arrayData = rowData.split("|");
            console.log(arrayData);
            //assign into seprated val

            var updateEliSrc = arrayData[0];
            var updateEliTy = arrayData[1];
            var updateChargeType = arrayData[2];
            var updateChargeFees = arrayData[3];






            var hfc = $("#Rhfc").val();
            var createdBy = $("#Rid").val();
            var dis = $("#Rdis").val();
            var sub = $("#Rsub").val();

            $('#updateEliSrc').val(updateEliSrc);
            $('#updateEliTy').val(updateEliTy);
            $('#updateChargeType').val(updateChargeType);
            $('#updateChargeFees').val(updateChargeFees);

        });

        $("#updateIDButton").off('click').on('click', function (e) {

            e.preventDefault();
            var updateEliSrc = $('#updateEliSrc').val();
            var updateEliTy = $('#updateEliTy').val();
            var updateChargeType = $('#updateChargeType').val();
            var updateChargeFees = $('#updateChargeFees').val();
            var hfc = $("#Rhfc").val();
            var createdBy = $("#Rid").val();
            var dis = $("#Rdis").val();
            var sub = $("#Rsub").val();

            if (updateChargeFees === "" || updateChargeFees === null) {
                bootbox.alert("Complete The Fields of Ward Name");
            } else {

                var data = {
                    updateEliSrc: updateEliSrc,
                    updateEliTy: updateEliTy,
                    updateChargeType: updateChargeType,
                    updateChargeFees: updateChargeFees,
                    hfc: hfc,
                    createdBy: createdBy,
                    dis: dis,
                    sub: sub
                };
                console.log(data);
                $.ajax({
                    url: "hospitalCharges-Update.jsp",
                    type: "post",
                    data: data,
                    timeout: 10000,
                    success: function (datas) {

                        if (datas.trim() === 'Success') {

                            $('#FacilityIDTable').load("hospitalCharges-Table.jsp");
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
    $('#tablefacilityIDTable').on('click', '#facilityIDTable #MWID_delete', function (e) {

        e.preventDefault();
        var row = $(this).closest("tr");
        var rowData = row.find("#dataFacilityIDhidden").val();
        var arrayData = rowData.split("|");

        //assign into seprated val
        var wcd = arrayData[0], wid = arrayData[2], hfc = arrayData[19];
        console.log(arrayData);
        bootbox.confirm({
            message: "Are you sure want to delete facility ID information?",
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
                    console.log(arrayData);
                    var datas = {
                        wcd: wcd,
                        wid: wid,
                        hfc: hfc

                    };
                    $.ajax({
                        type: "post",
                        url: "facilityIDDelete.jsp",
                        data: datas,
                        timeout: 10000,
                        success: function (result) {
                            console.log(result);
                            if (result.trim() === 'Success') {
                                row.remove();


                                bootbox.alert({
                                    message: "Successfully deleted",
                                    title: "Process Result",
                                    backdrop: true
                                });
                            } else if (result.trim() === 'Failed') {
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
        $('#facilityIDTable').DataTable();

    });
</script>

