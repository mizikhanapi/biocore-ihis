<%-- 
    Document   : manageStockCodeItemInsert
    Created on : Nov 15, 2017, 2:56:50 PM
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

    DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    LocalDateTime now = LocalDateTime.now();

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

    String created_by = session.getAttribute("USER_ID").toString();
    String created_date = format.format(now);
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
    String sub = session.getAttribute("SUB_DISCIPLINE_CODE").toString();

    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();

    String sqlCheck = "SELECT item_cd from stk_stock_item WHERE item_cd = '" + stockItemCode + "' AND hfc_cd  = '" + hfc + "'  AND discipline_cd   = '" + dis + "' LIMIT 1 ";
    ArrayList<ArrayList<String>> duplicate = conn.getData(sqlCheck);

    if (duplicate.size() > 0) {

        out.print("Duplicate");

    } else {

        String sqlInsert = "INSERT INTO stk_stock_item (item_cd, category_cd, item_name, barcode, oum, supplier_cd, serial_no, brand, "
                + " location, currency, selling_price, purchase_price, wholesale_price, tax, min_stock, float_stock, physical_stock, "
                + " reorder_level, std_material_cost, std_labor_cost, std_expenses, item_condition, item_grade, status, hfc_cd, "
                + " discipline_cd, subdiscipline_cd, created_by, created_date)"
                + " VALUES ('" + stockItemCode + "','" + stockItemCatCode + "','" + stockItemName + "','" + stockItemBarcode + "',"
                + " '" + stockItemOUM + "','" + stockItemsSupplierCD + "','" + stockItemSerialNo + "','" + stockItemBrand + "',"
                + " '" + stockItemLocation + "','" + stockItemCurrency + "','" + stockItemSellingPrice + "','" + stockItemPurchasePrice + "',"
                + " '" + stockItemWholesalePrice + "','" + stockItemTax + "','" + stockItemMinStock + "','" + stockItemFloatStock + "',"
                + " '" + stockItemPhysicalStock + "','" + stockItemReorderLevel + "','" + stockItemStdMaterialCost + "','" + stockItemStdLaborCost + "',"
                + " '" + stockItemStdExpenses + "','" + stockItemCondition + "','" + stockItemGrade + "','" + stockItemStatus + "',"
                + " '" + hfc + "','" + dis + "','" + sub + "','" + created_by + "','" + created_date + "' )";

        boolean isInsert = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

        if (isInsert == true) {
            out.print("Success");
        } else {
            out.print("Failed");
        }

    }

%>