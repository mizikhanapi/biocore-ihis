<%-- 
    Document   : customerProcessGetUserNotifications
    Created on : Aug 4, 2018, 4:23:46 PM
    Author     : Shammugam
--%>

<%@page import="org.json.JSONArray"%>
<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.JSONObject"%>

<%

    // Getting Parameter
    String user_id = request.getParameter("user_id");
    String filter_noti = request.getParameter("filter");

    // Connection 
    Conn conn = new Conn();

    // Status To Get As Return
    final String NO_NOTI = "No Notification";
    final String GOT_NOTI = "Got Notification";
    String status = "";
    String sql = "";

    if (filter_noti.equals("inbox")) {

        //                0           1         2            3        4       5       6     7               8                                       9            
        sql = " Select user_id, send_time, sender_id, receiver_id, title, message, type, status, TIME_FORMAT(TIME(send_time),'%r'),DATE_FORMAT(DATE(send_time),'%d/%m/%Y') "
                // JOIN SQL
                + " from jlk_notification "
                // WHERE CONDITION
                + " where user_id = '" + user_id + "' AND type = 'inbox' ";

    } else if (filter_noti.equals("outbox")) {

        //                0           1         2            3        4       5       6     7               8                                       9            
        sql = " Select user_id, send_time, sender_id, receiver_id, title, message, type, status, TIME_FORMAT(TIME(send_time),'%r'),DATE_FORMAT(DATE(send_time),'%d/%m/%Y') "
                // JOIN SQL
                + " from jlk_notification "
                // WHERE CONDITION
                + " where user_id = '" + user_id + "' AND type = 'outbox' ";

    } else {

        //                0           1         2            3        4       5       6     7               8                                       9            
        sql = " Select user_id, send_time, sender_id, receiver_id, title, message, type, status, TIME_FORMAT(TIME(send_time),'%r'),DATE_FORMAT(DATE(send_time),'%d/%m/%Y') "
                // JOIN SQL
                + " from jlk_notification "
                // WHERE CONDITION
                + " where user_id = '" + user_id + "' ";

    }

    // Return Object With Required Detail
    JSONObject objMain = new JSONObject();
    JSONArray notifyList = new JSONArray();

    ArrayList<ArrayList<String>> dataCustomerNotification = conn.getData(sql);

    int size = dataCustomerNotification.size();

    if (size > 0) {

        // Set Status
        status = GOT_NOTI;

        for (int i = 0; i < size; i++) {

            JSONObject objSmall = new JSONObject();

            objSmall.put("user_id", dataCustomerNotification.get(i).get(0));
            objSmall.put("send_time", dataCustomerNotification.get(i).get(1));
            objSmall.put("sender_id", dataCustomerNotification.get(i).get(2));
            objSmall.put("receiver_id", dataCustomerNotification.get(i).get(3));
            objSmall.put("title", dataCustomerNotification.get(i).get(4));
            objSmall.put("message", dataCustomerNotification.get(i).get(5));
            objSmall.put("type", dataCustomerNotification.get(i).get(6));
            objSmall.put("status", dataCustomerNotification.get(i).get(7));
            objSmall.put("date", dataCustomerNotification.get(i).get(9));
            objSmall.put("time", dataCustomerNotification.get(i).get(8));

            notifyList.put(objSmall);

        }

    } else {

        status = NO_NOTI;

    }

    objMain.put("message", status);
    objMain.put("dataJSON", notifyList);
    objMain.put("total_item", size);

    out.print(objMain);


%>