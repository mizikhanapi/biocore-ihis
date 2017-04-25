<%-- 
    Document   : order_update
    Created on : Apr 25, 2017, 9:44:58 PM
    Author     : user
--%>

<%@page import="main.RMIConnector"%>
<%@page import="Formatter.DateFormatter"%>
<%@page import="dBConn.Conn"%>
<%
    Conn conn = new Conn();
    RMIConnector rmic = new RMIConnector();
    String process = request.getParameter("process");
    String orderNo = request.getParameter("orderNo");
    String bsCode = request.getParameter("bsCode");
    String modCode = request.getParameter("modCode");
    String proCode = request.getParameter("proCode");

    if (process.equalsIgnoreCase("setDate")) {
        String exDate = request.getParameter("exDate");

        exDate = DateFormatter.formatDate(exDate, "dd/MM/yyyy", "yyyy-MM-dd HH:mm:ss.ms");

        String sql = "Update ris_order_detail set exam_date = '" + exDate + "' "
                + "where order_no = '" + orderNo + "' AND modality_cd = '" + modCode + "' AND body_system_cd = '" + bsCode + "' AND procedure_cd = '" + proCode + "' ";

        boolean isUpdate = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

        if (isUpdate) {
            out.print("success");
        } else {
            out.print("fail");
        }

    }//end set date
    else if (process.equalsIgnoreCase("perform")) {
        
        String sql = "Update ris_order_detail set order_status = '1', exam_date = now() "
                + "where order_no = '" + orderNo + "' AND modality_cd = '" + modCode + "' AND body_system_cd = '" + bsCode + "' AND procedure_cd = '" + proCode + "' ";

        boolean isUpdate = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

        if (isUpdate) {
            out.print("success");
        } else {
            out.print("fail");
        }

    }//end perform
%>
