<%-- 
    Document   : controllerReportStockAdjustment
    Created on : Oct 18, 2018, 4:15:18 PM
    Author     : shay
--%>

<%@page import="java.util.Date"%>
<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>

<%

    Config.getBase_url(request);
    Config.getFile_url(session);
    Conn conn = new Conn();

    String patientType, endDate, startDate, query="", hfc;

    startDate = request.getParameter("startDate");
    endDate = request.getParameter("endDate");
    hfc = request.getParameter("hfc");
    patientType = request.getParameter("patientType");
    String querydocname,itemname="";
    ArrayList<ArrayList<String>> medicalInfo,itemDetails;
    //                  0           1       2                 3               4           5          6
     query = "SELECT DATE_FORMAT(s.txn_date, '%d/%m/%Y'),s.item_cd,s.item_type,s.adjustment_mode,s.reference_no,s.adjust_by,s.hfc_cd,"
             //     7               8                   9           10               11          
             + "s.discipline_cd,s.subdiscipline_cd,s.current_value,s.stock_on_hand,s.changed_value,"
             //     12              13                    14              15          16           17               18
             + "s.new_qty_on_hand,s.adjustment_reason,s.description,s.created_date,s.created_by,u.user_name,d.description "
             + "FROM stk_adjustment_txn s JOIN adm_users u ON u.user_id = s.adjust_by"
             + " JOIN adm_lookup_detail d ON d.detail_reference_code = s.adjustment_reason AND d.master_reference_code = '0129' AND d.hfc_cd = s.hfc_cd"
             + " WHERE cast(s.txn_date as date) BETWEEN '"+startDate + "' AND '" + endDate + "' AND s.hfc_cd = '"+hfc+"'";
     
    if(patientType.equalsIgnoreCase("all")){
  
    }else{
        query += " AND s.discipline_cd = '"+patientType+"'";
    }   
     medicalInfo = conn.getData(query);
     if (medicalInfo.size() > 0) {
        for (int i = 0; i < medicalInfo.size(); i++) {
            ArrayList<String> medicalInforow = medicalInfo.get(i);
            //querydocname = "SELECT user_name from ADM_USERS where user_id = '"+medicalInforow.get(5)+"'";
            if(medicalInforow.get(2).equalsIgnoreCase("other")){
                itemname = "SELECT item_name FROM stk_stock_item WHERE item_cd = '"+medicalInforow.get(1)+"' AND hfc_cd = '"+medicalInforow.get(6)+"' AND discipline_cd ='"+medicalInforow.get(7)+"'";
            }else if(medicalInforow.get(2).equalsIgnoreCase("drug")){
                itemname = "SELECT d_trade_name FROM pis_mdc2 WHERE ud_mdc_code = '"+medicalInforow.get(1)+"' AND hfc_cd = '"+medicalInforow.get(6)+"' AND discipline_cd ='"+medicalInforow.get(7)+"'";
            }
            itemDetails = conn.getData(itemname);
            if(itemDetails.size() > 0){
                medicalInforow.add(itemDetails.get(0).get(0));
            }else{
                medicalInforow.add("-");
            }
            
            String slitedDatarow = StringUtils.join(medicalInforow, "|");
            out.print(slitedDatarow);
            if (i < medicalInfo.size() - 1) {
                out.print("^");
            }
        }
    } else {
        out.print("No Data");
        //out.print(query);
        //out.print(itemname);
    }
    
    

%>