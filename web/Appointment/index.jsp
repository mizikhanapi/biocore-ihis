<%-- 
    Document   : index
    Created on : Sep 6, 2017, 11:28:40 AM
    Author     : -D-
--%>


<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

    Conn Conn = new Conn();
    String discipline_name = null;
    String subdiscipline_name = null;
    String username = (String) session.getAttribute("USER_ID");
    String my_1_gamba = session.getAttribute("PICTURE").toString();
    

    String hfc = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    String hfc_name = (String) session.getAttribute("HFC_NAME");
    String name = (String) session.getAttribute("USER_NAME");
    String title = (String) session.getAttribute("OCCUPATION_CODE");
    String discipline = (String) session.getAttribute("DISCIPLINE_CODE");
    String subdiscipline = (String) session.getAttribute("SUB_DISCIPLINE_CODE");
    
    String discipline_name_sql = "SELECT discipline_name FROM adm_discipline WHERE discipline_cd = '" + discipline + "' AND discipline_hfc_cd = '" + hfc + "';";
    ArrayList<ArrayList<String>> discipline_name_AL = Conn.getData(discipline_name_sql);
    discipline_name = discipline_name_AL.get(0).get(0);
    String subdiscipline_name_sql = "SELECT subdiscipline_name FROM adm_subdiscipline WHERE subdiscipline_hfc_cd = '" + hfc + "' AND discipline_cd = '" + discipline + "' AND subdiscipline_cd = '" + subdiscipline + "'";
    ArrayList<ArrayList<String>> subdiscipline_name_AL = Conn.getData(subdiscipline_name_sql);
    subdiscipline_name = subdiscipline_name_AL.get(0).get(0);
    
 

%>
<html>
    <%@include file="header.jsp"%>
    <%@include file="assets/header.html"%>

    <body>
        <jsp:include page="main/SideMenu.jsp"/>
        <!-- main -->
        <div class="main" style="background: #f2f4f8;">

            <jsp:include page="main/TopMenu.jsp"/>

            <div class="container-fluid">


                <div class="row">
                    <div class="col-md-12 bodyContent">
                        <div class="thumbnail">
                            <div class="tab-content">

                                <div id="home" class="tab-pane active">
                                    <jsp:include page="main/home.jsp"/>
                                </div>

                                <div id="maintainholiday" class="tab-pane fade">
                                    <jsp:include page="main/MaintainHoliday.jsp"/>

                                </div>
                                <div id="viewholiday" class="tab-pane fade">
                                    <jsp:include page="main/ViewHoliday.jsp"/>

                                </div>
                                <div id="maintainclinicday" class="tab-pane fade">
                                    <jsp:include page="main/MaintainClinicDay.jsp"/>
                                </div>
                                <div id="viewclinicday" class="tab-pane">
                                    <jsp:include page="main/ViewClinicDay.jsp"/>
                                </div>
                                <div id="maintainroster" class="tab-pane fade">
                                    <jsp:include page="main/MaintainRoster.jsp"/>
                                </div>
                                <div id="viewroster" class="tab-pane fade ">
                                     <jsp:include page="main/ViewRoster.jsp"/>
                                </div>
                                <div id="maintainleave" class="tab-pane fade">
                                    <jsp:include page="main/MaintainLeave.jsp"/>
                                </div>
                                <div id="viewleave" class="tab-pane fade">
                                    <jsp:include page="main/ApplyLeave.jsp"/>
                                </div>
                                <div id="doctorDirectory" class="tab-pane fade">
                                     <jsp:include page="main/DoctorAvailability.jsp"/>
                                </div>
                                <div id="addAppointment" class="tab-pane fade" >
                                    <jsp:include page="main/MakeAppointment.jsp"/>
                                </div>
                                <div id="manageAppointment" class="tab-pane fade" >
                                     <jsp:include page="main/ManageAppointment.jsp"/>
                                </div>
                                     <div id="maintainShift" class="tab-pane fade" >
                                         <jsp:include page="main/MaintainShift.jsp"/>
                                     </div>
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

        <!--        End of div container-fluid-->
    </body>
</html>
