<%-- 
    Document   : getImage
    Created on : Jan 30, 2018, 3:55:27 PM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="jdk.nashorn.internal.runtime.arrays.ArrayLikeIterator"%>
<%@page import="dBConn.Conn"%>
<%
    String orderNo = request.getParameter("orderNo");
    String pm_cd = request.getParameter("pm_cd");
    
    Conn con = new Conn();
    String query="SELECT CONVERT(result_image USING utf8) "
            + "FROM ris_result_detail WHERE order_no='"+orderNo+"' AND procedure_cd='"+pm_cd+"';";
    
    ArrayList<ArrayList<String>> dataIm = con.getData(query);
    
    if(dataIm.size()>0){
        out.print(dataIm.get(0).get(0));
    }
    
%>
