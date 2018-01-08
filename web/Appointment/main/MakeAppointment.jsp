<%-- 
    Document   : MakeAppointment
    Created on : Sep 14, 2017, 9:55:17 PM
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
    String hfc_name = (String) session.getAttribute("HFC_NAME");
    String discipline = (String) session.getAttribute("DISCIPLINE_CODE");
    String subdiscipline = (String) session.getAttribute("SUB_DISCIPLINE_CODE");
    String USER_TYPE = (String) session.getAttribute("USER_TYPE");
    String start_time_calendar = "08:00";
    String end_time_calendar = "18:00:00";;
    String duration_time_calendar = "00:15";

    String discipline_name = null;
    String subdiscipline_name = null;

    String hfc_name_sql = "SELECT hfc_name FROM adm_health_facility WHERE hfc_cd = '" + hfc + "'";
    ArrayList<ArrayList<String>> hfc_name_AL = Conn.getData(hfc_name_sql);
    hfc_name = hfc_name_AL.get(0).get(0);

    String discipline_name_sql = "SELECT discipline_name FROM adm_discipline WHERE discipline_cd = '" + discipline + "' AND discipline_hfc_cd = '" + hfc + "';";
    ArrayList<ArrayList<String>> discipline_name_AL = Conn.getData(discipline_name_sql);
    discipline_name = discipline_name_AL.get(0).get(0);

    String subdiscipline_name_sql = "SELECT subdiscipline_name FROM adm_subdiscipline WHERE subdiscipline_hfc_cd = '" + hfc + "' AND discipline_cd = '" + discipline + "' AND subdiscipline_cd = '" + subdiscipline + "'";
    ArrayList<ArrayList<String>> subdiscipline_name_AL = Conn.getData(subdiscipline_name_sql);
    subdiscipline_name = subdiscipline_name_AL.get(0).get(0);
    String sqlTimeAppoinment = "SELECT start_time, consultation_period FROM pms_appointment_time pat WHERE hfc_cd = '" + hfc + "' AND discipline_cd = '" + discipline + "' AND subdiscipline_cd = '" + subdiscipline + "' ORDER BY start_time ASC";
    String sqlEndTimeAppoinment = "select ADDTIME(start_time,consultation_period),consultation_period from pms_appointment_time where hfc_cd = '" + hfc + "' AND discipline_cd = '" + discipline + "' AND subdiscipline_cd = '" + subdiscipline + "' ORDER BY start_time DESC LIMIT 1";

    ArrayList<ArrayList<String>> data_time_appointment = Conn.getData(sqlTimeAppoinment);
    ArrayList<ArrayList<String>> data_End_time_appointment = Conn.getData(sqlEndTimeAppoinment);

    if (data_time_appointment.size() > 0) {
        int index_date_time_appointment = data_time_appointment.size();
        start_time_calendar = data_time_appointment.get(0).get(0);
        end_time_calendar = data_End_time_appointment.get(0).get(0);
    }


