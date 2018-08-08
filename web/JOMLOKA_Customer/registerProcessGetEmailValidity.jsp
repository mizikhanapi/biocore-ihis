<%-- 
    Document   : registerProcessGetEmailValidity
    Created on : Jul 19, 2018, 2:14:24 PM
    Author     : Shammugam
--%>

<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.JSONObject"%>

<%

    // Getting Parameter
    String email = request.getParameter("user_email");
    
    // Connection 
    Conn conn = new Conn();

    // Status To Get As Return
    final String NO_USER = "No User";
    final String GOT_USER = "Got User";

    // Variable to Assign Value
    String status = "";


    //                      0        1          2               3                           4                       
    String sql = " Select user_id, password, user_name, health_facility_code, ifnull(convert(picture using utf8), ''), "
            //          5                   6               7                   8           9
            + " ifnull(login_status, '0'), new_icno, ifnull(user_status, ''), user_type , status "
            // JOIN SQL
            + " from adm_users "
            // WHERE CONDITION
            + " where user_id = '" + email + "' limit 1";

    ArrayList<ArrayList<String>> dataUser = conn.getData(sql);

    if (dataUser.size() > 0) // Check For JOMLOKA Customer
    {

        status = GOT_USER;

    } else {

        status = NO_USER;

    }

    
    // Return Object With Required Detail
    JSONObject obj = new JSONObject();

    obj.put("message", status);
    obj.put("data", "");

    out.print(obj);


%>