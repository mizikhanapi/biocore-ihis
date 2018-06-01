<%-- 
    Document   : registerUser
    Created on : Apr 13, 2018, 6:39:12 PM
    Author     : user
--%>

<%@page import="ADM_helper.Emailer"%>
<%@page import="ADM_helper.MySession"%>
<%@page import="Formatter.FormatTarikh"%>
<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%@page import="org.json.JSONObject"%>
<%@page import="Formatter.PeriksaString"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String name = request.getParameter("name");
    String ic_no = request.getParameter("ic_no");
    String gender = request.getParameter("sex");
    String country = request.getParameter("country");
    String phone = request.getParameter("phone");
    String email = request.getParameter("email");
    String pwd = request.getParameter("pwd");
    String userID = request.getParameter("userID");
    String dob = request.getParameter("dob");

    //json object
    JSONObject json = new JSONObject();

    String[] katas = {name, ic_no, gender, country, phone, email, pwd, userID, dob};
    PeriksaString ps = new PeriksaString();
    if (ps.adaPipe(katas)) {
        json.put("isValid", false);
        json.put("msg", "Invalid data detected. Please refill the form!");
        out.print(json.toString());
        return;
    }

    Conn con = new Conn();
    String query = "Select user_id from adm_users where user_id='" + userID + "' limit 1;";
    if (con.getData(query).size() > 0) {
        json.put("isValid", false);
        json.put("msg", "User ID " + userID + " is already been used. Please enter different User ID");
        out.print(json.toString());
        return;
    }
    
    dob = FormatTarikh.formatDate(dob, "dd/MM/yyyy", "yyyy-MM-dd HH:mm:ss.ms");
    MySession mys = new MySession();
    String random = mys.getRandomSessionID();

    RMIConnector rmi = new RMIConnector();
    query = "INSERT INTO adm_users(`USER_ID`, `USER_NAME`, `STATUS`, `USER_TYPE`, `NEW_ICNO`, birth_date, `SEX_CODE`, `NATIONALITY_CODE`, `MOBILE_PHONE`, `EMAIL`, `PASSWORD`, `CREATED_DATE`,`HEALTH_FACILITY_CODE`, `START_DATE`, `END_DATE`, `USER_STATUS`) "
            + "VALUES('"+userID+"', '"+name+"', 'link', 'TENANT', '"+ic_no+"', '"+dob+"', '"+gender+"', '"+country+"',  '"+phone+"', '"+email+"', '"+pwd+"', now(), '???', now(), '9999-12-31 00:00:00', '"+random+"' );";
    
    if(rmi.setQuerySQL(con.HOST, con.PORT, query)){
        String token =random+"l0l"+userID;
        String link = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath()+"/TMS/control/linkActivate.jsp?token="+token;
        String message = "<h3>Good day dear "+name+"!</h3> "
                + "<br/><p>Thank you for registering with us.</p>"
                + "<br/><br/><p>Following are your ID information...</p>"
                + "<p>User ID: "+userID+"</p>"
                + "<p>IC Number: "+ic_no+"</p>"
                + "<p>Password: "+pwd+"</p>"
                + "<br/><p>To activate your account, <a href='"+link+"'>simply click this <b>link</b>.<a/></p>";
        String subject = "Account Activation Link";
        Emailer em = new Emailer(email, subject, message);
        em.sendTextEmail();
        json.put("isValid", true);
        json.put("msg", "Your registration is successful. Please activate your account by clicking the activation link  sent to "+email);
        
        out.print(json.toString());
        
    }
    else{
        json.put("isValid", false);
        json.put("msg", "Oops! Something went wrong.Please try again later.");
        
        out.print(json.toString());
        
    }
    
    
%>
