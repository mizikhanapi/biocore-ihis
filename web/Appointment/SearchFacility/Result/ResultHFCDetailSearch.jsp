<%-- 
    Document   : searchHFC_cd
    Created on : 17-Feb-2017, 19:13:52
    Author     : ahmed
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn Conn = new Conn();
    String OrderHfc = request.getParameter("OrderHfc");
  

            

    String orderHfcDetail = "-NA-";


    String orderTown = "-";


    String orderHfc = "-";


    String orderDistrict = "-";


    String orderCountry = "-";


    String orderState = "-";


    String sqlMainOrder = "SELECT  hfc_cd,address1,address2,address3,town_cd,district_cd,state_cd,country_cd,postcode, telephone_no  FROM adm_health_facility WHERE hfc_cd = '" + OrderHfc + "';";
  

    ArrayList<ArrayList<String>> MainOrder = Conn.getData(sqlMainOrder);


    String orderTowncd = MainOrder.get(0).get(4);


    String orderHfccd = MainOrder.get(0).get(0);


    String orderDistrictcd = MainOrder.get(0).get(5);


    String orderCountrycd = MainOrder.get(0).get(7);


    String orderStatecd = MainOrder.get(0).get(6);


    String sqlOrderTown = "SELECT Description AS town_name  FROM adm_lookup_detail WHERE Detail_Reference_code = '" + orderTowncd + "'  AND Master_Reference_code = '0003'  GROUP BY town_name;";


    String sqlOrderHfc = "SELECT Description AS hfc_name FROM adm_lookup_detail  WHERE  Detail_Reference_code = '" + orderHfccd + "'  AND Master_Reference_code='0081'  GROUP BY hfc_name;";


    String sqlOrderDistrict = "SELECT Description AS district_name FROM adm_lookup_detail district WHERE Master_Reference_code = '0078' AND Detail_Reference_code ='" + orderDistrictcd + "' GROUP BY district_name;";


    String sqlOrderCountry = "SELECT Description AS country_name FROM adm_lookup_detail WHERE Master_Reference_code = '0001' AND Detail_Reference_code = '" + orderCountrycd + "' GROUP BY country_name;";


    String sqlOrderState = "SELECT Description AS state_name FROM adm_lookup_detail  WHERE Master_Reference_code = '0002' AND Detail_Reference_code = '" + orderStatecd + "' GROUP BY state_name;";


    ArrayList<ArrayList<String>> OrderTownData = Conn.getData(sqlOrderTown);


    if (OrderTownData.size() > 0) {
        orderTown = OrderTownData.get(0).get(0);

    }

    ArrayList<ArrayList<String>> OrderHfcData = Conn.getData(sqlOrderHfc);


    if (OrderHfcData.size() > 0) {
        orderHfc = OrderHfcData.get(0).get(0);
    }


    ArrayList<ArrayList<String>> OrderDistrictData = Conn.getData(sqlOrderDistrict);


    if (OrderDistrictData.size() > 0) {
        orderDistrict = OrderDistrictData.get(0).get(0);
    }


    ArrayList<ArrayList<String>> OrderCountryData = Conn.getData(sqlOrderCountry);


    if (OrderCountryData.size() > 0) {
        orderCountry = OrderCountryData.get(0).get(0);
    }


    ArrayList<ArrayList<String>> hfcOrderData = Conn.getData(sqlOrderState);


    if (hfcOrderData.size() > 0) {
        orderState = hfcOrderData.get(0).get(0);
    }


    if (MainOrder.size() > 0) {
        for (int i = 0; i < MainOrder.size(); i++) {
            orderHfcDetail = String.join("|", MainOrder.get(i));
        }

    }

    orderHfcDetail += "|" + orderTown + "|" + orderHfc + "|" + orderDistrict + "|" + orderCountry + "|" + orderState;
   
    out.print(orderHfcDetail);


%>        