<%-- 
    Document   : callingInsert
    Created on : May 11, 2018, 10:36:30 AM
    Author     : user
--%>

<%@page import="org.json.JSONObject"%>
<%@page import="ADM_helper.MySessionKey"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%  
    String hfc_cd = (String) session.getAttribute(MySessionKey.HFC_CD);
    String dis_cd = (String) session.getAttribute(MySessionKey.DISCIPLINE_CD);
    String subdis_cd = (String) session.getAttribute(MySessionKey.SUBDISCIPLINE_CD);
    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();

    DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    LocalDateTime now = LocalDateTime.now();

    // Requesting Parameter
    String pmi_no = request.getParameter("pmi_no");
    String pat_name = request.getParameter("pat_name");
    String user_id = (String) session.getAttribute(MySessionKey.USER_ID);

    String Id = "";                                         // Date 1
    String cs_hfc_cd = "";                                  // Date 2
    String cs_discipline = "";                              // Date 3
    String cs_sub_discipline = "";                          // Date 4
    String cs_pmi_no = "";                                  // Date 4
    String cs_patient_name = "";                            // Date 5
    String cs_queue_no = "";                                // Date 5
    String cs_queue_name = "-";                             // Date 6
    String cs_datetime = format.format(now);                // Date 7
    String cs_callingtime = "2";                            // Date 8
    String cs_room_no = "";                                 // Date 8
  

    cs_hfc_cd = hfc_cd;
    cs_discipline = dis_cd;
    cs_sub_discipline = subdis_cd;
    cs_pmi_no = pmi_no;
    cs_patient_name = pat_name;

    // Get Queue No Start
    String sqlCallingCheck = " SELECT queue_no FROM pms_patient_queue WHERE hfc_cd = '" + cs_hfc_cd + "' AND pmi_no = '" + cs_pmi_no + "' "
            + " ORDER BY created_date DESC LIMIT 1 ";
    ArrayList<ArrayList<String>> dataCallingCheck = conn.getData(sqlCallingCheck);

    int sizeCallingCheck = dataCallingCheck.size();
    for (int i = 0; i < sizeCallingCheck; i++) {
        cs_queue_no = dataCallingCheck.get(i).get(0).toString();
    }
    // Get Queue No End

    // Get Staff Room Number Start
    String sqlGetRoomNo = " SELECT ROOM_NO FROM adm_users WHERE USER_ID = '" + user_id + "' LIMIT 1 ";
    ArrayList<ArrayList<String>> dataGetRoomNo = conn.getData(sqlGetRoomNo);

    int sizeGetRoomNo = dataGetRoomNo.size();
    if (sizeGetRoomNo>0) {
        cs_room_no = dataGetRoomNo.get(0).get(0).toString();
    }
    // Get Staff Room Number End

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
    if (sizeCallingNo>0) {
        Id = dataCallingNo.get(0).get(0).toString();
    }
    // Get Order No End

    JSONObject json = new JSONObject();
    
    json.put("isValid", isInsertCalling);
    json.put("call_ID", Id);
    
    out.print(json.toString());

%>


