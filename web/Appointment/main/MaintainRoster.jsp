<%-- 
    Document   : MaintainRoster
    Created on : Sep 14, 2017, 8:26:53 PM
    Author     : -D-
--%>
<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn Conn = new Conn();
    String hfc = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    String hfcName = (String) session.getAttribute("HFC_NAME");
    String discipline = (String) session.getAttribute("DISCIPLINE_CODE");
    String subdiscipline = (String) session.getAttribute("SUB_DISCIPLINE_CODE");

    String sqlDisplayRoster = "SELECT LCASE(ad.USER_NAME) as patientName, ad.USER_ID, dr.hfc_cd, DATE(dr.start_date) AS start_date, DATE(dr.end_date) AS end_date, TIME(dr.start_time) AS start_time, TIME(dr.end_time) AS end_time, dr.roster_category, dr.status  FROM adm_users ad, pms_duty_roster dr WHERE ad.USER_ID = dr.user_id AND dr.hfc_cd ='" + hfc + "'";
    ArrayList<ArrayList<String>> dataClinicRoster = Conn.getData(sqlDisplayRoster);

%>


<h3 class="headerTitle">Maintain Staff Roster</h3>
<form class="form-horizontal"> 
    <div class="form-group"> 
        <label class="control-label col-sm-2" for="staffID">Health Facility Name </label>
        <div class="col-sm-10"> 
            <input  class="form-control" value="<%=hfc%>" type="hidden" id="hfcRoster" readonly>
            <input  class="form-control" value="<%=hfcName%>" type="text" id="hfcNameRoster" readonly>
        </div>
    </div>
    <div class="form-group"> 
        <label class="control-label col-sm-2" for="staffID">Staff ID / Name / Title </label>
        <div class="col-sm-10"> 
            <select class="form-control" id="staffIDRoster" name="staffID">
                <option></option>
                <%
                    String sql7 = "SELECT  ar.USER_ID, au.USER_NAME, au.OCCUPATION_CODE, au.HEALTH_FACILITY_CODE FROM adm_user_access_role ar "
                            + "INNER JOIN adm_users au ON au.`USER_ID` = ar.`USER_ID` "
                            + "WHERE ar.`HEALTH_FACILITY_CODE` = '" + hfc + "' AND ar.`DISCIPLINE_CODE` = '" + discipline + "' AND ar.`SUBDISCIPLINE_CODE` = '" + subdiscipline + "';";
                    ArrayList<ArrayList<String>> dataUserRoster = Conn.getData(sql7);

                    if (dataUserRoster.size() > 0) {
                        for (int i = 0; i < dataUserRoster.size(); i++) {%>
                <option value="<%=dataUserRoster.get(i).get(0)%>"><%=dataUserRoster.get(i).get(0)%> / <%=dataUserRoster.get(i).get(1)%> / <%=dataUserRoster.get(i).get(2)%></option>
                <%}
                                                        }%>

            </select>
            <input type="hidden" name="userIDBefore" value="" id="userIDBefore">
        </div>
    </div>

    <div class="form-group"> 
        <label class="control-label col-sm-2" for="staffID">Shift </label>
        <div class="col-sm-10">
            <select class="form-control" id="roster_category" name="roster_category" required>
                <option value="">Select  Shift</option>
                <%
                    String sql_select_shift = "SELECT shift_cd,shift_name FROM pms_shift WHERE hfc_cd = '" + hfc + "' AND discipline_cd = '" + discipline + "' AND subdiscipline_cd = '" + subdiscipline + "';";
                    ArrayList<ArrayList<String>> dataSelectShift = Conn.getData(sql_select_shift);
                    if (dataSelectShift.size() > 0) {
                        for (int i = 0; i < dataSelectShift.size(); i++) {
                %>
                <option value="<%out.print(dataSelectShift.get(i).get(0));%>"><%out.print(dataSelectShift.get(i).get(1));%></option>

                <%
                        }
                    }
                %>


            </select>
        </div>
    </div>
    <div class="form-group"> 
        <label class="control-label col-sm-2" for="startDate">Start Date </label>
        <input type="hidden" name="startDateBeforeRoster" value="" id="startDateBeforeRoster">
        <div class="col-sm-10">
            <input  class="form-control" name="startDateRoster" value="" type="text" id="startDateRoster">

        </div>
    </div>
    <div class="form-group"> 
        <label class="control-label col-sm-2" for="endDate">End Date </label>
        <div class="col-sm-10">

            <input  class="form-control" name="end_date" value="" type="text" id="endDateRoster">

        </div>
    </div>
    <div class="form-group"> 
        <label class="control-label col-sm-2" for="startTime">Start Time </label>
        <div class="col-sm-10">

            <input  class="form-control" name="startTimeRoster" value="" type="text" id="startTimeRoster" readonly="">

        </div>
    </div>
    <div class="form-group"> 
        <label class="control-label col-sm-2" for="endTime">End Time </label>
        <div class="col-sm-10">

            <input  class="form-control" name="endTimeRoster" value="" type="text" id="endTimeRoster" readonly="">

        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-sm-2" for="status">Roster Status </label>
        <div class="col-sm-10">  
            <select class="form-control" id="statusRoster" name="statusRoster" >

                <option value="">Select Your Status</option>
                <option value="active">active</option>
                <option value="inactive">inactive</option>

            </select>
        </div>
    </div>
    <div class="form-group">        
        <div class="col-sm-offset-2 col-sm-10">
            <button  class="btn btn-success" id="addRoster">Add</button>
            <button  class="btn btn-success" id="updateRoster">Update</button>
            <button  class="btn btn-success" id="cancelRoster">Cancel</button>
        </div>
    </div>
