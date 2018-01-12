<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%
    Conn conn = new Conn();
    String my_1_hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    String lis_item_category1 = "INSERT INTO lis_item_category(`category_code`, `category_name`, `status`, hfc_cd)"
            + "select `category_code`, `category_name`, `status`, '" + my_1_hfc_cd + "' "
            + "from lis_item_category where hfc_cd='99_iHIS_99'";

    String lis_item_category2 = "INSERT INTO lis_item_detail(`item_cd`, `item_name`, `test_cat`, spe_source, spe_container, volume, special_inst, status, buy_price, ser_price, hfc_cd) "
            + "select `item_cd`, `item_name`, `test_cat`, spe_source, spe_container, volume, special_inst, status, buy_price, ser_price, '" + my_1_hfc_cd + "'"
            + "from lis_item_detail where hfc_cd='99_iHIS_99'";
    RMIConnector rmic = new RMIConnector();
    //boolean isInsert = false;

    rmic.setQuerySQL(conn.HOST, conn.PORT, lis_item_category1);
    rmic.setQuerySQL(conn.HOST, conn.PORT, lis_item_category2);

%>
