<%-- 
    Document   : listRef
    Created on : Jan 22, 2018, 6:21:55 PM
    Author     : user
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
    String otherSQL = "select om.pmi_no, b.PATIENT_NAME, b.NEW_IC_NO, hfc.hfc_name "
                + "from pms_order_master om "
                + "join pms_patient_biodata b on om.pmi_no = b.`PMI_NO` "
                + "join adm_health_facility hfc on om.ordering_hfc_cd=hfc.hfc_cd "
                + "where b.`ID_NO` = '" + idInput + "' and om.hfc_cd='" + hfc + "' "
                + "group by om.hfc_cd, om.pmi_no;";
    
    switch (idType) {
        case "today":
            // todays
            sql = "select om.pmi_no, b.PATIENT_NAME, b.NEW_IC_NO, hfc.hfc_name from pms_order_master om join pms_patient_biodata b on om.pmi_no = b.`PMI_NO` join adm_health_facility hfc on om.ordering_hfc_cd=hfc.hfc_cd where DATE(om.order_date) = CURDATE() and om.hfc_cd='04010101' group by om.hfc_cd, om.pmi_no";
            break; // optional

        case "yesterday":
            // yesterday
            sql = "select om.pmi_no, b.PATIENT_NAME, b.NEW_IC_NO, hfc.hfc_name from pms_order_master om join pms_patient_biodata b on om.pmi_no = b.`PMI_NO` join adm_health_facility hfc on om.ordering_hfc_cd=hfc.hfc_cd where DATE(om.order_date) = (DATE(NOW() - INTERVAL 1 DAY)) and om.hfc_cd='" + hfc + "' group by om.hfc_cd, om.pmi_no";
            break; // optional
            
        case "7":
            // 30 days behind
            sql = "select om.pmi_no, b.PATIENT_NAME, b.NEW_IC_NO, hfc.hfc_name from pms_order_master om join pms_patient_biodata b on om.pmi_no = b.`PMI_NO` join adm_health_facility hfc on om.ordering_hfc_cd=hfc.hfc_cd where (DATE(om.order_date) between SUBDATE(CURDATE(),7) and CURDATE()) and om.hfc_cd='" + hfc + "' group by om.hfc_cd, om.pmi_no";

            break; // optional
            
        case "30":
            // 30 days behind
            sql = "select om.pmi_no, b.PATIENT_NAME, b.NEW_IC_NO, hfc.hfc_name from pms_order_master om join pms_patient_biodata b on om.pmi_no = b.`PMI_NO` join adm_health_facility hfc on om.ordering_hfc_cd=hfc.hfc_cd where (DATE(om.order_date) between SUBDATE(CURDATE(),30) and CURDATE()) and om.hfc_cd='" + hfc + "' group by om.hfc_cd, om.pmi_no";

            break; // optional

        case "60":
            // 60 days behind
            sql = "select om.pmi_no, b.PATIENT_NAME, b.NEW_IC_NO, hfc.hfc_name from pms_order_master om join pms_patient_biodata b on om.pmi_no = b.`PMI_NO` join adm_health_facility hfc on om.ordering_hfc_cd=hfc.hfc_cd where (DATE(om.order_date) between SUBDATE(CURDATE(),60) and CURDATE()) and om.hfc_cd='" + hfc + "' group by om.hfc_cd, om.pmi_no";

            break; // optional   

        case "custom":
            // Statements
            sql = "select om.pmi_no, b.PATIENT_NAME, b.NEW_IC_NO, hfc.hfc_name from pms_order_master om join pms_patient_biodata b on om.pmi_no = b.`PMI_NO` join adm_health_facility hfc on om.ordering_hfc_cd=hfc.hfc_cd where (DATE(om.order_date) between STR_TO_DATE('" + fromDate + "','%d/%m/%Y') and STR_TO_DATE('" + toDate + "','%d/%m/%Y')) and om.hfc_cd='" + hfc + "' group by om.hfc_cd, om.pmi_no";

            break; // optional

        case "001":
            // PMI
            sql = "select om.pmi_no, b.PATIENT_NAME, b.NEW_IC_NO, hfc.hfc_name "
                + "from pms_order_master om "
                + "join pms_patient_biodata b on om.pmi_no = b.`PMI_NO` "
                + "join adm_health_facility hfc on om.ordering_hfc_cd=hfc.hfc_cd "
                + "where b.pmi_no = '" + idInput + "' and om.hfc_cd='" + hfc + "' "
                + "group by om.hfc_cd, om.pmi_no;";
            break; // optional   

        case "002":
            // IC NEW
            sql = "select om.pmi_no, b.PATIENT_NAME, b.NEW_IC_NO, hfc.hfc_name "
                + "from pms_order_master om "
                + "join pms_patient_biodata b on om.pmi_no = b.`PMI_NO` "
                + "join adm_health_facility hfc on om.ordering_hfc_cd=hfc.hfc_cd "
                + "where b.`NEW_IC_NO` = '" + idInput + "' and om.hfc_cd='" + hfc + "' "
                + "group by om.hfc_cd, om.pmi_no;";
            break; // optional 

        case "003":
            // IC OLD
            sql = "select om.pmi_no, b.PATIENT_NAME, b.NEW_IC_NO, hfc.hfc_name "
                + "from pms_order_master om "
                + "join pms_patient_biodata b on om.pmi_no = b.`PMI_NO` "
                + "join adm_health_facility hfc on om.ordering_hfc_cd=hfc.hfc_cd "
                + "where b.`OLD_IC_NO` = '" + idInput + "' and om.hfc_cd='" + hfc + "' "
                + "group by om.hfc_cd, om.pmi_no;";
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
    
    
    
    
   /* 
    if (idType.isEmpty() && idInput.isEmpty()) {
        sql = "select om.pmi_no, b.PATIENT_NAME, b.NEW_IC_NO, hfc.hfc_name "
                + "from pms_order_master om "
                + "join pms_patient_biodata b on om.pmi_no = b.`PMI_NO` "
                + "join adm_health_facility hfc on om.ordering_hfc_cd=hfc.hfc_cd "
                + "where date(om.order_date) = date(now()) and om.hfc_cd='" + hfc + "' "
                + "group by om.hfc_cd, om.pmi_no;";

    } else if (idType.equals("001")) {
        sql = "select om.pmi_no, b.PATIENT_NAME, b.NEW_IC_NO, hfc.hfc_name "
                + "from pms_order_master om "
                + "join pms_patient_biodata b on om.pmi_no = b.`PMI_NO` "
                + "join adm_health_facility hfc on om.ordering_hfc_cd=hfc.hfc_cd "
                + "where b.pmi_no = '" + idInput + "' and om.hfc_cd='" + hfc + "' "
                + "group by om.hfc_cd, om.pmi_no;";

    } else if (idType.equals("002")) {
        sql = "select om.pmi_no, b.PATIENT_NAME, b.NEW_IC_NO, hfc.hfc_name "
                + "from pms_order_master om "
                + "join pms_patient_biodata b on om.pmi_no = b.`PMI_NO` "
                + "join adm_health_facility hfc on om.ordering_hfc_cd=hfc.hfc_cd "
                + "where b.`NEW_IC_NO` = '" + idInput + "' and om.hfc_cd='" + hfc + "' "
                + "group by om.hfc_cd, om.pmi_no;";

    } else if (idType.equals("003")) {
        sql = "select om.pmi_no, b.PATIENT_NAME, b.NEW_IC_NO, hfc.hfc_name "
                + "from pms_order_master om "
                + "join pms_patient_biodata b on om.pmi_no = b.`PMI_NO` "
                + "join adm_health_facility hfc on om.ordering_hfc_cd=hfc.hfc_cd "
                + "where b.`OLD_IC_NO` = '" + idInput + "' and om.hfc_cd='" + hfc + "' "
                + "group by om.hfc_cd, om.pmi_no;";

    } else {
        sql = "select om.pmi_no, b.PATIENT_NAME, b.NEW_IC_NO, hfc.hfc_name "
                + "from pms_order_master om "
                + "join pms_patient_biodata b on om.pmi_no = b.`PMI_NO` "
                + "join adm_health_facility hfc on om.ordering_hfc_cd=hfc.hfc_cd "
                + "where b.`ID_NO` = '" + idInput + "' and om.hfc_cd='" + hfc + "' "
                + "group by om.hfc_cd, om.pmi_no;";

    }
*/
    
    ArrayList<ArrayList<String>> dataAppointment;
    dataAppointment = conn.getData(sql);

%>
<form role="form" id="formRefointmentSaya" method="post">
    <table class="table table-filter table-striped" style="background: #fff; border: 1px solid #ccc;" id="listReferralTbl">
        <thead>
            <tr>
                <th>PMI No.</th>
                <th>Name</th>
                <th>New IC No</th>
                <th>Referred From</th>
                <th>Action</th>
            </tr>
        </thead>

        <tbody id="listReferralTblBody">
            <%   if (dataAppointment.size() > 0) {

                    for (int i = 0; i < dataAppointment.size(); i++) {

            %>
            <tr>
                <td><%=dataAppointment.get(i).get(0)%></td>
                <td><%=dataAppointment.get(i).get(1)%></td>
                <td><%=dataAppointment.get(i).get(2)%></td>
                <td><%=dataAppointment.get(i).get(3)%></td>
                <td>
                    <button id="ref_btnEdit" class="btn btn-default" type="button" data-dismiss="modal" role="button"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></button>
                    <input id="ref_hidden" type="hidden" value="<%=StringUtils.join(dataAppointment.get(i), "|")%>">
                </td>                                
            </tr>
            <%        }//end for
                } else {
                    out.print("<tr><td colspan='5' align='center'>No record was found<td></tr>");
                }

            %>
        </tbody>

    </table>
</form>