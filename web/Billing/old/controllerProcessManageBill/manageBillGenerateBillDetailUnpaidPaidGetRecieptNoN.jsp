<%-- 
    Document   : manageBillGenerateBillDetailUnpaidPaidGetRecieptNoN
    Created on : May 23, 2018, 6:47:12 AM
    Author     : Shammugam
--%>

<%@page import="GNLHelper.SeqNoGenerator"%>
<%

    SeqNoGenerator sq = new SeqNoGenerator("RCP");
    String orderNo = sq.getSeqNo();

    out.print(orderNo);

%>