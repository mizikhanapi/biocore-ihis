<%-- 
    Document   : listEmp
    Created on : Jan 20, 2017, 4:54:38 PM
    Author     : shay
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Conn conn = new Conn();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String now = sdf.format(new Date());

    //amik kt session
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String doctor = session.getAttribute("USER_NAME").toString();
//      String hfc = "04010101";
//      String doctor = "";
//    String sql = "SELECT e.PMI_NO,e.NAME,EPISODE_TIME,e.COMMON_QUEUE,e.DOCTOR,e.STATUS,q.QUEUE_NO FROM PMS_EPISODE e,PMS_PATIENT_QUEUE q WHERE e.EPISODE_DATE LIKE '%" + now + "%' AND e.STATUS NOT LIKE 'Discharge' AND q.PMI_NO=e.PMI_NO";
//    String newSql = "SELECT e.PMI_NO,e.name,e.EPISODE_TIME,e.COMMON_QUEUE,e.DOCTOR,e.STATUS,q.QUEUE_NO FROM PMS_EPISODE e,PMS_PATIENT_QUEUE q WHERE (e.STATUS NOT LIKE 'Discharge') AND ((e.EPISODE_DATE LIKE '%" + now + "%') AND  (q.PMI_NO=e.PMI_NO) AND e.HEALTH_FACILITY_CODE='" + hfc + "' AND e.EPISODE_DATE=q.episode_date)";
//    String newnewSql = "select e.pmi_no,e.name,e.episode_date,e.episode_time,e.common_queue,q.queue_no,e.doctor,e.status from pms_episode e,pms_patient_queue q where e.status !='Discharge' and e.EPISODE_DATE like '%" + now + "%' and e.HEALTH_FACILITY_CODE='" + hfc + "' and e.PMI_NO = q.pmi_no and e.EPISODE_DATE = q.episode_date";
    //String newnewnewsql ="select e.pmi_no,e.name,e.episode_date,e.episode_time,e.common_queue,q.queue_no,e.doctor,e.status,e.consultation_room from pms_episode e inner join pms_patient_queue q on q.pmi_no = e.pmi_no and q.episode_date = e.episode_date where e.status !='1' and e.EPISODE_DATE like '%" + now + "%' and e.HEALTH_FACILITY_CODE='" + hfc + "'";
    //String thesqlCIS ="select e.pmi_no,e.name,e.episode_date,e.episode_time,e.common_queue,q.queue_no,e.doctor,e.status,e.consultation_room from pms_episode e inner join pms_patient_queue q on q.pmi_no = e.pmi_no and q.episode_date = e.episode_date where e.status !='1' and e.EPISODE_DATE like '%" + now + "%' and e.HEALTH_FACILITY_CODE='" + hfc + "' and e.doctor = '"+ doctor +"'";
    String sql = "select q.pmi_no,e.name,q.episode_date,e.episode_time,q.queue_name,q.queue_no,e.doctor,l.description,e.consultation_room from pms_patient_queue q , pms_episode e,adm_lookup_detail l where l.`Master_Reference_code` ='0069' and l.`Detail_Reference_code` = q.status and e.pmi_no = q.pmi_no and e.episode_date = q.episode_date and e.`HEALTH_FACILITY_CODE` = q.hfc_cd and l.`hfc_cd` = '" + hfc + "' and q.episode_date like '%" + now + "%' and q.status !='1' and q.hfc_cd='" + hfc + "' AND (q.queue_type = 'CM' OR q.queue_name = '" + doctor + "') LIMIT 5";

                                //0    //1              //2                //3        //4         //5                       //6             //7         //8
    String sqlV3 = "SELECT q.pmi_no, b.patient_name, q.episode_date, q.queue_name, q.queue_no, ifnull(q.user_id, '-'), l.description, ifnull(u.room_no, '-'), q.patient_category, x.description"
            + " from pms_patient_queue q"
            + " join pms_patient_biodata b on b.pmi_no = q.pmi_no"
            + " join adm_lookup_detail l on l.`Master_Reference_code` ='0069' and l.`Detail_Reference_code` = q.status and l.`hfc_cd` = '" + hfc + "'"
            + " left join adm_lookup_detail x on x.`Master_Reference_code` ='0033' and x.`Detail_Reference_code` = q.patient_category and x.`hfc_cd` = '" + hfc + "'"
            + " left join adm_users u on u.user_id = q.user_id and u.health_facility_code = '" + hfc + "'"
            + " where q.episode_date like '%" + now + "%' and q.status !='1' and q.hfc_cd='" + hfc + "';";
    ArrayList<ArrayList<String>> dataQueue;
    dataQueue = conn.getData(sqlV3);
    //out.print(sql);
%>
<table class="table table-filter table-striped table-bordered" style="background: #fff; border: 1px solid #ccc; " id="listQueue">
    <thead>
        <tr>
            <th>PMI no. <%//out.print(sqlV3);%></th>
            <th>Name </th>
            <th>Episode Date/Time </th>
            <!--                                <th>Episode Time </th>-->
            <th class="hidden-xs">Queue Name </th>
            <th>Queue no.</th>
            <th class="hidden-xs">Doctor </th>
            <th>Consultation Room </th>
            <th class="hidden-xs">Patient Category</th>
            <th>Status</th>
            <th>Action </th>
        </tr>
    </thead>
    <tbody>
        <%
        for (int i = 0; i < dataQueue.size(); i++) {%>
        <tr>
            <td id="tdQMS_ATQ_PMI_NO"><%=dataQueue.get(i).get(0)%></td>
            <td id="tdQMS_ATQ_PATIENT_NAME"><%=dataQueue.get(i).get(1)%></td>
            <td id="tdQMS_ATQ_EPISODE_DATE"><%=dataQueue.get(i).get(2)%></td>
    <!--        <td id="epiTime" hidden="hidden"><% //dataQueue.get(i).get(3)%></td>-->
            <td class="hidden-xs" id="tdQMS_ATQ_QUEUE_NAME"><%=dataQueue.get(i).get(3)%></td>
            <td id="tdQMS_ATQ_QUEUE_NO"><%=dataQueue.get(i).get(4)%></td>
            <td class="hidden-xs"><%=dataQueue.get(i).get(5)%></td>
            <td ><%=dataQueue.get(i).get(7)%></td>
            <td class="hidden-xs" id="tdQMS_ATQ_PATIENT_CATEGORY"><%=dataQueue.get(i).get(9)%></td>
            <td id="tdQMS_ATQ_STATUS"><%=dataQueue.get(i).get(6)%></td>
            <% if (dataQueue.get(i).get(6).equals("Consult")) { %>
            <td><button class="btn btn-primary changePatientBtn" disabled="">Assign</button> </td>
            <% } else {%>
            <td><button class="btn btn-primary changePatientBtn" id="btnQMS_ATQ_Assign" >Assign</button> </td>
            <%}%>

        </tr>    
        <%    }
        %>

    </tbody>
</table>

