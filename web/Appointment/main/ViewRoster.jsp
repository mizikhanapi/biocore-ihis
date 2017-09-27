<%-- 
    Document   : ViewRoster
    Created on : Sep 14, 2017, 8:59:18 PM
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

                                
                                    <h3 class="headerTitle">View Staff Roster</h3>
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
                                