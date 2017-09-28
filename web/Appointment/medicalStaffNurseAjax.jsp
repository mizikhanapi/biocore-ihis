<%-- 
    Document   : medicalStaffNurseAjax
    Created on : Jan 24, 2017, 2:24:08 PM
    Author     : -D-
--%>

<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<script type="text/javascript">
    window.history.forward();
    function noBack()
    {
        window.history.forward();
    }
</script>

<%
        //untuk IE
    response.addHeader("Pragma", "no-cache");
    response.addHeader("Cache-Control", "no-cache");
    response.addHeader("Cache-Control", "no-store");
    response.addHeader("Cache-Control", "must-revalidate");
    response.addHeader("Cache-Control", "Post-Check=0");
    response.addHeader("Cache-Control", "Pre-Check=0");
    response.addHeader("Expires", "Mon, 1 Jan 2006 05:00:00 GMT");//in the past
    
Conn Conn = new Conn();
    String username = (String) session.getAttribute("username");
    String hfc = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    String name = (String) session.getAttribute("USER_NAME");
    String title = (String) session.getAttribute("OCCUPATION_CODE");

//    out.print(hfc);
    String hfcCode = "SELECT Detail_Reference_code "
            + "FROM adm_lookup_detail "
            + "WHERE Master_Reference_code = '0081' AND Description = '" + hfc + "'";
    ArrayList<ArrayList<String>> dataHFCCode = Conn.getData(hfcCode);
//        String discipline = "001";
//            String subdiscipline = "9";
//
////    out.print(username);
//
//
//            String sqlDisDesc = "select description from lookup_detail where Detail_Ref_code = '" + discipline + "' AND Master_Ref_code = '0033'";
//            ArrayList<ArrayList<String>> disDesc = Conn.getData(sqlDisDesc);
//            discipline = disDesc.get(0).get(0);
//            out.print(discipline);
//
//            String sqlSubDesc = "select description from lookup_detail where Master_Ref_code = '0071' AND Detail_Ref_code = '" + subdiscipline + "'";
//            ArrayList<ArrayList<String>> subDesc = Conn.getData(sqlSubDesc);
//            subdiscipline = subDesc.get(0).get(0);
//            out.print(subdiscipline);
//    String hfcc = dataHFCCode.get(0).get(0);

    String hfcCD;
    if (dataHFCCode.size() > 0) {
        hfcCD = dataHFCCode.get(0).get(0);
    } else {
        hfcCD = null;
    }

    String sqlhfc = "SELECT DISTINCT state_code "
            + "FROM pms_duty_roster "
            + "WHERE hfc_cd = '" + hfc + "'";
    ArrayList<ArrayList<String>> dataSQLHFC = Conn.getData(sqlhfc);

    String codeState = dataSQLHFC.get(0).get(0);

    String sql = "SELECT lm.Master_Reference_code, ld.`Master_Reference_code`, ld.Detail_Reference_code, pmsh.*, ld.Description "
            + "FROM adm_lookup_master lm, adm_lookup_detail ld, pms_holiday pmsh "
            + "WHERE lm.`Master_Reference_code` = ld.`Master_Reference_code` AND ld.`Master_Reference_code` = '0002' AND ld.`Detail_Reference_code` = pmsh.state_code AND ld.hfc_cd = '"+hfc+"' "
            + "ORDER BY pmsh.holiday_date ASC, ld.`Description` ASC";
    ArrayList<ArrayList<String>> data = Conn.getData(sql);

    String sqlDisplayClinic = "SELECT d.*, sub.description AS subdiscipline_name FROM adm_lookup_detail sub,"
            + " (SELECT c.*, al.description AS discipline_name FROM adm_lookup_detail al, "
            + "(SELECT b.*,hfc.description AS hfc_name FROM adm_lookup_detail hfc,"
            + " (SELECT t.*,ld.description AS state_name FROM adm_lookup_detail ld,  "
            + "(SELECT state_code, hfc_cd, day_cd, discipline_cd, subdiscipline_cd, start_time, end_time, status FROM pms_clinic_day WHERE hfc_cd = '"+hfc+"' )t "
            + " WHERE t.state_code=ld.`Detail_Reference_code` AND ld.`Master_Reference_code` = '0002' AND ld.hfc_cd = '"+hfc+"')b  "
            + "WHERE hfc.Master_Reference_code='0081' AND hfc.Detail_Reference_code = b.hfc_cd AND hfc.hfc_cd = '"+hfc+"')c"
            + "  WHERE al.`Master_Reference_code`='0072' AND al.`Detail_Reference_code` = c.discipline_cd AND al.hfc_cd = '"+hfc+"')d  "
            + "WHERE sub.`Master_Reference_code` = '0071' AND sub.`Detail_Reference_code` = d.subdiscipline_cd  AND sub.hfc_cd = '"+hfc+"'"
            + " ORDER BY state_name ASC";
    ArrayList<ArrayList<String>> dataClinicDay = Conn.getData(sqlDisplayClinic);

    String sqlDisplayRoster =  "SELECT LCASE(ad.USER_NAME) as patientName, ad.USER_ID, dr.hfc_cd, DATE(dr.start_date) AS start_date, DATE(dr.end_date) AS end_date, TIME(dr.start_time) AS start_time, TIME(dr.end_time) AS end_time, dr.roster_category, dr.status "
            + "FROM adm_users ad, pms_duty_roster dr "
            + "WHERE ad.USER_ID = dr.user_id AND dr.hfc_cd = '"+hfc+"'";
    ArrayList<ArrayList<String>> dataClinicRoster = Conn.getData(sqlDisplayRoster);

    String sqlStaffLeave = "SELECT user_id, date(start_leave_date), date(end_leave_date), leave_reason, status "
            + "FROM pms_staff_leave WHERE user_id = '" + username + "' AND (status = 'process' OR status = 'approve' OR status = 'not approve') "
            + "ORDER BY status DESC";
    ArrayList<ArrayList<String>> dataStaffLeave = Conn.getData(sqlStaffLeave);

    String sqlDoctorAvailable = "SELECT doc.*,DATE(pdr.start_date),DATE(pdr.end_date) "
            + "from pms_duty_roster pdr, "
            + "(SELECT USER_ID,LCASE(USER_NAME),OCCUPATION_CODE "
            + "FROM adm_users "
            + "WHERE OCCUPATION_CODE = 'DOCTOR' OR OCCUPATION_CODE = '002'"
            + "ORDER BY LCASE(USER_NAME) ASC)doc "
            + "where doc.USER_ID=pdr.user_id AND pdr.status='active' AND "
            + "DATE(now()) BETWEEN DATE(start_date) AND DATE(end_date) AND pdr.hfc_cd = '"+hfc+"'";
    ArrayList<ArrayList<String>> dataDoctorAvailable = Conn.getData(sqlDoctorAvailable);

    String sqlAppointment = "SELECT lookSub.appointment_date, lookSub.start_time, lookSub.pmi_no, lookSub.patient_name, lookSub.staff_name ,lookSub.discipline_name, lds.Description  "
             + "AS subdipline_name, lookSub.appointment_type, lookSub.ID_NO, lookSub.status, lookSub.canceled_reason FROM adm_lookup_detail lds,  "
             + "( SELECT lookDis.appointment_date, lookDis.start_time, lookDis.pmi_no, lookDis.PATIENT_NAME AS patient_name, lookDis.USER_NAME AS staff_name ,ld.Description AS discipline_name, "
             + "lookDis.subdiscipline, lookDis.appointment_type, lookDis.ID_NO, lookDis.status, lookDis.canceled_reason FROM adm_lookup_detail ld, "
             + "( SELECT DATE(pa.appointment_date) AS appointment_date, TIME(pa.start_time) AS start_time, pa.pmi_no, LCASE(pb.PATIENT_NAME)  AS PATIENT_NAME, "
             + "LCASE(au.USER_NAME) AS USER_NAME, pa.discipline, pa.subdiscipline, pa.appointment_type, pb.ID_NO, pa.status, pa.canceled_reason  FROM pms_appointment pa, pms_patient_biodata pb, adm_users au"
             + " WHERE pa.pmi_no = pb.PMI_NO AND pa.userid = au.USER_ID AND pa.hfc_cd = '"+hfc+"'  "
             + " ORDER BY pa.appointment_date DESC, pa.start_time ASC ) lookDis WHERE lookDis.discipline=ld.Detail_Reference_code  AND ld.Master_Reference_code = '0072' AND ld.hfc_cd = '"+hfc+"') lookSub "
             + "WHERE lds.Master_Reference_code = '0071' AND lookSub.subdiscipline=lds.Detail_Reference_code AND lds.hfc_cd= '"+hfc+"'";
    ArrayList<ArrayList<String>> dataAppointment = Conn.getData(sqlAppointment);

 
    String e48 = null;

   
    e48 = request.getParameter("e48");
