<%-- 
    Document   : customerViewServiceGetServiceTenantList
    Created on : Aug 29, 2018, 5:25:01 PM
    Author     : Shammugam
--%>

<%@page import="org.json.JSONArray"%>
<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.JSONObject"%>

<%

    // Getting Parameter
    String service_type = request.getParameter("service_type");
    String service_state = request.getParameter("service_state");
    String service_district = request.getParameter("service_district");
    String service_filter = request.getParameter("service_filter");

    // Connection 
    Conn conn = new Conn();

    // Status To Get As Return
    final String NO_DATA = "No Data";
    final String GOT_DATA = "Got Data";
    String status = "";

    //                                  0              1              2               3             4               5               6               7    
    String sqlGetService = " SELECT admt.tnt_cd, admt.tnt_type, admt.tnt_name, admt.address1, admt.address2, admt.district_cd, admt.state_cd, admt.postcode, "
            //          8           9           10              11                      12                   13                14               15
            + " admt.country_cd, admt.email, admt.user_id, admtt.tenant_type, districtcd.Description, statecd.Description, admt.logo, countrycd.Description "
            // FROM SQL
            + " FROM adm_tenant admt "
            // JOIN ADM TENANT TYPE SQL
            + " JOIN adm_tenant_type admtt ON (admt.tnt_cd = admtt.tenant_cd) "
            // JOIN LOOKUP DISTRICT SQL
            + " JOIN adm_lookup_detail districtcd ON ((admt.district_cd = districtcd.Detail_Reference_code) AND districtcd.`Master_Reference_code` = '0078' AND districtcd.hfc_cd = '99_iHIS_99') "
            // JOIN LOOKUP STATE SQL
            + " JOIN adm_lookup_detail statecd ON ((admt.state_cd = statecd.Detail_Reference_code) AND statecd.`Master_Reference_code` = '0002' AND statecd.hfc_cd = '99_iHIS_99') "
            // JOIN LOOKUP COUNTRY SQL
            + " JOIN adm_lookup_detail countrycd ON ((admt.country_cd = countrycd.Detail_Reference_code) AND countrycd.`Master_Reference_code` = '0001' AND countrycd.hfc_cd = '99_iHIS_99') "
            // WHERE CONDITION
            + " WHERE admtt.tenant_type = '" + service_type + "' AND admt.district_cd = '" + service_district + "' "
            + " AND admt.state_cd = '" + service_state + "' AND (admt.tnt_name like '%" + service_filter + "%') ";

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
            objSmall.put("tenant_tpy", dataService.get(i).get(1));
            objSmall.put("tenant_name", dataService.get(i).get(2));
            objSmall.put("tenant_add1", dataService.get(i).get(3));
            objSmall.put("tenant_add2", dataService.get(i).get(4));
            objSmall.put("tenant_district_cd", dataService.get(i).get(5));
            objSmall.put("tenant_district_name", dataService.get(i).get(12));
            objSmall.put("tenant_state_cd", dataService.get(i).get(6));
            objSmall.put("tenant_state_name", dataService.get(i).get(13));
            objSmall.put("tenant_country_cd", dataService.get(i).get(8));
            objSmall.put("tenant_country_name", dataService.get(i).get(15));
            objSmall.put("tenant_postcode", dataService.get(i).get(7));
            objSmall.put("tenant_email", dataService.get(i).get(9));
            objSmall.put("tenant_userid", dataService.get(i).get(10));
            objSmall.put("tenant_type", dataService.get(i).get(11));
            objSmall.put("tenant_logo", dataService.get(i).get(14));

            serviceList.put(objSmall);

        }

    } else {

        status = NO_DATA;

    }

    objMain.put("message", status);
    objMain.put("dataJSONTenant", serviceList);
    objMain.put("total_tenant", sizeService);

    out.print(objMain);


%>