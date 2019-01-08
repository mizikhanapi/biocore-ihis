<%-- 
    Document   : addContent
    Created on : 07-Jan-2019, 17:59:57
    Author     : Shay
--%>

<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%
    String tajuk = request.getParameter("title");
    String isi = request.getParameter("content");
    String tarikh = request.getParameter("date");
    String gambo = request.getParameter("img");
    String idContent = request.getParameter("contentId");
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    String dis_cd = (String) session.getAttribute("DISCIPLINE_CODE");
    String sub_dis = (String) session.getAttribute("SUB_DISCIPLINE_CODE");
    String user_id = (String) session.getAttribute("USER_ID");
    boolean isSuccess = false;

    Conn con = new Conn();
    RMIConnector rmi = new RMIConnector();
    
    String sql = "";
    
    if(idContent.equalsIgnoreCase("") || idContent.isEmpty() || (idContent.length() < 0) ){
        sql = "INSERT INTO qcs_calling_system_content (cs_hfc_cd,"
            + "cs_discipline,"
            + "cs_sub_discipline,"
            + "cs_episode_date,"
            + "cs_title,"
            + "cs_content,"
            + "cs_date,"
            + "cs_modified_by,"
            + "cs_img) VALUES('"
            + hfc_cd + "',"
            + "'" + dis_cd + "',"
            + "'" + sub_dis + "',"
            + "now(),"
            + "'" + tajuk + "',"
            + "'" + isi + "',"
            + "STR_TO_DATE('" + tarikh + "', '%d/%m/%Y'),'" + user_id + "','" + gambo + "')";
    }else{
        sql = "UPDATE qcs_calling_system_content SET cs_title='" + tajuk + "',cs_content='" + isi + "',cs_date=STR_TO_DATE('" + tarikh + "', '%d/%m/%Y'),cs_modified_by='" + user_id + "',cs_img='" + gambo + "' WHERE id = '"+idContent+"'";
    }
    isSuccess = rmi.setQuerySQL(con.HOST, con.PORT, sql);
    
    if (isSuccess) {
        out.print("success");
    } else {
        out.print("fail");
        //out.print(sql);
    }
%>