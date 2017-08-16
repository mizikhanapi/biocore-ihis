<%-- 
    Document   : ResultAddActiveDrugOutPatient
    Created on : Aug 14, 2017, 6:27:29 PM
    Author     : shay
--%>
<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%
    String pmi, disicpline, subdiscpiline, episodedate, hfc, doctor, drugcode;
    pmi = request.getParameter("pmino");
    episodedate = request.getParameter("episodedate");
    disicpline = request.getParameter("discipline");
    subdiscpiline = request.getParameter("subdiscipline");
    hfc = request.getParameter("hfc");
    doctor = request.getParameter("doctor");
    drugcode = request.getParameter("drugcode");

    String sql = "select pmi_no,hfc_cd,episode_date,encounter_date,discipline_cd,subdiscipline_cd,onset_date,drug_cd,created_by,created_date from lhr_active_medication where pmi_no ='" + pmi + "' and drug_cd = '" + drugcode + "';";
    Conn conn = new Conn();
    RMIConnector rmic = new RMIConnector();
    ArrayList<ArrayList<String>> searchActiveDrug;
    searchActiveDrug = conn.getData(sql);
    if (searchActiveDrug.size() > 0) {
        out.print("already");
    } else {
        String insertactiv = "INSERT INTO lhr_active_medication(pmi_no,hfc_cd,episode_date,encounter_date,discipline_cd,subdiscipline_cd,onset_date,drug_cd,created_by,created_date) values ('" + pmi + "','" + hfc + "','" + episodedate + "',now(),'" + disicpline + "','" + subdiscpiline + "',now(),'" + drugcode + "','" + doctor + "',now())";
        Boolean insertS = rmic.setQuerySQL(conn.HOST, conn.PORT, insertactiv);
        if(insertS){
            out.print("success");
        }else{
            out.print("fail");
            out.print(insertactiv);
        }
    }
%>