<%-- 
    Document   : searchHFC_cd
    Created on : 17-Feb-2017, 19:13:52
    Author     : ahmed
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn Conn = new Conn();
//    String dis = request.getParameter("discipline_cd");
//    String sub = request.getParameter("subdis_cd");
    String dis = request.getParameter("discipline_cd");
    String sub = request.getParameter("subdis_cd");
    String desc = "NA";

    String searchDis = "select Description from adm_lookup_detail where Master_Reference_Code = '0072' AND Detail_Reference_code = '"+dis+"' ";
    ArrayList<ArrayList<String>> searchDisData = Conn.getData(searchDis);
    
    String searchSub = "select Description from adm_lookup_detail where Master_Reference_Code = '0071' AND Detail_Reference_code = '"+sub+"' ";
    ArrayList<ArrayList<String>> searchSubData = Conn.getData(searchSub);
   // out.print(searchProblem);
    if (searchDisData.size() > 0) {
        if(searchSubData.size() > 0){
            desc = searchDisData.get(0).get(0) + "|" + searchSubData.get(0).get(0);
            out.print(desc);
        }else{
             desc = searchDisData.get(0).get(0) + "|-" ;
             out.print(desc);
        }
    }
    

%>        