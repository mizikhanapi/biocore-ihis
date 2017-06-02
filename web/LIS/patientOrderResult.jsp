<%-- 
    Document   : patientOrderResult
    Created on : May 2, 2017, 6:35:18 PM
    Author     : Raziff
--%>

<%@page import="java.text.ParseException"%>
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

    String dateverify = dateFormat.format(date);
    //String userIDBill = "Raziff";
    String userIDBill = session.getAttribute("USER_NAME").toString();
    String oderItem = "SELECT LAR.item_cd,LAR.test_name,LAR.id_result,LAR.`result`,LAR.remark,LAR.test_date,LAR.`test_time`,LAR.test_name,LAR.`performBy`,LAR.`Verification`,LAR.`verifyBy`,LOM.order_date FROM lis_result LAR,lis_order_master LOM WHERE LAR.order_no = LOM.order_no AND LAR.pmi_no = '" + pmiNo + "' AND LAR.order_no = '" + orderNo + "'";
    ArrayList<ArrayList<String>> dataLISOrderList = conn.getData(oderItem);

    int size = dataLISOrderList.size();
    for (int i = 0; i < size; i++) {

        String item_cd = dataLISOrderList.get(i).get(0);
        String item_name = dataLISOrderList.get(i).get(1);
        String id_result = dataLISOrderList.get(i).get(2);
        String result = dataLISOrderList.get(i).get(3);
        String remark = dataLISOrderList.get(i).get(4);
        
        String test_date = dataLISOrderList.get(i).get(5);
        String txtdate = "21/06/2012"; 
        SimpleDateFormat pd = new SimpleDateFormat("dd/MM/yyyy"); 
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd"); 

        Date date1 = null;
        try {
            date1 = (Date) pd.parse(test_date);
        } catch (ParseException e) {
            e.printStackTrace();
        } 

        String DisplayDate= df.format(date1); 
        
        String testTime = dataLISOrderList.get(i).get(6);
        String episode = dataLISOrderList.get(i).get(11);
        String performBy = dataLISOrderList.get(i).get(8);
        String verifyBy = dataLISOrderList.get(i).get(10);

        String dataOneRow = "LIR|" + item_cd + "^" + item_name + "^ICD10-PCS|" + id_result + "^" + result + "^UD|^" + performBy + "^UD|" + DisplayDate + " " + testTime + "|^^UD||^" + verifyBy + "^UD|" + dateverify + "||" + episode + "|<cr>";

        //String dataOneRow = "LIR|T^" + orderDate + "|CH|" + pmiNo + "|" + result + "|" + remark + "|" + test_date + "|" + testTime +"|" + test_name +"|" + performBy + "|" + "|" + Verification + "|" + userIDBill + "|" + dateBill + "<cr>";
        out.print(dataOneRow);
    }

%>