</form>
<div class="table-responsive">
    <table class="table table-bordered table-hover" id="rosterTable">
        <thead>

            <tr> 
                <th><center> No</center> </th>
        <th><center> Staff Name</center></th>
        <th><center> Start Date </center></th>
        <th><center> End Date</center></th>
        <th><center> Start Time</center></th>
        <th><center> End Time</center></th>
        <th><center> Shift</center></th>
        <th><center> Roster Status</center></th>
        <th><center> Action</center></th>
        </tr>
        </thead>
        <tbody>
            <%
                if (dataClinicRoster.size() > 0) {
                    for (int i = 0; i < dataClinicRoster.size(); i++) {
                        Date today = new Date();
                        String expectedPattern = "yyyy-MM-dd";
                        SimpleDateFormat formatter = new SimpleDateFormat(expectedPattern);
                        String startDateFromDB = dataClinicRoster.get(i).get(3);
                        String endDateFromDB = dataClinicRoster.get(i).get(4);
                        Date startDateDB = formatter.parse(startDateFromDB);
                        Date endDateDB = formatter.parse(endDateFromDB);

                        SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd/MM/yyyy");
                        String dateStart = DATE_FORMAT.format(startDateDB);
                        String dateEnd = DATE_FORMAT.format(endDateDB);

                        //                                 %>
            <tr>
                <td><center><%out.print(i+1);%></center></td>
        <td><left> <%=dataClinicRoster.get(i).get(0)%></left></td>
        <td><center> <%=dateStart%></center></td>
        <td><center> <%=dateEnd%></center></td>
        <td><center> <%=dataClinicRoster.get(i).get(5)%></center></td>
        <td><center> <%=dataClinicRoster.get(i).get(6)%></center></td>
        <td><center> <%=dataClinicRoster.get(i).get(7)%></center></td>
        <td><center> <%=dataClinicRoster.get(i).get(8)%></center></td>
        <td><center>
            <input type="hidden" id="rosterData<%=i%>" value=" <%=dataClinicRoster.get(i).get(1)%>|<%=dateStart%>|<%=dateEnd%>|<%=dataClinicRoster.get(i).get(5)%>|<%=dataClinicRoster.get(i).get(6)%>|<%=dataClinicRoster.get(i).get(7)%>|<%=dataClinicRoster.get(i).get(8)%>">
            <button class="btn btn-xs btn-primary roster-editBtn"  id="roster-editBtn|<%=i%>">Edit</button>
            <button class="btn btn-xs btn-danger" onClick="myFunctionsr('<%=dataClinicRoster.get(i).get(1)%>', '<%=hfc%>', '<%=dataClinicRoster.get(i).get(3)%>')">Delete</button>
            <script>
                function myFunctionsr(staffId, hfc, startDate)
                {
                    var dataDelRoster = {
                        staffId: staffId,
                        hfc: hfc,
                        startDate: startDate
                    };
                    var result = confirm("Are you sure to delete the selected roster data?");
                    if (result === true)
                    {
                        $.ajax({
                            url: 'deleteRosterAjax.jsp',
                            method: 'post',
                            data: dataDelRoster,
                            timeout: 10000,
                            success: function (result) {
                                console.log(result);
                                result = result.replace(";", "");
                                if (result.trim() === "success") {
                                    alert('Roster are successful deleted');
                                    $('#rosterTable').load('main/MaintainRoster.jsp #rosterTable');
                                } else {
                                    alert('Data Roster does not exist');
                                }
                            },
                            error: function (err) {
                                console.log(err);
                            }
                        });
                    } else
                    {
                        return false;
                    }
                }
            </script>
        </center></td>
        </tr>
        <%}
                                                }%>
        </tbody>
    </table>
