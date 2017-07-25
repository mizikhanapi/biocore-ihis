<%@page import="dBConn.Conn"%>
<%@page import="Config.connect"%>
<%@page import="main.RMIConnector"%>
<%
    String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String pmi_no = session.getAttribute("patientPMINo").toString();
    String episode_Date = session.getAttribute("episodeDate").toString();
    String my_1_dis_cd = (String) session.getAttribute("DISCIPLINE_CODE");
    String my_1_sub_cd = (String) session.getAttribute("SUB_DISCIPLINE_CODE");
    //String datetime = session.getAttribute("datetime").toString();
    
    String rnNo1 = request.getParameter("rnNo1");
    String rnNo2 = request.getParameter("rnNo2");
    String rnNo3 = request.getParameter("rnNo3");
    String rnNo4 = request.getParameter("rnNo4");
    String rnNo5 = request.getParameter("rnNo5");
    String rnNo6 = request.getParameter("rnNo6");
    String rnNo7 = request.getParameter("rnNo7");
    String rnNo8 = request.getParameter("rnNo8");
    String rnNo9 = request.getParameter("rnNo9");
    String rnNo10 = request.getParameter("rnNo10");
    String rnNo11 = request.getParameter("rnNo11");
    String rnNo12 = request.getParameter("rnNo12");
    String rnNo13 = request.getParameter("rnNo13");
    String rnNo14 = request.getParameter("rnNo14");
    String rnNo15 = request.getParameter("rnNo15");
    String rnNo16 = request.getParameter("rnNo16");
    String rnNo17 = request.getParameter("rnNo17");
    String rnNo18 = request.getParameter("rnNo18");
    String rnNo19 = request.getParameter("rnNo19");
    String rnNo20 = request.getParameter("rnNo20");
    String rnNo21 = request.getParameter("rnNo21");
    String rnNo22 = request.getParameter("rnNo22");
    String rnNo23 = request.getParameter("rnNo23");
    String rnNo24 = request.getParameter("rnNo24");
    //String selected_date = request.getParameter("selected_date");
    String assessment_date = request.getParameter("assessment_date");
    RMIConnector rmic = new RMIConnector();

    Conn conn = new Conn();
    String sqlInsert = "UPDATE lhr_ort_neu_assessment_chart SET hip_slrt_1 = '" + rnNo1 + "',hip_slrt_2 = '" + rnNo2 + "', hip_extension_1='"+rnNo3+"', hip_extension_2='"+rnNo4+"', hip_flexion_1 = '" + rnNo5 + "', hip_flexion_2 = '" + rnNo6 + "', hip_abduction_1='"+rnNo7+"', hip_abduction_2 = '"+rnNo8+"',knee_extension_1 = '"+rnNo9+"',knee_extension_2 = '"+rnNo10+"',knee_flexion_1 = '"+rnNo11+"',knee_flexion_2 = '"+rnNo12+"', ankle_dorsiflex_1 = '"+rnNo13+"',ankle_dorsiflex_2 = '"+rnNo14+"',ankle_pantarflex_1 = '"+rnNo15+"',ankle_pantarflex_2 = '"+rnNo16+"',ankle_eversion_1 = '"+rnNo17+"',ankle_eversion_2 = '"+rnNo18+"',ankle_inversion_1 = '"+rnNo19+"',ankle_inversion_2 = '"+rnNo20+"',toes_dorsiflex_1 = '"+rnNo21+"',toes_dorsiflex_2 = '"+rnNo22+"',toes_plantarflex_1 = '"+rnNo23+"',toes_plantarflex_2 = '"+rnNo24+"' WHERE pmi_no = '" + pmi_no + "' AND hfc_cd = '"+hfc_cd+"' AND episode_date = '"+episode_Date+"' AND encounter_date='"+assessment_date+"' AND discipline_cd='"+my_1_dis_cd+"' AND subdiscipline_cd = '"+my_1_sub_cd+"'";
    rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);
%>