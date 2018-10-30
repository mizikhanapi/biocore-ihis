<%-- 
    Document   : getItemtype
    Created on : Oct 30, 2018, 6:34:49 PM
    Author     : shay
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    String hfc = request.getParameter("hfc");
    String dis = request.getParameter("dis");
    String sub = request.getParameter("sub");
    String orderno = request.getParameter("orderno");
    
    Conn conn = new Conn();
    
    String selectdis = "SELECT item_type FROM stk_order_master WHERE hfc_cd = '"+hfc+"' AND order_no = '"+orderno+"'";

    
ArrayList<ArrayList<String>> datadis;
datadis = conn.getData(selectdis);
String result = "";

if(datadis.size() > 0){
    result = datadis.get(0).get(0);
    out.print(result);
}else{
    out.print("nope");
    //out.print(selectdis);
}


%>