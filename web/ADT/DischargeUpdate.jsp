<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="dBConn.Conn"%>
<%
    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();
    DateFormat df = new SimpleDateFormat("dd/MM/yy HH:mm:ss");
    Date dateobj = new Date();
    df.format(dateobj);

    String pmiNo = request.getParameter("pmiNo");
    String hfc = request.getParameter("hfc_cd");
    String Dis = request.getParameter("disb");
    String BedID = request.getParameter("BedID");
    String wnameb = request.getParameter("wnameb");
    String WardTypeb = request.getParameter("WardTypeb");
    String status = "2";
        String bedstatus = "Available";

    String userID = request.getParameter("userID");
    String transfer_reason = request.getParameter("DisReason");

    // String transfer_reason ="sakit";
    Boolean updBed, upMaster, upDetail;

    String updateBed = "UPDATE wis_bed_id SET bed_status = '" + bedstatus + "' where hfc_cd ='" + hfc + "' and discipline_cd ='" + Dis + "' and bed_id ='" + BedID + "' ";
   String updateEpisode = "DELETE from wis_inpatient_episode where pmi_no ='" + pmiNo + "' and hfc_cd ='" + hfc + "' and discipline_cd ='" + Dis + "'  ";
    String insertHistory = "insert into wis_inpatient_episode_history"
           + "(pmi_no,episode_date,encounter_date,hfc_cd,ward_class_code,ward_id,bed_id,transfer_reason,inpatient_status,created_by,created_date) "
           + "values"
            + "('" + pmiNo + "',NOW(),NOW(),'" + hfc + "','" + WardTypeb + "','" + wnameb + "','" + BedID + "','" + transfer_reason + "','" + status + "','" + userID + "',NOW());";

    updBed = rmic.setQuerySQL(conn.HOST, conn.PORT, updateBed);
   upMaster = rmic.setQuerySQL(conn.HOST, conn.PORT, updateEpisode);
    upDetail = rmic.setQuerySQL(conn.HOST, conn.PORT, insertHistory);
//
//
    if (updBed == true && upMaster == true && upDetail == true ) {
        out.print("Success");
    } else {
        out.print("False");

    }


%>

