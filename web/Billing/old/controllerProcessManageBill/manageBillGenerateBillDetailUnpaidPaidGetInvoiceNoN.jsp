<%-- 
    Document   : manageBillGenerateBillDetailUnpaidPaidGetInvoiceNoN
    Created on : May 23, 2018, 6:46:46 AM
    Author     : Shammugam
--%>

<%@page import="GNLHelper.SeqNoGenerator"%>
<%

    SeqNoGenerator sq = new SeqNoGenerator("INV");
    String orderNo = sq.getSeqNo();

    out.print(orderNo);

%>