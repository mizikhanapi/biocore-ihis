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

        <th style="text-align: left;">Eligibility Sources</th>
        <th style="text-align: left;">Eligibility Type</th>
        <th style="text-align: left;">Ward Class </th>
        <th style="text-align: left;">Ward Name (RM) </th>
        <th style="text-align: left;">Charges Type</th>
        <th style="text-align: left;">Charges Fees (RM) </th>
        <th style="text-align: left;">Action</th>
        </thead>
        <tbody>

            <% //                Conn conn = new Conn();
                //                                    0             1               2               3                           4                   5                   6
                String sqlFacilityID = "SELECT es.Description,et.Description, ct.Description,a.eligibility_sources_cd, a.eligibility_type_cd, a.charges_type, a.charges_fees, "
                        //      7                   8                   9           10       11             12
                        + "wwc.ward_class_name,wwn.ward_name, a.ward_class_code,a.ward_id, a.hfc_cd, a.discipline_cd "
                        + "from wis_hospital_charges a "
                        + "left join adm_lookup_detail es on a.eligibility_sources_cd = es.Detail_Reference_Code and es.hfc_cd = a.hfc_cd and es.`Master_Reference_code`='0063' "
                        + "left join adm_lookup_detail et on a.eligibility_type_cd = et.Detail_Reference_Code and et.hfc_cd = a.hfc_cd and et.`Master_Reference_code`='0034' "
                        + "left join adm_lookup_detail ct on a.charges_type = ct.Detail_Reference_Code and ct.hfc_cd = a.hfc_cd and ct.`Master_Reference_code`='0100' "
                        + "left join wis_ward_class wwc on wwc.ward_class_code = a.ward_class_code and wwc.hfc_cd=a.hfc_cd "
                        + "left join wis_ward_name wwn on wwn.ward_id = a.ward_id and wwn.hfc_cd=a.hfc_cd and wwn.discipline_cd=a.discipline_cd "
                        + "where a.discipline_cd = '" + disID + "' and a.hfc_cd ='" + hfcID + "'";
                ArrayList<ArrayList<String>> dataFacilityID = conn3.getData(sqlFacilityID);

                int size11 = dataFacilityID.size();

                for (int i = 0; i < size11; i++) {

            %>


            <tr>

        <input id="dataFacilityIDhidden" type="hidden" value="<%=String.join("|", dataFacilityID.get(i))%>">
        <td><%= dataFacilityID.get(i).get(0)%></td>
        <td><%= dataFacilityID.get(i).get(1)%></td>
        <td><%= dataFacilityID.get(i).get(7)%></td>
        <td><%= dataFacilityID.get(i).get(8)%></td>
        <td><%= dataFacilityID.get(i).get(2)%></td>
        <td><%= dataFacilityID.get(i).get(6)%></td>


        <td align="center">
            <!-- Update Part Start -->
            <a id="MWID_edit" data-toggle="modal" data-target="#FacilityIDUpdateModal"><i data-toggle="tooltip" data-placement="left" title="Update Item" class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
            <!-- Update Part End -->
                        	&nbsp;	&nbsp;

                        <!-- Delete Button Start -->
            <a id="MWID_delete" class="testing"><i  data-toggle="tooltip" data-placement="right" title="Delete Item" class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;" ></i></a>
            <!-- Delete Button End -->
        </td>
        </tr>
        <%
            }

        %>
        </tbody>
    </table>
</div>


<script>
    $(function () {
        $('[data-toggle="tooltip"]').tooltip();
    });
