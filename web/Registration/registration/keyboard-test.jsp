<%-- 
    Document   : keyboard-test
    Created on : May 17, 2017, 3:11:01 PM
    Author     : user
--%>
<%@page import="dBConn.Conn"%>
<%@page import="Config.Config"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Config.getBase_url(request);
    Config.getFile_url(session);

    Conn conn = new Conn();

    String Consultationqueue = "select * from pms_queue_name where queue_type='FY' and hfc_cd = '" + session.getAttribute("HEALTH_FACILITY_CODE") + "' ";
    String Doctorqueue = "select * from pms_queue_name where queue_type='PN' and hfc_cd = '" + session.getAttribute("HEALTH_FACILITY_CODE") + "' ";

    ArrayList<ArrayList<String>> dataQueue;
    ArrayList<ArrayList<String>> dataQueue2;

    dataQueue = conn.getData(Doctorqueue);
    dataQueue2 = conn.getData(Consultationqueue);
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Kiosk | Signup Page</title>
        <!--header-->
        <%@include file="../assets/header.html"%>
        <link  rel="stylesheet" href="../assets/css/radiobtn.css">

        <script src="../../assets/js/jquery.min.js" type="text/javascript"></script>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <!-- keyboard widget css & script (required) -->
        <link href="../assets/css/keyboard.css" rel="stylesheet">
        <script src="../assets/js/jquery.keyboard.js"></script>

        <script>
            $(function () {
                $('#keyboard').keyboard();
            });
        </script>
        <!--header-->
    </head>
    <body>
        <input type="text" id="Rhfc" name="hiddeninput_HFC" hidden="" value='<%=session.getAttribute("HEALTH_FACILITY_CODE").toString()%>'>
        <div class="container-fluid m-scene">
            <div class="row">
                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-4 col-md-offset-4" style="margin-top: 2%;">
                            <div class="thumbnail">
                                <a href="../mainMenu.jsp" title="Back to Dashboard"><i class="fa fa-arrow-left fa-lg pull-left" style="color: #ccc;"></i></a>
                                <div class="profile-img-card" style="text-align: center;" >
                                    <i class="fa fa-user-md" aria-hidden="true" style="color: #666; font-size: 100px;"></i>
                                </div>
                                <div class="logo" style="font-size: 32px; text-align: center;">
                                    Please Enter your IC Number
                                </div>
                                <br/>
                                <form class="form-signin" action="dashboard.jsp">
                                    <span id="reauth-email" class="reauth-email"></span>
                                    <input id="keyboard" type="text">
                                    <input type="text" id="inputUserIC" class="form-control" placeholder="Enter Your IC" name="useric">
                                    <input type="text" id="inputUserName" class="form-control" placeholder="Your Name" name="username" disabled="">


                                    <div class="form-group">
                                        <label class="control-label" for="selectbasic">Please Select Queue</label>
                                        <!--<div class="col-md-8">-->
                                        <br>      
                                        <div class="btn-group" data-toggle="buttons">
                                            <label class="btn active marglft" for="commonQueue">
                                                <input type="radio" id ="commonQueue" name='queuetype' value="CM"><i class="fa fa-circle-o fa-2x"></i><i class="fa fa-dot-circle-o fa-2x "></i> <span>Consultation</span>
                                            </label>
                                            <label class="btn marglft" for="consultantQueue">
                                                <input type="radio" id ="consultantQueue" name='queuetype' value="FY"><i class="fa fa-circle-o fa-2x"></i><i class="fa fa-dot-circle-o fa-2x "></i><span>Services</span>
                                            </label>
                                            <label class="btn marglft" for="doctorQueue">
                                                <input type="radio" id ="doctorQueue" name='queuetype' value="PN"><i class="fa fa-circle-o fa-2x"></i><i class="fa fa-dot-circle-o fa-2x "></i><span>Doctors</span>
                                            </label>
                                        </div>
                                        <!--</div>-->
                                    </div>
                                    <select  id="selectedServiceQueue"  class="form-control select-full" hidden>
                                        <option value="null" selected="" disabled="">Please Select Queue</option>

                                        <%
                                            String add = null, text = null;
                                            for (int i = 0; i < dataQueue2.size(); i++) {
                                                if (dataQueue2.get(i).get(1) != "" || dataQueue2.get(i).get(1) != null) {

                                                    if (!dataQueue2.get(i).get(1).contains("Room")) {

                                        %>

                                        <option value="<%=dataQueue2.get(i).get(1)%>"><%="(" + dataQueue2.get(i).get(0) + ") " + dataQueue2.get(i).get(1)%></option>
                                        <%                  }
                                                }
                                            }
                                        %>

                                    </select>

                                    <select  id="selectedDoctorQueue"  class="form-control select-full">
                                        <option value="null" selected="" disabled="">Please Select Queue</option>

                                        <%
                                            for (int i = 0; i < dataQueue.size(); i++) {
                                                if (dataQueue.get(i).get(1) != "" || dataQueue.get(i).get(1) != null) {
                                        %>

                                        <option value="<%=dataQueue.get(i).get(1)%>"><%="(" + dataQueue.get(i).get(0) + ") " + dataQueue.get(i).get(1)%></option>
                                        <%                  }
                                            }
                                        %>

                                    </select>

                                </form>
                                <div class="text-center">
                                    <button id="registerSignup" class="btn btn-lg btn-primary">Register</button>
                                    <button id="cancelSignup" class="btn btn-lg btn-default">Cancel</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--Script-->
        <div w3-include-html="../libraries/script.html"></div>

        <script src="http://www.w3schools.com/lib/w3data.js"></script>

        <script src="../assets/js/bootbox.min.js"></script>
        <%//@include file="../assets/script.html"%>
        <script src="../assets/jquery.PrintArea.js"></script>

    </body>
</html>
