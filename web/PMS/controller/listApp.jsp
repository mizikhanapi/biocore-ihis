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
    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    Date date = new Date();

    String idType = request.getParameter("idType");
    String idInput = request.getParameter("idInput");
    String fromDate = request.getParameter("fromDate");
    String toDate = request.getParameter("toDate");
    
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String sql = "";
    String otherSQL = "select a.pmi_no,a.appointment_date,a.start_time,a.appointment_type,b.PATIENT_NAME,b.NEW_IC_NO,b.OLD_IC_NO,b.ID_TYPE,b.ID_NO from pms_appointment a inner join pms_patient_biodata b on a.pmi_no = b.`PMI_NO` where a.pmi_no = (select pmi_no from pms_patient_biodata where id_no='" + idInput + "') and status ='active' and hfc_cd='" + hfc + "'";

    switch (idType) {
        case "today":
            // todays
            sql = "select a.pmi_no,a.appointment_date,a.start_time,a.appointment_type,b.PATIENT_NAME,b.NEW_IC_NO,b.OLD_IC_NO,b.ID_TYPE,b.ID_NO from pms_appointment a inner join pms_patient_biodata b on a.pmi_no = b.`PMI_NO` where DATE(a.appointment_date) = CURDATE() and a.status ='active' and hfc_cd='" + hfc + "'";
            break; // optional

        case "yesterday":
            // yesterday
            sql = "select a.pmi_no,a.appointment_date,a.start_time,a.appointment_type,b.PATIENT_NAME,b.NEW_IC_NO,b.OLD_IC_NO,b.ID_TYPE,b.ID_NO from pms_appointment a inner join pms_patient_biodata b on a.pmi_no = b.`PMI_NO` where DATE(a.appointment_date) = DATE(NOW() - INTERVAL 1 DAY) and a.status ='active' and hfc_cd='" + hfc + "'";
            break; // optional

        case "30":
            // 30 days behind
            sql = "select a.pmi_no,a.appointment_date,a.start_time,a.appointment_type,b.PATIENT_NAME,b.NEW_IC_NO,b.OLD_IC_NO,b.ID_TYPE,b.ID_NO from pms_appointment a inner join pms_patient_biodata b on a.pmi_no = b.`PMI_NO` where (DATE(a.appointment_date) between SUBDATE(CURDATE(),30) and CURDATE() ) and a.status ='active' and hfc_cd='" + hfc + "'";

            break; // optional

        case "60":
            // 60 days behind
            sql = "select a.pmi_no,a.appointment_date,a.start_time,a.appointment_type,b.PATIENT_NAME,b.NEW_IC_NO,b.OLD_IC_NO,b.ID_TYPE,b.ID_NO from pms_appointment a inner join pms_patient_biodata b on a.pmi_no = b.`PMI_NO` where (DATE(a.appointment_date) between SUBDATE(CURDATE(),60) and CURDATE() ) and a.status ='active' and hfc_cd='" + hfc + "'";
            break; // optional   

        case "custom":
            // Statements
            sql = "select a.pmi_no,a.appointment_date,a.start_time,a.appointment_type,b.PATIENT_NAME,b.NEW_IC_NO,b.OLD_IC_NO,b.ID_TYPE,b.ID_NO from pms_appointment a inner join pms_patient_biodata b on a.pmi_no = b.`PMI_NO` where (DATE(a.appointment_date) between STR_TO_DATE('" + fromDate + "','%d/%m/%Y') and STR_TO_DATE('" + toDate + "','%d/%m/%Y') ) and a.status ='active' and hfc_cd='" + hfc + "'";

            break; // optional

        case "001":
            // PMI
            sql = "select a.pmi_no,a.appointment_date,a.start_time,a.appointment_type,b.PATIENT_NAME,b.NEW_IC_NO,b.OLD_IC_NO,b.ID_TYPE,b.ID_NO from pms_appointment a inner join pms_patient_biodata b on a.pmi_no = b.`PMI_NO` where a.pmi_no = '" + idInput + "' and status ='active' and hfc_cd='" + hfc + "'";
            break; // optional   

        case "002":
            // IC NEW
            sql = "select a.pmi_no,a.appointment_date,a.start_time,a.appointment_type,b.PATIENT_NAME,b.NEW_IC_NO,b.OLD_IC_NO,b.ID_TYPE,b.ID_NO from pms_appointment a inner join pms_patient_biodata b on a.pmi_no = b.`PMI_NO` where a.pmi_no = (select pmi_no from pms_patient_biodata where new_ic_no='" + idInput + "') and status ='active' and hfc_cd='" + hfc + "'";
            break; // optional 

        case "003":
            // IC OLD
            sql = "select a.pmi_no,a.appointment_date,a.start_time,a.appointment_type,b.PATIENT_NAME,b.NEW_IC_NO,b.OLD_IC_NO,b.ID_TYPE,b.ID_NO from pms_appointment a inner join pms_patient_biodata b on a.pmi_no = b.`PMI_NO` where a.pmi_no = (select pmi_no from pms_patient_biodata where old_ic_no='" + idInput + "') and status ='active' and hfc_cd='" + hfc + "'";
            break; // optional   

        case "004":
            // MATRIC
            sql = otherSQL;
            break; // optional

        case "005":
            // STAFF
            sql = otherSQL;
            break; // optional

        case "006":
            // POLICE ID
            sql = otherSQL;
            break; // optional

        case "007":
            // MILITARY
            sql = otherSQL;
            break; // optional 

        case "008":
            // PASSPORT
            sql = otherSQL;
            break; // optional

        case "009":
            // OTHERS
            sql = otherSQL;
            break; // optional 

        case "ID No":
            // ID NO
            sql = otherSQL;
            break; // optional 

    }

    ArrayList<ArrayList<String>> dataAppointment;
    dataAppointment = conn.getData(sql);
    //out.print(hfc);
    if (dataAppointment.size() > 0) {

%>
<form role="form" id="formAppointmentSaya" method="post">
    <table class="table table-filter table-striped" style="background: #fff; border: 1px solid #ccc;" id="listAppointment">
        <thead>
        <th>PMI No.</th>
        <th>Name</th>
        <th>Appointment Date</th>
        <th>Appointment Time</th>
        <th>Appointment Type</th>
        <th>Action</th>
        </thead>
        <tbody>
            <%        for (int i = 0; i < dataAppointment.size(); i++) {
                    String dateApp = dataAppointment.get(i).get(1);
                    String timeApp = dataAppointment.get(i).get(2);
                    String splittedDate = StringUtils.substring(dateApp, 0, 10);
                    String splittedTime = StringUtils.substring(dateApp, 10, 21);
            %>
            <tr>
                <td><%=dataAppointment.get(i).get(0)%> 
                    <input id="appval" type="hidden" value="<%=StringUtils.join(dataAppointment.get(i), "|")%>"></td>
                <td><%=dataAppointment.get(i).get(4)%></td>
                <td><%=splittedDate%></td>
                <td><%=splittedTime%></td>
                <td><%=dataAppointment.get(i).get(3)%></td>
                <td><button id="APPedit" name="APPedit" class="btn btn-link" type="button" data-dismiss="modal" role="button"><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></button></td>                                
            </tr>
            <% }
            } else {
            %>
        <table class="table table-filter table-striped" style="background: #fff; border: 1px solid #ccc;" id="listAppointment">
            <thead>
            <th>PMI No.</th>
            <th>Name</th>
            <th>Appointment Date</th>
            <th>Appointment Time</th>
            <th>Appointment Type</th>
            <th>Action</th>
            </thead>
            <tbody>

                <tr>
                    <td colspan="6" align="center">No record was found</td>
                </tr>
                <%
                    }
                %>

            </tbody>
        </table>
</form>