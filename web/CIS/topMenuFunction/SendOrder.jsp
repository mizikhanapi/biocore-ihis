<%-- 
    Document   : discharge
    Created on : Mar 3, 2017, 4:58:40 PM
    Author     : -D-
--%>


<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    String msg = request.getParameter("msg");
    String pmino = request.getParameter("pmino");
    String episodedate = request.getParameter("episodedate");
    String status = request.getParameter("status");

    Conn conn = new Conn();
    RMIConnector rmic = new RMIConnector();
//    String sqlCheckEHR = "SELECT * FROM ehr_central where pmi_no = '" + pmino + "' AND c_txndate = '" + episodedate + "'";
    
    /*
    * Editted by Ardhi; 08032018
    * To ensure order date is using server time. NOT using users' machine time.
    * Users' machine time can be altered by the users and this cause havoc during order submission
    */

//    ArrayList<ArrayList<String>> dataEHR = conn.getData(sqlCheckEHR);

    /*
        ----- how? -------
        1. msg is created by javascript function from user's PC.
        2. We want only to adjust ORC orderDate & encounterDate column to take server time.
        3. Split msg using "<cr>" and store to arr1.
        4. Set String orc = arr1[2].
        5. Split orc using "|" and store to arr2.
        6. Set arr2[6] = serverTime.
        7. Set orc = String.join("|", arr2);
        8. Set arr1[2] = orc
        9. Set msg = String.join("<cr>", arr1);
    */
    
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    Timestamp timestamp = new Timestamp(System.currentTimeMillis());
    
    String[] arr1 = msg.split("<cr>");
    String orc = arr1[2];
    String[] arr2 = orc.split("\\|");
    arr2[8] = sdf.format(timestamp);
    timestamp = new Timestamp(System.currentTimeMillis());
    arr2[6] = sdf.format(timestamp);
    orc = String.join("|", arr2);
    arr1[2] = orc;
    msg = String.join("<cr>", arr1);
    
    String sql = "INSERT INTO ehr_central(pmi_no, c_txndate, c_txndata, status,status_1,status_2,status_3,status_4,status_5) "
                    + "VALUES('" + pmino + "','" + episodedate + "','" + msg + "','" + status + "','0','0','0','0','0') ";
        
      rmic.setQuerySQL(conn.HOST, conn.PORT, sql);
       out.print("|-SUCCESS-|");

//            boolean stats = conn.setData("INSERT INTO ehr_central(pmi_no, c_txndate, c_txndata, status,status_1,status_2,status_3,status_4,status_5) "
//                    + "VALUES('" + pmino + "','" + episodedate + "','" + msg + "','" + status + "','0','0','0','0','0') ");
//            
//            if (stats) {
//                out.print("|-SUCCESS-|");
//            } else {
//                out.print("|2|");
//            }

   


 

%>