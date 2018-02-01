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
    String query="SELECT CONVERT(image USING utf8) "
            + "FROM opt_result WHERE order_no='"+orderNo+"' AND procedure_cd='"+pm_cd+"';";
    
    ArrayList<ArrayList<String>> dataIm = con.getData(query);
    
    if(dataIm.size()>0){
        //String img = dataIm.get(0).get(0).isEmpty()? "/assets/img/no-image.png" : dataIm.get(0).get(0);
        if(dataIm.get(0).get(0) == null){
            out.print(request.getContextPath()+"/assets/img/no-image.png");
        }
        else if(dataIm.get(0).get(0).isEmpty()){
            out.print(request.getContextPath()+"/assets/img/no-image.png");
        }
        else{
            out.print(dataIm.get(0).get(0));
        }
        
    }
    else{
        out.print(request.getContextPath()+"/assets/img/no-image.png");
    }
    
%>
