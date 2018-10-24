<%-- 
    Document   : procedure_select
    Created on : Oct 24, 2018, 12:36:54 PM
    Author     : shay
--%>

<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Conn conn = new Conn();
    String hfcori = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String disori = session.getAttribute("DISCIPLINE_CODE").toString();
    String subdisori = session.getAttribute("SUB_DISCIPLINE_CODE").toString();
    
    String orderno = request.getParameter("orderNo");
    String output = "";
    
    ArrayList<ArrayList<String>> dataselectItem,dataitemstk;
    //                              0       1         2         3           4          5        6
    String selectitem = "SELECT order_no,txt_date,item_cd,item_desc,item_quantity,item_amt,item_type FROM stk_distribition_detail WHERE order_no = '"+orderno+"' and location = '"+hfcori+"'";
    String selectqty = "";
    dataselectItem = conn.getData(selectitem);
    if(dataselectItem.size() > 0){
        for(int i = 0 ; i<dataselectItem.size(); i++){
            if(dataselectItem.get(i).get(6).equalsIgnoreCase("drug")){
                selectqty = "SELECT d_stock_qty,d_sell_price from pis_mdc2 WHERE ud_mdc_code = '"+dataselectItem.get(i).get(2) +"' and hfc_cd = '"+hfcori+"' and discipline_cd = '"+disori+"'";
            }else if(dataselectItem.get(i).get(6).equalsIgnoreCase("other")){
                selectqty = "SELECT physical_stock,selling_price from stk_stock_item WHERE item_cd = '"+dataselectItem.get(i).get(2) +"' and hfc_cd = '"+hfcori+"' and discipline_cd = '"+disori+"'";
            }
            
            dataitemstk = conn.getData(selectqty);
            if(dataitemstk.size() > 0){
                dataselectItem.get(i).add(dataitemstk.get(0).get(0));
                dataselectItem.get(i).add(dataitemstk.get(0).get(1));
            }else{
                dataselectItem.get(i).add("-");
                dataselectItem.get(i).add("-");
            }
            output += "<tr id='addNewStockOrderDetailsUpdateDeleteBtn'>"
                    +"<td>" + dataselectItem.get(i).get(2) + "</td>"
                                            +"<td>" + dataselectItem.get(i).get(3) + "</td>"
                                            +"<td>" + dataselectItem.get(i).get(8) + "</td>"
                                            +"<td>" +dataselectItem.get(i).get(7) + "</td>"
                                            +"<td>" + dataselectItem.get(i).get(4) + "</td>"
                                            +"<td>" + dataselectItem.get(i).get(5) + "</td>"
                                            +"<td><input type='hidden' id='disciplineStockA' value='" + disori + "'><input type='hidden' id='subdisciplineStockA' value='" + subdisori + "'>"
                                            +"<input type='hidden' id='disciplineStockOrderingA' value='" + disori + "'>"
                                            +"<input type='hidden' id='subdisciplineStockOrderingA' value='" + subdisori +"'></td><input type='hidden' id='stockitemtypeA' value='" + dataselectItem.get(i).get(6) + "'>"
                                        +"</tr>";
        }
        out.print(output);
    }else{
        out.print("NO");
        //out.print(selectitem);
    }
    
%>