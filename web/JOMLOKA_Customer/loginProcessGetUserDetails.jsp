<%-- 
    Document   : loginProcessGetUserDetails
    Created on : Jul 14, 2018, 2:59:01 PM
    Author     : Shammugam
--%>

<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.JSONObject"%>

<%
    
    // Getting Parameter
    String user = request.getParameter("user_name");
    String pass = request.getParameter("user_pass");
    String group = request.getParameter("user_group");

    // Connection 
    Conn conn = new Conn();

    // Status To Get As Return
    final String NO_USER = "No User";
    final String WRONG_PASSWORD = "Wrong Password";
    final String LOGIN = "Login";
    final String CONFIGURE = "No Access";
    String status = "";

    // Variable to Assign Value
    String userName = "";
    String userHFC = "";
    String userIC = "";
    String userStatus = "";
    String userType = "";

    //                      0        1          2               3                           4                       
    String sql = " Select user_id, password, user_name, health_facility_code, ifnull(convert(picture using utf8), ''), "
            //          5                   6               7                   8           9
            + " ifnull(login_status, '0'), new_icno, ifnull(user_status, ''), user_type , status "
            // JOIN SQL
            + " from adm_users "
            // WHERE CONDITION
            + " where user_id = '" + user + "' AND user_group='" + group + "' limit 1";

    ArrayList<ArrayList<String>> dataUser = conn.getData(sql);

    if (dataUser.size() > 0) // Login For JOMLOKA Customer
    {

        if (dataUser.get(0).get(1).equals(pass)) {

            if (dataUser.get(0).get(9).equals("0")) {

                status = LOGIN;
                userName = dataUser.get(0).get(2);
                userHFC = dataUser.get(0).get(3);
                userIC = dataUser.get(0).get(6);
                userStatus = dataUser.get(0).get(7);
                userType = dataUser.get(0).get(8);

            } else {

                status = CONFIGURE;

            }

        } else {

            status = WRONG_PASSWORD;

        }

    } else {

        status = NO_USER;

    }

    
    // Return Object With Required Detail
    JSONObject obj = new JSONObject();

    obj.put("message", status);
    obj.put("screen", "Dashboard");
    obj.put("data", user + "|" + pass + "|" + group + "|" + userName + "|" + userHFC + "|" + userIC + "|" + userStatus + "|" + userType);

    out.print(obj);


%>