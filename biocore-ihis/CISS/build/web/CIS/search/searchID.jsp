<%-- 
    Document   : searchID
    Created on : 07-Mar-2017, 17:47:59
    Author     : ahmed
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>

<%
    Conn conn = new Conn();
//    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
//    Date date = new Date();

    String idType = request.getParameter("idType");
    String idInput = request.getParameter("idInput");
    String sql = "";
    String sql2 = "";

    if (idType.equals("pmino")) {
        sql = "select w.pmi_no,w.episode_date,h.hfc_name,d.discipline_name,w.new_ic_no,w.old_ic_no from wis_inpatient_episode w inner join adm_health_facility h on w.hfc_cd = h.hfc_cd inner join  adm_discipline d on w.discipline_cd = d.discipline_cd where w.pmi_no = '" + idInput + "'";
        sql2 = "select p.pmi_no,p.episode_date,h.hfc_name,d.discipline_name,p.new_ic_no,p.old_ic_no from pms_episode p inner join adm_health_facility h on p.`HEALTH_FACILITY_CODE` = h.hfc_cd inner join  adm_discipline d on p.DISCIPLINE_CODE = d.discipline_cd where p.pmi_no = '" + idInput + "';";

    } else if (idType.equals("icnew")) {
        sql = "select w.pmi_no,w.episode_date,h.hfc_name,d.discipline_name,w.new_ic_no,w.old_ic_no from wis_inpatient_episode w inner join adm_health_facility h on w.hfc_cd = h.hfc_cd inner join  adm_discipline d on w.discipline_cd = d.discipline_cd where w.new_ic_no = '" + idInput + "'";
        sql2 = "select p.pmi_no,p.episode_date,h.hfc_name,d.discipline_name,p.new_ic_no,p.old_ic_no from pms_episode p inner join adm_health_facility h on p.`HEALTH_FACILITY_CODE` = h.hfc_cd inner join  adm_discipline d on p.DISCIPLINE_CODE = d.discipline_cd where p.new_ic_no = '" + idInput + "';";

    } else if (idType.equals("icold")) {
        sql = "select w.pmi_no,w.episode_date,h.hfc_name,d.discipline_name,w.new_ic_no,w.old_ic_no from wis_inpatient_episode w inner join adm_health_facility h on w.hfc_cd = h.hfc_cd inner join  adm_discipline d on w.discipline_cd = d.discipline_cd where w.old_ic_no = '" + idInput + "'";
        sql2 = "select p.pmi_no,p.episode_date,h.hfc_name,d.discipline_name,p.new_ic_no,p.old_ic_no from pms_episode p inner join adm_health_facility h on p.`HEALTH_FACILITY_CODE` = h.hfc_cd inner join  adm_discipline d on p.DISCIPLINE_CODE = d.discipline_cd where p.old_ic_no = '" + idInput + "';";
    }

    ArrayList<ArrayList<String>> searchID;
    searchID = conn.getData(sql);

    ArrayList<ArrayList<String>> searchID1;
    searchID1 = conn.getData(sql2);

    //out.println(searchID);
    
if(searchID.size() > 0 && searchID1.size()>0){
    

%>
<center>
    <h4>PREVIOUS VISIT (INPATIENT EPISODE) 
<!--        <a class="btn btn-primary pull-right" data-toggle="collapse" href="#searchPatient1" aria-expanded="false" aria-controls="searchPatient1">
            View Inpatient Episode
        </a>-->
    </h4>
</center>
<br/>
<table class="table table-filter table-striped" style="background: #fff; border: 1px solid #ccc;" id="searchPatient1">
    <thead>
    <th>Episode Date</th>
    <th>Health Care Facility</th>
    <th>Discipline</th>
    <th>Action</th>
</thead>
<tbody id="detailList">
    <%        for (int i = 0; i < searchID.size(); i++) {
            if (searchID.size() > 0) {
           //out.print(String.join("|", searchID.get(i)));

    %>
    <tr>
        <td><%=searchID.get(i).get(1)%>
            <input type="hidden" id="pmi" value="<%=searchID.get(i).get(0)%>">
            <input type="hidden" id="episode" value="<%=searchID.get(i).get(1)%>">
            <input type="hidden" id="disipline" value="<%=searchID.get(i).get(3)%>">
            <input type="hidden" id="ic_no" value="<%=searchID.get(i).get(4)%>">
            <input type="hidden" id="old_ic_no" value="<%=searchID.get(i).get(5)%>">
        </td>
        <td><%=searchID.get(i).get(2)%></td>
        <td><%=searchID.get(i).get(3)%></td>
        <td><a href="#episodeDetail" id="ViewDetail" name="ViewDetail" class="btn btn-default" type="button" role="button"><i class="fa fa-eye" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a></td>
    </tr>

    <% }
        }
    %>
</tbody>
</table>
<center><h4>PREVIOUS VISIT (OUTPATIENT EPISODE)</h4></center>
<table class="table table-filter table-striped" style="background: #fff; border: 1px solid #ccc;" id="searchPatient1">
    <thead>
    <th>Episode Date</th>
    <th>Health Care Facility</th>
    <th>Discipline</th>
    <th>Action</th>
</thead>
<tbody id="detailList1">
    <%
        for (int i = 0; i < searchID1.size(); i++) {
            if (searchID1.size() > 0) {

           //out.print(String.join("|", searchID1.get(i)));
    %>
    <tr>
        <td><%=searchID1.get(i).get(1)%>
            <input type="hidden" id="pmi1" value="<%=searchID1.get(i).get(0)%>">
            <input type="hidden" id="episode1" value="<%=searchID1.get(i).get(1)%>">
            <input type="hidden" id="disipline1" value="<%=searchID1.get(i).get(3)%>">
            <input type="hidden" id="ic_no1" value="<%=searchID1.get(i).get(4)%>">
            <input type="hidden" id="old_ic_no1" value="<%=searchID1.get(i).get(5)%>">
        </td>
        <td><%=searchID1.get(i).get(2)%></td>
        <td><%=searchID1.get(i).get(3)%></td>
        <td><a href="#episodeDetail" id="ViewDetail1" name="ViewDetail" class="btn btn-default" type="button" role="button"><i class="fa fa-eye" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a></td>
    </tr>

    <% }
        }
    %>
</tbody>
</table>

<% 
}
else{
    out.print("1");
}
%>

