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
    
    

    String sql_check_user_type = "SELECT `USER_TYPE` FROM adm_users WHERE `USER_ID` = '" + USER_ID + "'";
    ArrayList<ArrayList<String>> data_check_user_type = Conn.getData(sql_check_user_type);

   
        

                            
                            String USER_NAME = session.getAttribute("USER_NAME").toString();
                            //String PICTURE = session.getAttribute("PICTURE").toString();
                            String IC_NO = session.getAttribute("IC_NO").toString();
                            String MOBILE_PHONE = session.getAttribute("MOBILE_PHONE").toString();
                            String EMAIL = session.getAttribute("EMAIL").toString();
                            

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
            <img src="<%//= my_1_gamba%>" class="img-responsive" alt="profile pic">
        </div>
        <!-- SIDEBAR USER TITLE -->
        <div class="profile-usertitle">
            <div class="profile-usertitle-name">
                <%=USER_NAME%> (<%=USER_ID%>)
            </div>
            <div class="profile-usertitle-job">
                PUBLIC USER&nbsp;
                <li data-toggle="collapse" data-target="#viewExtraProfile" class="collapsed" style="list-style: none; display: inline; cursor: pointer;">
                    <i class="fa fa-caret-down"></i>
                </li>
            </div>
            <div class="collapse" id="viewExtraProfile">
                -
                <div class="profile-usertitle-job text-left">
                    IC NO: <br><strong><%= IC_NO%></strong>
                </div>

                <div class="profile-usertitle-job text-left">
                    Phone No : <br><strong><%= MOBILE_PHONE%></strong>
                </div>

                <div class="profile-usertitle-job text-left">
                    Email : <br><strong><%= EMAIL%> </strong>
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
        <li id="tab" class="active"><a data-toggle="tab" class="editTab" href="#home">Home</a></li>
        <li><a data-toggle="tab" class="dropdown-item" href="#viewholiday">View Holiday</a></li>
         <li><a data-toggle="tab" class="dropdown-item" href="#viewclinicday">View Clinic Day</a></li>
<!--        <li class="dropdown" id="tab"><a class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-chevron-right sideIcon" aria-hidden="true" ></i>Holiday<span class="caret"></span></a>
            <ul class="dropdown-menu">
                <li><a data-toggle="tab" class="dropdown-item" href="#maintainholiday">Maintain Holiday</a></li>
                <li><a data-toggle="tab" class="dropdown-item" href="#viewholiday">View Holiday</a></li>
            </ul>
        </li>-->
<!--        <li class="dropdown" id="tab"><a class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-chevron-right sideIcon" aria-hidden="true" ></i>Clinic Day<span class="caret"></span></a>
            <ul class="dropdown-menu">
                <li><a data-toggle="tab" class="dropdown-item" href="#maintainclinicday">Maintain Clinic Day</a></li>
                <li><a data-toggle="tab" class="dropdown-item" href="#viewclinicday">View Clinic Day</a></li>
            </ul>
        </li>-->
<!--        <li class="dropdown" id="tab"><a class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-chevron-right sideIcon" aria-hidden="true" ></i>Roster<span class="caret"></span></a>
            <ul class="dropdown-menu">
                <li><a data-toggle="tab" class="dropdown-item" href="#maintainroster">Maintain Staff Roster</a></li>
                <li><a data-toggle="tab" class="dropdown-item" href="#viewroster">View Staff Roster</a></li>
            </ul>
        </li>-->
<!--        <li class="dropdown" id="tab"><a class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-chevron-right sideIcon" aria-hidden="true" ></i>Leave<span class="caret"></span></a>
            <ul class="dropdown-menu">
                <li><a data-toggle="tab" class="dropdown-item" href="#maintainleave">Maintain Staff Leave</a></li>
                <li><a data-toggle="tab" class="dropdown-item" href="#viewleave">Apply Leave</a></li>
            </ul>
        </li>-->
<!--        <li id="tab" class=""><a data-toggle="tab" class="editTab" href="#maintainShift"><i class="fa fa-chevron-right sideIcon" aria-hidden="true" ></i>Maintain Shift</a></li>-->
        <li id="tab"><a data-toggle="tab" href="#doctorDirectory">Doctor Availability</a></li>
        <li id="tab"><a data-toggle="tab" class="dropdown-item" href="#addAppointment" id="tab_ADD_Appointment">Make Appointment</a></li>

        <li id="tab"><a href="http://www.utem.edu.my/pusat_kesihatan/en/" target="_blank">University Health Centre</a></li>
    </ul>  
</div>
