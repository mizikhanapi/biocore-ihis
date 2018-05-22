<%-- 
    Document   : orderStockGetSeqNo
    Created on : May 22, 2018, 11:49:29 PM
    Author     : Shammugam
--%>



<%@page import="GNLHelper.SeqNoGenerator"%>
<%

    SeqNoGenerator sq = new SeqNoGenerator ("SMS");
    String orderNo = sq.getSeqNo();

    out.print(orderNo);
    
%>