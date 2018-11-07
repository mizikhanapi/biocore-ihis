<%-- 
    Document   : getHFCname
    Created on : Oct 30, 2018, 6:05:31 PM
    Author     : shay
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    String hfc = request.getParameter("hfc");
    String dis = request.getParameter("dis");
    String sub = request.getParameter("sub");
    
    Conn conn = new Conn();
    
    String selectdis = "SELECT discipline_name FROM adm_discipline WHERE discipline_hfc_cd = '"+hfc+"' AND discipline_cd ='"+dis+"'";
    String selectsub = "SELECT subdiscipline_name FROM adm_subdiscipline WHERE subdiscipline_hfc_cd = '"+hfc+"' AND discipline_cd ='"+dis+"' AND"
            + " subdiscipline_cd = '"+sub+"'";
    String selectHFC = "SELECT hfc_name FROM adm_health_facility WHERE hfc_cd = '"+hfc+"'";
    
ArrayList<ArrayList<String>> datadis,datasub,datahfc;
datadis = conn.getData(selectdis);
datasub = conn.getData(selectsub);
datahfc = conn.getData(selectHFC);
String result = "";
if(datadis.size() > 0 && datasub.size() > 0 && datahfc.size() > 0){
    result = datahfc.get(0).get(0) + "|" + datadis.get(0).get(0)+"|"+datasub.get(0).get(0);
    out.print(result);
}else{
    out.print("nope");
}


%>