%>


<!DOCTYPE html>
<html>
    <title>Admin Page</title>
    <%@include file="header.jsp"%>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-10 col-md-offset-1" style="margin-top: 2%; margin-bottom: 2%">
                    <img src="image/posterHeader.jpg" width="1600" height="345">
                </div>
            </div>
            <div class="row">
                <div class="col-md-5 col-md-offset-1 " style="padding-top: 0.5%;">
                    Welcome <%=name%>
                </div>
                <div class="col-md-5 text-right">
                    <button class="btn btn-info buttonAuthenticate" onclick="window.location.href = 'destroySession.jsp'">Log out</button>
                </div>
            </div>  
            <div class="row">
                <div class="col-md-2 col-md-offset-1 col-sm-12 col-xs-12 bodyContent">
                    <script>
                        function a()
                        {
                        <%
                                try {
                                    String error = request.getParameter("error");
                                    if (error != null) {
                        %>
                            alert('<%=error%>');
                            location.href = 'medicalStaffNurse.jsp';
                        <%
                                            }
                                        } catch (Exception e) {
                                        }
                        %>
                        }
                        $(document).ready(function () {
                            $('a[data-toggle="tab"]').on('shown.bs.tab', function () {
                                //save the latest tab; use cookies if you like 'em better:
                                localStorage.setItem('lastTab', $(this).attr('href'));
                            });
                            //go to the latest tab, if it exists:
                            var lastTab = localStorage.getItem('lastTab');
                            if (lastTab) {
                                $('a[href=' + lastTab + ']').tab('show');
                                var a1 = setTimeout("a()", 1000);
                            } else
                            {
                                // Set the first tab if cookie do not exist
                                $('a[data-toggle="tab"]:first').tab('show');
                            }
                        });


                    </script>
                    <h3 class="headerTitle">Categories</h3>
                    <nav class="navbar navbar-inverse" style="background-color: white; ">
                        <div class="container-fluid">
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                            </div>
                            <div class="collapse navbar-collapse" id="myNavbar" >
                                <ul class="nav navbar-nav"  style="margin-bottom: 5%;" >
                                    <li id="tab" class="active"><a data-toggle="tab" class="editTab" href="#home">Home</a></li>
                                    <li id="tab"><a data-toggle="tab" class="editTab" href="#holiday">View Holiday</a></li>
                                    <li id="tab"><a data-toggle="tab" class="editTab" href="#clinicday">View Clinic Day</a></li>
                                    <li id="tab"><a data-toggle="tab" class="editTab" href="#roster">View Roster</a></li>
                                    <li id="tab"><a data-toggle="tab" class="editTab" href="#leave">Apply Leave</a></li> 
                                    <li id="tab"><a data-toggle="tab" class="editTab" href="#doctorDirectory">Doctor Availability</a></li>
                                    <li class="dropdown" id="tab"><a class="dropdown-toggle" data-toggle="dropdown">Maintain Appointment<span class="caret"></span></a>
                                        <ul class="dropdown-menu">
                                            <li><a data-toggle="tab" class="dropdown-item" href="#addAppointment">Make Patient Appointment</a></li>
                                            <!--<li><a data-toggle="tab" class="dropdown-item" href="#checkAppointment">Check Patient Appointment</a></li>-->
                                            <li><a data-toggle="tab" class="dropdown-item" href="#viewAppointment">View Patient Appointment</a></li>
                                        </ul>
                                    </li>
                                    <li id="tab"><a href="http://www.utem.edu.my/pusat_kesihatan/en/" target="_blank">University Health Centre</a></li>
                                </ul> 
                            </div>
                        </div>
                    </nav>
                </div>
                <div class="col-md-8 col-sm-12 col-xs-12 bodyContent">
                    <div class="tab-content">
                        <div id="home" class="tab-pane active">
                            <h3 class="headerTitle">What is e-Appointment</h3>
                            <p style="text-align: justify"><strong>e-Appointment is a Web Bases application that is used to manage the patient appointment record by using a web based. 
                                    Moreover this system is benefited for patients in order for them to book their appointment by themselves. As this web based application is designed 
                                    in a responsive form so that it is also will be able to be opened in any mobile devices. User will be using a web browser to open the application 
                                    then perform the booking appointment activities. Before performing an appointment user need to check the doctor availability and also view a holiday. 
                                    First time user need to attend to the clinic in order to use the system but sign up is needed before user can proceed to sign in into the system.
                                </strong></p>
                            <h3 class="headerTitle" style="margin-top: 3%;">How to use the system ?</h3>
                            <p><strong>Step 1: Patients need to attend to the clinic/hospital as a First Time User in order to use the system</strong></p>
                            <p><strong>Step 2: Patients need to Sign Up and fill in the Register Form </strong></p>
                            <p><strong>Step 3: Patients can use the system by Signing in into the system</strong></p>
                            <p><strong>Step 4: Patients have option to  check the doctor availability and view holiday before make an appointment or directly make an appointment</strong></p>
                            <p><strong>Step 5: Patients can view their previous appointment at the View Appointment tab</strong></p>
                            <h3 class="headerTitle" style="margin-top: 3%;">Our Location</h3>
                            <div class="google_map">
                                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d15946.294237778036!2d102.32034365!3d2.3109037500000005!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31d1
                                        e46c6eaa869b%3A0xb8935957e3536888!2sUniversiti+Teknikal+Malaysia+Melaka!5e0!3m2!1sen!2s!4v1433745195746" width="700" height="450" frameborder="0"></iframe></div>
                            View <a href="https://www.google.com/maps/place/Universiti+Teknikal+Malaysia+Melaka/@2.313859,102.3190038,17z/data=!3m1!4b1!4m2!3m1!1s0x31d1e46c6eaa869b:0xb8935957e3536888" class="large_map">Utem Clinic</a> in a larger map        
                        </div>
                        <div id="holiday" class="tab-pane fade">
                            <h3 class="headerTitle">View Holiday</h3>
                            <div class="dropdown"  style="padding-bottom: 2%">
                                <button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">View By
                                    <span class="caret"></span></button>
                                <ul class="dropdown-menu" role="menu" aria-labelledby="menu1" id="stateMenu">
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="" class="viewHoliday" id="state">All States</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="" class="viewHoliday" id="00">National</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="" class="viewHoliday" id="01">Johor</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="" class="viewHoliday" id="02">Kedah</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="" class="viewHoliday" id="03">Kelantan</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="" class="viewHoliday" id="04">Melaka</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="" class="viewHoliday" id="05">Negeri Sembilan</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="" class="viewHoliday" id="06">Pahang</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="" class="viewHoliday" id="08">Perak</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="" class="viewHoliday" id="09">Perlis</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="" class="viewHoliday" id="07">Pulau Pinang</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="" class="viewHoliday" id="12">Sabah</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="" class="viewHoliday" id="13">Sarawak</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="" class="viewHoliday" id="10">Selangor</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="" class="viewHoliday" id="11">Terengganu</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="" class="viewHoliday" id="14">Wilayah Persekutuan Kuala Lumpur</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="" class="viewHoliday" id="16">Wilayah Persekutuan Putrajaya</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="" class="viewHoliday" id="15">Wilayah Persekutuan Labuan</a></li>
                                </ul>
                            </div>
                            <div class="table-responsive" id="viewAllHoliday">
                                <table class="table table-bordered table-hover" id="viewHoliday">
                                    <thead>
                                        <tr>
                                            <th><center>No</center></th>
                                    <th><center>Date</center></th>
                                    <th><center>Description</center></th>
                                    <th><center>State Name</center></th>
                                    <th><center>Applicable to</center></th>
                                    <!--<th><center>Status</center></th>-->
                                    </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            if (data.size() > 0) {
                                                for (int i = 0; i < data.size(); i++) {
                                                    Date today = new Date();
                                                    String expectedPattern = "yyyy-MM-dd HH:mm:ss.SSS";
                                                    SimpleDateFormat formatter = new SimpleDateFormat(expectedPattern);
                                                    String dateFromDB = data.get(i).get(4);
                                                    Date dateDB = formatter.parse(dateFromDB);

                                                    SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd/MM/yyyy");
                                                    String date = DATE_FORMAT.format(dateDB);

                                                    SimpleDateFormat df = new SimpleDateFormat("EEEE");
                                                    String newDate = df.format(dateDB);
                                                    //out.print(newDate);

                                        %>
                                        <tr>
                                            <td><center>
                                            <%                                                out.print(i + 1);
                                            %>
                                    </center></td>
                                    <td><center><%=date%></center></td>
                                    <td><left><%=data.get(i).get(5)%></left></td>
                                    <td><left><%=data.get(i).get(10)%></left></td>
                                    <td><left><%=data.get(i).get(6)%></left></td> 
                                    </tr>
                                    <%
                                                if (dateDB.before(today)) {
                                                    RMIConnector rmic = new RMIConnector();
                                                    String sqlInsert = "UPDATE pms_holiday SET status='inactive' WHERE holiday_date < date(now());";

                                                    boolean isInsert = rmic.setQuerySQL(Conn.HOST, Conn.PORT, sqlInsert);
                                        }
                                    }
                                }%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div id="clinicday" class="tab-pane fade">
                            <h3 class="headerTitle">View Clinic Day</h3>
                            <div class="table-responsive">
                                <table class="table table-bordered table-hover">
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
                                    <!--<th><center>Status</center></th>-->
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
                                    </tr>
                                    <% }
                             }%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div id="roster" class="tab-pane fade">
                            <h3 class="headerTitle">View Roster</h3>
                            <div class="table-responsive">
                                <table class="table table-bordered table-hover">
                                    <thead>

                                        <tr> 
                                            <th><center> No</center> </th>
                                    <th><center> Staff Name</center></th>
                                    <th><center> Start Date </center></th>
                                    <th><center> End Date</center></th>
                                    <th><center> Start Time</center></th>
                                    <th><center> End Time</center></th>
                                    <th><center> Shift</center></th>
                                    <!--<th><center> Status</center></th>-->
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
                                    <td><left> <%=dataClinicRoster.get(i).get(7)%></left></td>
                                    </tr>
                                    <%
                                        }
                                    }%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div id="leave" class="tab-pane fade">
                            <h3 class="headerTitle">Apply Leave</h3> 
                            <div class="form-horizontal"> 
                                <div class="form-group"> 
                                    <label class="control-label col-sm-2" for="hfc">Health Facility Name </label>
                                    <div class="col-sm-10"> 


                                        <input  class="form-control" value="<%=hfc%>" type="text" id="hfcNameL" readonly>


                                    </div>
                                </div>
                                <div class="form-group"> 
                                    <label class="control-label col-sm-2" for="staffID">Staff Name </label>
                                    <div class="col-sm-10"> 

                                        <input  class="form-control" value="<%=name%>" name="staffID" type="text" id="staffNameL" readonly>

                                    </div>
                                </div>  
                                <div class="form-group"> 
                                    <label class="control-label col-sm-2" for="startLeave">Start Leave </label>
                                    <input type="hidden" name="startLeaveBefore" value="" id="startLeaveBefore">
                                    <div class="col-sm-10">

                                        <input  class="form-control" name="start_leave" value="" type="text" id="startDateLeave" required>

                                    </div>
                                </div>
                                <div class="form-group"> 
                                    <label class="control-label col-sm-2" for="endLeave">End Leave </label>
                                    <div class="col-sm-10">

                                        <input  class="form-control" name="end_leave" value="" type="text" id="endDateLeave" required>

                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2 col-md-2" for="description">Leave Reason</label>  
                                    <div class="col-sm-10">

                                        <textarea class="form-control" name="leave_reason"  rows="5" id="descLeave" value="" required></textarea>

                                    </div>
                                </div>
                                <div class="form-group">        
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <button class="btn btn-success" id="applyLeave">Apply</button>
                                        <!--<button type="submit" class="btn btn-success" formaction="updateLeave.jsp">Update</button>-->
                                        <button  class="btn btn-success" id="cancelLeave">Cancel</button>
                                    </div>
                                </div>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-bordered table-hover" id="leaveTable">
                                    <thead>
                                        <tr>
                                            <th><center>No</center></th>
                                    <th><center>Start date</center></th>
                                    <th><center>End date</center></th>
                                    <th><center>Reason</center></th>
                                    <th><center>Total Day</center></th>
                                    <th><center>Leave Status</center></th>
                                    <!--<th><center>Action</center></th>-->
                                    </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            if (dataStaffLeave.size() > 0) {
                                                for (int i = 0; i < dataStaffLeave.size(); i++) {
                                                    Date today = new Date();
                                                    String expectedPattern = "yyyy-MM-dd";
                                                    SimpleDateFormat formatter = new SimpleDateFormat(expectedPattern);
                                                    String startLeaveDateFromDB = dataStaffLeave.get(i).get(1);
                                                    Date startLeaveDate = formatter.parse(startLeaveDateFromDB);
                                                    String endLeaveDateFromDB = dataStaffLeave.get(i).get(2);
                                                    Date endLeaveDate = formatter.parse(endLeaveDateFromDB);

                                                    SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd/MM/yyyy");
                                                    String startLeave = DATE_FORMAT.format(startLeaveDate);
                                                    String endLeave = DATE_FORMAT.format(endLeaveDate);

                                                    String staffIDFromDB = dataStaffLeave.get(i).get(0);

                                                    //                                    RMIConnector rmic = new RMIConnector();
                                                    String sqlTotalDay = "SELECT DATEDIFF('" + endLeaveDateFromDB + "', '" + startLeaveDateFromDB + "') AS TotalDay "
                                                            + "FROM pms_staff_leave "
                                                            + "WHERE user_id = '" + staffIDFromDB + "'";
                                                    ArrayList<ArrayList<String>> dataTotalDay = Conn.getData(sqlTotalDay);
                                                    //                                    boolean isSelect = rmic.setQuerySQL(Conn.HOST, Conn.PORT, sqlTotalDay);
                                                    //                                    out.print(sqlTotalDay);
                                                    //                                    out.print(isSelect);
                                                    int plusOneDay = 1;
                                                    int dayFromDBCalculation = Integer.parseInt(dataTotalDay.get(0).get(0));
                                                    int totalDay = dayFromDBCalculation + plusOneDay;

                                        %>
                                        <tr>
                                            <td><center>
                                            <%                                                out.print(i + 1);

                                            %>
                                    </center></td>
                                    <td><center><%=startLeave%></center></td>
                                    <td><center><%=endLeave%></center></td>
                                    <td><center><%=dataStaffLeave.get(i).get(3)%></center></td>
                                    <td><center><%=totalDay%></center></td>
                                    <td><center><%=dataStaffLeave.get(i).get(4)%></center></td>
                                    </tr>
                                    <%
                                            }
                                        }%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div id="doctorDirectory" class="tab-pane fade">
                            <h3 class="headerTitle">Doctor Availability</h3>
                            <p>Search Area:</p>                     
                            <div class='row' style="padding-bottom: 2%; padding-top: 2%; padding-left: 2%; background-color: #d9d9d9; margin-bottom: 4%">
                                <div class="col-md-6 col-sm-12 col-xs-12">
                                    <form>
                                        <!--<div class="form-inline" >-->
                                        <div class="form-group">
                                            <input type="text" name="searchDateAvailability"  id="dateDoctorA" class="form-control" placeholder="Search Appointment Date" required="required"/>
                                        </div>
                                        <div class="form-group"> 
                                            <!--<div class="col-sm-10">--> 
                                            <select class="form-control" id="selectDoctorA" placeholder="Search Doctor Name"  name="searchDoctorAvailability" required>
                                                <option></option>
                                                <%   String sqlDctorAvailability = "SELECT doc.*,pdr.start_date,pdr.end_date "
                                                            + "from pms_duty_roster pdr, "
                                                            + "(SELECT USER_ID,USER_NAME,OCCUPATION_CODE "
                                                            + "FROM adm_users  "
                                                            + "WHERE OCCUPATION_CODE = '002')doc "
                                                            + "where doc.USER_ID=pdr.user_id AND pdr.status='active' AND "
                                                            + "DATE(now()) BETWEEN DATE(start_date) AND DATE(end_date)";
                                                    ArrayList<ArrayList<String>> dataDctorAvailability = Conn.getData(sqlDctorAvailability);

