<%-- 
    Document   : discharge_update
    Created on : Oct 10, 2017, 11:41:44 AM
    Author     : Ardhi Surya; rdsurya147@gmail.com; @rdcfc
--%>

<%@page import="Formatter.FormatTarikh"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    String pmiNo = (String) session.getAttribute("patientPMINo");
    String epDate = (String) session.getAttribute("episodeDate");
    
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    String dis_cd = (String) session.getAttribute("DISCIPLINE_CODE");
    String sub_cd = (String) session.getAttribute("SUB_DISCIPLINE_CODE");
    String creator = (String) session.getAttribute("USER_ID");
    
    String name= request.getParameter("name");
    String ic_no= request.getParameter("ic_no");
    String address= request.getParameter("address");
    String relation= request.getParameter("relation");
    String tagNo= request.getParameter("tagNo");
    String disDate= request.getParameter("disDate");
    String disTime= request.getParameter("disTime");
    String staff_id= request.getParameter("staff_id");
    String pictureBaby= request.getParameter("pictureBaby");
    String pictureBabyMother= request.getParameter("pictureBabyMother");
    
    Conn con = new Conn();
    RMIConnector rmi = new RMIConnector();
    
    disDate = FormatTarikh.formatDate(disDate+" "+disTime, "dd/MM/yyyy HH:mm", "yyyy-MM-dd HH:mm:ss");
    
    String query="UPDATE lhr_ong_discharge_baby set new_ic_no='"+ic_no+"', guardian_name='"+name+"', home_address='"+address+"', relationship_with_infant='"+relation+"', `discharge_dateTime`='"+disDate+"', staff_id_on_duty='"+staff_id+"', picture_baby='"+pictureBaby+"',picture_with_mother='"+pictureBabyMother+"' "
            + "WHERE pmi_no='"+pmiNo+"' and hfc_cd='"+hfc_cd+"' and infant_tag_no='"+tagNo+"'; ";
    boolean isSuccess = rmi.setQuerySQL(con.HOST, con.PORT, query);
    
    if(isSuccess)
        out.print("success");
    else
        out.print("fail");
%>
