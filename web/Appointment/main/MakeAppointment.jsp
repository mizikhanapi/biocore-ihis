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
            </div>

        </div>
        <div class="col-md-4">


            <div class="col-md-12">
                <label class="col-md-12" for="textinput">Discipline</label>
                <input class="form-control input-lg" type="text"  id="t_SEARCH_Appointment_DIS_NAME"   value="<%=discipline_name%>" readonly="">
                <input class="form-control input-lg" type="hidden"  id="t_SEARCH_Appointment_DIS_CODE"   value="<%=discipline%>" readonly="">
                <input class="form-control input-lg" type="hidden"  id="t_ADD_Appointment_END_TIME"   value="<%=end_time_calendar%>" readonly="">
            </div>

        </div>
        <div class="col-md-4">

            <div class="col-md-12">
                <label class="col-md-12" for="textinput">Subdiscipline</label>
                <input class="form-control input-lg" type="text"  id="t_SEARCH_Appointment_SUBDIS_NAME"  value="<%=subdiscipline_name%>" readonly="">
                <input class="form-control input-lg" type="hidden"  id="t_SEARCH_Appointment_SUBDIS_CODE"  value="<%=subdiscipline%>" readonly="">
                <input class="form-control input-lg" type="hidden"  id="t_ADD_Appointment_DURATION"  value="<%=duration_time_calendar%>" readonly="">
            </div>

            <div class="form-group" style="float: right; padding-right: 15px">
                <!--                                                <button class="btn btn-primary" id="t_SEARCH_HFC_VIEW_Appointment" >Search</button>-->
            </div>
        </div>

    </div>
    <div id="AppointmentCalender"></div>


