<%-- 
    Document   : antenatalFunction
    Created on : Oct 2, 2017, 6:10:09 PM
    Author     : shay
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="OnG_helper.AnteNatalRecord"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    AnteNatalRecord an = new AnteNatalRecord();
    String methodName = request.getParameter("methodName");
    String data = request.getParameter("datas");
    //Boolean result;
    String result;
    
    if (methodName.equalsIgnoreCase("add")) {
        //result = an.insertBloodProfile(data);
        //out.print(result);
    } else if (methodName.equalsIgnoreCase("addAnte")) {
        result = an.insertAntenatal(data);
        out.print(result);
    } else if (methodName.equalsIgnoreCase("getBP")) {

} else if (methodName.equalsIgnoreCase("getAnte")) {

    } else if (methodName.equalsIgnoreCase("del")) {
        //result = an.deleteAntenatal(data);
        //out.print(result);
    }
%>