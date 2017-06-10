<%-- 
    Document   : order_update
    Created on : Jun 10, 2017, 4:49:04 PM
    Author     : user
--%>

<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%@page import="POS_helper.OrderMaster"%>
<%
    String proCode = request.getParameter("proCode");
    String orderNo = request.getParameter("orderNo");
    String process = request.getParameter("process");
    
    Conn conn = new Conn();
    RMIConnector rmic = new RMIConnector();
    
    if (process.equalsIgnoreCase("cancel")) {

        String sql = "Delete from pos_order_detail "
                + "where order_no = '" + orderNo + "' AND procedure_cd = '" + proCode + "' ";

        boolean isUpdate = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

        if (isUpdate) {
            out.print("success");
            OrderMaster om = new OrderMaster(orderNo);
            om.updateOrderMasterStatus();
        } else {
            out.print("fail");
        }

    }//end cancel
    

%>