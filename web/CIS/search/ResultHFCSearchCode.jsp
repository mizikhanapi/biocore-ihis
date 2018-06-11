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
    //String key = request.getParameter("input");
    String id = request.getParameter("id");
    String ORDER_CODE = request.getParameter("orderCode");
   // String id = "Klinik UTeM Kampus Industri";
    String OrderHfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String ProviderHfc = "";
    
    String orderHfcDetail="-NA-";
    String providerHfcDetail="-NA-";
    
    String orderTown = "-";
    String providerTown = "-";
    
    String orderHfc = "-";
    String providerHfc = "-";
    
    String orderDistrict = "-";
    String providerDistrict = "-";
    
    String orderCountry = "-";
    String providerCountry = "-";
    
    String orderState = "-";
    String providerState = "-";
    

    String searchProblem = "select hfc_cd,Concat(address1 ,address2,address3) AS location from adm_health_facility where hfc_name like '%" + id + "%' ";
    ArrayList<ArrayList<String>> search = Conn.getData(searchProblem);
    

   // out.print(searchProblem);
    if (search.size() > 0) {
    String searchHfcProblem =  search.get(0).get(0) + "|" + search.get(0).get(1);
    ProviderHfc = search.get(0).get(0);
    session.setAttribute("PROVIDER_HFC_ROS", search.get(0).get(0));
    session.setAttribute("PROVIDER_HFC_LOS", search.get(0).get(0));
    
     String sqlMainOrder = "SELECT  hfc_cd,address1,address2,address3,town_cd,district_cd,state_cd,country_cd,postcode, telephone_no  FROM adm_health_facility WHERE hfc_cd = '"+OrderHfc+"';";
      String sqlMainProvider = "SELECT  hfc_cd,address1,address2,address3,town_cd,district_cd,state_cd,country_cd,postcode, telephone_no  FROM adm_health_facility WHERE hfc_cd = '"+ProviderHfc+"';";
   
      ArrayList<ArrayList<String>> MainOrder= Conn.getData(sqlMainOrder);
      ArrayList<ArrayList<String>> MainProvider = Conn.getData(sqlMainProvider);
      
      String orderTowncd = MainOrder.get(0).get(4);
      String providerTowncd = MainProvider.get(0).get(4);
      
     String  orderHfccd = MainOrder.get(0).get(0);
     String providerHfccd = MainProvider.get(0).get(0);
              
     String orderDistrictcd = MainOrder.get(0).get(5);
      String providerDistrictcd = MainProvider.get(0).get(5);
             
      String orderCountrycd = MainOrder.get(0).get(7);
      String providerCountrycd = MainProvider.get(0).get(7);
              
      String orderStatecd = MainOrder.get(0).get(6);
       String providerStatecd =MainProvider.get(0).get(6);
      
      String sqlOrderTown = "SELECT Description AS town_name  FROM adm_lookup_detail WHERE Detail_Reference_code = '"+orderTowncd+"'  AND Master_Reference_code = '0003'  GROUP BY town_name;";
      String sqlProviderTown = "SELECT Description AS town_name  FROM adm_lookup_detail WHERE Detail_Reference_code = '"+providerTowncd+"'  AND Master_Reference_code = '0003'  GROUP BY town_name;";
      
      String sqlOrderHfc = "SELECT Description AS hfc_name FROM adm_lookup_detail  WHERE  Detail_Reference_code = '"+orderHfccd+"'  AND Master_Reference_code='0081'  GROUP BY hfc_name;";
      String sqlProviderHfc = "SELECT Description AS hfc_name FROM adm_lookup_detail  WHERE  Detail_Reference_code = '"+providerHfccd+"'  AND Master_Reference_code='0081'  GROUP BY hfc_name;";
      
      String sqlOrderDistrict = "SELECT Description AS district_name FROM adm_lookup_detail district WHERE Master_Reference_code = '0078' AND Detail_Reference_code ='"+orderDistrictcd+"' GROUP BY district_name;";
      String sqlProviderDistrict = "SELECT Description AS district_name FROM adm_lookup_detail district WHERE Master_Reference_code = '0078' AND Detail_Reference_code ='"+providerDistrictcd+"' GROUP BY district_name;";
      
     String sqlOrderCountry = "SELECT Description AS country_name FROM adm_lookup_detail WHERE Master_Reference_code = '0001' AND Detail_Reference_code = '"+orderCountrycd+"' GROUP BY country_name;";
      String sqlProviderCountry = "SELECT Description AS country_name FROM adm_lookup_detail WHERE Master_Reference_code = '0001' AND Detail_Reference_code = '"+providerCountrycd+"' GROUP BY country_name;";
      
      String sqlOrderState = "SELECT Description AS state_name FROM adm_lookup_detail  WHERE Master_Reference_code = '0002' AND Detail_Reference_code = '"+orderStatecd+"' GROUP BY state_name;";
      String sqlProviderState = "SELECT Description AS state_name FROM adm_lookup_detail  WHERE Master_Reference_code = '0002' AND Detail_Reference_code = '"+providerStatecd+"' GROUP BY state_name;";
      
      ArrayList<ArrayList<String>> OrderTownData = Conn.getData(sqlOrderTown);
        ArrayList<ArrayList<String>> ProviderTownData = Conn.getData(sqlProviderTown);
       
        if(OrderTownData.size() > 0){
            orderTown = OrderTownData.get(0).get(0);
             
        }
        if(ProviderTownData.size() > 0){
            providerTown = ProviderTownData.get(0).get(0);
        }
                
        ArrayList<ArrayList<String>> OrderHfcData = Conn.getData(sqlOrderHfc);
        ArrayList<ArrayList<String>> ProviderHfcData = Conn.getData(sqlProviderHfc);
        
     if(OrderHfcData.size() > 0){
            orderHfc = OrderHfcData.get(0).get(0);
        }
        if(ProviderHfcData.size() > 0){
            providerHfc = ProviderHfcData.get(0).get(0);
        }
        
        ArrayList<ArrayList<String>> OrderDistrictData = Conn.getData(sqlOrderDistrict);
        ArrayList<ArrayList<String>> ProviderDistrictData = Conn.getData(sqlProviderDistrict);
        
      if(OrderDistrictData.size() > 0){
            orderDistrict = OrderDistrictData.get(0).get(0);
        }
        if(ProviderDistrictData.size() > 0){
            providerDistrict = ProviderDistrictData.get(0).get(0);
        }
        
        
        ArrayList<ArrayList<String>> OrderCountryData = Conn.getData(sqlOrderCountry);
        ArrayList<ArrayList<String>> ProviderCountryData = Conn.getData(sqlProviderCountry);
        
         if(OrderCountryData.size() > 0){
            orderCountry = OrderCountryData.get(0).get(0);
        }
        if(ProviderCountryData.size() > 0){
            providerCountry = ProviderCountryData.get(0).get(0);
        }
        
        ArrayList<ArrayList<String>> hfcOrderData = Conn.getData(sqlOrderState);
        ArrayList<ArrayList<String>> ProviderStateData = Conn.getData(sqlProviderState);
        
          if(hfcOrderData.size() > 0){
            orderState = hfcOrderData.get(0).get(0);
        }
        if(ProviderStateData.size() > 0){
            providerState = ProviderStateData.get(0).get(0);
        }
    
        
    if (MainOrder.size() > 0) {
            for (int i = 0; i < MainOrder.size(); i++) {
                orderHfcDetail = String.join("|", MainOrder.get(i));
            }
        
        }
         if (MainProvider.size() > 0) {
            for (int i = 0; i < MainProvider.size(); i++) {
                providerHfcDetail = String.join("|", MainProvider.get(i));
            }
        }
   orderHfcDetail += "|"+orderTown+ "|"+orderHfc+ "|"+orderDistrict+ "|"+orderCountry+ "|"+orderState;
   providerHfcDetail+="|"+providerTown+ "|"+providerHfc+ "|"+providerDistrict+ "|"+providerCountry+ "|"+providerState;
   out.print(searchHfcProblem + "[#-#]" +orderHfcDetail + "[#-#]" +providerHfcDetail);
    //out.print(searchOrderHfc);
    
//        for (int i = 0; i < search.size(); i++) {
//            
//            out.print(String.join("|", search.get(i)));
//        }

    }
%>        