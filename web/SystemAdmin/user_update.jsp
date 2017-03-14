<%-- 
    Document   : user_update
    Created on : Feb 20, 2017, 1:32:17 AM
    Author     : user
--%>
<%@page import="Formatter.DateFormatter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Conn conn = new Conn();
    String process = request.getParameter("process");
    String name = request.getParameter("name");
    String title = request.getParameter("title");
    String icNo = request.getParameter("icNo");
    String email = request.getParameter("email");
    String userID = request.getParameter("userID");
    String hfc = request.getParameter("hfc");
    String password = request.getParameter("password");
    String dob = request.getParameter("dob");
    String gender = request.getParameter("gender");
    String occupation = request.getParameter("occupation");
    String nationality = request.getParameter("nationality");
    String officeTel = request.getParameter("officeTel");
    String homeTel = request.getParameter("homeTel");
    String mobilePhone = request.getParameter("mobilePhone");
    String faxNo = request.getParameter("faxNo");
    String userIDCategory = request.getParameter("userIDCategory");
    String userType = request.getParameter("userType");
    String userGroup = request.getParameter("userGroup");
    String userClass = request.getParameter("userClass");
    String startDate = request.getParameter("startDate");
    String endDate = request.getParameter("endDate");
    String userIDStatus = request.getParameter("userIDStatus");
    String mother = request.getParameter("mother");
    String roomNo = request.getParameter("roomNo");

    RMIConnector rmic = new RMIConnector();

    if (process.equalsIgnoreCase("password")) {

        String sqlInsert = "UPDATE adm_users set password = '"+password+"' Where user_id = '"+userID+"'";

        boolean isInsert = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

        if (isInsert == true) {
            out.print("Success");
        } else {
            out.print("Failed");
        }
        
       return;

    }

    dob = DateFormatter.formatDate(dob, "dd/MM/yyyy", "yyyy-MM-dd HH:mm:ss.ms");
    startDate = DateFormatter.formatDate(startDate, "dd/MM/yyyy", "yyyy-MM-dd HH:mm:ss.ms");
    endDate = DateFormatter.formatDate(endDate, "dd/MM/yyyy", "yyyy-MM-dd HH:mm:ss.ms");

    String sqlInsert = "UPDATE adm_users set health_facility_code='" + hfc + "', user_name='" + name + "', occupation_code='" + occupation + "', "
            + "birth_date='" + dob + "', sex_code ='" + gender + "', new_icno='" + icNo + "', home_phone='" + homeTel + "', office_phone='" + officeTel + "', "
            + "mobile_phone ='" + mobilePhone + "', fax_no ='" + faxNo + "', email='" + email + "', id_category_code='" + userIDCategory + "', start_date='" + startDate + "', end_date='" + endDate + "',"
            + " title='" + title + "', nationality_code='" + nationality + "', user_type='" + userType + "', user_group ='" + userGroup + "', user_classification_code='" + userClass + "', status='" + userIDStatus + "', "
            + "mother_name = '" + mother + "', room_no = '"+roomNo+"' WHERE user_id ='" + userID + "'";

    boolean isInsert = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

    if (isInsert == true) {
        out.print("Success");
    } else {
        out.print("Failed");
    }


%>