//                                                        DateTime dt = DateTime.now();
//                                                        String todaysDate =(String) dt.toString("dd/MM/yyyy");
                                                    if (dataDctorAvailability.size() > 0) {
                                                        for (int i = 0; i < dataDctorAvailability.size(); i++) {%>
                                                <option value="<%=dataDctorAvailability.get(i).get(1)%>"><%=dataDctorAvailability.get(i).get(1)%></option>
                                                <%}
                                                    }
                                                %>
                                            </select>
                                            <!--</div>-->
                                        </div>
                                        <div class="form-group">
                                            <button class="btn btn-xs btn-success" id="searchDoctor">Search</button>
                                        </div>
                                        <!--</div>-->
                                    </form>

                                    <button class="btn btn-info" id="todaySearch">Today's Availability</button>

                                </div>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-bordered table-hover" id="doctorAvailabilityTable">
                                    <thead>
                                        <tr>
                                            <th><center>No</center></th>
                                    <th><center>Doctor Name</center></th>
                                    <th><center>Availability</center></th>
                                    <th><center>Available/Unavailable Reason</center></th>
                                    <th><center>Not Available On (Booked Time)</center></th>
                                    <th><center>Duty Period</center></th>
                                    </tr>
                                    </thead>
                                    <tbody><%
                                        for (int i = 0; i < dataDoctorAvailable.size(); i++) {
                                            Date today = new Date();
                                            String expectedPattern = "yyyy-MM-dd";
                                            SimpleDateFormat formatter = new SimpleDateFormat(expectedPattern);
                                            String startDateFromDB = dataDoctorAvailable.get(i).get(3);
                                            String endDateFromDB = dataDoctorAvailable.get(i).get(4);
                                            Date startDateDB = formatter.parse(startDateFromDB);
                                            Date endDateDB = formatter.parse(endDateFromDB);

                                            SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd/MM/yyyy");
                                            String dateStart = DATE_FORMAT.format(startDateDB);
                                            String dateEnd = DATE_FORMAT.format(endDateDB);%>
                                        <tr id="doctorRow">
                                            <td><center><%out.print(i + 1);%></center></td>
                                    <td><left><%=dataDoctorAvailable.get(i).get(1)%></left></td>
                                        <%
                                            String doctorId = dataDoctorAvailable.get(i).get(0);
                                            String doctorAvailablity = "select * from pms_staff_leave "
                                                    + "where status='approve' AND "
                                                    + "DATE(now()) BETWEEN DATE(start_leave_date) "
                                                    + "AND DATE(end_leave_date) AND user_id='" + doctorId + "' ";
                                            ArrayList<ArrayList<String>> dataDoctorAvailablity = Conn.getData(doctorAvailablity);

                                            if (dataDoctorAvailablity.size() > 0) {
                                                for (int index = 0; index < dataDoctorAvailablity.size(); index++) {
                                        %>
                                    <td><center>not available</center></td>
                                    <td><center><%=dataDoctorAvailablity.get(index).get(7)%></center></td> 
                                    <td><center>-</center></td> 
                                        <%
                                            }
                                        } else { %>
                                    <td><center>available</center></td>
                                    <td><center>on duty</center></td> 
                                        <%
                                            String dateNotAvailable = "SELECT TIME(start_time) "
                                                    + "FROM pms_appointment "
                                                    + "WHERE date(appointment_date) = date(now()) AND userid = '" + doctorId + "' AND status = 'active'";
                                            ArrayList<ArrayList<String>> dataDateNotAvailable = Conn.getData(dateNotAvailable);
                                        %>
                                    <td>
                                    <center>
                                        <%
                                            if (dataDateNotAvailable.size() > 0) {

                                                for (int j = 0; j < dataDateNotAvailable.size(); j++) {
                                                    out.print(dataDateNotAvailable.get(j).get(0));
                                                    out.print(",");
                                                }
                                            } else {
                                                out.print("all time available");

                                            }
                                        %> 
                                    </center>
                                    </td>
                                    <% }%>

                                    <td><center><%=dateStart%> <% out.print('-');%><%=dateEnd%></center></td> 

                                    </tr>
                                    <%}%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div id="addAppointment" class="tab-pane fade">
                            <h3 class="headerTitle">Make Patient Appointment</h3>
                            <div class="row myform">
                                <div class="col-md-8 col-md-offset-2">
                                    <p>Search Patient : <b><i>Please choose only one</i></b></p>
                                    <form>
                                        <div class="row" style="padding: 1%; margin-bottom: 2%; background-color: #d9d9d9">
                                            <input type="hidden" name="canceledReason" value="-">
                                            <div class="col-md-4 col-sm-12">
                                                <div class="form-group">
                                                    <label>PMI No :</label>
                                                    <input type="text" name="pmiNo" id="pmiNoSearch" class="form-control" placeholder=""/>

                                                </div>
                                            </div>

                                            <div class="col-md-4 col-sm-12">
                                                <div class="form-group">
                                                    <label>IC No :</label>
                                                    <input type="text" name="icNo" id="icNoSearch" class="form-control" placeholder=""/>
                                                </div>
                                            </div>

                                            <div class="col-md-4 col-sm-12">
                                                <div class="form-group">
                                                    <label>ID No :</label>
                                                    <input type="text" name="idNo" id="idNoSearch" class="form-control" placeholder=""/>
                                                </div>
                                            </div>
                                        </div>
                                        <button class="btn btn-xs btn-success" id="adminSearchPatient" style="margin-bottom: 3%">Search</button>
                                    </form>
                                    <p style="color: red"> *** Please make sure that you have check the availability and also view the holiday before make an appointment</p>
                                    <p>Patient Details :</p>
                                    <form class="form-horizontal">
                                        <%
                                            String pmiNO = request.getParameter("pmiNo");
                                            String icNo = request.getParameter("icNo");
                                            String idType = request.getParameter("idType");
                                            String idNo = request.getParameter("idNo");
                                            String patientName = request.getParameter("patientName");
                                            String appDate = request.getParameter("appDate");
                                            String appTime = request.getParameter("appTime");
                                            String appDoc = request.getParameter("appDoc");
                                            String disApp = request.getParameter("disApp");
                                            String subDisApp = request.getParameter("subDisApp");
                                            String appType = request.getParameter("appType");

                                            // String sql = "SELECT * ";
                                            // + "FROM pms_patient_biodata "
                                            //  + "WHERE PMI_NO='" + pmiNO + "' OR NEW_IC_NO = '" + icNo + "' OR ID_NO = '" + idNo + "'";
                                            ArrayList<ArrayList<String>> dataPatient = Conn.getData(sql);
                                            //                            

                                            //                            out.print(sql);
                                            String sqlPatientApp = "SELECT * "
                                                    + "FROM pms_appointment";
                                            ArrayList<ArrayList<String>> dataPatientApp = Conn.getData(sqlPatientApp);
                                            //                            displayValue 
                                            //                            out.print(sql);
                                        %>
                                        <div class="form-group" >
                                            <label class="control-label col-sm-2" for="pmiNo">PMI No : </label>  
                                            <div class="col-sm-10">   
                                                <input type="hidden" name="role" value="<%=title%>" id="role">
                                                <input type="hidden" name="disciple" value="" id="disciple">
                                                <input type="hidden" name="subdiscipline" value="" id="subdisciplineAppointment">
                                                <input type="hidden" name="HFCCode" value="<%=hfc%>" id="HFCCode">
                                                <input name="pmiNo" value=""  id="pmiNo" type="text" class="form-control" readonly>
                                                <input type="hidden" name="ic"  id="ic">


                                            </div>
                                        </div> 
                                        <div class="form-group">
                                            <label class="control-label col-sm-2" for="patientName">Patient Name : </label>  
                                            <div class="col-sm-10">   


                                                <input type="text" name="patientName" id="patientName" value="" class="form-control" readonly> 
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-sm-2" for="idNo">ID No : </label>  
                                            <div class="col-sm-10">   


                                                <input name="idNo" value="" type="text" id="idNo" class="form-control" readonly> 

                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-sm-2" for="appDoc">*Doctor : </label>  
                                            <div class="col-sm-10">   
                                                <select class="form-control" id="doctorApp" name="appDoc" required>
                                                    <option></option>
                                                    <%
                                                        String sqlDoc = "SELECT * "
                                                                + "FROM adm_users "
                                                                + "WHERE HEALTH_FACILITY_CODE = '" + hfc + "' AND OCCUPATION_CODE = '002';";
                                                        ArrayList<ArrayList<String>> dataDoctor = Conn.getData(sqlDoc);

                                                        if (dataDoctor.size() > 0) {
                                                                        for (int i = 0; i < dataDoctor.size(); i++) {%>
                                                    <option value="<%=dataDoctor.get(i).get(0)%>"><%=dataDoctor.get(i).get(3)%></option>
                                                    <% }
                                                                    }%>

                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-sm-2" for="appDate">*Appointment Date : </label>  
                                            <div class="col-sm-10">   
                                                <%if (appDate == null) {%>
                                                <input  name="appDate" type="text" id="datepicker" class="form-control" required>
                                                <%} else {%>
                                                <input name="appDate" value="<%= appDate%>" type="date"  class="form-control" required>
                                                <%}%>
                                            </div>
                                        </div>
                                        <script>
                                            var today = new Date().toISOString().split('T')[0];
                                            document.getElementsByName("appDate")[0].setAttribute('min', today);
                                        </script>
                                        <div class="form-group">
                                            <label class="control-label col-sm-2" for="appTime">*Appointment Time : </label>  
                                            <div class="col-sm-10">   
                                                <select class="form-control" id="timepicker" name="appTime" required>
                                                    <option></option>
                                                    <%if (appTime == null) {%>
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
                                                    <%} else {%>
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
                                                    <%} %>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-sm-2" for="appType">*Appointment Type : </label>  
                                            <div class="col-sm-10">   
                                                <select class="form-control" id="typeAppointment" name="appType" required>
                                                    <option></option>
                                                    <%
                                                        String sqlAppType = "SELECT * FROM adm_lookup_detail "
                                                                + "WHERE Master_Reference_code = '0086' ";
                                                        ArrayList<ArrayList<String>> dataAppType = Conn.getData(sqlAppType);

                                                        if (e48 == null) {
                                                            if (dataAppType.size() > 0) {
                                                                for (int i = 0; i < dataAppType.size(); i++) {%>
                                                    <option value="<%=dataAppType.get(i).get(2)%>"><%=dataAppType.get(i).get(2)%></option>
                                                    <% }
                                                                        }
                                                                    } else {
                                                                    }%>
                                                </select>
                                            </div>
                                        </div>
                                        <button class="btn btn-xs btn-success"  value="Check" id="check" style="margin-bottom: 6%">Check</button>
                                        <button class="btn btn-xs btn-success" type="reset" value="Reset" style="margin-bottom: 6%">Reset</button>

                                    </form>


                                </div>
                            </div>
                        </div>
                        <div id="viewAppointment" class="tab-pane fade">
                            <h3 class="headerTitle">View Patient Appointment</h3>
                            <form method="post" name="myform" role="form" action="sendReminder.jsp">
                                <button id="sendReminder" class="btn btn-primary">Send Appointment Reminder</button>
                            </form><br>
                            <span id="showMessage" ></span>
                            <%
                                String sqlReminder = "SELECT w.*,ld.Description AS state_name "
                                        + "FROM adm_lookup_detail ld, "
                                        + "(SELECT t.* "
                                        + "FROM "
                                        + "(SELECT pa.pmi_no, pa.hfc_cd, DATE(pa.appointment_date) AS appDate, TIME(pa.start_time) AS start_time, "
                                        + "pb.MOBILE_PHONE, DATEDIFF(pa.appointment_date, NOW()) as DiffDate, pb.PATIENT_NAME, pb.EMAIL_ADDRESS "
                                        + "FROM pms_appointment pa, pms_patient_biodata pb "
                                        + "WHERE pa.pmi_no = pb.PMI_NO AND pa.status = 'active' AND remarks = 'pending' AND (DATEDIFF(pa.appointment_date, NOW())>1 ))t "
                                        + "WHERE t.DiffDate<3)w "
                                        + "WHERE w.hfc_cd = ld.Detail_Reference_code AND ld.Master_Reference_code = '0081'  AND w.hfc_cd= '" + hfcCD + "'";
                                ArrayList<ArrayList<String>> dataReminder = Conn.getData(sqlReminder);

                                if (dataReminder.size() > 0) {%>
                            <script>
//                                
                                $("#sendReminder").click();
                                $("#showMessage").html("System already send the appointment reminder");

                            </script> <%
                                } else {%>
                            <script>

                                $("#sendReminder").hide();

                            </script> <%

                                }

                            %>

                            <p>Search Appointment Area:</p>                     
                            <div class='row' style="padding-bottom: 2%; padding-top: 2%; padding-left: 2%; background-color: #d9d9d9; margin-bottom: 4%">
                                <div class="col-md-3 col-sm-12 col-xs-12">
                                    <form method="post" name="myform" role="form" action="adminAppointmentSelectDate.jsp">
                                        <div class="form-inline" >
                                            <div class="form-group">
                                                <!--<label>PMI No :</label>-->
                                                <input type="text" name="searchAppointmentDate"  id="searchAppointmentDate" class="form-control" placeholder="Search Appointment Date"/>
                                            </div>
                                            <div class="form-group">
                                                <button class="btn btn-xs btn-success" id="searchDateView">Search</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="col-md-3 col-sm-12 col-xs-12">
                                    <form>
                                        <div class="form-inline" >
                                            <div class="form-group">
                                                <!--<label>PMI No :</label>-->
                                                <input type="text" name="searchAppointmentPatient" id="searchAppointmentPatient"class="form-control" placeholder="Search Patient Name"/>
                                            </div>
                                            <div class="form-group">
                                                <button class="btn btn-xs btn-success" id="searchPatientView" >Search</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="col-md-3 col-sm-12 col-xs-12">
                                    <form method="post" name="myform" role="form" action="adminAppointmentSelectDoctor.jsp">
                                        <div class="form-inline" >
                                            <div class="form-group">
                                                <!--<label>PMI No :</label>-->
                                                <input type="text" name="searchAppointmentDoctor"  id="searchAppointmentDoctor" class="form-control" placeholder="Search Doctor Name"/>
                                            </div>
                                            <div class="form-group">
                                                <button class="btn btn-xs btn-success" id="searchDoctorView">Search</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="col-md-3 col-sm-12 col-xs-12">

                                    <button class="btn btn-info" id="viewAllAppointment">View All Appointment</button>

                                </div>
                            </div>
                            <p>Display Patient Appointment :</p>
                            <table class="table table-bordered table-hover" id="viewAppointment">
                                <thead>
                                    <tr>
                                        <th style="background-color : yellow;"></th>
                                        <th>Canceled Appointment</th>
                                        <th style="background-color : #8cff66;"></th>
                                        <th>Upcoming Appointment</th>
                                        <th style="background-color : red;"></th>
                                        <th>Past Appointment</th>
                                    </tr>
                                </thead>
                            </table>
                            <div class="table-responsive"  id="viewAppointmentTable">
                                <table class="table table-bordered table-hover" style="margin-bottom: 4%">
                                    <thead>
                                        <tr>
                                            <th><center>No</center></th>
                                    <th><center>Appointment Date</center></th>
                                    <th><center>Appointment Time</center></th>
                                    <th><center>PMI No</center></th>
                                    <th><center>Patient Name</center></th>
                                    <th><center>Doctor Name</center></th>
                                    <th><center>Discipline</center></th>
                                    <th><center>Subdicipline</center></th>
                                    <th><center>Appointment Type</center></th>
                                    <th><center>Action</center></th>
                                    <th><center>Cancel Reason</center></th>               
                                    </tr>
                                    </thead>
                                    <tbody>
                                        <%                                            if (dataAppointment.size() > 0) {
                                                for (int i = 0; i < dataAppointment.size(); i++) {
                                                    Date today = new Date();
                                                    String expectedPattern = "yyyy-MM-dd";
                                                    SimpleDateFormat formatter = new SimpleDateFormat(expectedPattern);
                                                    String appDateFromDB = dataAppointment.get(i).get(0);
                                                    Date covertedAppDate = formatter.parse(appDateFromDB);
                                                    //                                    String endLeaveDateFromDB = dataAppointment.get(i).get(1);
                                                    //                                    Date endLeaveDate = formatter.parse(endLeaveDateFromDB);

                                                    SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd/MM/yyyy");
                                                    String appointmentDate = DATE_FORMAT.format(covertedAppDate);
                                                    //                                    String endLeave = DATE_FORMAT.format(endLeaveDate);

                                                    //                                    String staffIDFromDB = dataStaffLeave.get(i).get(1);

                                        %>
                                        <tr>
                                            <%                                                Date currentDate = new Date();
                                                String todayDate = DATE_FORMAT.format(currentDate);

                                                if ((covertedAppDate.after(currentDate) || appointmentDate.contentEquals(todayDate)) && dataAppointment.get(i).get(9).equals("active")) { %>
                                            <td class="incoming_date_area"><center><%out.print(i + 1);%></center></td>
                                    <td class="incoming_date_area"><center><%=appointmentDate%></center></td>
                                    <td class="incoming_date_area"><center><%=dataAppointment.get(i).get(1)%></center></td>
                                    <td class="incoming_date_area"><center><%=dataAppointment.get(i).get(2)%></center></td>
                                    <td class="incoming_date_area"><left><%=dataAppointment.get(i).get(3)%></left></td> 
                                    <td class="incoming_date_area"><left><%=dataAppointment.get(i).get(4)%></left></td>
                                    <td class="incoming_date_area"><center><%=dataAppointment.get(i).get(5)%></center></td>
                                    <td class="incoming_date_area"><center><%=dataAppointment.get(i).get(6)%></center></td>
                                    <td class="incoming_date_area"><center><%=dataAppointment.get(i).get(7)%></center></td>
                                    <td class="incoming_date_area">
                                    <center>
                                        <button class="btn btn-xs btn-primary" onClick="return myFunction('<%=dataAppointment.get(i).get(2)%>', '<%=hfcCD%>', '<%=dataAppointment.get(i).get(0)%>')">Cancel</button>

                                    </center>
                                    </td>
                                    <td class="incoming_date_area"><center></center></td>
                                        <%
                                    } else if ((covertedAppDate.after(currentDate) || appointmentDate.contentEquals(todayDate)) && dataAppointment.get(i).get(9).equals("canceled")) {%>
                                    <td style="background-color : yellow"><center><%out.print(i + 1);%></center></td>
                                    <td><center><%=appointmentDate%></center></td>
                                    <td><center><%=dataAppointment.get(i).get(1)%></center></td>
                                    <td><center><%=dataAppointment.get(i).get(2)%></center></td>
                                    <td><left><%=dataAppointment.get(i).get(3)%></left></td> 
                                    <td><left><%=dataAppointment.get(i).get(4)%></left></td>
                                    <td><center><%=dataAppointment.get(i).get(5)%></center></td>
                                    <td><center><%=dataAppointment.get(i).get(6)%></center></td>
                                    <td><center><%=dataAppointment.get(i).get(7)%></center></td>
                                    <td>
                                    <center>
                                        <button disabled="disabled" class="btn btn-xs btn-primary" onClick="location.href = 'adminCancelAppointment.jsp?e27=<%=dataAppointment.get(i).get(2)%>&e48=<%=hfcCD%>&e32=<%=dataAppointment.get(i).get(0)%>'">Cancel</button>
                                    </center>
                                    </td> 
                                    <td><center><%=dataAppointment.get(i).get(10)%></center></td>

                                    <%
                                    } else {
                                    %>
                                    <td style="background-color:red"><center><%out.print(i + 1);%></center></td>
                                    <td><center><%=appointmentDate%></center></td>
                                    <td><center><%=dataAppointment.get(i).get(1)%></center></td>
                                    <td><center><%=dataAppointment.get(i).get(2)%></center></td>
                                    <td><left><%=dataAppointment.get(i).get(3)%></left></td> 
                                    <td><left><%=dataAppointment.get(i).get(4)%></left></td>
                                    <td><center><%=dataAppointment.get(i).get(5)%></center></td>
                                    <td><center><%=dataAppointment.get(i).get(6)%></center></td>
                                    <td><center><%=dataAppointment.get(i).get(7)%></center></td>
                                    <!--<td><center><%=dataAppointment.get(i).get(9)%></center></td>-->
                                    <td>
                                    <center>
                                        <button disabled="disabled" class="btn btn-xs btn-primary" onClick="location.href = 'adminCancelAppointment.jsp?e27=<%=dataAppointment.get(i).get(2)%>&e48=<%=hfcCD%>&e32=<%=dataAppointment.get(i).get(0)%>'">Cancel</button>
                                    </center>
                                    <td><center>Not Applicable</center></td>
                                        <%
                                            }
                                        %>

                                    </tr>
                                    <%
                                                if (covertedAppDate.before(today)) {
                                                    RMIConnector rmic = new RMIConnector();
                                                    String sqlInsert = "UPDATE pms_appointment SET status='inactive' WHERE appointment_date < date(now());";

                                                    boolean isInsert = rmic.setQuerySQL(Conn.HOST, Conn.PORT, sqlInsert);
                                                }
                                            }
                                        }
                                    %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12 footer " >
                    Copyright &copy; BIOCORE 2016
                </div>
            </div>
        </div>
        <script src="<%=Config.getBase_url(request)%>jsfile/ViewHoliday.js"></script>
        <script src="<%=Config.getBase_url(request)%>jsfile/ApplyLeave.js"></script>
        <script src="<%=Config.getBase_url(request)%>jsfile/DoctorAvaibility.js"></script>
        <script src="<%=Config.getBase_url(request)%>jsfile/SearchPatient.js"></script>    
        <script src="<%=Config.getBase_url(request)%>jsfile/ViewAppointment.js"></script> 
        <script src="<%=Config.getBase_url(request)%>jsfile/CancelAppointment.js"></script>
        <script src="<%=Config.getBase_url(request)%>jsfile/MakeAppointment.js"></script> 
        
        <script type="text/javascript">
            $(document).ready(function(){
               
                $('#dateDoctorA').datepicker({dateFormat:'dd/mm/yy'});
                $('#datepicker').datepicker({dateFormat:'dd/mm/yy'});
                 $('#searchAppointmentDate').datepicker({dateFormat:'dd/mm/yy'});
                
            });
            
            </script>
    </body>
</html>