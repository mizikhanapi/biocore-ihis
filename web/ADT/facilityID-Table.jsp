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


<div id="tablefacilityIDTable" class="table-guling">


    <table id="facilityIDTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">


        <thead>

        <th style="text-align: center;">Ward Class</th>
        <th style="text-align: center;">Ward Name</th>
        <th style="text-align: center;">No of Bed</th>
        <th style="text-align: center;">Discipline Code</th>
        <th style="text-align: center;">Citizen Rate (RM)</th>
        <th style="text-align: center;">Non Citizen Rate (RM)</th>
        <th style="text-align: center;">Update</th>
        <th style="text-align: center;">Delete</th>
        </thead>
        <tbody>

            <%
                //Conn conn = new Conn();
                //                                      0               1           2           3                   4           5                       6                   7                   8                       9                       10
                String sqlFacilityID = "SELECT wwc.ward_class_name, a.ward_name, a.ward_id, b.discipline_name, a.no_of_bed, a.citizen_room_cost, a.citizen_deposit, a.citizen_discount, a.non_citizen_room_cost, a.non_citizen_deposit, a.non_citizen_discount, "
                        //      11                          12                  13                  14                  15                  16                          17              18            19            20              21                  22          
                        + "a.pensioner_room_cost,  a.pensioner_deposit, a.pensioner_discount,a.attach_toilet, a.include_television, a.attach_bathroom_tiolet, a.include_telephone, a.ward_status, a.hfc_cd , a.discipline_cd, b.discipline_cd, wwc.ward_class_code, "
                        //      23                     24
                        + "sd.subdiscipline_cd, sd.subdiscipline_name "
                        + "FROM wis_ward_name a "
                        + "LEFT JOIN adm_discipline b ON a.discipline_cd = b.discipline_cd AND a.hfc_cd=b.discipline_hfc_cd "
                        + "LEFT JOIN adm_subdiscipline sd ON sd.subdiscipline_hfc_cd = b.discipline_hfc_cd AND sd.discipline_cd = b.discipline_cd AND sd.subdiscipline_cd = a.subdiscipline_cd "
                        + "LEFT JOIN wis_ward_class wwc on wwc.ward_class_code = a.ward_class_code AND a.hfc_cd=wwc.hfc_cd "
                        + "where a.discipline_cd = '" + disID + "' and a.hfc_cd ='" + hfcID + "' GROUP BY a.ward_id;";
                /*String sqlFacilityID = "SELECT wwc.ward_class_name, a.ward_name, a.ward_id, b.discipline_name, a.no_of_bed, a.citizen_room_cost, a.citizen_deposit, a.citizen_discount, a.non_citizen_room_cost, a.non_citizen_deposit, a.non_citizen_discount, "
                        + "a.pensioner_room_cost,  a.pensioner_deposit, a.pensioner_discount,a.attach_toilet, a.include_television, a.attach_bathroom_tiolet, a.include_telephone, a.ward_status, a.hfc_cd , a.discipline_cd, b.discipline_cd, wwc.ward_class_code "
                        + "FROM wis_ward_name a "
                        + "LEFT JOIN adm_discipline b ON a.discipline_cd = b.discipline_cd AND a.hfc_cd=b.discipline_hfc_cd "
                        + "LEFT JOIN wis_ward_class wwc on wwc.ward_class_code = a.ward_class_code AND a.hfc_cd=wwc.hfc_cd AND wwc.discipline_cd=a.discipline_cd "
                        + "where a.hfc_cd ='"+hfcID+"' GROUP BY a.ward_id;";*/
                ArrayList<ArrayList<String>> dataFacilityID = conn3.getData(sqlFacilityID);

                int size11 = dataFacilityID.size();
                for (int i = 0; i < size11; i++) {
            %>


            <tr>

        <input id="dataFacilityIDhidden" type="hidden" value="<%=String.join("|", dataFacilityID.get(i))%>">
        <td>(<%= dataFacilityID.get(i).get(22)%>) <%= dataFacilityID.get(i).get(0)%></td>
        <td>(<%= dataFacilityID.get(i).get(2)%>) <%= dataFacilityID.get(i).get(1)%></td>
        <td><%= dataFacilityID.get(i).get(4)%></td>
        <td><%= dataFacilityID.get(i).get(3)%> - <%= dataFacilityID.get(i).get(24)%></td>
        <td><%= dataFacilityID.get(i).get(5)%></td>
        <td><%= dataFacilityID.get(i).get(8)%></td>

        <td>
            <!-- Update Part Start -->
            <a id="MWID_edit" ><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
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
    <div class="modal-dialog" style="width: 75%">
        <div class="modal-content" >
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineIDLabel">Update Facility ID Details</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal" id="editIDForm">


                    <div class="col-md-12">

                        <div class="col-md-12"> 

                            <!-- Select Basic -->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Discipline Code</label>
                                <div class="col-md-4">
                                    <input id="updateDis" type="text"  readonly class="form-control input-md" >
                                    <input type="hidden" id="UdisCode">
                                </div>
                            </div>

                            <!-- Select Basic -->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Ward Class </label>
                                <div class="col-md-4">
                                    <input id="onlyWC" name="onlyWC"  readonly class="form-control input-md">
                                    <input type="hidden" id="updateWC" name="updateWC"  readonly class="form-control input-md">

                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Ward ID</label>
                                <div class="col-md-4">
                                    <input id="updateWardID" name="updateWardID" readonly class="form-control input-md">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Ward Name *</label>
                                <div class="col-md-4">
                                    <input id="updateWardName" name="updateWardName" type="text" placeholder="" class="form-control input-md">
                                </div>
                            </div>




                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">No of bed *</label>
                                <div class="col-md-4">
                                    <input id="updateNoOfBed" name="updateNoOfBed" type="text" placeholder="" class="form-control input-md">
                                </div>
                            </div>
                        </div>

                    </div>



                    <div class="row">
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Citizen Rates (RM)</label>
                                <div class="col-md-4">
                                    <input id="updateCitizenRates" name="updateCitizenRates" type="text" placeholder="(RM)" class="form-control input-md">
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Citizen Deposit (RM)</label>
                                <div class="col-md-4">
                                    <input id="updateCitizenDeposit" name="updateCitizenDeposit" type="text" placeholder="(RM)" class="form-control input-md">
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Citizen Discount (%)</label>
                                <div class="col-md-4">
                                    <input id="updateCitizenDiscount" name="updateCitizenDiscount" type="text" placeholder="(%)" class="form-control input-md">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Non Citizen Rates (RM)</label>
                                <div class="col-md-4">
                                    <input id="updateNonCitizenRates" name="updateNonCitizenRates" type="text" placeholder="(RM)" class="form-control input-md">
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Non Citizen Deposit (RM)</label>
                                <div class="col-md-4">
                                    <input id="updateNonCitizenDeposit" name="updateNonCitizenDeposit" type="text" placeholder="(RM)" class="form-control input-md">
                                </div>
                            </div>

                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Non Citizen Discount (%)</label>
                                <div class="col-md-4">
                                    <input id="updateNonCitizenDiscount" name="updateNonCitizenDiscount" type="text" placeholder="(%)" class="form-control input-md">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Pensioner Rates (RM)</label>
                                <div class="col-md-4">
                                    <input id="updatePensionerRates" name="updatePensionerRates" type="text" placeholder="(RM)" class="form-control input-md">
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Pensioner Deposit (RM)</label>
                                <div class="col-md-4">
                                    <input id="updatePensionerDeposit" name="updatePensionerDeposit" type="text" placeholder="(RM)" class="form-control input-md">
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Pensioner Discount (%)</label>
                                <div class="col-md-4">
                                    <input id="updatePensionerDiscount" name="updatePensionerDiscount" type="text" placeholder="(%)" class="form-control input-md">
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="row">
                        <div class="col-md-6">


                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Attach toilet</label>
                                <div class="col-md-4">
                                    <input id="updatetoilet" name="updatetoilet" type="checkbox"  class="form-control input-md">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Television</label>
                                <div class="col-md-4">
                                    <input id="updatetelevision" name="updatetelevision" type="checkbox"  class="form-control input-md">
                                </div>
                            </div>


                        </div>
                        <div class="col-md-6">



                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Attach bathroom and toilet</label>
                                <div class="col-md-4">
                                    <input id="updatebathroom" name="updatebathroom"  type="checkbox"  class="form-control input-md">

                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Telephone</label>
                                <div class="col-md-4">
                                    <input id="updatetelephone" name="updatetelephone" type="checkbox"  class="form-control input-md">
                                </div>
                            </div>


                        </div>
                    </div>

                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Status</label>
                        <div class="col-md-4">
                            <select class="form-control" name="updatestatus" id="updatestatus">
                                <option value="1">Active</option>
                                <option value="0">Inactive</option>
                            </select>
                        </div>
                    </div>

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

<!--      <script src="old/assets/js/dataTables.bootstrap.min.js"></script>-->

<script type="text/javascript">

    $(document).ready(function () {
        //initialise datatable 
        var tableWard = $('#facilityIDTable').DataTable();


        //function to edit facility type from table
        $('#FacilityIDTable').off('click', '#facilityIDTable #MWID_edit').on('click', '#facilityIDTable #MWID_edit', function (e) {
            e.preventDefault();
            //go to the top
            $('#FacilityIDUpdateModal').modal('show');
            //get the row value
            var row = $(this).closest("tr");
            var rowData = row.find("#dataFacilityIDhidden").val();
            var arrayData = rowData.split("|");
            //console.log(arrayData);
            //assign into seprated val
            var WardClassCode = arrayData[22];
            var WardClass = arrayData[0];
            var WardName = arrayData[1];
            var WardID = arrayData[2];
            var Dis = arrayData[3];
            var NoOfBed = arrayData[4];
            var CitizenRates = arrayData[5];
            var CitizenDeposit = arrayData[6];
            var CitizenDiscount = arrayData[7];
            var NonCitizenRates = arrayData[8];
            var NonCitizenDeposit = arrayData[9];
            var NonCitizenDiscount = arrayData[10];
            var PensionerRates = arrayData[11];
            var PensionerDeposit = arrayData[12];
            var PensionerDiscount = arrayData[13];
            var toilet = arrayData[14];
            var televison = arrayData[15];
            var bathroom = arrayData[16];
            var telephone = arrayData[17];
            var status = arrayData[18];
            var disCode = arrayData[21];



            $('#UdisCode').val(disCode);
            $('#updateDis').val(Dis);
            $('#onlyWC').val(WardClass);
            $('#updateWC').val(WardClassCode);
            $('#updateWardName').val(WardName);
            $('#updateWardID').val(WardID);
            var hfc = $("#Rhfc").val();
            var createdBy = $("#Rid").val();
            var dis = $("#Rdis").val();
            var sub = $("#Rsub").val();

            $('#updateNoOfBed').val(NoOfBed);
            $('#updateCitizenRates').val(CitizenRates);
            $('#updateCitizenDeposit').val(CitizenDeposit);
            $('#updateCitizenDiscount').val(CitizenDiscount);
            $('#updateNonCitizenRates').val(NonCitizenRates);
            $('#updateNonCitizenDeposit').val(NonCitizenDeposit);
            $('#updateNonCitizenDiscount').val(NonCitizenDiscount);
            $('#updatePensionerRates').val(PensionerRates);
            $('#updatePensionerDeposit').val(PensionerDeposit);
            $('#updatePensionerDiscount').val(PensionerDiscount);

            var toiletCheck = (toilet === "Yes") ? true : false;
            var televisionCheck = (televison === "Yes") ? true : false;
            var bathroomCheck = (bathroom === "Yes") ? true : false;
            var telephoneCheck = (telephone === "Yes") ? true : false;

            $('#updatetoilet').prop("checked", toiletCheck);
            $('#updatetelevision').prop("checked", televisionCheck);
            $('#updatebathroom').prop("checked", bathroomCheck);
            $('#updatetelephone').prop("checked", telephoneCheck);
            if (status === '1')
                $('#updatestatus').val(1);
            else
                $('#updatestatus').val(0);
        });

        $("#updateIDButton").off('click').on('click', function (e) {
            $('#FacilityIDUpdateModal').css('overflow', 'auto');
            e.preventDefault();
            var WardClassCode = $('#updateWC').val();
            var WardName = $('#updateWardName').val();
            var WardID = $('#updateWardID').val();
            var Dis = $('#Dis').val();
            var NoOfBed = $('#updateNoOfBed').val();
            var CitizenRates = $('#updateCitizenRates').val();
            var CitizenDeposit = $('#updateCitizenDeposit').val();
            var CitizenDiscount = $('#updateCitizenDiscount').val();
            var NonCitizenRates = $('#updateNonCitizenRates').val();
            var NonCitizenDeposit = $('#updateNonCitizenDeposit').val();
            var NonCitizenDiscount = $('#updateNonCitizenDiscount').val();
            var PensionerRates = $('#updatePensionerRates').val();
            var PensionerDeposit = $('#updatePensionerDeposit').val();
            var PensionerDiscount = $('#updatePensionerDiscount').val();
            var toilet = $('#updatetoilet').prop("checked") ? "Yes" : "No";
            var televison = $('#updatetelevision').prop("checked") ? "Yes" : "No";
            var bathroom = $('#updatebathroom').prop("checked") ? "Yes" : "No";
            var telephone = $('#updatetelephone').prop("checked") ? "Yes" : "No";
            var status = $('#updatestatus').val();
            var hfc = $("#Rhfc").val();
            var createdBy = $("#Rid").val();
            var dis = $("#UdisCode").val();
            var sub = $("#Rsub").val();

            console.log(dis);
            if (WardName === "" || WardName === null) {
                bootbox.alert("Complete The Fields of Ward Name");
            } else if (CitizenRates === "" || CitizenRates === null) {
                bootbox.alert("Complete The Fields of Citizen Rates");
            } else if (CitizenDeposit === "" || CitizenDeposit === null) {
                bootbox.alert("Complete The Fields of Citizen Deposit");
            } else if (CitizenDiscount === "" || CitizenDiscount === null) {
                bootbox.alert("Complete The Fields of Citizen Discount");
            } else if (NonCitizenRates === "" || NonCitizenRates === null) {
                bootbox.alert("Complete The Fields of Non Citizen Rates");
            } else if (NonCitizenDeposit === "" || NonCitizenDeposit === null) {
                bootbox.alert("Complete The Fields of Non Citizen Deposit");
            } else if (NonCitizenDiscount === "" || NonCitizenDiscount === null) {
                bootbox.alert("Complete The Fields of Non Citizen Discount");
            } else if (PensionerDeposit === "" || PensionerDeposit === null) {
                bootbox.alert("Complete The Fields of Pensioner Deposit");
            } else if (NoOfBed === "" || NoOfBed === null) {
                bootbox.alert("Complete The Fields of No Of Bed");
            } else if (status !== "1" && status !== "0") {
                alert("Select Any Status");
            } else if (PensionerDiscount === "" || PensionerDiscount === null) {
                bootbox.alert("Complete The Fields of Pensioner Discount");
            } else if (PensionerRates === "" || PensionerRates === null) {
                bootbox.alert("Complete The Fields of Pensioner Rates");
            } else {

                var data = {
                    WardClassCode: WardClassCode,
                    WardName: WardName,
                    WardID: WardID,
                    Dis: Dis,
                    NoOfBed: NoOfBed,
                    CitizenRates: CitizenRates,
                    CitizenDeposit: CitizenDeposit,
                    CitizenDiscount: CitizenDiscount,
                    NonCitizenRates: NonCitizenRates,
                    NonCitizenDeposit: NonCitizenDeposit,
                    NonCitizenDiscount: NonCitizenDiscount,
                    PensionerRates: PensionerRates,
                    PensionerDeposit: PensionerDeposit,
                    PensionerDiscount: PensionerDiscount,
                    toilet: toilet,
                    televison: televison,
                    bathroom: bathroom,
                    telephone: telephone,
                    status: status,
                    hfc: hfc,
                    createdBy: createdBy,
                    dis: dis,
                    sub: sub
                };
                console.log(data);
                createScreenLoading();
                $.ajax({
                    url: "facilityIDUpdate.jsp",
                    type: "post",
                    data: data,
                    timeout: 10000,
                    success: function (datas) {

                        if (datas.trim() === 'Success') {

                            $('#FacilityIDTable').load("facilityID-Table.jsp");
                            $(".modal-backdrop").hide();
                            bootbox.alert({
                                message: "Facility ID information successfully updated",
                                title: "Process Result",
                                backdrop: true
                            });
                            FI_loadWardNameOption();
                        } else if (datas.trim() === 'Failed') {
                            bootbox.alert({
                                message: "Update Failed",
                                title: "Process Result",
                                backdrop: true
                            });
                        } else if (datas.trim() === 'name') {
                            bootbox.alert({
                                message: "Ward Name Duplication Detected. Please use different Ward Name.",
                                title: "Process Result",
                                backdrop: true
                            });
                        } else {
                            bootbox.alert(datas.trim());
                        }

                    },
                    error: function (err) {
                        alert("Error update!");
                    },
                    complete: function (jqXHR, textStatus) {
                        destroyScreenLoading();
                    }
                });
            }
        });

        //delete function when click delete on next of kin
        $('#tablefacilityIDTable').on('click', '#facilityIDTable #MWID_delete', function (e) {

            e.preventDefault();
            var row = $(this).closest("tr");
            var rowData = row.find("#dataFacilityIDhidden").val();
            var arrayData = rowData.split("|");

            //assign into seprated val
            var wcd = arrayData[0], wid = arrayData[2], hfc = arrayData[19], wname = arrayData[1], wdis = arrayData[20];
            console.log(arrayData);
            bootbox.confirm({
                message: "Are you sure to delete facility ID information?",
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
                            hfc: hfc,
                            wname: wname,
                            wdis: wdis

                        };
                        createScreenLoading();
                        $.ajax({
                            type: "post",
                            url: "facilityIDDelete.jsp",
                            data: datas,
                            timeout: 10000,
                            success: function (result) {
                                console.log(result);
                                if (result.trim() === 'Success') {
                                    tableWard.row(row).remove.draw();
                                    bootbox.alert({
                                        message: "Successfully deleted",
                                        title: "Process Result",
                                        backdrop: true
                                    });
                                    FI_loadWardNameOption();
                                    $('#AssignBedTable').html('');
                                    $('#AssignBedTable').load('assign-bed-to-ward-table.jsp');

                                } else if (result.trim() === 'Failed') {
                                    bootbox.alert({
                                        message: "Delete Failed",
                                        title: "Process Result",
                                        backdrop: true

                                    });
                                } else if (result.trim() === 'no') {
                                    bootbox.alert({
                                        message: "You cannot delete this ward because there are patients inside it.",
                                        title: "Process Result",
                                        backdrop: true

                                    });
                                }


                            }, error: function (err) {
                                alert("Error! Deletion Ajax failed!!");
                            },
                            complete: function (jqXHR, textStatus) {
                                destroyScreenLoading();
                            }

                        });
                    } else {
                        console.log("Process Is Canceled");
                    }
                }
            });
        });

    });// end of document ready

</script>

