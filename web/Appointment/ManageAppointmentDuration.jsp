<%-- 
    Document   : register
    Created on : Mar 18, 2016, 2:46:31 PM
    Author     : asyraf
--%>

<%@page import="org.joda.time.DateTime"%>
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
    Conn Conn = new Conn();
    String username = (String) session.getAttribute("username");
    String hfc = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    String name = (String) session.getAttribute("USER_NAME");
    String title = (String) session.getAttribute("OCCUPATION_CODE");
    String discipline = (String) session.getAttribute("DISCIPLINE_CODE");
    String subdiscipline = (String) session.getAttribute("SUB_DISCIPLINE_CODE");

    String sqlTimeAppoinment = "SELECT start_time, consultation_period FROM pms_appointment_time pat WHERE hfc_cd = '"+hfc+"' AND discipline_cd = '"+discipline+"' AND subdiscipline_cd = '"+subdiscipline+"' ORDER BY start_time ASC";
    ArrayList<ArrayList<String>> data_time_appointment = Conn.getData(sqlTimeAppoinment);

  

%>


<!DOCTYPE html>
<html>
    <title>Admin Page</title>
    <%@include file="header.jsp"%>
    <body>
        <div class="container-fluid">

            <div class="row">
                <% out.print(sqlTimeAppoinment); %>
                <div class="col-md-8 col-sm-12 col-xs-12 bodyContent">
                    <div class="tab-content">

                        <div id="viewAppointment" class="tab-pane active">
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                           
                            <th><center>Start Time</center></th>
                            <th><center>Duration</center></th>
                            <th><center>Action</center></th>

                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for(int i = 0; i<data_time_appointment.size(); i++){
                                %>
                                <tr>
                                    <td><%out.print(data_time_appointment.get(i).get(0));%></td>
                                    <td><%out.print(data_time_appointment.get(i).get(1));%></td>
                                    <td> <button class="btn btn-xs btn-primary" >Delete</button>
                                     <button class="btn btn-xs btn-primary" >Update</button></td>
                                </tr>
                                    
                                <%
                            }
                        %>


                    </tbody>
                </table>

            </div>
                    </div>
                </div>
            </div>

        </div>
    </body>
</html>
