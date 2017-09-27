<%-- 
    Document   : MaintainClinicDay
    Created on : Sep 7, 2017, 5:46:42 PM
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
    String hfc_state_name = null;
    String hfc_state_code = null;

    String sqlDisplayClinic = "SELECT d.*, sub.description AS subdiscipline_name FROM adm_lookup_detail sub,"
            + " (SELECT c.*, al.description AS discipline_name FROM adm_lookup_detail al, "
            + "(SELECT b.*,hfc.description AS hfc_name FROM adm_lookup_detail hfc,"
            + " (SELECT t.*,ld.description AS state_name FROM adm_lookup_detail ld,  "
            + "(SELECT state_code, hfc_cd, day_cd, discipline_cd, subdiscipline_cd, start_time, end_time, status FROM pms_clinic_day WHERE hfc_cd = '" + hfc + "' )t "
            + " WHERE t.state_code=ld.`Detail_Reference_code` AND ld.`Master_Reference_code` = '0002' AND ld.hfc_cd = '" + hfc + "')b  "
            + "WHERE hfc.Master_Reference_code='0081' AND hfc.Detail_Reference_code = b.hfc_cd AND hfc.hfc_cd = '" + hfc + "')c"
            + "  WHERE al.`Master_Reference_code`='0072' AND al.`Detail_Reference_code` = c.discipline_cd AND al.hfc_cd = '" + hfc + "')d  "
            + "WHERE sub.`Master_Reference_code` = '0071' AND sub.`Detail_Reference_code` = d.subdiscipline_cd  AND sub.hfc_cd = '" + hfc + "'"
            + " ORDER BY state_name ASC";
    ArrayList<ArrayList<String>> dataClinicDay = Conn.getData(sqlDisplayClinic);

    String sql_hfc_state = "SELECT ld.`Description`, hf.state_cd FROM adm_health_facility hf  INNER JOIN adm_lookup_detail ld ON ld.`Detail_Reference_code` = hf.state_cd WHERE hf.hfc_cd = '" + hfc + "' AND ld.hfc_cd = '04010101' AND ld.`Master_Reference_code` = '0002'";
    ArrayList<ArrayList<String>> data_hfc_state = Conn.getData(sql_hfc_state);

    hfc_state_code = data_hfc_state.get(0).get(1);
    hfc_state_name = data_hfc_state.get(0).get(0);

    String sql_hfc_list = " SELECT hfc_cd,hfc_name FROM adm_health_facility WHERE state_cd = '" + hfc_state_code + "'  ";
    ArrayList<ArrayList<String>> data_hfc_list = Conn.getData(sql_hfc_list);

    String e7 = null;

    String stateCode = null;
%>

