<%@page import="dBConn.Conn"%>
<%@page import="Config.connect"%>
<%@page import="main.RMIConnector"%>
<%
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String pmino = session.getAttribute("patientPMINo").toString();
    //String user_id = session.getAttribute("USER_ID").toString();
    String episodeDate = session.getAttribute("episodeDate").toString();
    //String datetime = session.getAttribute("datetime").toString();
    
    String rnNo25 = request.getParameter("rnNo25");
    String rnNo26 = request.getParameter("rnNo26");
    String rnNo27 = request.getParameter("rnNo27");
    String rnNo28 = request.getParameter("rnNo28");
    String rnNo29 = request.getParameter("rnNo29");
    String rnNo30 = request.getParameter("rnNo30");
    String rnNo31 = request.getParameter("rnNo31");
    String rnNo32 = request.getParameter("rnNo32");
    String rnNo33 = request.getParameter("rnNo33");
    String rnNo34 = request.getParameter("rnNo34");
    String rnNo35 = request.getParameter("rnNo35");
    String rnNo36 = request.getParameter("rnNo36");
    String rnNo37 = request.getParameter("rnNo37");
    String rnNo38 = request.getParameter("rnNo38");
    String rnNo39 = request.getParameter("rnNo39");
    String rnNo40 = request.getParameter("rnNo40");
    String rnNo41 = request.getParameter("rnNo41");
    String rnNo42 = request.getParameter("rnNo42");
    String rnNo43 = request.getParameter("rnNo43");
    String rnNo44 = request.getParameter("rnNo44");
    String rnNo45 = request.getParameter("rnNo45");
    String rnNo46 = request.getParameter("rnNo46");
    String rnNo47 = request.getParameter("rnNo47");
    String rnNo48 = request.getParameter("rnNo48");
    

//    String rnNo31 = "3";
//    String rnNo32 = "3";
//    String rnNo33 = "3";
//    String rnNo34 = "3";
//    String rnNo35 = "3";
//    String rnNo36 = "3";
//    String rnNo37 = "3";
//    String rnNo38 = "3";
//    String rnNo39 = "3";
//    String rnNo40 = "3";
//    String rnNo41 = "3";
//    String rnNo42 = "5";
//    String rnNo43 = "4";
//    String rnNo44 = "7";
//    String rnNo45 = "8";
//    String rnNo46 = "9";
//    String rnNo47 = "9";
//    String rnNo48 = "9";
    
    RMIConnector rmic = new RMIConnector();

    Conn conn = new Conn();
    String sqlInsert = "UPDATE lhr_ort_neu_assessment_chart SET sensory_L1_1 = '" + rnNo25 + "',sensory_L1_2 = '" + rnNo26 + "', sensory_l2_1='"+rnNo27+"', sensory_l2_2='"+rnNo28+"', sensory_l3_1 = '" + rnNo29 + "', sensory_l3_2 = '" + rnNo30 + "', sensory_l4_1='"+rnNo31+"', sensory_l4_2 = '"+rnNo32+"',sensory_l5_1 = '"+rnNo33+"',sensory_l5_2 = '"+rnNo34+"',sensory_s1_1 = '"+rnNo35+"',sensory_s1_2 = '"+rnNo36+"', sensory_s2_1 = '"+rnNo37+"',sensory_s2_2 = '"+rnNo38+"',sensory_sacral_1 = '"+rnNo39+"',sensory_sacral_2 = '"+rnNo40+"',sensory_abdominal_1 = '"+rnNo41+"',sensory_abdominal_2 = '"+rnNo42+"',sensory_crematenic_1 = '"+rnNo43+"',sensory_crematenic_2 = '"+rnNo44+"',sensory_anal_1 = '"+rnNo45+"',sensory_anal_2 = '"+rnNo46+"',sensory_bo_1 = '"+rnNo47+"',sensory_bo_2 = '"+rnNo48+"' WHERE pmi_no = '" + pmino + "' AND hfc_cd = '"+hfc+"' AND episode_date = '"+episodeDate+"'";
    rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);
%>

