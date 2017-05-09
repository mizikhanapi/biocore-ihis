<%-- 
    Document   : patientOrderResult
    Created on : May 2, 2017, 6:35:18 PM
    Author     : Raziff
--%>

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
    String oderItem = "SELECT LAR.`result`,LAR.remark,LAR.test_date,LAR.`testTime`,LAR.test_name,LAR.`performBy`,LAR.`Verification` FROM lis_assign_result LAR WHERE LAR.pmi_no = '"+pmiNo+"' AND LAR.order_no = '"+orderNo+"'";
    ArrayList<ArrayList<String>> dataLISOrderList = conn.getData(oderItem);

    int size = dataLISOrderList.size();
    for (int i = 0; i < size; i++) {

        String result = dataLISOrderList.get(i).get(0);
        String remark = dataLISOrderList.get(i).get(1);
        String test_date = dataLISOrderList.get(i).get(2);
        String testTime = dataLISOrderList.get(i).get(3);
        String test_name = dataLISOrderList.get(i).get(4);
        String performBy = dataLISOrderList.get(i).get(5);
        String Verification = dataLISOrderList.get(i).get(6);
        
        String dataOneRow = "LIR|T^" + orderDate + "|CH|" + pmiNo + "|" + result + "|" + remark + "|" + test_date + "|" + testTime +"|" + test_name +"|" + performBy + "|" + "|" + Verification + "|" + userIDBill + "|" + dateBill + "<cr>";
        out.print(dataOneRow);
    }

%>