<%-- 
    Document   : getImage
    Created on : Apr 20, 2018, 12:11:02 PM
    Author     : user
--%>

<%@page import="org.json.JSONObject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String type = request.getParameter("type");
    Conn con = new Conn();
    String jSrc = "";
    boolean haveImage = false;
    String query="";

    if ("RIS".equals(type)) {

        String pmi_no = request.getParameter("pmi_no");
        String hfc_cd = request.getParameter("hfc_cd");
        String encounter_date = request.getParameter("encounter_date");
        String code = request.getParameter("code");

        try {
            code = code.trim();
        } catch (Exception e) {

        }

        query = "Select ifnull(convert(rd.result_image using utf8), '') from ris_result_detail rd "
                + "JOIN ris_order_master om ON om.order_no=rd.order_no "
                + "WHERE om.pmi_no='" + pmi_no + "' AND om.hfc_to='" + hfc_cd + "' AND om.encounter_date='" + encounter_date + "' AND rd.procedure_cd='" + code + "';";
        ArrayList<ArrayList<String>> img = con.getData(query);

        if (img.size() > 0) {
            if (!"".equals(img.get(0).get(0))) {
                jSrc = img.get(0).get(0);
                haveImage = true;
            }
        }
    } else if ("LIS".equals(type)) {
        
        String code = request.getParameter("code");

        query = "Select ifnull(convert(picture using utf8), '') from lis_result where result_no = '" + code + "'";

        ArrayList<ArrayList<String>> img = con.getData(query);
        
        if (img.size() > 0) {
            if (!"".equals(img.get(0).get(0))) {
                jSrc = img.get(0).get(0);
                haveImage = true;
            }
        }
    
    } else if("OPT".equals(type)){
        String code = request.getParameter("code");
        String hfc_cd = request.getParameter("hfc_cd");
        String order_no = request.getParameter("order_no");
        String pmi_no = request.getParameter("pmi_no");
        
        query = "Select ifnull(convert(image using utf8), '') FROM opt_result "
                + "WHERE `pmiNo`='"+pmi_no+"' AND hfc_cd='"+hfc_cd+"' AND order_no='"+order_no+"' AND procedure_cd='"+code+"';";
        
        ArrayList<ArrayList<String>> img = con.getData(query);
        
        if (img.size() > 0) {
            if (!"".equals(img.get(0).get(0))) {
                jSrc = img.get(0).get(0);
                haveImage = true;
            }
        }
    }

    JSONObject json = new JSONObject();
    json.put("src", jSrc);
    json.put("haveImage", haveImage);
    json.put("query", query);

    out.print(json.toString());
%>
