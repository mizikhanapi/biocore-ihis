<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="Config.connect"%>

<%@ page session="true" %>

<%
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String id = session.getAttribute("USER_ID").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
    String sub = session.getAttribute("SUB_DISCIPLINE_CODE").toString();
    
            //Conn conn = new Conn();

  %>
<input type="hidden" value="<%=hfc%>" id="Rhfc">
<input type="hidden" value="<%=id%>" id="Rid">
<input type="hidden" value="<%=dis%>" id="Rdis">
<input type="hidden" value="<%=sub%>" id="Rsub">
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

   
</head>

<div id="tablefacilityIDTable" class="form-group">


    <table id="facilityIDTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">


        <thead>


        <th>Ward Name</th>
        <th>No of Bed</th>
        <th>Discipline</th>
        <th>Citizen Rate</th>
        <th>Non Citizen Rate</th>
        <th>Update</th>
        <th>Delete</th>
        </thead>
        <tbody>

            <%                Conn conn = new Conn();
                String sqlFacilityID = "SELECT ward_class_code, ward_name, ward_id,discipline_cd, no_of_bed,"
                        + "citizen_room_cost, citizen_deposit, citizen_discount, non_citizen_room_cost, non_citizen_deposit, non_citizen_discount, pensioner_room_cost,  pensioner_deposit, pensioner_discount,"
                        + "attach_toilet, include_television, attach_bathroom_tiolet, include_telephone, ward_status, hfc_cd FROM wis_ward_name";
                ArrayList<ArrayList<String>> dataFacilityID = conn.getData(sqlFacilityID);

                int size11 = dataFacilityID.size();
                for (int i = 0; i < size11; i++) {
            %>


            <tr>

        <input id="dataFacilityIDhidden" type="hidden" value="<%=String.join("|", dataFacilityID.get(i))%>">
        <td><%= dataFacilityID.get(i).get(1)%></td>
        <td><%= dataFacilityID.get(i).get(4)%></td>
        <td><%= dataFacilityID.get(i).get(3)%></td>
        <td><%= dataFacilityID.get(i).get(5)%></td>
        <td><%= dataFacilityID.get(i).get(8)%></td>

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
                <h3 class="modal-title" id="lineIDLabel">Update Facility ID Details</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal" id="editIDForm">


                    <div class="col-md-12">

                        <div class="col-md-12"> 


                            <!-- Select Basic -->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="selectbasic">Ward Class</label>
                                <div class="col-md-4">
                                    <select id="updateWardClass" name="updateWardClass" class="form-control">
                                        <!--                                        <option value="null" selected="" disabled="">Select Ward Class</option>
                                                                                <option value="-">-</option>-->


                                        <%                                            String sql12 = "SELECT  ward_class_name FROM wis_ward_class";
                                            ArrayList<ArrayList<String>> dataClass22 = conn.getData(sql12);

                                            int size1 = dataClass22.size();

                                            for (int i = 0; i < size1; i++) {
                                        %>
                                        <option value="<%= dataClass22.get(i).get(0)%>"><%= dataClass22.get(i).get(0)%> </option>
                                        <%
                                            }
                                        %>


                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Ward Name</label>
                                <div class="col-md-4">
                                    <input id="updateWardName" name="updateWardName" type="text" placeholder="" class="form-control input-md">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Ward ID</label>
                                <div class="col-md-4">
                                    <input id="updateWardID" name="updateWardID" type="text" placeholder="" class="form-control input-md">
                                </div>
                            </div>
                           <!-- Select Basic -->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="selectbasic">Discipline *</label>
                                <div class="col-md-6">
                                    <input id="Dis" name="Dis" type="text"  class="form-control input-md">
                                    <div id="disList"></div>
                                </div>

                            </div>
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">No of bed</label>
                                <div class="col-md-4">
                                    <input id="updateNoOfBed" name="updateNoOfBed" type="text" placeholder="" class="form-control input-md">
                                </div>
                            </div>
                        </div>

                    </div>



                    <div class="row">
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Citizen Rates</label>
                                <div class="col-md-4">
                                    <input id="updateCitizenRates" name="updateCitizenRates" type="text" placeholder="" class="form-control input-md">
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Citizen Deposit</label>
                                <div class="col-md-4">
                                    <input id="updateCitizenDeposit" name="updateCitizenDeposit" type="text" placeholder="" class="form-control input-md">
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Citizen Discount</label>
                                <div class="col-md-4">
                                    <input id="updateCitizenDiscount" name="updateCitizenDiscount" type="text" placeholder="" class="form-control input-md">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Non Citizen Rates</label>
                                <div class="col-md-4">
                                    <input id="updateNonCitizenRates" name="updateNonCitizenRates" type="text" placeholder="" class="form-control input-md">
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Non Citizen Deposit</label>
                                <div class="col-md-4">
                                    <input id="updateNonCitizenDeposit" name="updateNonCitizenDeposit" type="text" placeholder="" class="form-control input-md">
                                </div>
                            </div>

                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Non Citizen Discount</label>
                                <div class="col-md-4">
                                    <input id="updateNonCitizenDiscount" name="updateNonCitizenDiscount" type="text" placeholder="" class="form-control input-md">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Pensioner Rates</label>
                                <div class="col-md-4">
                                    <input id="updatePensionerRates" name="updatePensionerRates" type="text" placeholder="" class="form-control input-md">
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Pensioner Deposit</label>
                                <div class="col-md-4">
                                    <input id="updatePensionerDeposit" name="updatePensionerDeposit" type="text" placeholder="" class="form-control input-md">
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Pensioner Discount</label>
                                <div class="col-md-4">
                                    <input id="updatePensionerDiscount" name="updatePensionerDiscount" type="text" placeholder="" class="form-control input-md">
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
                                    <%--
                                    <% request.getParameter(bathroom);

                                            %>
                                    --%>

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

<script src="bootstrap-3.3.6-dist/js/jquery.dataTables.min.js"></script>
<script src="searchDiscipline.jsp"></script>
<script src="old/assets/js/searchDisipline.js" type="text/javascript"></script>



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
            $('#updateWardClass').val(WardClass);
            $('#updateWardName').val(WardName);
            $('#updateWardID').val(WardID);
            Dis = $('#Dis').val();
            var array_dis = Dis.split("|");
            var Dis = array_dis[0];
            var  hfc = $("#Rhfc").val();
            var createdBy = $("#Rid").val();
             var  dis = $("#Rdis").val();
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
            $('#updatetoilet').val(toilet);
            $('#updatetelevison').val(televison);
            $('#updatebathroom').val(bathroom);
            $('#updatetelephone').val(telephone);
            if (status === '1')
                $('#updatestatus').val(1);
            else
                $('#updatestatus').val(0);
        });

        $("#updateIDButton").off('click').on('click', function (e) {

            e.preventDefault();
            var WardClass = $('#updateWardClass').val();
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
            var toilet = $('#updatetoilet').val();
            var televison = $('#updatetelevison').val();
            var bathroom = $('#updatebathroom').val();
            var telephone = $('#updatetelephone').val();
            var status = $('#updatestatus').val();
var  hfc = $("#Rhfc").val();
            var createdBy = $("#Rid").val();
             var  dis = $("#Rdis").val();
            var sub = $("#Rsub").val();
            //var hfc = $('#hfc').val();
            //var discipline = $('#discipline').val();
            //var subDicipline = $('#subDicipline').val();

            if (WardClass === "" || WardClass === null) {
                bootbox.alert("Complete The Fields of Ward Class update");
            } else if (WardID === "" || WardID === null) {
                bootbox.alert("Complete The Fields of Ward ID");
            } else if (Dis === "" || Dis === null) {
                bootbox.alert("Complete The Fields of Discipline");
            } else if (WardName === "" || WardName === null) {
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
                    WardClass: WardClass,
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
                    createdBy :createdBy,
                    dis :dis,
                    sub : sub
                };
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
        console.log(arrayData);
        //assign into seprated val
        var iditem = arrayData[0], wid = arrayData[2], hfc = arrayData[19];
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

                    var data = {
                        iditem: iditem,
                        wid:wid,
                        hfc:hfc

                    };
                    $.ajax({
                        type: "post",
                        url: "facilityIDDelete.jsp",
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
        $('#facilityIDTable').DataTable();

    });
</script>

