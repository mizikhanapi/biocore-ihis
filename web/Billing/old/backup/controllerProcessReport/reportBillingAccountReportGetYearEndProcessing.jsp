<%-- 
    Document   : reportBillingAccountReportGetYearEndProcessing
    Created on : Nov 29, 2017, 1:12:02 AM
    Author     : Shammugam
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<!DOCTYPE html>
<%
    Conn conn = new Conn();

    String userId = session.getAttribute("USER_ID").toString();
    String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis_cd = session.getAttribute("DISCIPLINE_CODE").toString();
    String sub_cd = session.getAttribute("SUB_DISCIPLINE_CODE").toString();

    String sql = "SELECT pb.patient_name, cl.customer_id, IFNULL(cl.dr_amt_13, 0), IFNULL(cl.cr_amt_13,0) "
            + " FROM pms_patient_biodata pb "
            + " LEFT JOIN far_customer_ledger cl ON (cl.customer_id = pb.PMI_NO) "
            + " WHERE cl.customer_id = pb.pmi_no AND cl.hfc_cd = '" + hfc_cd + "' ";

    ArrayList<ArrayList<String>> data = conn.getData(sql);

    if (data.isEmpty()) {

        String infoMessage = "There is no year end processing has been done before.";
        out.print("-|-1|" + infoMessage);

    } else {

        out.print("-|1|");

    }
%>