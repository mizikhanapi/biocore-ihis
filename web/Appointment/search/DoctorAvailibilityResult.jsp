<%-- 
    Document   : DoctorAvailibilityResult
    Created on : Nov 21, 2017, 4:30:37 PM
    Author     : -D-
--%>
<%@page import="org.joda.time.DateTime"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%
    Conn Conn = new Conn();
    
    String hfc = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    String searchDoctorAvailability = request.getParameter("doc_name");
    String searchDateAvailability = request.getParameter("date");
//    String searchDoctorAvailability = "DR SHAHANEEN BINTI JOHARI";
//    String searchDateAvailability = "22-11-2017";
    
        String sqlDoctorAvailable = "SELECT doc.*,DATE(pdr.start_date),DATE(pdr.end_date) "
            + "from pms_duty_roster pdr, "
            + "(SELECT USER_ID,LCASE(USER_NAME),OCCUPATION_CODE, HEALTH_FACILITY_CODE "
            + "FROM adm_users "
            + "WHERE OCCUPATION_CODE = 'DOCTOR' OR OCCUPATION_CODE = '002'"
            + "ORDER BY LCASE(USER_NAME) ASC)doc "
            + "where doc.USER_ID=pdr.user_id AND pdr.status='active' AND "
            + "DATE(now()) BETWEEN DATE(start_date) AND DATE(end_date) AND doc.HEALTH_FACILITY_CODE ='" + hfc + "'  ";
        ArrayList<ArrayList<String>> dataDoctorAvailable = Conn.getData(sqlDoctorAvailable);
  %>

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
                    <tbody><%                            String index_color = null;
                        for (int i = 0; i < dataDoctorAvailable.size(); i++) {
                            Date today = new Date();
                            String expectedPattern = "yyyy-MM-dd";
                            SimpleDateFormat formatter = new SimpleDateFormat(expectedPattern);
                            String startDateFromDB = dataDoctorAvailable.get(i).get(4);
                            String endDateFromDB = dataDoctorAvailable.get(i).get(5);
                            String dateCompareDay = searchDateAvailability;
                            
                            Date startDateDB = formatter.parse(startDateFromDB);
                            Date endDateDB = formatter.parse(endDateFromDB);
                            Date CompareDay = formatter.parse(dateCompareDay);

                            SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd/MM/yyyy");
                            String dateStart = DATE_FORMAT.format(startDateDB);
                            String dateEnd = DATE_FORMAT.format(endDateDB);

                            SimpleDateFormat df = new SimpleDateFormat("EEEE");
                            String newCompareDay = df.format(CompareDay);


                        %>
                        <tr id="tbl_<%=i%>">
                            <td><center><%out.print(i + 1);%></center></td>
                    <td><left><%=dataDoctorAvailable.get(i).get(1)%></left></td>
                        <%

                            String doctorId = dataDoctorAvailable.get(i).get(0);

                            if (dataDoctorAvailable.get(i).get(1).equalsIgnoreCase(searchDoctorAvailability)) {
                                index_color = Integer.toString(i);
                        %><script>
                            $("#tbl_" +<%=index_color%>).css("background-color", "#8cff66");

                    </script><%
                        }
                        String doctorAvailablity = "select * from pms_staff_leave "
                                + "where status='approve' AND "
                                + "'" + CompareDay + "' BETWEEN DATE(start_leave_date) "
                                + "AND DATE(end_leave_date) AND user_id='" + doctorId + "' ";
                        ArrayList<ArrayList<String>> dataDoctorAvailablity = Conn.getData(doctorAvailablity);

                        String sqlDutyDoctor = "SELECT doc.*,DATE(pdr.start_date),DATE(pdr.end_date) "
                                + "from pms_duty_roster pdr, "
                                + "(SELECT USER_ID,LCASE(USER_NAME),OCCUPATION_CODE "
                                + "FROM adm_users "
                                + "WHERE OCCUPATION_CODE = '002' AND USER_ID = '" + doctorId + "' "
                                + "ORDER BY LCASE(USER_NAME) ASC)doc "
                                + "where doc.USER_ID=pdr.user_id AND pdr.status='active' AND "
                                + "DATE('" + searchDateAvailability + "') BETWEEN DATE(start_date) AND DATE(end_date) AND hfc_cd = '"+hfc+"'";
                        ArrayList<ArrayList<String>> dataDutyDoctor = Conn.getData(sqlDutyDoctor);

        
                        String sqlCheckHoliday = "SELECT * FROM pms_holiday WHERE DATE(holiday_date) = '" + CompareDay + "' ";
                        ArrayList<ArrayList<String>> dataCheckHoliday = Conn.getData(sqlCheckHoliday);

                        String sqlCompareDay = "SELECT * FROM pms_clinic_day WHERE hfc_cd = '" + hfc + "' AND day_cd = '" + newCompareDay + "' ";
                        ArrayList<ArrayList<String>> dataCompareDay = Conn.getData(sqlCompareDay);

                        if (dataCheckHoliday.size() == 0) {
                            if (dataCompareDay.size() > 0) {
                                //                                                    out.print(dataDutyDoctor.size());
                                if (dataDutyDoctor.size() > 0) {

                                    if (dataDoctorAvailablity.size() > 0) {


                                        for (int index = 0; index < dataDoctorAvailablity.size(); index++) {
                    %>
                    <td><center>not available</center></td>
                    <td><center><%=dataDoctorAvailablity.get(index).get(7) %></center></td> 
                    <td><center>-</center></td> 
                        <%
                            }
                        } else { %>
                    <td><center>available</center></td>
                    <td><center>on duty</center></td> 
                        <%
                            String dateNotAvailable = "SELECT TIME(start_time) "
                                    + "FROM pms_appointment "
                                    + "WHERE date(appointment_date) = '" + searchDateAvailability + "' AND userid = '" + doctorId + "' AND status = 'active'";
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
                        <% }
                    } else { %><td><center>not available</center></td>
                    <td><center>not in duty roster</center></td> 
                    <td><center>-</center></td> <%
                            //                                                      out.print(dataDutyDoctor.get(0).get(1)); 
                        }
                    } else { %>
                    <td><center>not available</center></td>
                    <td><center>clinic off</center></td> 
                    <td><center>-</center></td>  <%
                        }
                    } else {%>

                    <td><center>not available</center></td>
                    <td><center><%=dataCheckHoliday.get(0).get(2)%> </center></td> 
                    <td><center>-</center></td>  <%

                        }%>
                    <td><center><%=dateStart%> <% out.print('-');%><%=dateEnd%></center></td>  
                    </tr>
                 <% }%>
                    </tbody>
                </table>