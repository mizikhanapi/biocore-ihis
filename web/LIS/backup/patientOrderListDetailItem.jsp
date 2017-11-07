<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="dBConn.Conn"%>
<%
    Conn conn = new Conn();
    String orderNo = request.getParameter("orderNo");
    String orderDate = request.getParameter("orderDate");
    String pmiNo = request.getParameter("pmiNo");
    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    Date date = new Date();
    
    String dateBill = dateFormat.format(date);
    String userIDBill = "Raziff";
    String oderItem = "SELECT LID.item_cd,LID.test_cat,LID.item_name,LID.spe_source,LID.spe_container,LID.volume,LID.special_inst,LID.status,LID.buy_price,LID.ser_price,LOD.order_date FROM lis_item_detail LID,lis_order_detail LOD WHERE LID.item_cd = LOD.item_cd AND LOD.order_date = '"+orderDate+"' AND LOD.pmi_no = '"+pmiNo+"' AND LOD.order_no = '"+orderNo+"'";
    ArrayList<ArrayList<String>> dataLISOrderList = conn.getData(oderItem);

    int size = dataLISOrderList.size();
    for (int i = 0; i < size; i++) {

        String item_cd = dataLISOrderList.get(i).get(0);
        String test_category = dataLISOrderList.get(i).get(1);
        String item_name = dataLISOrderList.get(i).get(2);
        String spe_source = dataLISOrderList.get(i).get(3);
        String spe_container = dataLISOrderList.get(i).get(4);
        String volume = dataLISOrderList.get(i).get(5);
        String special_inst = dataLISOrderList.get(i).get(6);
        String status = dataLISOrderList.get(i).get(7);
        String buy_price = dataLISOrderList.get(i).get(8);
        String ser_price = dataLISOrderList.get(i).get(9);

        //String t = "BLI|T^2017-5-24 12:25:1|CH|9504050251851|MTA011004|acetamenophane|0.10|12|DR024|2017-5-24 12:25:1<cr>";
        String dataOneRow = "BLI|T^" + orderDate + "|CH|" + pmiNo + "|" + item_cd + "|" + item_name + "|" + buy_price + "|" + ser_price + "|" + userIDBill + "|" + dateBill + "<cr>\n";
        out.print(dataOneRow);
    }

%>

