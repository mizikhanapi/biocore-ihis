<%-- 
    Document   : getDetailFlexList
    Created on : Apr 13, 2018, 11:04:42 AM
    Author     : user
--%>

<%@page import="ADM_helper.MySessionKey"%>
<%@page import="Config.Config"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ADM_helper.LookupHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String master_cd = "0012";
    String key = "";
    String nation = request.getParameter("nation");

    nation = nation.toLowerCase();

    String hfc_cd = (String) session.getAttribute(MySessionKey.HFC_CD);
    String dataSystemStatus = (String) session.getAttribute("SYSTEM_PARAMETER");

    LookupHelper lh = new LookupHelper(hfc_cd);
    ArrayList<ArrayList<String>> data = lh.getListOfDetailCodeNameFlex(master_cd, key);

    for (int i = data.size() - 1; i >= 0; i--) {
        if ("001".equalsIgnoreCase(data.get(i).get(0)) || "ID No".equalsIgnoreCase(data.get(i).get(0))) {
            data.remove(i);
        }
    }

    if ("0".equalsIgnoreCase(dataSystemStatus)) {
        for (int i = data.size() - 1; i >= 0; i--) {
            if ("004".equalsIgnoreCase(data.get(i).get(0)) || "005".equalsIgnoreCase(data.get(i).get(0))) {
                data.remove(i);
            }
        }
    }

    if (nation.contains("malaysia")) {
        for (int i = data.size() - 1; i >= 0; i--) {
            if ("008".equalsIgnoreCase(data.get(i).get(0)) || "009".equalsIgnoreCase(data.get(i).get(0))) {
                data.remove(i);
            }
        }
    } else {
        for (int i = data.size() - 1; i >= 0; i--) {
            if (!"008".equalsIgnoreCase(data.get(i).get(0)) && !"009".equalsIgnoreCase(data.get(i).get(0)) 
                    && !"004".equalsIgnoreCase(data.get(i).get(0)) && !"005".equalsIgnoreCase(data.get(i).get(0))) {
                data.remove(i);
            }
        }
    }

    JSONArray jsonArr = new JSONArray();

    for (ArrayList<String> temp : data) {
        JSONObject obj = new JSONObject();
        obj.put("value", temp.get(0));
        obj.put("name", temp.get(1));
        jsonArr.put(obj);
    }

    out.print(jsonArr.toString());

%>
