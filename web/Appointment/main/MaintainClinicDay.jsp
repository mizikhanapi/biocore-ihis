<%-- 
    Document   : MaintainClinicDay
    Created on : Sep 7, 2017, 5:46:42 PM
    Author     : -D-
--%>
<%@page import="ADM_helper.MySessionKey"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn Conn = new Conn();
    String hfc = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    String hfc_name = (String) session.getAttribute(MySessionKey.HFC_NAME);
    String hfc_state_name = "";
    String hfc_state_code = "";


    /*String sqlDisplayClinic = "SELECT d.*, sub.description AS subdiscipline_name FROM adm_lookup_detail sub,"
            + " (SELECT c.*, al.description AS discipline_name FROM adm_lookup_detail al, "
            + "(SELECT b.*,hfc.description AS hfc_name FROM adm_lookup_detail hfc,"
            + " (SELECT t.*,ld.description AS state_name FROM adm_lookup_detail ld,  "
            + "(SELECT state_code, hfc_cd, day_cd, discipline_cd, subdiscipline_cd, start_time, end_time, status FROM pms_clinic_day WHERE hfc_cd = '" + hfc + "' )t "
            + " WHERE t.state_code=ld.`Detail_Reference_code` AND ld.`Master_Reference_code` = '0002' AND ld.hfc_cd = '" + hfc + "')b  "
            + "WHERE hfc.Master_Reference_code='0081' AND hfc.Detail_Reference_code = b.hfc_cd AND hfc.hfc_cd = '" + hfc + "')c"
            + "  WHERE al.`Master_Reference_code`='0072' AND al.`Detail_Reference_code` = c.discipline_cd AND al.hfc_cd = '" + hfc + "')d  "
            + "WHERE sub.`Master_Reference_code` = '0071' AND sub.`Detail_Reference_code` = d.subdiscipline_cd  AND sub.hfc_cd = '" + hfc + "'"
            + " ORDER BY state_name ASC";
     */
    //                                      0              1            2           3                   4                   5               6              7            8                           
    String sqlDisplayClinic = "SELECT cli.state_code, cli.hfc_cd, cli.day_cd, cli.discipline_cd, cli.subdiscipline_cd, cli.start_time, cli.end_time, cli.status, sta.`Description` as state_name, "
            //       9              10                          11              
            + "hfc.hfc_name, dis.discipline_name, sub.subdiscipline_name "
            + "FROM pms_clinic_day cli "
            + "JOIN adm_health_facility hfc on hfc.hfc_cd=cli.hfc_cd "
            + "LEFT JOIN adm_discipline dis on dis.discipline_hfc_cd=cli.hfc_cd and dis.discipline_cd=cli.discipline_cd "
            + "LEFT JOIN adm_subdiscipline sub on sub.subdiscipline_hfc_cd=cli.hfc_cd and sub.discipline_cd=cli.discipline_cd and sub.subdiscipline_cd=cli.subdiscipline_cd "
            + "JOIN adm_lookup_detail sta on sta.hfc_cd=cli.hfc_cd and sta.`Detail_Reference_code`=cli.state_code and sta.`Master_Reference_code`='0002' "
            + "WHERE cli.hfc_cd='" + hfc + "' Order By state_name;";
    ArrayList<ArrayList<String>> dataClinicDay = Conn.getData(sqlDisplayClinic);

    if (dataClinicDay.size() > 0) {
        hfc_state_code = dataClinicDay.get(0).get(0);
        hfc_state_name = dataClinicDay.get(0).get(8);
    }

    String e7 = null;

%>

<h3 class="headerTitle">Maintain Clinic Day</h3>
<input class="form-control" id="state_" name="state_code" type="hidden" value="<%=hfc_state_code%>"> 
<input class="form-control" id="hfc_codeC" name="hfc_code" type="hidden" value="<%=hfc%>">

