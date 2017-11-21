<%-- 
    Document   : DoctorAvailability
    Created on : Sep 14, 2017, 9:26:39 PM
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
    
    String sqlDctorAvailability = "SELECT doc.*from pms_duty_roster pdr, (SELECT USER_ID,USER_NAME,OCCUPATION_CODE FROM adm_users WHERE OCCUPATION_CODE = '002')doc where doc.USER_ID=pdr.user_id AND pdr.status='active' AND  pdr.hfc_cd = '"+hfc+"'";
    ArrayList<ArrayList<String>> dataDctorAvailability = Conn.getData(sqlDctorAvailability);

            
       String sqlDoctorAvailable = "SELECT doc.*,DATE(pdr.start_date),DATE(pdr.end_date) "
            + "from pms_duty_roster pdr, "
            + "(SELECT USER_ID,LCASE(USER_NAME),OCCUPATION_CODE "
            + "FROM adm_users "
            + "WHERE OCCUPATION_CODE = '002'"
            + "ORDER BY LCASE(USER_NAME) ASC)doc "
            + "where doc.USER_ID=pdr.user_id AND pdr.status='active' AND "
            + "DATE(now()) BETWEEN DATE(start_date) AND DATE(end_date) AND hfc_cd = '" + hfc + "'";
    ArrayList<ArrayList<String>> dataDoctorAvailable = Conn.getData(sqlDoctorAvailable);
   
    
%>

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
                                                    <div id="searchDoctorAvailibilitySelectDiv">
                                                    <select class="form-control" id="selectDoctorAvailibility" placeholder="Search Doctor Name"  name="searchDoctorAvailability" required>
                                                        <option></option>
                                                        <%
                                                            if (dataDctorAvailability.size() > 0) {
                                                                for (int i = 0; i < dataDctorAvailability.size(); i++) {%>
                                                        <option value="<%=dataDctorAvailability.get(i).get(1)%>"><%=dataDctorAvailability.get(i).get(1)%></option>
                                                        <%}
                                                            }
                                                        %>
                                                    </select>
                                                    </div>
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
                                        <div id="doctorAvailabilityTableDiv">
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
                