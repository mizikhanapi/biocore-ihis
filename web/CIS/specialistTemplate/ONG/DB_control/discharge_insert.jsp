<%-- 
    Document   : discharge_insert
    Created on : Oct 9, 2017, 4:08:58 PM
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
    
    String queryCheck="SELECT pmi_no FROM lhr_ong_discharge_baby where infant_tag_no='"+tagNo+"' and hfc_cd='"+hfc_cd+"' limit 1;";
    ArrayList<ArrayList<String>> dataDup = con.getData(queryCheck);
    
    if(dataDup.size()>0){
        out.print("Discharge letter for infant with tag "+tagNo+" is already existed. Please insert different tag number.");
    }
    else{
        RMIConnector rmi = new RMIConnector();
        disDate = FormatTarikh.formatDate(disDate+" "+disTime, "dd/MM/yyyy HH:mm", "yyyy-MM-dd HH:mm:ss");
        
        String query="INSERT INTO lhr_ong_discharge_baby(pmi_no, hfc_cd, episode_date, encounter_date, infant_tag_no, new_ic_no, guardian_name, home_address, relationship_with_infant, `discharge_dateTime`, staff_id_on_duty, created_by, created_date,picture_baby,picture_with_mother) "
                + "VALUES('"+pmiNo+"', '"+hfc_cd+"', '"+epDate+"', now(), '"+tagNo+"', '"+ic_no+"', '"+name+"', '"+address+"', '"+relation+"', '"+disDate+"', '"+staff_id+"', '"+creator+"', now(),'"+pictureBaby+"','"+pictureBabyMother+"' );";
        
        boolean isSuccess = rmi.setQuerySQL(con.HOST, con.PORT, query);
        
        String queryDua = "Update lhr_ong_personal_info set status = '1' where pmi_no = '"+pmiNo+"' and hfc_cd='"+hfc_cd+"' and status = '0'";
        boolean isSuccessDua = rmi.setQuerySQL(con.HOST, con.PORT, queryDua);
        
        if(isSuccess)
            out.print("success");
        else
            out.print("fail");
    }  
%>