<form class="form-horizontal" id="clinicForm">    
    <div class="form-group"> 
        <script>

            function getDiscipline(hfc_cd) {
                var hfc = hfc_cd;
                $.ajax({
                    type: "POST",
                    url: "adminGetDiscipline.jsp",
                    data: {hfc: hfc},
                    success: function (data) {
                        $("#discipline").html(data);
                        $("#discipline").change();
                    }
                });

            }

            function getSubDiscipline(hfc_cd, discipline_cd) {
                var hfc = hfc_cd;
                var discipline_cd = discipline_cd
                $.ajax({
                    type: "POST",
                    url: "adminGetSubDiscipline.jsp",
                    data: {hfc_cd: hfc, discipline_cd: discipline_cd},
                    success: function (data) {
                        $("#subdiscipline").html(data);

                    }
                });

            }


            $(document).ready(function () {

                $("#hfc_codeC").on('change', function () {
                    getDiscipline($(this).val());
                });

                $("#discipline").on('change', function () {
                    var hfc_cd = $("#hfc_codeC").val();
                    var discipline_cd = $(this).val();
                    getSubDiscipline(hfc_cd, discipline_cd);


                });

                $("#hfc_codeC").change();

            });

        </script>
        <label class="control-label col-sm-2" for="state">State </label>
        <div class="col-sm-10"> 
            <input class="form-control" type="text" readonly value="<%=hfc_state_name%>">                            
        </div>
    </div>

    <div class="form-group"> 
        <label class="control-label col-sm-2" for="hfc">Health Facility Name  </label>
        <div id="hfc" class="col-sm-10">
            <input class="form-control" type="text" readonly value="<%=hfc_name%>">
            <input type="hidden" name="hfcBefore" id="hfcBefore">
        </div>
    </div>
    <div class="form-group"> 
        <label class="control-label col-sm-2" for="discipline">Discipline </label>
        <div class="col-sm-10"> 
            <select class="form-control" id="discipline" name="discipline" required>
                <option value=""></option>

            </select>
            <input type="hidden" name="disciplineBefore" id="disciplineBefore">
        </div>
    </div>
    <div class="form-group"> 
        <label class="control-label col-sm-2" for="subdiscipline">Subdiscipline </label>
        <div class="col-sm-10">
            <select class="form-control" id="subdiscipline" name="subdiscipline" required>
                <option value=""></option>
            </select>
            <input type="hidden" name="subdisciplineBefore" id="subdisciplineBefore">
        </div>
    </div>
    <div class="form-group"> 
        <label class="control-label col-sm-2" for="state">Clinic Day </label>
        <div class="col-sm-10"> 
            <input type="hidden" name="dayBefore"  id="dayBefore">
            <select class="form-control" id="clinicDay" name="day" required>
                <option value=""></option>

                <option value="Monday">Monday</option>
                <option value="Tuesday">Tuesday</option>
                <option value="Wednesday">Wednesday</option>
                <option value="Thursday">Thursday</option>
                <option value="Friday">Friday</option>
                <option value="Saturday">Saturday</option>
                <option value="Sunday">Sunday</option>

            </select>
        </div>
    </div>                                   
    <div class="form-group">
        <label class="control-label col-sm-2" for="starttime">Start Time</label>  
        <div class="col-sm-10">   

            <input  name="starttime" type="text" class="form-control" id="startdateC" placeholder="Click to set the time" required readonly>

        </div>
    </div>   
    <div class="form-group">
        <label class="control-label col-sm-2" for="endtime">End Time</label>  
        <div class="col-sm-10">   

            <input  name="endtime" type="text" class="form-control" id="enddateC" placeholder="Click to set the time" required readonly>

        </div>
    </div> 
    <div class="form-group">
        <label class="control-label col-sm-2" for="status">Clinic Status </label>
        <div class="col-sm-10">  
            <select class="form-control" id="status" name="status" required>

                <option value="">Please Select Your Status</option>
                <option value="active">active</option>
                <option value="inactive">inactive</option>

            </select>
        </div>
    </div>
    <div class="form-group">        
        <div class="col-sm-offset-2 col-sm-10">
            <button  class="btn btn-success" id="addClinicDay">Add</button>
            <button  class="btn btn-success" id="updateClinicDay">Update</button>
            <button  class="btn btn-success" id="cancelClinicDay">Cancel</button>
        </div>
    </div>