<h3 class="headerTitle">Maintain Clinic Day</h3>
<form class="form-horizontal" id="clinicForm">    
    <div class="form-group"> 
        <script>
            function showUser()
            {
                var str = $("#state_ option:selected").val();

                if (str === "")
                {
                    document.getElementById("hfc_codeC").innerHTML = "";
                    return;
                }
                //                                                
            <%                                                    //                                                  if($('#hfc_code').val()!=null)){
            %>
                //                                                           if($('#hfc_code').val()==null)){
                $.ajax({
                    type: "POST",
                    url: "adminGetHFC.jsp",
                    data: {state: str},
                    success: function (data) {

                        document.getElementById("hfc_codeC").innerHTML = data;
                        getDiscipline();
                    }
                });
                //                                                           }
            <%                                                    //                                                  }
            %>
            }

            function getDiscipline(hfc_cd) {
                var hfc = hfc_cd;
                $.ajax({
                    type: "POST",
                    url: "adminGetDiscipline.jsp",
                    data: {hfc: hfc},
                    success: function (data) {
                        $("#discipline").html(data);

                    }
                });
                
            }
            
             function getSubDiscipline(hfc_cd,discipline_cd) {
                var hfc = hfc_cd;
                var discipline_cd = discipline_cd
                $.ajax({
                    type: "POST",
                    url: "adminGetSubDiscipline.jsp",
                    data: {hfc_cd: hfc,discipline_cd:discipline_cd},
                    success: function (data) {
                        $("#subdiscipline").html(data);

                    }
                });
                
            }

            $(document).ready(function () {
                $("#hfc_codeC").on('change', function () {
                    getDiscipline($(this).val())
                });
                $("#discipline").on('change',function(){
                    var hfc_cd =  $("#hfc_codeC option:selected").val();
                    var discipline_cd = $(this).val();
                    getSubDiscipline(hfc_cd,discipline_cd)
 
                    
                });
            })

        </script>
        <label class="control-label col-sm-2" for="state">State </label>
        <div class="col-sm-10"> 
            <select class="form-control" id="state_" name="state_code" onchange="showUser()" required>
                <option value="">Select State</option>
                <%   String sql3 = "SELECT Detail_Reference_code, Description FROM adm_lookup_detail WHERE Master_Reference_code = '0002'  AND  hfc_cd = '" + hfc + "'  ";
                    ArrayList<ArrayList<String>> dataStateClinic = Conn.getData(sql3);

                    if (hfc_state_name == null) {
                        if (dataStateClinic.size() > 0) {
                            for (int i = 0; i < dataStateClinic.size(); i++) {%>
                <option value="<%=dataStateClinic.get(i).get(0)%>"><%=dataStateClinic.get(i).get(1)%></option>
                <%}
                    }
                } else {
                    String sqlStateCode = "SELECT Detail_Reference_code FROM adm_lookup_detail WHERE Master_Reference_code = '0002' AND  Description ='" + hfc_state_name + "'   AND  hfc_cd = '" + hfc + "'  ";
                    ArrayList<ArrayList<String>> dataStateCode = Conn.getData(sqlStateCode);

                    stateCode = dataStateCode.get(0).get(0);

                    for (int i = 0; i < dataStateClinic.size(); i++) {
                        if (stateCode.equals(dataStateClinic.get(i).get(0))) {%> 
                <option value="<%=stateCode%>" selected ><%=dataStateClinic.get(i).get(1)%></option>
                <%} else {%>
                <option value="<%=dataStateClinic.get(i).get(0)%>"><%=dataStateClinic.get(i).get(1)%></option>
                <%}
                    }
                %>
                <script>

                    showUser();

                </script><%
                    }%>
            </select>
        </div>
    </div>

    <div class="form-group"> 
        <label class="control-label col-sm-2" for="hfc">Health Facility Name  </label>
        <div id="hfc" class="col-sm-10">
            <select class="form-control" id="hfc_codeC" name="hfc_code" required>

                <%
                    if (hfc == null) {
                %>
                <option></option> <%
                } else {

                    //                                                checkDropdown=true;
                    String getHFCValue = " SELECT hfc_cd,hfc_name FROM adm_health_facility WHERE state_cd = '" + stateCode + "'  ";
                    ArrayList<ArrayList<String>> dataGetHFCValue = Conn.getData(getHFCValue);
                    out.print(getHFCValue);
                    if (dataGetHFCValue.size() > 0) {
                        for (int i = 0; i < dataGetHFCValue.size(); i++) {
                            if (hfc.equals(dataGetHFCValue.get(i).get(0))) {
                %><option selected value="<%=dataGetHFCValue.get(i).get(0)%>" ><%=dataGetHFCValue.get(i).get(1)%></option> <%
                } else {
                %><option value="<%=dataGetHFCValue.get(i).get(0)%>" ><%=dataGetHFCValue.get(i).get(1)%></option> <%
                        }
                    }
                } else {
                %> <option>No Healthcare Facility Exist</option><%
                        }

                    }
                %>
            </select>

            <input type="hidden" name="hfcBefore" id="hfcBefore">
        </div>
    </div>
    <div class="form-group"> 
        <label class="control-label col-sm-2" for="discipline">Discipline </label>
        <div class="col-sm-10"> 
            <select class="form-control" id="discipline" name="discipline" required>
                <option></option>

            </select>
            <input type="hidden" name="disciplineBefore" id="disciplineBefore">
        </div>
    </div>
    <div class="form-group"> 
        <label class="control-label col-sm-2" for="subdiscipline">Subdiscipline </label>
        <div class="col-sm-10">
            <select class="form-control" id="subdiscipline" name="subdiscipline" required>
                <option></option>
                <%  String sql6 = "SELECT Detail_Reference_code, Description FROM adm_lookup_detail WHERE Master_Reference_code = '0071'  AND  hfc_cd = '" + hfc + "' ";
                    ArrayList<ArrayList<String>> dataSubClinic = Conn.getData(sql6);
                    if (dataSubClinic.size() > 0) {
                        for (int i = 0; i < dataSubClinic.size(); i++) {%>
                <option value="<%=dataSubClinic.get(i).get(0)%>"><%=dataSubClinic.get(i).get(1)%></option>
                <%}
                    }%>

            </select>
            <input type="hidden" name="subdisciplineBefore" id="subdisciplineBefore">
        </div>
    </div>
    <div class="form-group"> 
        <label class="control-label col-sm-2" for="state">Clinic Day </label>
        <div class="col-sm-10"> 
            <input type="hidden" name="dayBefore"  id="dayBefore">
            <select class="form-control" id="clinicDay" name="day" required>
                <option></option>

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

            <input  name="starttime" type="text" class="form-control" id="startdateC" placeholder="" required>

        </div>
    </div>   
    <div class="form-group">
        <label class="control-label col-sm-2" for="endtime">End Time</label>  
        <div class="col-sm-10">   

            <input  name="endtime" type="text" class="form-control" id="enddateC"placeholder="" required>

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
<div class="table-responsive">
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
                                    $('#clinicDayTable').load('adminAppointmentAjax.jsp #clinicDayTable');
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
