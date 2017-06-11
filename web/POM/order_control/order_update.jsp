<%-- 
    Document   : order_update for POM
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
    else if(process.equalsIgnoreCase("report")){
        String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
        String creator = (String) session.getAttribute("USER_ID");
        
        String comment = request.getParameter("comment");
        String ep_date = request.getParameter("epDate");
        String proName = request.getParameter("proName");
        
        
        boolean isSuccess = true;
        
        String query = "Update pos_order_detail set comment ='"+comment+"', order_status ='2', encounter_date =now() "
                + "where order_no ='"+orderNo+"' and procedure_cd ='"+proCode+"' and hfc_cd = '"+hfc_cd+"'";
        isSuccess = rmic.setQuerySQL(conn.HOST, conn.PORT, query);
        
        if(isSuccess){
            query = "Insert into pos_result_detail(order_no, procedure_cd, procedure_name, episode_date, encounter_date, comments, created_by, created_date) "
                    + "values('"+orderNo+"', '"+proCode+"', '"+proName+"', '"+ep_date+"', now(), '"+comment+"', '"+creator+"', now())";
            
            isSuccess = rmic.setQuerySQL(conn.HOST, conn.PORT, query);
 
        }
        
        if (isSuccess) {
            out.print("success");
            OrderMaster om = new OrderMaster(orderNo);
            om.updateOrderMasterStatus();
        } else {
            out.print("fail");
        }
    }
    

%>