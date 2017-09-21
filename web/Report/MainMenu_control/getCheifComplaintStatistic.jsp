<%-- 
    Document   : getCheifComplaintStatistic
    Created on : Sep 19, 2017, 9:34:53 AM
    Author     : Ardhi Surya; rdsurya147@gmail.com; insta:@rdcfc
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    Conn con = new Conn();
    String query="select ls.symptom_cd, cc.`RCC_DESC`, count(ls.episode_date) as jumlah "
            + "from lhr_signs ls "
            + "join readcode_chief_complaint cc on cc.`RCC_CD`=ls.symptom_cd "
            + "where ls.hfc_cd='"+hfc_cd+"' and date_format(ls.episode_date, '%Y')=date_format(now(), '%Y') "
            + "group by ls.symptom_cd order by jumlah desc limit 10;";
    ArrayList<ArrayList<String>> dataStat = con.getData(query);
    
    try{
 %>
<div class="text-center">
    <div class="bed-booking-title">Top <%=dataStat.size()%> Chief Complaint</div>
    
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
