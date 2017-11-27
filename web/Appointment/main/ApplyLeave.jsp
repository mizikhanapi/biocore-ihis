<%-- 
    Document   : ApplyLeave
    Created on : Sep 14, 2017, 9:15:25 PM
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
    String USER_ID = (String) session.getAttribute("USER_ID");
    String USER_NAME = (String) session.getAttribute("USER_NAME");

    String sqlAdminLeave = "SELECT user_id, date(start_leave_date), date(end_leave_date), leave_reason, status "
            + "FROM pms_staff_leave WHERE user_id = '" + USER_ID + "' AND (status = 'process' OR status = 'approve' OR status = 'not approve') "
            + "ORDER BY status DESC";
    ArrayList<ArrayList<String>> dataAdminLeave = Conn.getData(sqlAdminLeave);


%>


    <h3 class="headerTitle">Apply Leave</h3> 
    <div class="form-horizontal"> 
        <div class="form-group"> 
            <label class="control-label col-sm-2" for="hfc">Health Facility Name </label>
            <div class="col-sm-10"> 

                <input  class="form-control" value="<%=hfcName%>" type="text" id="hfcNameFull" readonly>
                <input  class="form-control hidden" value="<%=hfc%>" type="text" id="hfcNameL" readonly>


            </div>
        </div>
        <div class="form-group"> 
            <label class="control-label col-sm-2" for="staffID">Staff Name </label>
            <div class="col-sm-10"> 


                <input  class="form-control" value="<%=USER_NAME%>" name="staffID" type="text" id="staffNameL" readonly>

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

                <input  class="form-control" name="end_leave" value="" type="text" id="endDateLeave" disabled="" required>

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
                    if (dataAdminLeave.size() > 0) {
                        for (int i = 0; i < dataAdminLeave.size(); i++) {
                            Date today = new Date();
                            String expectedPattern = "yyyy-MM-dd";
                            SimpleDateFormat formatter = new SimpleDateFormat(expectedPattern);
                            String startLeaveDateFromDB = dataAdminLeave.get(i).get(1);
                            Date startLeaveDate = formatter.parse(startLeaveDateFromDB);
                            String endLeaveDateFromDB = dataAdminLeave.get(i).get(2);
                            Date endLeaveDate = formatter.parse(endLeaveDateFromDB);

                            SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd/MM/yyyy");
                            String startLeave = DATE_FORMAT.format(startLeaveDate);
                            String endLeave = DATE_FORMAT.format(endLeaveDate);

                            String staffIDFromDB = dataAdminLeave.get(i).get(0);

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
            <td><center><%=dataAdminLeave.get(i).get(3)%></center></td>
            <td><center><%=totalDay%></center></td>
            <td><center><%=dataAdminLeave.get(i).get(4)%></center></td>
            </tr>
            <%
                    }
                }%>
            </tbody>
        </table>
    </div>
