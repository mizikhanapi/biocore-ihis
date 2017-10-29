<%-- 
    Document   : CIS040000
    Created on : Feb 18, 2017, 12:26:03 PM
    Author     : -D-
--%>
<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<!--Modal add Procedure-->
<%
    Conn Conn = new Conn();
//    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
//
//    String username = (String) session.getAttribute("username");
//    String hfc = (String) session.getAttribute("HEALTH_FACILITY_CODE");
//    String name = (String) session.getAttribute("USER_NAME");
//    String title = (String) session.getAttribute("OCCUPATION_CODE");
//    String discipline = (String) session.getAttribute("DISCIPLINE_CODE");
//    String subdiscipline = (String) session.getAttribute("SUBDISCIPLINE_CODE");

%>
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
        </div>

        <div class="modal-footer">
            <div class="btn-group btn-group-justified" role="group" aria-label="group button">

                <div class="btn-group" role="group">
                    <button type="button" id="saveImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    <button type="button" id="saveImage" class="btn btn-danger btn-block btn-lg" data-dismiss="modal" role="button">Cancel</button>
                </div>
            </div>
        </div>
    </div>
</div>

<!--End add Procedure-->

