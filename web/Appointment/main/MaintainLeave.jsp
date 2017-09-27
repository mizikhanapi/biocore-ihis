<%-- 
    Document   : MaintainLeave
    Created on : Sep 14, 2017, 9:11:04 PM
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
            
    String sqlStaffLeave = "SELECT sl.hfc_cd, au.USER_ID, LCASE(au.USER_NAME) AS patientName, date(sl.start_leave_date), date(sl.end_leave_date), LCASE(sl.leave_reason) AS reason, sl.status "
            + "FROM pms_staff_leave sl, adm_users au "
            + "WHERE (sl.status = 'process' OR sl.status = 'approve' OR sl.status = 'not approve') AND au.USER_ID = sl.user_id  and sl.hfc_cd = '" + hfc + "'"
            + "ORDER BY au.USER_NAME DESC";
    ArrayList<ArrayList<String>> dataStaffLeave = Conn.getData(sqlStaffLeave);
            
   
    
%>

                                    <h3 class="headerTitle">Maintain Staff Leave</h3>
                                    <div class="table-responsive">
                                        <table class="table table-bordered table-hover" id="maintainStaffLeave">
                                            <thead>
                                                <tr>
                                                    <th><center>No</center></th>
                                            <th><center>Staff Name</center></th>
                                            <th><center>Start date</center></th>
                                            <th><center>End date</center></th>
                                            <th><center>Reason</center></th>
                                            <th><center>Total Day</center></th>
                                            <th><center>Leave Status</center></th>
                                            <th><center>Action</center></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    if (dataStaffLeave.size() > 0) {
                                                        for (int i = 0; i < dataStaffLeave.size(); i++) {
                                                            Date today = new Date();
                                                            String expectedPattern = "yyyy-MM-dd";
                                                            SimpleDateFormat formatter = new SimpleDateFormat(expectedPattern);
                                                            String startLeaveDateFromDB = dataStaffLeave.get(i).get(3);
                                                            Date startLeaveDate = formatter.parse(startLeaveDateFromDB);
                                                            String endLeaveDateFromDB = dataStaffLeave.get(i).get(4);
                                                            Date endLeaveDate = formatter.parse(endLeaveDateFromDB);

                                                            SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd/MM/yyyy");
                                                            String startLeave = DATE_FORMAT.format(startLeaveDate);
                                                            String endLeave = DATE_FORMAT.format(endLeaveDate);

                                                            String staffIDFromDB = dataStaffLeave.get(i).get(1);

                                                            String sqlTotalDay = "SELECT DATEDIFF('" + endLeaveDateFromDB + "', '" + startLeaveDateFromDB + "') AS TotalDay "
                                                                    + "FROM pms_staff_leave "
                                                                    + "WHERE user_id = '" + staffIDFromDB + "'";
                                                            ArrayList<ArrayList<String>> dataTotalDay = Conn.getData(sqlTotalDay);
                                                            int plusOneDay = 1;
                                                            int dayFromDBCalculation = Integer.parseInt(dataTotalDay.get(0).get(0));
                                                            int totalDay = dayFromDBCalculation + plusOneDay;

                                                %>
                                                <tr>
                                                    <%                                                            if (dataStaffLeave.get(i).get(6).equals("approve") || dataStaffLeave.get(i).get(6).equals("not approve")) { %>
                                                    <td><center><%out.print(i + 1);%></center></td>
                                            <td><left><%=dataStaffLeave.get(i).get(2)%></left></td>
                                            <td><center><%=startLeave%></center></td>
                                            <td><center><%=endLeave%></center></td>
                                            <td><center><%=dataStaffLeave.get(i).get(5)%></center></td>
                                            <td><center><%=totalDay%></center></td>
                                            <td><center><%=dataStaffLeave.get(i).get(6)%></center></td>
                                            <td><center>

                                                <button disabled="disabled" id="disableButton" class="btn btn-xs btn-primary">Approve</button>

                                                <button disabled="disabled" class="btn btn-xs btn-primary" id="disableButton">Not Approve</button>
                                            </center></td>
                                            <%} else {%>
                                            <td><center><%out.print(i + 1);%></center></td>
                                            <td><left><%=dataStaffLeave.get(i).get(2)%></left></td>
                                            <td><center><%=startLeave%></center></td>
                                            <td><center><%=endLeave%></center></td>
                                            <td><center><%=dataStaffLeave.get(i).get(5)%></center></td>
                                            <td><center><%=totalDay%></center></td>
                                            <td><center><%=dataStaffLeave.get(i).get(6)%></center></td>
                                            <td><center>
                                                <input type="hidden" id="dataStaffLeave<%=i%>" value="<%=dataStaffLeave.get(i).get(0)%>|<%=dataStaffLeave.get(i).get(1)%>|<%=dataStaffLeave.get(i).get(3)%>">

                                                <button id="approveLeave|<%=i%>" class="btn btn-xs btn-primary approve-leave">Approve</button>

                                                <button class="btn btn-xs btn-primary notApprove-leave" id="notApproveLeave|<%=i%>">Not Approve</button>
                                            </center>
                                            </td>
                                            <%}%>
                                            </tr>
                                            <%}
                                                }%>
                                            </tbody>
                                        </table>
                                    </div>
                     