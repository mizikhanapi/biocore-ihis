<%-- 
    Document   : patientOrderListNewOrderSearchResult
    Created on : Apr 28, 2017, 2:54:21 AM
    Author     : Shammugam
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    //String key = request.getParameter("input");
    String id = request.getParameter("id");
    String HEALTH_FACILITY_CODE = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    String DISCIPLINE_CODE = (String) session.getAttribute("DISCIPLINE_CODE");

    Conn conn = new Conn();

    //id.toLowerCase();
    String searchProblem = "select mdc.ud_mdc_code,mdc.d_gnr_name,mdc.d_stock_qty,IFNULL(lRoute.Description,'-'),IFNULL(lForm.Description,'-'),IFNULL(mdc.d_strength,'-'),IFNULL(lInstruc.Description,'-'),IFNULL(mdc.d_caution_code,'-'),IFNULL(mdc.d_packaging,'-') "
            + " from pis_mdc2 mdc "
            + " left join adm_lookup_detail lRoute on (mdc.d_route_code = lRoute.Detail_Reference_code) AND lRoute.master_reference_code = '0066' AND lRoute.hfc_cd = '"+HEALTH_FACILITY_CODE+"' "
            + " left join adm_lookup_detail lForm on (mdc.d_form_code = lForm.Detail_Reference_code) AND lForm.master_reference_code = '0067' AND lForm.hfc_cd = '"+HEALTH_FACILITY_CODE+"' "
            + " left join adm_lookup_detail lInstruc on (mdc.d_advisory_code = lInstruc.Detail_Reference_code) AND lInstruc.master_reference_code = '0087' AND lInstruc.hfc_cd = '"+HEALTH_FACILITY_CODE+"' "
            + " where mdc.d_trade_name = '" + id + "' AND mdc.hfc_cd = '"+HEALTH_FACILITY_CODE+"' AND mdc.discipline_cd = '"+DISCIPLINE_CODE+"' ";
    ArrayList<ArrayList<String>> search = conn.getData(searchProblem);
    if (search.size() > 0) {

        for (int i = 0; i < search.size(); i++) {

//            out.println(search.get(i).get(0));
//            out.println(search.get(i).get(1));
//            out.println(search.get(i).get(2));
            out.print(String.join("|", search.get(i)));
        }
    }
%>                           

