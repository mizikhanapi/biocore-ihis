<%-- 
    Document   : getDrugStatistic
    Created on : Sep 19, 2017, 9:54:22 AM
    Author     : Ardhi Surya; rdsurya147@gmail.com; insta:@rdcfc
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    Conn con = new Conn();
    String query="select lm.drug_cd, md.d_trade_name, sum(lm.quantity) as jumlah "
            + "from lhr_medication lm "
            + "join pis_mdc2 md on md.ud_mdc_code=lm.drug_cd and md.hfc_cd=lm.hfc_cd "
            + "where lm.hfc_cd='"+hfc_cd+"' and date_format(lm.episode_date, '%Y')=date_format(now(), '%Y') "
            + "group by lm.drug_cd order by jumlah desc limit 10;";
    ArrayList<ArrayList<String>> dataStat = con.getData(query);
    
    try{
 %>
<div class="text-center">
    <div class="bed-booking-title">Top <%=dataStat.size()%> Drugs</div>
    
    <div class="text-left text-info">
        <p>&nbsp;</p>
       <%
           for(int i=0; i<dataStat.size(); i++){
               
       %>
            <p><%=(i+1)%>. <%=dataStat.get(i).get(1)%> : <%=dataStat.get(i).get(2)%> units</p>
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