%>

    <h3 class="headerTitle">Make Patient Appointment</h3>
    <div class="row">
        <div class="col-md-4">


            <div class="col-md-12">
                <label class="col-md-12" for="textinput">Health Facility</label>
                
                <input class="form-control input-lg" type="text"  id="t_SEARCH_Appointment_HFC_NAME"   value="<%=hfc_name%>" readonly="">
                <input class="form-control input-lg" type="hidden"  id="t_SEARCH_Appointment_HFC_CD"   value="<%=hfc%>" readonly="">
                <input class="form-control input-lg" type="hidden"  id="t_ADD_Appointment_START_TIME"   value="<%=start_time_calendar%>" readonly="">
                <%
                    if (USER_TYPE.equals("PUBLIC")) {
                %>                <select class="form-control" id="hfc_code" name="hfc_name" placeholder="Select Hospital/Clinic" required>
                    <option disabled selected>Select Hospital/Clinic</option>
                <%
                    String sqlHFCCode = "select hfc_name,hfc_cd from adm_health_facility";
                    ArrayList<ArrayList<String>> dataHFCCode = Conn.getData(sqlHFCCode);

                    if (dataHFCCode.size() > 0) {
                        for (int i = 0; i < dataHFCCode.size(); i++) {%>
                    <option value="<%=dataHFCCode.get(i).get(1)%>"><%=dataHFCCode.get(i).get(0)%></option>
                <% }
                    }

                %>
                </select><%
                            }
                %>

            </div>

        </div>
        <div class="col-md-4">


            <div class="col-md-12">
                <label class="col-md-12" for="textinput">Discipline</label>
                <input class="form-control input-lg" type="text"  id="t_SEARCH_Appointment_DIS_NAME"   value="<%=discipline_name%>" readonly="">
                <input class="form-control input-lg" type="hidden"  id="t_SEARCH_Appointment_DIS_CODE"   value="<%=discipline%>" readonly="">
                <input class="form-control input-lg" type="hidden"  id="t_ADD_Appointment_END_TIME"   value="<%=end_time_calendar%>" readonly="">
                <%
                    if (USER_TYPE.equals("PUBLIC")) {
                %><div id="divDiscipline">
                </div><%
                            }
                %>
                
            </div>

        </div>
        <div class="col-md-4">

            <div class="col-md-12">
                <label class="col-md-12" for="textinput">Subdiscipline</label>
                <input class="form-control input-lg" type="text"  id="t_SEARCH_Appointment_SUBDIS_NAME"  value="<%=subdiscipline_name%>" readonly="">
                <input class="form-control input-lg" type="hidden"  id="t_SEARCH_Appointment_SUBDIS_CODE"  value="<%=subdiscipline%>" readonly="">
                <input class="form-control input-lg" type="hidden"  id="t_ADD_Appointment_DURATION"  value="<%=duration_time_calendar%>" readonly="">
                <%
                    if (USER_TYPE.equals("PUBLIC")) {
                %> <div id="subDiscipline">
                </div><%
                    }
                %>
               
            </div>

            <div class="form-group" style="float: right; padding-right: 15px">
                <%
                    if(USER_TYPE.equals("PUBLIC")){
                        %>
                        <button class="btn btn-primary" id="t_SEARCH_HFC_CHANGE_HFC" >CHANGE</button>
<!--                        <button class="btn btn-primary" id="t_SEARCH_HFC_VIEW_Appointment" >Search</button>
                        <button class="btn btn-default" id="t_SEARCH_HFC_CANCEL" >CANCEL</button>
                        <button class="btn btn-primary" id="t_SEARCH_HFC_CHANGE_HFC" >CHANGE</button>-->
                        <%
                    }
                    %>
                <!--                                                <button class="btn btn-primary" id="t_SEARCH_HFC_VIEW_Appointment" >Search</button>-->
            </div>
        </div>

    </div>
    <div id="AppointmentCalender"></div>
    
    <div class="modal fade" id="AppointmentAdd" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                    <h3 class="modal-title" id="lineModalLabel">Make Appointment</h3>
                </div>
                <div class="modal-header" style="padding: 0px;">

                </div>
                <div class="modal-body">
                    <div class="tabbable-panel">
                        <div class="tabbable-line">
                            <!-- tab content -->
                            <div class="tab-content">

                                <div class="form-horizontal">
                                    <h4 class="modal-title" style="font-weight: bold">Search Patient</h4>
  <%if (USER_TYPE.equals("STAFF")) {
  %>                                    <div class="row">
      <div class="col-md-6">
          <div class="form-group" >
              <label class="  col-md-12" for="textinput" >Search Type</label>
              <div class="col-md-12">
                  <select class="form-control input-lg" id="select_TYPE_SEARCH_PATIENT" name="select_TYPE_SEARCH_PATIENT">
                      <option value="IC">Identification Card Number / IC No</option>
                      <option value="PMI">PMI Number</option>
                      <option value="ID">ID Number / Matric / Staff Number</option>
                  </select>
              </div>
          </div> 
      </div>
      <div class="col-md-6">
          <div class="form-group form-inline" >
              <label class="  col-md-12" for="textinput" >&nbsp;</label>
              <div class="col-md-12">
                  <input class="form-control input-lg" type="text"  id="t_SEARCH_PMI_NO" placeholder="Enter PMI Number Here" style="width: 82%;">
                  <input class="form-control input-lg" type="text"  id="t_SEARCH_IC_NO" placeholder="Enter IC Number Here" style="width: 82%;" >
                  <input class="form-control input-lg" type="text"  id="t_SEARCH_ID_NO" placeholder="Enter ID Number Here" style="width: 82%;" >
                  <button class="btn btn-primary" id="t_SEARCH_Patient_ADD_Appointment" >Search</button>
              </div>
          </div>
      </div>

  </div><%
}%>

                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">

                                                <div class="col-md-12">

                                                    <input class="form-control input-lg" type="hidden"  id="t_ADD_Appointment_HFC_CD"   value="<%=hfc%>">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">

                                                <div class="col-md-12">

                                                    <input class="form-control input-lg" type="hidden"  id="t_ADD_Appointment_DIS_CODE"   value="<%=discipline%>">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <div class="col-md-12">


                                                    <input class="form-control input-lg" type="hidden"  id="t_ADD_Appointment_SUBDIS_CODE"  value="<%=subdiscipline%>">
                                                </div>
                                            </div>

                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="col-md-12"><h4 class="modal-title" style="font-weight: bold">Patient Detail</h4></div>
                                        <div class="col-md-6">


                                            <!-- content goes here -->
                                            <div class="form-group">

                                                <label class="col-md-12" for="textinput">Patient Name</label>
                                                <div class="col-md-12">
                                                    <%
                                                        if (USER_TYPE.equals("PUBLIC")) {
                                                            %><input class="form-control input-lg" type="text" name="problem"  id="t_ADD_Appointment_Patient_Name" readonly="" value="<%=session.getAttribute("USER_NAME").toString()%>"><%
} else {
                                                    %><input class="form-control input-lg" type="text" name="problem"  id="t_ADD_Appointment_Patient_Name" readonly=""><%
}
                                                        %>

                                                    

                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label class="col-md-12" for="textinput">PMI Number</label>
                                                <div class="col-md-12">
                                                    <%
                                                        if (USER_TYPE.equals("PUBLIC")) {
                                                    %>                                                    <input class="form-control input-lg" type="text" name="problem"  id="t_ADD_Appointment_PMI_NO" readonly="" value="<%=session.getAttribute("PMI_NO").toString()%>">
                                                    <input class="form-control input-lg" type="hidden" name="problem"  id="t_ADD_Appointment_IC_NO" readonly="" value="<%=session.getAttribute("IC_NO").toString()%>"><%
                                                            } else {
                                                    %>                                                    <input class="form-control input-lg" type="text" name="problem"  id="t_ADD_Appointment_PMI_NO" readonly="">
                                                    <input class="form-control input-lg" type="hidden" name="problem"  id="t_ADD_Appointment_IC_NO" readonly=""><%
                                                        }
                                                    %>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label class="col-md-12" for="textinput">ID Number</label>
                                                <div class="col-md-12">
                                                    <%
                                                        if (USER_TYPE.equals("PUBLIC")) {
                                                    %> <input class="form-control input-lg" type="text" name="problem"  id="t_ADD_Appointment_ID_NO" readonly="" value="<%=session.getAttribute("ID_NO").toString()%>"><%
                                                    } else {
                                                    %> <input class="form-control input-lg" type="text" name="problem"  id="t_ADD_Appointment_ID_NO" readonly=""><%
                                                        }
                                                    %>
                                                   

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <hr/>
                                    <div class="row">
                                        <div class="col-md-12"><h4 class="modal-title" style="font-weight: bold">Appointment Detail</h4></div>
                                        <div class="col-md-6">


                                            <!-- content goes here -->
                                            <div class="form-group">

                                                <label class="col-md-12" for="textinput">Date</label>
                                                <div class="col-md-12">
                                                    <input class="form-control input-lg" type="text" name="problem"  id="t_ADD_Appoinment_Date">

                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="col-md-12" for="textinput">Time</label>
                                                <div class="col-md-12">
                                                    <div id="div_ADD_Appoinment_TIME"></div>
                                                    <!--                                                <select class="form-control input-lg" id="t_ADD_Appoinment_Time" name="appTime" required>
                                                                                                        <option></option>
                                                                                                        <option value="09:00:00"><%out.print("09:00:00");%></option>
                                                                                                        <option value="09:15:00"><%out.print("09:15:00");%></option>
                                                                                                        <option value="09:30:00"><%out.print("09:30:00");%></option>
                                                                                                        <option value="09:45:00"><%out.print("09:45:00");%></option>
                                                                                                        <option value="10:00:00"><%out.print("10:00:00");%></option>
                                                                                                        <option value="10:15:00"><%out.print("10:15:00");%></option>
                                                                                                        <option value="10:30:00"><%out.print("10:30:00");%></option>
                                                                                                        <option value="10:35:00"><%out.print("10:35:00");%></option>
                                                                                                        <option value="10:40:00"><%out.print("10:40:00");%></option>
                                                                                                        <option value="10:45:00"><%out.print("10:45:00");%></option>
                                                                                                        <option value="11:00:00"><%out.print("11:00:00");%></option>
                                                                                                        <option value="11:15:00"><%out.print("11:15:00");%></option>
                                                                                                        <option value="11:30:00"><%out.print("11:30:00");%></option>
                                                                                                        <option value="11:45:00"><%out.print("11:45:00");%></option>
                                                                                                        <option value="12:00:00"><%out.print("12:00:00");%></option>
                                                                                                        <option value="12:15:00"><%out.print("12:15:00");%></option>
                                                                                                        <option value="12:30:00"><%out.print("12:30:00");%></option>
                                                                                                        <option value="12:45:00"><%out.print("12:45:00");%></option>
                                                                                                        <option value="13:00:00"><%out.print("13:00:00");%></option>
                                                                                                        <option value="13:15:00"><%out.print("13:15:00");%></option>
                                                                                                        <option value="13:30:00"><%out.print("13:30:00");%></option>
                                                                                                        <option value="13:45:00"><%out.print("13:45:00");%></option>
                                                                                                        <option value="14:00:00"><%out.print("14:00:00");%></option>
                                                                                                        <option value="14:15:00"><%out.print("14:15:00");%></option>
                                                                                                        <option value="14:30:00"><%out.print("14:30:00");%></option>
                                                                                                        <option value="14:45:00"><%out.print("14:45:00");%></option>
                                                                                                        <option value="15:00:00"><%out.print("15:00:00");%></option>
                                                                                                        <option value="15:15:00"><%out.print("15:15:00");%></option>
                                                                                                        <option value="15:30:00"><%out.print("15:30:00");%></option>
                                                                                                        <option value="15:45:00"><%out.print("15:45:00");%></option>
                                                                                                        <option value="16:00:00"><%out.print("16:00:00");%></option>
                                                                                                        <option value="16:15:00"><%out.print("16:15:00");%></option>
                                                                                                        <option value="16:30:00"><%out.print("16:30:00");%></option>
                                                                                                    </select>-->

                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="col-md-12 " for="textinput">Doctor</label>
                                                <div class="col-md-12">
                                                    <div id="div_ADD_Appoinment_Doctor"></div>


                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="col-md-12" for="textinput">Type</label>
                                                <div class="col-md-12">
                                                    <select class="form-control input-lg" id="t_ADD_Appoinment_Type" name="appType" required>
                                                        <option></option>
                                                        <%
                                                            String sqlAppType = "SELECT `Description` FROM adm_lookup_detail WHERE `Master_Reference_code` = '0086' AND hfc_cd = '" + hfc + "' ";
                                                            ArrayList<ArrayList<String>> dataAppType = Conn.getData(sqlAppType);

                                                            if (dataAppType.size() > 0) {
                                                                for (int i = 0; i < dataAppType.size(); i++) {%>
                                                        <option value="<%=dataAppType.get(i).get(0)%>"><%=dataAppType.get(i).get(0)%></option>
                                                        <% }
                                                            }
                                                        %>
                                                    </select>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <!-- Tab 1 -->


                                <!-- Tab 2 -->

                            </div>
                        </div>
                    </div>




                </div>

                <div class="modal-footer">
                    <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                        <div class="btn-group" role="group">
                            <button type="button" class="btn btn-success btn-block btn-lg" id="btn_ADD_Appoinment_ADD" role="button">Submit Orders</button>
                        </div>
                        <div class="btn-group btn-delete hidden" role="group">
                            <button type="button" id="delImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal"  role="button">Clear</button>
                        </div>
                        <div class="btn-group" role="group">
                            <button type="button" id="saveImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--End add Procedure-->

