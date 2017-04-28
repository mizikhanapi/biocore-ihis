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
    //String id = "Klinik UTeM Kampus Industri";
    String OrderHfc = request.getParameter("orderHfcCd");
    String ProviderHfc = request.getParameter("providerHfcCd");
    
    String orderHfcDetail="-NA-";
    String providerHfcDetail="-NA-";
    
    
            String searchOrderHfc = "SELECT f.*,statea.Description AS state_name FROM adm_lookup_detail statea, "
                + "(SELECT e.*,country.Description AS country_name FROM adm_lookup_detail country, "
                + "( SELECT d.*,district.Description AS district_name FROM adm_lookup_detail district, "
                + "( SELECT b.*,hfc.description AS hfc_name FROM adm_lookup_detail hfc,"
                + " (SELECT t.*,ld.Description AS town_name  FROM adm_lookup_detail ld, "
                + "( select  hfc_cd,address1,address2,address3,town_cd,district_cd,state_cd,country_cd,postcode, telephone_no  from adm_health_facility )t "
                + " WHERE t.town_cd=ld.`Detail_Reference_code` AND ld.`Master_Reference_code` = '0003' )b "
                + " WHERE hfc.Master_Reference_code='0081' AND hfc.Detail_Reference_code = b.hfc_cd  )d  "
                + "WHERE district.`Master_Reference_code` = '0078' AND district.`Detail_Reference_code` = d.district_cd )e  "
                + "WHERE country.`Master_Reference_code` = '0001' AND country.`Detail_Reference_code` = e.country_cd) f "
                + "WHERE statea.`Master_Reference_code` = '0002' AND statea.`Detail_Reference_code` = f.state_cd AND f.hfc_cd = '"+OrderHfc+"' GROUP BY hfc_cd  ";      
         ArrayList<ArrayList<String>> hfcOrderData = Conn.getData(searchOrderHfc);
        
      String searchProviderHfc ="SELECT f.*,statea.Description AS state_name FROM adm_lookup_detail statea, "
              + "(SELECT e.*,country.Description AS country_name FROM adm_lookup_detail country,"
              + " ( SELECT d.*,district.Description AS district_name FROM adm_lookup_detail district,"
              + " ( SELECT b.*,hfc.description AS hfc_name FROM adm_lookup_detail hfc,"
              + " (SELECT t.*,ld.Description AS town_name  FROM adm_lookup_detail ld, "
              + "( select  hfc_cd,address1,address2,address3,town_cd,district_cd,state_cd,country_cd,postcode, telephone_no  from adm_health_facility )t "
              + " WHERE t.town_cd=ld.`Detail_Reference_code` AND ld.`Master_Reference_code` = '0003' )b "
              + " WHERE hfc.Master_Reference_code='0081' AND hfc.Detail_Reference_code = b.hfc_cd  )d "
              + " WHERE district.`Master_Reference_code` = '0078' AND district.`Detail_Reference_code` = d.district_cd )e  "
              + "WHERE country.`Master_Reference_code` = '0001' AND country.`Detail_Reference_code` = e.country_cd) f"
              + " WHERE statea.`Master_Reference_code` = '0002' AND statea.`Detail_Reference_code` = f.state_cd AND f.hfc_cd = '"+ProviderHfc+"' GROUP BY hfc_cd  ";      
      
      ArrayList<ArrayList<String>> hfcProviderData = Conn.getData(searchProviderHfc);
        
    if (hfcOrderData.size() > 0) {
            for (int i = 0; i < hfcOrderData.size(); i++) {
                orderHfcDetail = String.join("|", hfcOrderData.get(i));
            }
        
        }
         if (hfcProviderData.size() > 0) {
            for (int i = 0; i < hfcProviderData.size(); i++) {
                providerHfcDetail = String.join("|", hfcProviderData.get(i));
            }
        }
    
    out.print(orderHfcDetail + "[#-#]" +providerHfcDetail);
    
//        for (int i = 0; i < search.size(); i++) {
//            
//            out.print(String.join("|", search.get(i)));
//        }

    
%>        