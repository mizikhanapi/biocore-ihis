<%-- 
    Document   : getDiagnosisStatistic
    Created on : Sep 18, 2017, 6:21:02 PM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    Conn con = new Conn();
    
    String query ="select ld.`Diagnosis_Cd`, i10.icd10_desc, count(ld.`Episode_Date`) as jumlah "
            + "from lhr_diagnosis ld "
            + "join icd10_codes i10 on i10.icd10_code=ld.`Diagnosis_Cd` "
            + "where ld.hfc_cd='"+hfc_cd+"' and extract(YEAR from ld.`Episode_Date`)=extract(YEAR from now()) "
            + "group by ld.`Diagnosis_Cd` "
            + "order by jumlah desc limit 10;";
    ArrayList<ArrayList<String>> dataStat = con.getData(query);
    
    try{

%>
<div class="text-center">
    <div class="bed-booking-title">Top <%=dataStat.size()%> Diagnosis</div>
    
    <div class="text-left text-info">
        <p>&nbsp;</p>
       <%
           for(int i=0; i<dataStat.size(); i++){
               
       %>
            <p><%=(i+1)%>. <%=dataStat.get(i).get(1)%> : <%=dataStat.get(i).get(2)%> cases</p>
       <%
            
            }//end for loop
       %>
    </div>
    
     
</div>
<%
        
    
    }//end try
    catch(Exception e){
        response.sendError(response.SC_INTERNAL_SERVER_ERROR);
    }
    
%>