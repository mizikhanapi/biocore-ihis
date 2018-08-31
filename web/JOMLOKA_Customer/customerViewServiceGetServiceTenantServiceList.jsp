<%-- 
    Document   : customerViewServiceGetServiceTenantServiceList
    Created on : Aug 29, 2018, 5:25:21 PM
    Author     : Shammugam
--%>

<%@page import="org.json.JSONArray"%>
<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.JSONObject"%>

<%

    // Getting Parameter
    String tenant_cd = request.getParameter("tenant_cd");
    String tenant_type = request.getParameter("tenant_type");

    // Connection 
    Conn conn = new Conn();

    // Status To Get As Return
    final String NO_DATA = "No Data";
    final String GOT_DATA = "Got Data";
    String status = "";

    //                                      0               1                       2                       3                           4                      
    String sqlGetService = " SELECT medmas.tenant_cd, medmas.tenant_type, medicser.service_type, medicref.service_name, medicser.service_fees, "
            //          5                   6                       7
            + " service_deposit, medicser.service_commission, medicser.service_tax  "
            // FROM SQL
            + " FROM jlk_medic_master medmas "
            // JOIN JLK MEDIC SERVICE TYPE SQL
            + " JOIN jlk_medic_service_type medicser ON (medmas.tenant_cd = medicser.tenant_cd) "
            // JOIN JLK MEDIC SERVICE TYPE REF SQL
            + " JOIN jlk_medic_service_type_ref medicref ON (medicref.service_type = medicser.service_type) "
            // WHERE CONDITION
            + " WHERE medmas.tenant_cd = '" + tenant_cd + "' AND medmas.tenant_type = '" + tenant_type + "' ";

    // Return Object With Required Detail
    JSONObject objMain = new JSONObject();
    JSONArray serviceList = new JSONArray();

    ArrayList<ArrayList<String>> dataService = conn.getData(sqlGetService);

    int sizeService = dataService.size();

    if (sizeService > 0) {

        // Set Status
        status = GOT_DATA;

        for (int i = 0; i < sizeService; i++) {

            JSONObject objSmall = new JSONObject();

            objSmall.put("tenant_code", dataService.get(i).get(0));
            objSmall.put("tenant_type", dataService.get(i).get(1));
            objSmall.put("service_type", dataService.get(i).get(2));
            objSmall.put("service_name", dataService.get(i).get(3));
            objSmall.put("service_fee", dataService.get(i).get(4));
            objSmall.put("service_deposit", dataService.get(i).get(5));
            objSmall.put("service_comission", dataService.get(i).get(6));
            objSmall.put("service_tax", dataService.get(i).get(7));

            serviceList.put(objSmall);

        }

    } else {

        status = NO_DATA;

    }

    objMain.put("message", status);
    objMain.put("dataJSONService", serviceList);
    objMain.put("total_service", sizeService);

    out.print(objMain);


%>