</div>
<script type="text/javascript">
    $(document).ready(function () {

        $("#roster_category").on('change', function () {
            var shift_cd = $(this).val();
            $.ajax({
                url: "search/getShiftTime.jsp",
                method: "POST",
                data: {
                    shift_cd: shift_cd
                },
                success: function (r) {
                    if (r.trim() === "3") {
                        alert("Error while retrieving shift");

                    } else {
                        var timeA = r.trim().split("|");
                        $("#startTimeRoster").val(timeA[0]);
                        $("#endTimeRoster").val(timeA[1]);
                    }
                }
            })
        })

        $('#cancelRoster').click(function (e) {
            e.preventDefault();
            $('#updateRoster').prop('disabled', true);
            $('#addRoster').prop('disabled', false);
            $('#staffIDRoster').val('');
            $('#userIDBefore').val('');
            $('#roster_category').val('');
            $('#startDateBeforeRoster').val('');
            $('#startDateRoster').val('');
            $('#endDateRoster').val('');
            $('#startTimeRoster').val('');
            $('#endTimeRoster').val('');
            $('#statusRoster').val('');
        });

        $('#updateRoster').click(function (e) {
            e.preventDefault(e);

            var startDate = changeDateFormat($('#startDateRoster').val());
            var endDate = changeDateFormat($('#endDateRoster').val());
            var startDateBefore = changeDateFormat($('#startDateBeforeRoster').val());


            var dataURoster = {
                hfcCode: $('#hfcRoster').val(),
                staffId: $('#staffIDRoster').val(),
                userIdBefore: $('#userIDBefore').val(),
                roster_category: $('#roster_category').val(),
                startDateBefore: startDateBefore,
                startDate: startDate,
                endDate: endDate,
                startTime: $('#startTimeRoster').val(),
                endTime: $('#endTimeRoster').val(),
                status: $('#statusRoster').val()
            };
            //console.log(dataURoster);

            $.ajax({
                url: 'updateRosterAjax.jsp',
                method: 'post',
                data: dataURoster,
                timeout: 10000,
                success: function (result) {
                    console.log(result);
                    if (result.trim() === 'success') {
                        alert('Update roster successful');
                        $('#rosterTable').load('main/MaintainRoster.jsp #rosterTable');
                    } else {
                        alert('Update roster fail due to the roster data does not exist');
                    }
                },
                error: function (error) {
                    console.log(error);
                }
            });
        });

        $('#rosterTable').on('click', '.roster-editBtn', function (e) {
            e.preventDefault();
            $('#updateRoster').prop('disabled', false);
            $('#addRoster').prop('disabled', true);
            $('html,body').animate({
                scrollTop: $("#maintainroster").offset().top
            }, 500);

            var idName = $(this).get(0).id;
            var id = idName.split("|");
            var dataRoster = $('#rosterData' + id[1]).val();
            var dataRArry = dataRoster.split("|");

            console.log(dataRArry);


//                    var starttimeRoster = ConvertTimeformat12('12', dataRArry[3]);
//                    var endtimeRoster = ConvertTimeformat12('12', dataRArry[4]);

            $('#staffIDRoster').val(dataRArry[0].trim());
            $('#userIDBefore').val(dataRArry[0].trim());
            $('#roster_category').val(dataRArry[5]);
            $('#startDateRoster').val(dataRArry[1]);
            $('#startDateBeforeRoster').val(dataRArry[1]);
            $('#endDateRoster').val(dataRArry[2]);
            $('#startTimeRoster').val(dataRArry[3]);
            $('#endTimeRoster').val(dataRArry[4]);
            $('#statusRoster').val(dataRArry[6]);

        });

        $('#addRoster').click(function (e) {
            e.preventDefault();

            var startDateRoster = $('#startDateRoster').val().split('/');
            var endDateRoster = $('#endDateRoster').val().split('/');
            startDateRoster = startDateRoster[2] + '-' + startDateRoster[1] + '-' + startDateRoster[0];
            endDateRoster = endDateRoster[2] + '-' + endDateRoster[1] + '-' + endDateRoster[0];

//                    var starttimeRoster = ConvertTimeformat('24', $('#startTimeRoster').val());
//                    var endtimeRoster = ConvertTimeformat('24', $('#endTimeRoster').val());

            var dataRoster = {
                hfcRoster: $('#hfcRoster').val(),
                staffIDRoster: $('#staffIDRoster').val(),
                roster_category: $('#roster_category').val(),
                startDateRoster: startDateRoster,
                endDateRoster: endDateRoster,
                startTimeRoster: $('#startTimeRoster').val(),
                endTimeRoster: $('#endTimeRoster').val(),
                statusRoster: $('#statusRoster').val()
            };

            console.log(dataRoster);
            $.ajax({
                url: 'addRosterAjax.jsp',
                method: 'post',
                timeout: 10000,
                data: dataRoster,
                success: function (result) {
                    console.log(result);
                    if (result.trim() === 'fail') {
                        alert('Fail to add staff roster due to the roster period still active');
                    } else if (result.trim() === 'success') {
                        alert('Insert Roster Successful');
                        $('#rosterTable').load('main/MaintainRoster.jsp #rosterTable');
                        $('#staffIDRoster').val('');
                        $('#userIDBefore').val('');
                        $('#roster_category').val('');
                        $('#startDateBeforeRoster').val('');
                        $('#startDateRoster').val('');
                        $('#endDateRoster').val('');
                        $('#startTimeRoster').val('');
                        $('#endTimeRoster').val('');
                        $('#statusRoster').val('');
                    } else {
                        alert('error on ajax');
                    }
                },
                error: function (err) {
                    console.log(err);
                }
            });
        });

    })
</script>