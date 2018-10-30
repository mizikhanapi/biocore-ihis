<%-- 
    Document   : patientOrderListDetailsDispenseCallPatientInsert
    Created on : Jun 8, 2017, 4:41:22 AM
    Author     : Shammugam
--%>


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

    DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    LocalDateTime now = LocalDateTime.now();

    // Requesting Parameter
    String dataCallPatientFull = request.getParameter("dataCallPatientFull");

    String Id = "";                                  // Date 1
    String cs_hfc_cd = "";                                  // Date 2
    String cs_discipline = "";                              // Date 3
    String cs_sub_discipline = "";                          // Date 4
    String cs_pmi_no = "";                                  // Date 4
    String cs_patient_name = "";                            // Date 5
    String cs_queue_no = "";                                // Date 5
    String cs_queue_name = "-";                // Date 6
    String cs_datetime = format.format(now);                // Date 7
    String cs_callingtime = "2";                             // Date 8
    String cs_room_no = "Pharmacy";                             // Date 8

    String data[] = dataCallPatientFull.split("\\|");

    cs_hfc_cd = data[0];
    cs_discipline = data[1];
    cs_sub_discipline = data[2];
    cs_pmi_no = data[3];
    cs_patient_name = data[4];

    // Get Queue No Start
//    String sqlCallingCheck = " select * FROM qcs_calling_system_queue WHERE cs_hfc_cd = '" + cs_hfc_cd + "' AND cs_discipline = '" + cs_discipline + "' "
//            + "AND cs_sub_discipline = '" + cs_sub_discipline + "' AND cs_room_no = 'Pharmacy'; ";
//    ArrayList<ArrayList<String>> dataCallingCheck = conn.getData(sqlCallingCheck);
//
//    int sizeCallingCheck = dataCallingCheck.size();
//    int sizeCallingCheckModified = sizeCallingCheck + 1;
//    cs_queue_no = String.valueOf(sizeCallingCheckModified);

    String sqlCallingCheck = " SELECT queue_no FROM pms_patient_queue WHERE hfc_cd = '" + cs_hfc_cd + "' AND pmi_no = '" + cs_pmi_no + "' "
            + " ORDER BY created_date DESC LIMIT 1 ";
    ArrayList<ArrayList<String>> dataCallingCheck = conn.getData(sqlCallingCheck);

    int sizeCallingCheck = dataCallingCheck.size();
    for (int i = 0; i < sizeCallingCheck; i++) {
        cs_queue_no = dataCallingCheck.get(i).get(0).toString();
    }
    // Get Queue No End

    
    // Insert Into Calling System Start
    String sqlInsertCalling = "INSERT INTO qcs_calling_system_queue (cs_hfc_cd,cs_discipline,cs_sub_discipline,cs_pmi_no,cs_patient_name,cs_queue_no,cs_queue_name,cs_datetime,cs_callingtime,cs_room_no) "
            + " VALUES ('" + cs_hfc_cd + "','" + cs_discipline + "','" + cs_sub_discipline + "','" + cs_pmi_no + "','" + cs_patient_name + "','" + cs_queue_no + "','" + cs_queue_name + "', "
            + " '" + cs_datetime + "','" + cs_callingtime + "','" + cs_room_no + "') ";
    boolean isInsertCalling = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsertCalling);
    // Insert Into Calling System End 

    // Get Order No Start
    String sqlCallingNo = "select Id FROM qcs_calling_system_queue WHERE cs_hfc_cd = '" + cs_hfc_cd + "' AND cs_discipline = '" + cs_discipline + "' AND cs_pmi_no = '" + cs_pmi_no + "' "
            + " AND cs_sub_discipline = '" + cs_sub_discipline + "' AND cs_patient_name = '" + cs_patient_name + "' AND cs_queue_no = '" + cs_queue_no + "' AND cs_datetime = '" + cs_datetime + "' ";
    ArrayList<ArrayList<String>> dataCallingNo = conn.getData(sqlCallingNo);

    int sizeCallingNo = dataCallingNo.size();
    for (int i = 0; i < sizeCallingNo; i++) {
        Id = dataCallingNo.get(i).get(0).toString();
    }
    // Get Order No End

    if (isInsertCalling == true) {
        out.print("Success|" + Id);
    } else {
        out.print("Failed|" + Id);
    }

%>

