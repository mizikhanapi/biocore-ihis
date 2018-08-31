<%-- 
    Document   : customerViewServiceGetStateDistrict
    Created on : Aug 24, 2018, 3:37:04 PM
    Author     : Shammugam
--%>

<%@page import="org.json.JSONArray"%>
<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.JSONObject"%>

<%

    // Connection 
    Conn conn = new Conn();

    // Status To Get As Return
    final String NO_DATA = "No Data";
    final String GOT_DATA = "Got Data";
    String status = "";

    //                              0                       1                       2        3    
    String sqlState = " SELECT master_reference_code, detail_reference_code, description, status  "
            // JOIN SQL
            + " FROM adm_lookup_detail "
            // WHERE CONDITION
            + " WHERE hfc_cd = '99_iHIS_99' AND master_reference_code = '0002' ";

    //                              0                       1                       2           3    
    String sqlDistrict = " SELECT master_reference_code, detail_reference_code, description, status "
            // JOIN SQL
            + " FROM adm_lookup_detail "
            // WHERE CONDITION
            + " WHERE hfc_cd = '99_iHIS_99' AND master_reference_code = '0078' ";

    // Return Object With Required Detail
    JSONObject objMain = new JSONObject();
    JSONArray stateList = new JSONArray();
    JSONArray districtList = new JSONArray();

    ArrayList<ArrayList<String>> dataState = conn.getData(sqlState);
    ArrayList<ArrayList<String>> dataDistrict = conn.getData(sqlDistrict);

    int sizeState = dataState.size();
    int sizeDistrict = dataDistrict.size();

    if (sizeState > 0 && sizeDistrict > 0) {

        // Set Status
        status = GOT_DATA;

        for (int i = 0; i < sizeState; i++) {

            JSONObject objSmall = new JSONObject();

            objSmall.put("master_code", dataState.get(i).get(0));
            objSmall.put("detail_code", dataState.get(i).get(1));
            objSmall.put("description", dataState.get(i).get(2));
            objSmall.put("status", dataState.get(i).get(3));

            stateList.put(objSmall);

        }

        for (int i = 0; i < sizeDistrict; i++) {

            JSONObject objSmall = new JSONObject();

            objSmall.put("master_code", dataDistrict.get(i).get(0));
            objSmall.put("detail_code", dataDistrict.get(i).get(1));
            objSmall.put("description", dataDistrict.get(i).get(2));
            objSmall.put("status", dataDistrict.get(i).get(3));

            districtList.put(objSmall);

        }

    } else {

        status = NO_DATA;

    }

    objMain.put("message", status);
    objMain.put("dataJSONState", stateList);
    objMain.put("dataJSONDistrict", districtList);
    objMain.put("total_state", sizeState);
    objMain.put("total_district", sizeDistrict);

    out.print(objMain);


%>