<%-- 
    Document   : reportBillingValidateCustomerIC
    Created on : Nov 28, 2017, 12:51:35 PM
    Author     : Shammugam
--%>

<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

    String ic = request.getParameter("ic");

    Conn conn = new Conn();

    String userId = session.getAttribute("USER_ID").toString();
    String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis_cd = session.getAttribute("DISCIPLINE_CODE").toString();
    String sub_cd = session.getAttribute("SUB_DISCIPLINE_CODE").toString();

    String sqlValidateIC = " SELECT cl.customer_id  "
            + " FROM pms_patient_biodata pb "
            + " LEFT JOIN far_customer_ledger cl "
            + " ON (cl.customer_id = pb.PMI_NO) "
            + " WHERE pb.new_ic_no = '" + ic + "' "
            + " AND cl.hfc_cd = '" + hfc_cd + "' ";

    ArrayList<ArrayList<String>> dataPatient = conn.getData(sqlValidateIC);

    if (dataPatient.isEmpty()) {

        String infoMessage = "Record not found.\nPlease recheck the IC";
        out.print("-|-1|" + infoMessage);

    } else {

        out.print("-|1|");

    }

%>