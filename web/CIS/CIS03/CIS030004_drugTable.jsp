<%-- 
    Document   : CIS030004_drugTable
    Created on : Dec 9, 2017, 9:57:18 PM
    Author     : -D-
--%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="dBConn.Conn"%>
<%@page import="Config.Config"%>
<%@page import="java.util.ArrayList"%>

<%
    String pmiNo = session.getAttribute("patientPMINo").toString();
    Conn conn = new Conn();
    String sqlActivDrug = "Select distinct m.pmi_no,m.hfc_cd,m.episode_date,m.encounter_date,m.discipline_cd,m.subdiscipline_cd,m.onset_date,m.drug_cd,m.created_by,m.created_date,p.d_trade_name,m.drug_dosage,m.drug_strength,duration from lhr_active_medication m join pis_mdc2 p on m.drug_cd = p.ud_mdc_code and m.hfc_cd = p.hfc_cd where pmi_no = '" + pmiNo + "' order by m.onset_date desc;";
    ArrayList<ArrayList<String>> searchActivDrug;
    searchActivDrug = conn.getData(sqlActivDrug);
%>

<table class="table table-striped table-bordered" id="tableActiveDrugList" cellspacing="0" width="100%">
    <thead>
    <th>No.</th>
    <th>Name</th>
    <th>Onset Date</th>
    <th>Dosage</th>
    <th>Strength</th>
    <th>Duration</th>
    <th>Action</th>
</thead>
<tbody>
    <%                      if (searchActivDrug.size() > 0) {
            for (int i = 0; i < searchActivDrug.size(); i++) {
    %>
    <tr>
        <td><%=i + 1%>
            <input type="hidden" id="pmidrug" value="<%=searchActivDrug.get(i).get(0)%>">
            <input type="hidden" id="episodedrug" value="<%=searchActivDrug.get(i).get(2)%>">
            <input type="hidden" id="disciplinedrug" value="<%=searchActivDrug.get(i).get(5)%>">
            <input type="hidden" id="drugcodedrug" value="<%=searchActivDrug.get(i).get(7)%>">
        </td>
        <td><%=searchActivDrug.get(i).get(10)%></td>
        <td id="drugonsetDate"><%=searchActivDrug.get(i).get(6)%></td>
        <td><%=searchActivDrug.get(i).get(11)%></td>
        <td><%=searchActivDrug.get(i).get(12)%></td>
        <td><%=searchActivDrug.get(i).get(13)%></td>
        <td><button id="btnDeleteActivDrug" class="btn btn-danger">Delete</button></td>
    </tr>
    <%}
                        }%>
</tbody>
</table>