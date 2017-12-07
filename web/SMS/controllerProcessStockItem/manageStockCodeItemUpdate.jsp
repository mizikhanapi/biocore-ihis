<%-- 
    Document   : manageStockCodeItemUpdate
    Created on : Nov 15, 2017, 4:31:11 PM
    Author     : Shammugam
--%>

<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String stockItemCatCode = request.getParameter("stockItemCatCode");
    String stockItemCode = request.getParameter("stockItemCode");
    String stockItemName = request.getParameter("stockItemName");
    String stockItemBarcode = request.getParameter("stockItemBarcode");
    String stockItemOUM = request.getParameter("stockItemOUM");
    String stockItemsSupplierCD = request.getParameter("stockItemsSupplierCD");
    String stockItemSerialNo = request.getParameter("stockItemSerialNo");
    String stockItemBrand = request.getParameter("stockItemBrand");

    String stockItemLocation = request.getParameter("stockItemLocation");
    String stockItemCurrency = request.getParameter("stockItemCurrency");
    String stockItemSellingPrice = request.getParameter("stockItemSellingPrice");
    String stockItemPurchasePrice = request.getParameter("stockItemPurchasePrice");
    String stockItemWholesalePrice = request.getParameter("stockItemWholesalePrice");
    String stockItemTax = request.getParameter("stockItemTax");
    String stockItemMinStock = request.getParameter("stockItemMinStock");
    String stockItemFloatStock = request.getParameter("stockItemFloatStock");

    String stockItemPhysicalStock = request.getParameter("stockItemPhysicalStock");
    String stockItemReorderLevel = request.getParameter("stockItemReorderLevel");
    String stockItemStdMaterialCost = request.getParameter("stockItemStdMaterialCost");
    String stockItemStdLaborCost = request.getParameter("stockItemStdLaborCost");
    String stockItemStdExpenses = request.getParameter("stockItemStdExpenses");
    String stockItemCondition = request.getParameter("stockItemCondition");
    String stockItemGrade = request.getParameter("stockItemGrade");
    String stockItemStatus = request.getParameter("stockItemStatus");

    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
    String sub = session.getAttribute("SUB_DISCIPLINE_CODE").toString();

    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();

    String sqlUpdate = "UPDATE stk_stock_item SET item_name = '" + stockItemName + "',barcode = '" + stockItemBarcode + "',"
            + " oum = '" + stockItemOUM + "',supplier_cd = '" + stockItemsSupplierCD + "',serial_no = '" + stockItemSerialNo + "', "
            + " brand = '" + stockItemBrand + "',location = '" + stockItemLocation + "',currency = '" + stockItemCurrency + "', "
            + " selling_price = '" + stockItemSellingPrice + "',purchase_price = '" + stockItemPurchasePrice + "',"
            + " wholesale_price = '" + stockItemWholesalePrice + "',tax = '" + stockItemTax + "',"
            + " min_stock = '" + stockItemMinStock + "',float_stock = '" + stockItemFloatStock + "', "
            + " physical_stock = '" + stockItemPhysicalStock + "',reorder_level = '" + stockItemReorderLevel + "', "
            + " std_material_cost = '" + stockItemStdMaterialCost + "',std_labor_cost = '" + stockItemStdLaborCost + "', "
            + " std_expenses = '" + stockItemStdExpenses + "',item_condition = '" + stockItemCondition + "', "
            + " item_grade = '" + stockItemGrade + "',status = '" + stockItemStatus + "' "
            + " WHERE item_cd = '" + stockItemCode + "' "
            + " AND hfc_cd  = '" + hfc + "' AND discipline_cd   = '" + dis + "' ";

    boolean isUpdate = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdate);

    if (isUpdate == true) {
        out.print("Success");
    } else {
        out.print("Failed");
    }

%>