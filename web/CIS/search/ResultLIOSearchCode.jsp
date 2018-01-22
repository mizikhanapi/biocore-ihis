<%-- 
    Document   : getProcedureCode
    Created on : 02-Feb-2017, 15:00:50
    Author     : ahmed
--%>

<%@page import="ADM_helper.MySessionKey"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
     Conn Conn = new Conn();
    //String key = request.getParameter("input");
    String hfc_cd = (String) session.getAttribute(MySessionKey.HFC_CD);
    String id = request.getParameter("code");
    
    id.toLowerCase();
    //                                 0       1        2          3            4        5          6       
    String searchProblem = "select item_cd,item_name,test_cat,spe_source,spe_container,volume, ifnull(special_inst, '-') from lis_item_detail where hfc_cd='"+hfc_cd+"' AND CONCAT(UPPER(item_cd),LOWER(item_cd)) like '%" + id + "%' ";
    ArrayList<ArrayList<String>> search = Conn.getData(searchProblem);
   
    if (search.size() > 0) {

        for (int i = 0; i < search.size(); i++) {

            out.print(String.join("|", search.get(i)));
        }
    }
%>                           

