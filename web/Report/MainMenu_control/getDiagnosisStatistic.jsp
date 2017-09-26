<%-- 
    Document   : getDiagnosisStatistic
    Created on : Sep 18, 2017, 6:21:02 PM
    Author     :  Ardhi Surya; rdsurya147@gmail.com; insta:@rdcfc
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>

<%
    Calendar calendar = Calendar.getInstance();
    int currentYear = calendar.get(Calendar.YEAR);
    DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        
    String startOfYear = currentYear+"-01-01 00:00:00";
    String curDate = sdf.format(calendar.getTime());
    
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    Conn con = new Conn();
    
    String query ="select ld.`Diagnosis_Cd`, ld.icd10_description, count(ld.`Episode_Date`) as jumlah "
            + "from lhr_diagnosis ld "
            + "where ld.hfc_cd='"+hfc_cd+"' and ld.`Episode_Date` between '"+startOfYear+"' and '"+curDate+"' "
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
               
                String diagName = dataStat.get(i).get(1);
                if(diagName.trim().equalsIgnoreCase("")){
                    diagName = dataStat.get(i).get(0);
                }
               
       %>
            <p><%=(i+1)%>. <%=diagName%> : <%=dataStat.get(i).get(2)%> cases</p>
       <%
            
            }//end for loop
       %>
    </div>
    
     
</div>
<%
        
    
    }//end try
    catch(Exception e){
        response.sendError(response.SC_INTERNAL_SERVER_ERROR, "Oops! Something went wrong. Please try again later.");
    }
    
%>