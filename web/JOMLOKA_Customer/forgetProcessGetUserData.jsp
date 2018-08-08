<%-- 
    Document   : forgetProcessGetUserData
    Created on : Aug 8, 2018, 5:59:12 PM
    Author     : Shammugam
--%>

<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.JSONObject"%>

<%

    // Getting Parameter
    String user = request.getParameter("user_name");
    String group = request.getParameter("user_group");
    String type = request.getParameter("user_type");

    // Connection 
    Conn conn = new Conn();

    // Status To Get As Return
    final String NO_USER = "No User";
    final String GOT_USER = "Got User";
    String status = "";

    // Variable to Assign Value
    String userID = "";
    String userName = "";
    String userPassword = "";
    String userQuestion = "";
    String userAnswer = "";

    //                      0        1          2               3                 4         5         6        7                  
    String sql = " Select user_id, password, user_name, health_facility_code, user_type , status, question, answer "
            // JOIN SQL
            + " from adm_users "
            // WHERE CONDITION
            + " where user_id = '" + user + "' AND user_group='" + group + "' AND user_type='" + type + "' limit 1";

    ArrayList<ArrayList<String>> dataUser = conn.getData(sql);

    if (dataUser.size() > 0) // Login For JOMLOKA Customer
    {

        status = GOT_USER;
        userID = dataUser.get(0).get(0);
        userName = dataUser.get(0).get(2);
        userPassword = dataUser.get(0).get(1);
        userQuestion = dataUser.get(0).get(6);
        userAnswer = dataUser.get(0).get(7);

    } else {

        status = NO_USER;

    }

    // Return Object With Required Detail
    JSONObject obj = new JSONObject();

    obj.put("message", status);
    obj.put("data", userID + "|" + userName + "|" + userPassword + "|" + userQuestion + "|" + userAnswer);

    out.print(obj);


%>