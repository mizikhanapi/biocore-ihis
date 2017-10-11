<%-- 
    Document   : retrieveGuardian
    Created on : Oct 9, 2017, 12:42:56 PM
    Author     : Ardhi Surya; rdsurya147@gmail.com; @rdcfc
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
     String pmiNo = (String) session.getAttribute("patientPMINo");
     String leic_no = request.getParameter("ic_no");
     
     Conn con = new Conn();
     
     String whereCondition = "`PMI_NO`='"+pmiNo+"'";
     
     if(!leic_no.equalsIgnoreCase("")){
         whereCondition=" new_ic_no='"+leic_no+"'";
     }
   
     //                         0              1            2               3                   4                   5                   6                   7           
     String query="SELECT `PATIENT_NAME`, `NEW_IC_NO`, `HOME_ADDRESS`, `HOME_TOWN_CODE`, `HOME_DISTRICT_CODE`, `HOME_STATE_CODE`, `HOME_COUNTRY_CODE`, `HOME_POSTCODE` "
             + "FROM pms_patient_biodata where "+whereCondition
             + " limit 1;";
    ArrayList<ArrayList<String>> dataPat = con.getData(query);
    
    String address="", name="", ic_no="";
    
    if(dataPat.size()>0){
        address= dataPat.get(0).get(2)+" "+dataPat.get(0).get(3)+" "+ dataPat.get(0).get(4)+" \n"+dataPat.get(0).get(7)+" "+dataPat.get(0).get(5)+" "+dataPat.get(0).get(6);
        name=dataPat.get(0).get(0);
        ic_no=dataPat.get(0).get(1);
    }
    
    out.print(name+"x-RD-split"+ic_no+"x-RD-split"+address);
     
%>
