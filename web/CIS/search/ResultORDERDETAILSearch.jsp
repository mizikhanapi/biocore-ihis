
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
     Conn Conn = new Conn();
    //String key = request.getParameter("input");
//    String pmi_no = request.getParameter("pmi_no");
//    String episode_date = request.getParameter("episode_date");
    
    String pmi_no = "051347716";
    String episode_date = "2017-08-08 09:44:27.0";
    
    String data = "";

    String searchProblem = "SELECT od.`DRUG_ITEM_CODE`, od.`DRUG_ITEM_DESC`, od.`DRUG_FREQUENCY`, od.`DRUG_ROUTE`, od.`DRUG_FORM`, od.`DRUG_FORM`, od.`DRUG_STRENGTH`,"
            + " od.`DRUG_DOSAGE`, od.`ORDER_OUM`, od.`DURATION`, od.`QTY_ORDERED` FROM pis_order_detail od INNER JOIN pis_order_master om  ON od.`ORDER_NO`  "
            + "WHERE om.`EPISODE_CODE` = '"+episode_date+"' AND om.`PMI_NO` = '"+pmi_no+"'; ";
    ArrayList<ArrayList<String>> search = Conn.getData(searchProblem);
   // out.print(searchProblem);
    if (search.size() > 0) {

        for (int i = 0; i < search.size(); i++) {
            data += search.get(i).get(0)+ "|" +search.get(i).get(1) + "|" +search.get(i).get(2) + "|" +search.get(i).get(3) + "|" +search.get(i).get(4) + "|" +search.get(i).get(5) + "|" +search.get(i).get(6) + "|" +search.get(i).get(7) + "|" +search.get(i).get(8) + "|" +search.get(i).get(9) + "|" +search.get(i).get(10)  +"[#-#]" ; 
        }
        out.print(data);
    }
%>        

