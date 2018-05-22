<%-- 
    Document   : billGenerateBillDetailGetSeqNoN
    Created on : May 23, 2018, 12:08:47 AM
    Author     : Shammugam
--%>

<%@page import="GNLHelper.SeqNoGenerator"%>
<%

    SeqNoGenerator sq = new SeqNoGenerator ("BLI");
    String orderNo = sq.getSeqNo();

    out.print(orderNo);
    
%>