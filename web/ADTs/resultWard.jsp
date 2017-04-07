<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="dBConn.Conn"%>
<%@page import="Config.Config"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%
    String idWard = request.getParameter("idWard");
//    String idInput = request.getParameter("idInput");
    Config.getBase_url(request);
    Config.getFile_url(session);
    Conn conn = new Conn();

    //String systemParam = "select * from system_param";
    //ArrayList<ArrayList<String>> systemParams = connect.getData(systemParam);
    //String status = systemParams.get(0).get(2);
    //if status = 1,select from table pms_patient_biodata and special_intergration_information
    // status 0 = public
    // status 1 = universiti
    // status bole dapat kat session
//    String status = session.getAttribute("SYSTEMSTAT").toString();
    String searchWard = "";

    searchWard = "select ward_id from wis_inpatient_episode where ward_id ='" + idWard + "'";


    ArrayList<ArrayList<String>> search = conn.getData(searchWard);
    if (search.size() > 0) {
        ArrayList<String> search1 = search.get(0);
        String newVal = StringUtils.join(search1, "|");
%>
<%out.print(newVal);%>
<%
    }


%>   