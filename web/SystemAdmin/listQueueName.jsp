<%-- 
    Document   : listQueueType
    Created on : Feb 8, 2017, 11:09:35 AM
    Author     : shay
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Config.getBase_url(request);
    Config.getFile_url(session);
    Conn conn = new Conn();
    String hfcN = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String disN = session.getAttribute("DISCIPLINE_CODE").toString();

    //                                                                                      DATE_FORMAT(n.created_date,'%d/%m/%Y')
    String sql = "select n.queue_type,n.queue_name,n.queue_description,ifnull(n.user_id, '-'),n.quota,n.status,n.created_by, DATE_FORMAT(n.created_date,'%d/%m/%Y'),n.hfc_cd,d.discipline_name,s.subdiscipline_name,h.hfc_name,x.user_name"
            + " from pms_queue_name n "
            + "left join adm_users x on x.user_id = n.user_id " //aku tukar inner jadi left untuk test.
            + "left join adm_health_facility h on h.hfc_cd = n.hfc_cd "
            + "left join adm_hfc_discipline a on a.discipline_cd = n.discipline_code and a.subdiscipline_cd = n.subdiscipline_code and a.hfc_cd = n.hfc_cd "
            + "left join adm_discipline d on d.discipline_cd = a.discipline_cd and d.discipline_hfc_cd = n.hfc_cd "
            //+ "left join pms_queue_type q on q.queue_type = n.queue_type and q.status='Active' and q.hfc_cd = n.hfc_cd and q.discipline_code = n.discipline_code "
            + "LEFT JOIN adm_subdiscipline s on s.subdiscipline_cd = a.subdiscipline_cd and s.discipline_cd = a.discipline_cd and s.subdiscipline_hfc_cd = n.hfc_cd "
            + "where n.hfc_cd = '" + hfcN + "' and n.discipline_code='" + disN + "';";
    ArrayList<ArrayList<String>> dataQN;
    dataQN = conn.getData(sql);
%>
<table class="table table-filter table-striped table-bordered table-hover" style="background: #fff; border: 1px solid #ccc;" id="QNtable">
    <thead>
    <th>Queue Type Code</th>
    <th>Queue Name Code</th>
    <th>Staff ID</th>
    <th hidden="true"></th>
    <th>Description</th>
    <th>Quota</th>
    <th>Status</th>
    <th>Modify by</th>
    <th>Modify date</th>
    <th>Health Facility</th>
    <th hidden="true"></th>
    <th>Discipline</th>
    <th>Sub-discipline</th>
</thead>
<tbody>
    <%
        for (int i = 0; i < dataQN.size(); i++) {
            String sub = "";
            if (dataQN.get(i).get(10) == null) {
                sub = "-";
            } else {
                sub = dataQN.get(i).get(10);
            }
    %>
    <tr data-status="pagado" data-toggle="modal" data-id="1" data-target="#names">
        <td id="tyCd"><%=dataQN.get(i).get(0)%></td>
        <td id="nmCd"><%=dataQN.get(i).get(1)%></td>
        <td id="idName" ><%=dataQN.get(i).get(12)%></td>
        <td id="id" hidden=""><%=dataQN.get(i).get(3)%></td>
        <td id="desc"><%=dataQN.get(i).get(2)%></td>
        <td id="quota"><%=dataQN.get(i).get(4)%></td>
        <td id="status23"><%=dataQN.get(i).get(5)%></td>
        <td id="createdBy"><%=dataQN.get(i).get(6)%></td>
        <td id="createdDate"><%=dataQN.get(i).get(7)%></td>
        <td ><%=dataQN.get(i).get(11)%></td>
        <td id="hfc" hidden="true"><%=dataQN.get(i).get(8)%></td>
        <td id="disipline"><%=dataQN.get(i).get(9)%></td>
        <td id="subdicipline"><%=sub%></td>
    </tr>
    <%
        }
    %>
</tbody>
</table>
<script>
    $(document).ready(function () {
        $('#QNtable').DataTable({
            
            "language": {
                "emptyTable": "No Queue Name Available To Display"
            }
        });
    });
</script>