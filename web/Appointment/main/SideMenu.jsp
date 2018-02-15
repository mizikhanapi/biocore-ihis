<%-- 
    Document   : SideMenu
    Created on : Sep 6, 2017, 5:37:48 PM
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
    String discipline_name = null;
    String subdiscipline_name = null;
    String user_type = (String) session.getAttribute("USER_TYPE");
    String USER_ID = session.getAttribute("USER_ID").toString();
    
    boolean isPublicUser = true;

    String sql_check_user_type = "SELECT `USER_TYPE` FROM adm_users WHERE `USER_ID` = '" + USER_ID + "'";
    ArrayList<ArrayList<String>> data_check_user_type = Conn.getData(sql_check_user_type);
    
    try{
        isPublicUser = data_check_user_type.get(0).get(0).equals("PUBLIC");
    }catch(Exception e){
        isPublicUser = false;
    }

    if (isPublicUser) {

    } else {

        String username = (String) session.getAttribute("USER_ID");
        String hfc = (String) session.getAttribute("HEALTH_FACILITY_CODE");
        String hfc_name = (String) session.getAttribute("HFC_NAME");
        String name = (String) session.getAttribute("USER_NAME");
        String title = (String) session.getAttribute("OCCUPATION_CODE");
        String discipline = (String) session.getAttribute("DISCIPLINE_CODE");
        String subdiscipline = (String) session.getAttribute("SUB_DISCIPLINE_CODE");
        String my_1_gamba = session.getAttribute("PICTURE").toString();

        String discipline_name_sql = "SELECT discipline_name FROM adm_discipline WHERE discipline_cd = '" + discipline + "' AND discipline_hfc_cd = '" + hfc + "';";
        ArrayList<ArrayList<String>> discipline_name_AL = Conn.getData(discipline_name_sql);
        discipline_name = discipline_name_AL.get(0).get(0);

        String subdiscipline_name_sql = "SELECT subdiscipline_name FROM adm_subdiscipline WHERE subdiscipline_hfc_cd = '" + hfc + "' AND discipline_cd = '" + discipline + "' AND subdiscipline_cd = '" + subdiscipline + "'";

        ArrayList<ArrayList<String>> subdiscipline_name_AL = Conn.getData(subdiscipline_name_sql);
        subdiscipline_name = subdiscipline_name_AL.get(0).get(0);
%>

<script>
    function a()
    {
    <%                    try {
            String error = request.getParameter("error");
            if (error != null) {
    %>
            alert('<%=error%>');
        location.href = 'adminAppointment.jsp';
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

<div class="col-sm-3 col-md-2 sidebar">
    <div class="brand"></div>
    <!-- logo -->
    <div class="logo">
        Welcome to <span>iHIS</span>
    </div>
    <!-- logo -->

    <!-- profile Sidebar -->
    <div class="profile">
        <div class="profile-userpic">
            <img src="<%= my_1_gamba%>" class="img-responsive" alt="profile pic">
        </div>
        <!-- SIDEBAR USER TITLE -->
        <div class="profile-usertitle">
            <div class="profile-usertitle-name">
                <%=name%> (<%=username%>)
            </div>
            <div class="profile-usertitle-job">
                ADMINISTRATOR&nbsp;
                <li data-toggle="collapse" data-target="#viewExtraProfile" class="collapsed" style="list-style: none; display: inline; cursor: pointer;">
                    <i class="fa fa-caret-down"></i>
                </li>
            </div>
            <div class="collapse" id="viewExtraProfile">
                -
                <div class="profile-usertitle-job text-left">
                    Health Facility: <br><strong><%= hfc_name%> (<%=hfc%>)</strong>
                </div>

                <div class="profile-usertitle-job text-left">
                    Discipline: <br><strong><%= discipline_name%> (<%=discipline%>)</strong>
                </div>

                <div class="profile-usertitle-job text-left">
                    Subdiscipline: <br><strong><%= subdiscipline_name%> (<%=subdiscipline%>)</strong>
                </div>
            </div>
        </div>

        <!-- SIDEBAR BUTTONS -->
        <!-- <div class="profile-userbuttons">
            <button type="button" class="btn btn-success btn-sm" onclick="window.location.href = '../Entrance/Profile'">Manage Account</button>-->
        <!--<button type="button" class="btn btn-success btn-sm" onclick="clickManageAccount()">Manage Account</button>-->
        <!-- </div> --> 
    </div>

    <hr/>
    <!-- profile Sidebar -->
    <ul class="nav nav-sidebar" id="side-menu">
        <li id="tab" class="active"><a data-toggle="tab" class="editTab" href="#home"><i class="fa fa-chevron-right sideIcon" aria-hidden="true" ></i>Home</a></li>
        <li class="dropdown" id="tab"><a class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-chevron-right sideIcon" aria-hidden="true" ></i>Holiday<span class="caret"></span></a>
            <ul class="dropdown-menu">
                <li><a data-toggle="tab" class="dropdown-item" href="#maintainholiday">Maintain Holiday</a></li>
                <li><a data-toggle="tab" class="dropdown-item" href="#viewholiday">View Holiday</a></li>
            </ul>
        </li>
        <li class="dropdown" id="tab"><a class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-chevron-right sideIcon" aria-hidden="true" ></i>Clinic Day<span class="caret"></span></a>
            <ul class="dropdown-menu">
                <li><a data-toggle="tab" class="dropdown-item" href="#maintainclinicday">Maintain Clinic Day</a></li>
                <li><a data-toggle="tab" class="dropdown-item" href="#viewclinicday">View Clinic Day</a></li>
            </ul>
        </li>
        <li class="dropdown" id="tab"><a class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-chevron-right sideIcon" aria-hidden="true" ></i>Roster<span class="caret"></span></a>
            <ul class="dropdown-menu">
                <li><a data-toggle="tab" class="dropdown-item" href="#maintainroster">Maintain Staff Roster</a></li>
                <li><a data-toggle="tab" class="dropdown-item" href="#viewroster">View Staff Roster</a></li>
            </ul>
        </li>
        <li class="dropdown" id="tab"><a class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-chevron-right sideIcon" aria-hidden="true" ></i>Leave<span class="caret"></span></a>
            <ul class="dropdown-menu">
                <li><a data-toggle="tab" class="dropdown-item" href="#maintainleave">Maintain Staff Leave</a></li>
                <li><a data-toggle="tab" class="dropdown-item" href="#viewleave">Apply Leave</a></li>
            </ul>
        </li>
        <li id="tab" class=""><a data-toggle="tab" class="editTab" href="#maintainShift"><i class="fa fa-chevron-right sideIcon" aria-hidden="true" ></i>Maintain Shift</a></li>
        <li id="tab"><a data-toggle="tab" href="#doctorDirectory"><i class="fa fa-chevron-right sideIcon" aria-hidden="true" ></i>Doctor Availability</a></li>
        <li class="dropdown" id="tab"><a class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-chevron-right sideIcon" aria-hidden="true" ></i>Appointment<span class="caret"></span></a>
            <ul class="dropdown-menu">
                <li><a data-toggle="tab" class="dropdown-item" href="#addAppointment" id="tab_ADD_Appointment">Make Patient Appointment</a></li>
<!--                <li><a data-toggle="tab" class="dropdown-item" href="#viewAppointment">View Patient Appointment</a></li>-->
                <li><a data-toggle="tab" class="dropdown-item" href="#manageAppointment">Manage Appointment Duration</a></li>
            </ul>
        </li>
        <li id="tab"><a href="http://www.utem.edu.my/pusat_kesihatan/en/" target="_blank"><i class="fa fa-chevron-right sideIcon" aria-hidden="true" ></i>University Health Centre</a></li>
    </ul>  
</div>
<%}%>