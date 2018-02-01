<%-- 
    Document   : managePastCompleteOrderGetImage
    Created on : Feb 1, 2018, 6:18:59 PM
    Author     : Shammugam
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="jdk.nashorn.internal.runtime.arrays.ArrayLikeIterator"%>
<%@page import="dBConn.Conn"%>
<%
    String result_no = request.getParameter("result_no");

    Conn con = new Conn();

    //                              0
    String query = "SELECT CONVERT(picture USING utf8) "
            // FROM RESULT TABLE
            + " FROM lis_result "
            // WHERE CONDITION
            + " WHERE result_no = '" + result_no + "' ;";

    ArrayList<ArrayList<String>> dataIm = con.getData(query);

    if (dataIm.size() > 0) {
        //String img = dataIm.get(0).get(0).isEmpty()? "/assets/img/no-image.png" : dataIm.get(0).get(0);
        if (dataIm.get(0).get(0) == null) {
            out.print(request.getContextPath() + "/assets/img/no-image.png");
        } else if (dataIm.get(0).get(0).isEmpty()) {
            out.print(request.getContextPath() + "/assets/img/no-image.png");
        } else {
            out.print(dataIm.get(0).get(0));
        }

    } else {
        out.print(request.getContextPath() + "/assets/img/no-image.png");
    }

%>
