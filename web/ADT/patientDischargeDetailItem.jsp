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
    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    Date date = new Date();

    String orderDate = request.getParameter("orderDate");
    String pmiNo = request.getParameter("pmiNo");
    String ser_price = request.getParameter("Discharge");

    String dateBill = dateFormat.format(date);
    String userIDBill = request.getParameter("userID");

    String item_name = "Ward Charges";
    String item_cd = "WIS001";
    String buy_price = "0";

    String dataOneRow = "BIL|T^" + orderDate + "|CH|" + pmiNo + "|" + item_cd + "|" + item_name + "|" + buy_price + "|" + ser_price + "|" + userIDBill + "|" + dateBill + "<cr>\n";
    out.print(dataOneRow);


%>

