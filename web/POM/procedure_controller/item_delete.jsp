<%-- 
    Document   : item_delete
    Created on : Oct 25, 2018, 12:01:44 AM
    Author     : shay
--%>

<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%
    Conn conn = new Conn();
    RMIConnector rmi = new RMIConnector();
    
    String orderno = request.getParameter("orderno");
    String changeqty = request.getParameter("changeqty");
    String amount = request.getParameter("amount");
    String totalqty = request.getParameter("totalqty");
    String itemcd = request.getParameter("itemcode");
    String itemtype = request.getParameter("itemtype");
    
    
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    String dis = (String)session.getAttribute("DISCIPLINE_CODE");
    
    String updatedistributiondetail = "DELETE FROM stk_distribition_detail WHERE order_no = '"+orderno+"' AND item_cd = '"+itemcd+"' AND location = '"+hfc_cd+"'";
    String updateitem = "";
    if(itemtype.equalsIgnoreCase("drug")){
        updateitem = "UPDATE pis_mdc2 SET d_stock_qty = d_stock_qty + "+totalqty+" WHERE UD_MDC_CODE = '"+itemcd+"' AND hfc_cd = '"+hfc_cd+"' AND discipline_cd = '"+dis+"'";
    }else if(itemtype.equalsIgnoreCase("other")){
        updateitem = "UPDATE stk_stock_item SET physical_item= physical_item + "+totalqty+" WHERE item_cd = '"+itemcd+"' AND hfc_cd = '"+hfc_cd+"' AND discipline_cd = '"+dis+"'";
    }
    
    boolean isupdatedistributedetail = true;
    boolean isupdateitem = true;
    isupdatedistributedetail = rmi.setQuerySQL(conn.HOST, conn.PORT, updatedistributiondetail);
    isupdateitem = rmi.setQuerySQL(conn.HOST, conn.PORT, updateitem);
    
    if(isupdatedistributedetail && isupdateitem){
        out.print("OK");
        //out.print(updateitem);
        //out.print(updatedistributiondetail);
    }else if(!isupdatedistributedetail && !isupdateitem){
        out.print("XOK");
        //out.print(updateitem);
        //out.print(updatedistributiondetail);
    }else if(!isupdatedistributedetail && isupdateitem){
        out.print("1OK");
        //out.print(updatedistributiondetail);
    }else if(isupdatedistributedetail && !isupdateitem){
        out.print("2OK");
        //out.print(updateitem);
    }

%>