</script>


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
                                    <input  type="hidden" id="updateEliSrc_cd">
                                </div>
                            </div>

                            <!-- Select Basic -->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Eligibility Type </label>
                                <div class="col-md-4">
                                    <input disabled="" id="updateEliTy" name="updateEliTy"  readonly class="form-control input-md">
                                    <input type="hidden" id="updateEliTy_cd">
                                </div>
                            </div>

                            <!-- Select Basic -->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Ward Class</label>
                                <div class="col-md-4">
                                    <input disabled="" id="updatewclass" type="text"  readonly class="form-control input-md" >
                                    <input type="hidden"  id="updatewclass_cd">
                                </div>
                            </div>

                            <!-- Select Basic -->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Ward Name</label>
                                <div class="col-md-4">
                                    <input disabled="" id="updatewname" name="updatewname"  readonly class="form-control input-md">
                                    <input type="hidden" id="updatewname_cd">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Charge Type</label>
                                <div class="col-md-4">
                                    <input disabled="" id="updateChargeType" name="updateChargeType" readonly class="form-control input-md">
                                    <input type="hidden" id="updateChargeType_cd">

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
                        <button type="submit" class="btn btn-primary btn-block btn-lg" role="button" id="updateIDButton">Update</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="reset" id="updateReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
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

        var hcTable = $('#facilityIDTable').DataTable();

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
            var updateChargeFees = arrayData[6];
            var updatewclass = arrayData[7];
            var updatewname = arrayData[8];



            var updateEliSrc_cd = arrayData[3];
            var updateEliTy_cd = arrayData[4];
            var updateChargeType_cd = arrayData[5];
            var updatewclass_cd = arrayData[9];
            var updatewname_cd = arrayData[10];



            var hfc = $("#Rhfc").val();
            var createdBy = $("#Rid").val();
            var dis = $("#Rdis").val();
            var sub = $("#Rsub").val();

            $('#updateEliSrc').val(updateEliSrc);
            $('#updateEliTy').val(updateEliTy);
            $('#updateChargeType').val(updateChargeType);
            $('#updatewclass').val(updatewclass);
            $('#updatewname').val(updatewname);


            $('#updateEliSrc_cd').val(updateEliSrc_cd);
            $('#updateEliTy_cd').val(updateEliTy_cd);
            $('#updateChargeType_cd').val(updateChargeType_cd);
            $('#updatewclass_cd').val(updatewclass_cd);
            $('#updatewname_cd').val(updatewname_cd);


            $('#updateChargeFees').val(updateChargeFees);

        });

        $("#updateIDButton").off('click').on('click', function (e) {

            e.preventDefault();
            var updateEliSrc_cd = $('#updateEliSrc_cd').val();
            var updateEliTy_cd = $('#updateEliTy_cd').val();
            var updateChargeType_cd = $('#updateChargeType_cd').val();
            var updatewclass_cd = $('#updatewclass_cd').val();
            var updatewname_cd = $('#updatewname_cd').val();


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
                    updatewclass_cd: updatewclass_cd,
                    updatewname_cd: updatewname_cd,
                    updateEliSrc: updateEliSrc,
                    updateEliTy: updateEliTy,
                    updateChargeType: updateChargeType,
                    updateChargeFees: updateChargeFees,
                    hfc: hfc,
                    createdBy: createdBy,
                    dis: dis,
                    sub: sub,
                    updateEliSrc_cd: updateEliSrc_cd,
                    updateEliTy_cd: updateEliTy_cd,
                    updateChargeType_cd: updateChargeType_cd
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
                                message: "Hospital charges information successfully updated",
                                title: "Information",
                                backdrop: true
                            });
                        } else if (datas.trim() === 'Failed') {
                            bootbox.alert({
                                message: "Update Failed",
                                title: "Information",
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


        $('#tablefacilityIDTable').off('click').on('click', '#facilityIDTable #MWID_delete', function (e) {

            e.preventDefault();
            var row = $(this).closest("tr");
            var rowData = row.find("#dataFacilityIDhidden").val();
            var arrayData = rowData.split("|");

            //assign into seprated val
            var updateEliSrc_cd = arrayData[3];
            var updateEliTy_cd = arrayData[4];
            var updateChargeType_cd = arrayData[5];
            var class_cd = arrayData[9];
            var ward_cd = arrayData[10];

            console.log(arrayData);
            bootbox.confirm({
                message: "Are you sure to delete Hospital Charges information ?",
                title: "Please Confirm ?",
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
                            updateEliSrc_cd: updateEliSrc_cd,
                            updateEliTy_cd: updateEliTy_cd,
                            updateChargeType_cd: updateChargeType_cd,
                            class_cd: class_cd,
                            ward_cd: ward_cd

                        };
                        $.ajax({
                            type: "post",
                            url: "hospitalCharges-Delete.jsp",
                            data: datas,
                            timeout: 10000,
                            success: function (result) {
                                console.log(result);
                                if (result.trim() === 'Success') {
                                    hcTable
                                            .row(row)
                                            .remove()
                                            .draw();

                                    //row.remove();


                                    bootbox.alert({
                                        message: "Successfully deleted",
                                        title: "Information",
                                        backdrop: true
                                    });
                                } else if (result.trim() === 'Failed') {
                                    bootbox.alert({
                                        message: "Delete Failed",
                                        title: "Information",
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


    });// end on document ready
//delete function when click delete on next of kin

</script>

