<%-- 
    Document   : customerProcessGetUserNotifications
    Created on : Aug 4, 2018, 4:23:46 PM
    Author     : Shammugam
--%>

<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.JSONObject"%>

<%

    // Getting Parameter
    String user_id = request.getParameter("user_id");

    // Connection 
    Conn conn = new Conn();

    // Status To Get As Return
    final String NO_NOTI = "No Notification";
    final String GOT_NOTI = "Got Notification";
    String status = "";

    //                      0           1         2            3        4         5                    
    String sql = " Select user_id, send_time, sender_id, receiver_id, message, status "
            // JOIN SQL
            + " from jlk_notification "
            // WHERE CONDITION
            + " where user_id = '" + user_id + "' ";

    ArrayList<ArrayList<String>> dataCustomerNotification = conn.getData(sql);

    ArrayList<String> list = new ArrayList();

    int size = dataCustomerNotification.size();

    if (size > 0) {

        // Set Status
        status = GOT_NOTI;

        for (int i = 0; i < size; i++) {

            String listItemFull = "<ListItem><Body>"
                    + "<Text>Dummy Message Server</Text>"
                    + "<Text note numberOfLines={3}>Have a good experience using our service."
                    + "</Text></Body></ListItem>";

            String longJoinetdData = dataCustomerNotification.get(i).get(0) + "|" + dataCustomerNotification.get(i).get(1)
                    + "|" + dataCustomerNotification.get(i).get(2) + "|" + dataCustomerNotification.get(i).get(3)
                    + "|" + dataCustomerNotification.get(i).get(4) + "|" + dataCustomerNotification.get(i).get(5);

            list.add(longJoinetdData);

        }

    } else {

        status = NO_NOTI;

    }

    // Return Object With Required Detail
    JSONObject objMain = new JSONObject();

    objMain.put("message", status);
    objMain.put("data", dataCustomerNotification);
    objMain.put("rendered_list", list);
    objMain.put("total_item", size);

    out.print(objMain);


%>