</form>
<div class="table-responsive" id="clinicDayTableDiv">
    <table class="table table-bordered table-hover" id="clinicDayTable">
        <thead>

            <tr> 
                <th><center>No</center></th>
        <th><center>State</center></th>
        <th><center>Health Facility Name </center></th>
        <th><center>Discipline</center></th>
        <th><center>Subdiscipline</center></th>
        <th><center>Clinic Day</center></th>
        <th><center>Start Time</center></th>
        <th><center>End Time</center></th>
        <th><center>Clinic Status</center></th>
        <th><center>Action</center></th>
        </tr>
        </thead>
        <tbody>
            <%
                if (dataClinicDay.size() > 0) {
                    for (int i = 0; i < dataClinicDay.size(); i++) {%>
            <tr>
                <td><center><%out.print(i + 1);%></center></td>
        <td><left><%=dataClinicDay.get(i).get(8)%></left></td>
        <td><left><%=dataClinicDay.get(i).get(9)%></left></td>
        <td><left><%=dataClinicDay.get(i).get(10)%></left></td>
        <td><left><%=dataClinicDay.get(i).get(11)%></left></td>
        <td><left><%=dataClinicDay.get(i).get(2)%></left></td>
        <td><center><%=dataClinicDay.get(i).get(5)%></center></td>
        <td><center><%=dataClinicDay.get(i).get(6)%></center></td>
        <td><center><%=dataClinicDay.get(i).get(7)%></center></td>            
        <td><center>
            <input type="hidden" id="clinicData<%=i%>" value="<%=dataClinicDay.get(i).get(8)%>|<%=dataClinicDay.get(i).get(9)%>|<%=dataClinicDay.get(i).get(10)%>|<%=dataClinicDay.get(i).get(11)%>|<%=dataClinicDay.get(i).get(2)%>|<%=dataClinicDay.get(i).get(5)%>|<%=dataClinicDay.get(i).get(6)%>|<%=dataClinicDay.get(i).get(7)%>">

            <button class="btn btn-xs btn-primary clinic-editBtn" id="clinicDay|<%=i%>">Edit</button>
            <button class="btn btn-xs btn-danger" onClick="myFunctions('<%=dataClinicDay.get(i).get(1)%>', '<%=dataClinicDay.get(i).get(3)%>', '<%=dataClinicDay.get(i).get(4)%>', '<%=dataClinicDay.get(i).get(2)%>')">Delete</button>
            <script>
                function myFunctions(hfcCode, disc, subdisc, day)
                {

                    var dataDelete = {
                        hfc_code: hfcCode,
                        discipline: disc,
                        subdiscipline: subdisc,
                        day: day
                    };
                    //console.log(data);
                    var result = confirm("Are you sure to delete the selected clinic day data?");
                    if (result === true)
                    {
                        $.ajax({
                            url: 'deleteClinicDay.jsp',
                            method: 'post',
                            timeout: 10000,
                            data: dataDelete,
                            success: function (result) {
                                console.log(result);
                                result = result.replace(";", "");
                                if (result.trim() === 'success') {
                                    //$('#clinicDayTable').load('adminAppointmentAjax.jsp #clinicDayTable');
                                    $('#clinicDayTableDiv').load('main/MaintainClinicDay.jsp #clinicDayTable', function(){
                                        initDataTable("clinicDayTable");
                                    });
                                    $('#tableViewClinicDayDiv').load("main/ViewClinicDay.jsp #tableViewClinicDay", function(){
                                        initDataTable("tableViewClinicDay");
                                    });
                                    alert('Clinic day deleted');
                                } else {
                                    alert('Error while deleted');
                                }
                            },
                            error: function (e) {
                                console.log(e);
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
    $(function () {
        $('#clinicDayTable').DataTable();
    });
</script>