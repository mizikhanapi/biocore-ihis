<%-- 
    Document   : stockAdjustSearchItemResult
    Created on : Oct 12, 2018, 12:03:48 AM
    Author     : shay
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%

    String id = request.getParameter("id");
    String type = request.getParameter("itemType");
    String HEALTH_FACILITY_CODE = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    String DISCIPLINE_CODE = request.getParameter("store");
    //String dataCS = request.getParameter("mode");
    
    
    Conn conn = new Conn();
    String searchProblem = "";
    //id.toLowerCase();
    if(type.equalsIgnoreCase("other")){
        //                               0           1          2             3              4                           
     searchProblem = "SELECT item_cd, category_cd, item_name, selling_price, physical_stock"
            //            FROM CONDITION        
            + " FROM stk_stock_item "
            //            WHERE CONDITION        
            + " where item_cd = '" + id + "' "
            + " AND hfc_cd = '" + HEALTH_FACILITY_CODE + "' AND discipline_cd = '" + DISCIPLINE_CODE + "' ";
    }else if(type.equalsIgnoreCase("drug")){
        
//            if(dataCS.equalsIgnoreCase("qa")){
//
//            }else if(dataCS.equalsIgnoreCase("va")){
//
//            }
         searchProblem = "SELECT ud_mdc_code, d_form_code, d_gnr_name, d_sell_price, d_stock_qty"
            //            FROM CONDITION        
            + " FROM pis_mdc2 "
            //            WHERE CONDITION        
            + " where ud_mdc_code = '" + id + "' "
            + " AND hfc_cd = '" + HEALTH_FACILITY_CODE + "' AND discipline_cd = '" + DISCIPLINE_CODE + "' ";
    }
    
    
    ArrayList<ArrayList<String>> search = conn.getData(searchProblem);
    String selectDiscipline = "SELECT discipline_cd, discipline_name FROM adm_discipline WHERE discipline_hfc_cd='" + HEALTH_FACILITY_CODE + "' and discipline_cd = '"+DISCIPLINE_CODE+"' order by discipline_name desc";
    ArrayList<ArrayList<String>> searchDiscipline = conn.getData(selectDiscipline);
    
    
    if (search.size() > 0) {

        for (int i = 0; i < search.size(); i++) {

            out.print(String.join("|", search.get(i)));

        }
    }
%>              
