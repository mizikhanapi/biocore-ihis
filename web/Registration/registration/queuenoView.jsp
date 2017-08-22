
<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.io.*"%> 
<%@page import="java.sql.Connection"%> 
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>

<%
    Config.getBase_url(request);
    Config.getFile_url(session);

    Conn conn = new Conn();

    String hfc = "", status = "1", today = "", time = "", queuename = "",icNo="",patientName="";
    String CurrentNo = "", PatientNewNo = "", HelathFacility = "";
    String day = "";
    // status= "1";
    // today= "2017-08-04";
    // queuename= "Normal Queue";

    hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    today = request.getParameter("today").trim();
    time = request.getParameter("time").trim();
    queuename = request.getParameter("queuename").trim();
    icNo = request.getParameter("icno").trim();
    patientName = request.getParameter("patientname").trim();
    String Result = "";
//             status = request.getParameter("status").trim();// when 0069 look up details = Consult

    String quary = "	SELECT MAX(`queue_no`) AS pms_pat_que"
            + " FROM `pms_patient_queue`"
            + " WHERE  `hfc_cd` =  '" + hfc + "' "
            + " and  `episode_date` like '" + today + "%'"
            + " and `queue_name`= '" + queuename + "'  and `status`='" + status + "'"
            + " UNION"
            + " SELECT `last_queue_no` AS pms_last_queue_no"
            + " from `pms_last_queue_no`"
            + " WHERE  `hfc_cd` =  '" + hfc + "' "
            + " and  `episode_date` like '" + today + "%'  "
            + " and `queue_name`= '" + queuename + "' ";

    ArrayList<ArrayList<String>> QueueNo = conn.getData(quary);

    if (!QueueNo.isEmpty()) {
           
        CurrentNo = QueueNo.get(0).get(0);
        PatientNewNo = QueueNo.get(1).get(0);
        HelathFacility = session.getAttribute("HFC_NAME").toString();

        try {

            SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
            Date dt1 = format1.parse(today);
            DateFormat format2 = new SimpleDateFormat("EEEE");
            day = format2.format(dt1);

        } catch (ParseException e) {
            e.printStackTrace();
        }

        if (CurrentNo == null) {
            CurrentNo = "0";
        }

        Result = "Success";
    } else {
        Result = "No Rcords";
    }
%>



<div>
    <p style="text-align: center; margin-bottom: 10px; font-size: 16px"><strong><%= HelathFacility%></strong></p>
    <p><strong>IC Number: </strong><%=icNo%></p>
    <p><strong>Name: </strong><%=patientName%></p>
    <p><strong>Nombor anda: </strong><%=PatientNewNo%></p>
    <p><strong>Current no : </strong><%=CurrentNo%></p>
    <p style="font-size: 9px"><%=day + ": " + today + "        " + "Time: " + time%></p>
    <p style="display: none" id="checkReport"><%=Result%></p>
</div>






