<%-- 
    Document   : addUserID_step2
    Created on : Jun 27, 2018, 4:57:33 PM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="ADM_helper.Emailer"%>
<%@page import="main.RMIConnector"%>
<%@page import="ADM_helper.MySession"%>
<%@page import="Formatter.FormatTarikh"%>
<%@page import="dBConn.Conn"%>
<%@page import="org.json.JSONObject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    String userID = (String) session.getAttribute("REGISTRATION_ID");
    String email = (String) session.getAttribute("REGISTRATION_EMAIL");

    String name = request.getParameter("name");
    String ic_no = request.getParameter("nric");
    String gender = request.getParameter("gender");
    String phone = request.getParameter("mobile");
    String dob = request.getParameter("dob");
    String salutation = request.getParameter("salutation");
    String img = request.getParameter("strPic");

    //json object
    JSONObject json = new JSONObject();

    Conn con = new Conn();
    String query = "";

    dob = FormatTarikh.formatDate(dob, "dd/MM/yyyy", "yyyy-MM-dd HH:mm:ss.ms");
    MySession mys = new MySession();
    String random = mys.getRandomSessionID();

    RMIConnector rmi = new RMIConnector();
    query = "UPDATE adm_users set `USER_NAME`='"+name+"', `NEW_ICNO`='"+ic_no+"', `SEX_CODE`='"+gender+"', `MOBILE_PHONE`='"+phone+"', birth_date='"+dob+"', `TITLE`='"+salutation+"', `STATUS`='link', `USER_STATUS`='"+random+"', `CREATED_DATE`=now(),"
            + "`ID_IMG`='"+img+"' WHERE `USER_ID`='"+userID+"';";

    if (rmi.setQuerySQL(con.HOST, con.PORT, query)) {
        String token = random + "l0l" + userID;
        String link = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/TMS/control/linkActivate.jsp?token=" + token;
        
        String pwd = "";
        query = "Select password from adm_users where user_id='"+userID+"' limit 1;";
        ArrayList<ArrayList<String>> dataPwd = con.getData(query);
        if(dataPwd.size()>0){
            pwd = dataPwd.get(0).get(0);
        }
        
        String message = "<h3>Good day dear " + name + "!</h3> "
                + "<br/><p>Thank you for registering with us.</p>"
                + "<br/><br/><p>Following are your ID information...</p>"
                + "<p>User ID: " + userID + "</p>"
                + "<p>IC Number: " + ic_no + "</p>"
                + "<p>Password: " + pwd + "</p>"
                + "<br/><p>To activate your account, <a href='" + link + "'>simply click this <b>link</b>.<a/></p>";
        String subject = "Account Activation Link";
        Emailer em = new Emailer(email, subject, message);
        em.sendTextEmail();
        json.put("isValid", true);
        json.put("msg", "Your registration is successful. Please activate your account by clicking the activation link  sent to " + email);

        out.print(json.toString());

    } else {
        json.put("isValid", false);
        json.put("msg", "HIS-CARE online ID failed to create – please try again");

        out.print(json.toString());

    }
%>
