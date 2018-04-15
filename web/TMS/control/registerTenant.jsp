<%-- 
    Document   : registerTenant
    Created on : Apr 15, 2018, 10:07:10 AM
    Author     : user
--%>

<%@page import="main.RMIConnector"%>
<%@page import="ADM_helper.MySessionKey"%>
<%@page import="dBConn.Conn"%>
<%@page import="org.json.JSONObject"%>
<%@page import="Formatter.PeriksaString"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String user_id = (String) session.getAttribute(MySessionKey.USER_ID);
    if (user_id == null) {
        out.print("<h1>Invalid Link</h1>");
        return;
    }

    String code = request.getParameter("code");
    String name = request.getParameter("name");
    String add1 = request.getParameter("add1");
    String add2 = request.getParameter("add2");
    String add3 = request.getParameter("add3");
    String town = request.getParameter("town");
    String district = request.getParameter("district");
    String state = request.getParameter("state");
    String pos = request.getParameter("pos");
    String phone = request.getParameter("phone");
    String fax = request.getParameter("fax");
    String email = request.getParameter("email");

    PeriksaString ps = new PeriksaString();
    JSONObject json = new JSONObject();

    String[] katas = {code, name, add1, add2, add3, town, district, state, pos, phone, fax, email};
    if (ps.adaPipe(katas)) {
        json.put("msg", "<h3 class='text-danger'>Illegal data!</h3>");
        out.print(json.toString());
        return;
    }

    Conn con = new Conn();
    String query = "SELECT tnt_cd FROM adm_tenant WHERE tnt_cd='" + code + "' limit 1;";
    if (con.getData(query).size() > 0) {
        json.put("msg", "<b class='text-danger'>The code " + code + " is already used. Please enter different code.</b>");
        out.print(json.toString());
        return;
    }

    query = "INSERT INTO adm_tenant(tnt_cd, tnt_name, address1, address2, address3, town_cd, district_cd, state_cd, country_cd, telephone_no, fax_no, email, created_by, created_date, postcode) "
            + "VALUES('"+code+"', '"+name+"', '"+add1+"', '"+add2+"', '"+add3+"', '"+town+"', '"+district+"', '"+state+"', 'MY', '"+phone+"', '"+fax+"', '"+email+"', '"+user_id+"', now(), '"+pos+"' );";
    
    RMIConnector rmi = new RMIConnector();
    if(rmi.setQuerySQL(con.HOST, con.PORT, query)){
        json.put("msg", "Tenant is registered successfully.");
        json.put("url", "home.jsp");
        out.print(json.toString());
        session.setAttribute(MySessionKey.TENANT_CD, code);
        session.setAttribute(MySessionKey.TENANT_NAME, name);
        
        query = "UPDATE adm_users set `HEALTH_FACILITY_CODE`='"+code+"' WHERE `USER_ID`='"+user_id+"';";
        rmi.setQuerySQL(con.HOST, con.PORT, query);
    }
    else{
        json.put("msg", "<b class='text-danger'>Something went wrong. Please try again later.</b>");
        json.put("query", query);
        out.print(json.toString());
        
    }
    

%>