<div class="modal fade" id="AppointmentViewModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">View Appointment Detail</h3>
            </div>
            <div class="modal-header" style="padding: 0px;">

            </div>
            <div class="modal-body">
                <div id="Appointment_Detail_Div"></div>
            </div>
        

        <div class="modal-footer">
            <div class="btn-group btn-group-justified" role="group" aria-label="group button">

                <div class="btn-group" role="group">
                    <button type="button" id="btn_CANCEL_Appoinment_CANCEL" class="btn btn-danger btn-block btn-lg">Cancel Appointment</button>
                    <button type="button" id="btn_CANCEL_Appoinment_REACTIVE" class="btn btn-success btn-block btn-lg">Reactive Appointment</button>
                </div>
                <div class="btn-group" role="group">
                    <button type="reset" id="" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button" >Close</button>
                </div>
            </div>
        </div>
            </div>
    </div>
</div>
    
    <div class="modal fade" id="AppointmentCancelReason" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                    <h3 class="modal-title" id="lineModalLabel">Cancel Reason</h3>
                </div>
                <div class="modal-header" style="padding: 0px;">

                </div>
                <div class="modal-body">
                    <textarea name="t_CANCEL_Appointment_REASON" id="t_CANCEL_Appointment_REASON" class="form-control" rows="5" id="desc" maxlength="100" required></textarea>
                </div>
            

            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">

                    <div class="btn-group" role="group">
                        <button type="button" id="" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>

                    </div>
                    <div class="btn-group" role="group">
                        <button type="reset" id="btn_CANCEL_Appointment_CONFIRM" class="btn btn-primary btn-block btn-lg" data-dismiss="modal" role="button" >Confirm</button>
                        
                    </div>
                </div>
            </div>
                </div>
        </div>
    </div>

                <%
                    if (USER_TYPE.equals("PUBLIC")) {
                %><script src="calender/AppointmentCalendarPatient.js" type="text/javascript"></script><%
                            }else {
%><script src="calender/AppointmentCalendar.js" type="text/javascript"></script><%
}
                %>
