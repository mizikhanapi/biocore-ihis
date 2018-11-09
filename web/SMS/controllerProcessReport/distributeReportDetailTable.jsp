<%-- 
    Document   : distributeReportDetailTable
    Created on : 09-Nov-2018, 23:37:07
    Author     : Shay
--%>
<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%
    Config.getBase_url(request);
    Config.getFile_url(session);
    Conn conn = new Conn();

    String orderno = request.getParameter("orderno");

    ArrayList<ArrayList<String>> data;
    //                            0              1            2            3            4
    String sqlquery = "SELECT sdd.order_no,sdd.txt_date,sdd.item_cd,sdd.item_desc,sdd.item_amt,"
            //        5                  6          7               8            9           10
            + "sdd.item_quantity,sdd.order_by,sdd.created_by,sdd.item_type,sdd.location,sdd.customer_id,"
            //       11                12                     13
            + "sdm.discipline_cd,sdm.subdiscipline_cd,sdm.ordering_discipline_cd,"
            //           14                            15                16
            + "sdm.ordering_subdiscipline_cd,ad.discipline_name,asd.subdiscipline_name,"
            //       17                     18
            + "x.discipline_name,asdd.subdiscipline_name "
            + "FROM stk_distribition_detail sdd "
            + "JOIN stk_distribition_master sdm ON sdm.order_no = sdd.order_no "
            + "JOIN adm_discipline ad ON ad.discipline_hfc_cd = sdd.location AND ad.discipline_cd = sdm.discipline_cd "
            + "JOIN adm_subdiscipline asd ON asd.subdiscipline_hfc_cd = sdd.location AND asd.discipline_cd = sdm.discipline_cd AND asd.subdiscipline_cd = sdm.subdiscipline_cd "
            + "JOIN adm_discipline x ON x.discipline_hfc_cd = sdd.location AND x.discipline_cd = sdm.ordering_discipline_cd "
            + "JOIN adm_subdiscipline asdd ON asdd.subdiscipline_hfc_cd = sdd.location AND asdd.discipline_cd = sdm.ordering_discipline_cd AND asdd.subdiscipline_cd = sdm.ordering_subdiscipline_cd "
            + "WHERE sdd.order_no = '"+orderno+"'";

    data = conn.getData(sqlquery);
    if (data.size() > 0) {
        
        for (int i = 0; i < data.size(); i++) {
            
            ArrayList<String> medicalInforow = data.get(i);
            
            String slitedDatarow = StringUtils.join(medicalInforow, "|");
            out.print(slitedDatarow);
            
            if (i < data.size() - 1) {
                out.print("^");
            }
        }
    }else{
        out.print(sqlquery);
    }

    %>

