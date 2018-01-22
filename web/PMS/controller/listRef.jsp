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
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String sql = "";
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
    ArrayList<ArrayList<String>> dataAppointment;
    dataAppointment = conn.getData(sql);
    //out.print(hfc);
    if (dataAppointment.size() > 0) {

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
        out.print("<tr><td colspan='5' align='center'>NO RECORD FOUND!</td></tr>");
    }

%>
