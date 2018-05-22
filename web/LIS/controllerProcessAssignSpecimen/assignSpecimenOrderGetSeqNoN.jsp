<%-- 
    Document   : assignSpecimenOrderGetSeqNoN
    Created on : May 23, 2018, 12:06:30 AM
    Author     : Shammugam
--%>


<%@page import="GNLHelper.SeqNoGenerator"%>
<%

    SeqNoGenerator sq = new SeqNoGenerator ("SPE");
    String orderNo = sq.getSeqNo();

    out.print(orderNo);
    
%>