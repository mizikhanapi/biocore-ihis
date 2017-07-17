<%-- 
    Document   : DLT_getClone
    Created on : Jul 17, 2017, 3:55:54 PM
    Author     : Ardhi Surya; rdsurya147@gmail.com; insta: @rdcfc
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    
    String masterCode = request.getParameter("masterCode");
    String masterName = request.getParameter("masterName");
    
    
    Conn con = new Conn();
    
    try{
        //                          0                           1                   2
        String query ="SELECT `Master_Reference_code`, `Detail_Reference_code`, `Description` FROM adm_lookup_detail "
                + "WHERE hfc_cd ='99_iHIS_99' and `Master_Reference_code`='"+masterCode+"' and `Detail_Reference_code` not in "
                + "(Select `Detail_Reference_code` from adm_lookup_detail where `Master_Reference_code`='"+masterCode+"' and hfc_cd = '"+hfc_cd+"');";
        
        ArrayList<ArrayList<String>> clone = con.getData(query);
        
        if(clone.size() > 0){
            
            for(int i=0; i<clone.size(); i++){
       
%>
<option value="<%= clone.get(i).get(1)%>">(<%= clone.get(i).get(1)%>) <%= clone.get(i).get(2)%></option>
<%
            }//end for loop
        
        }
        else{
            out.print("<option disabled>Your lookup detail for "+masterName+" is up to date</option>");
        }
    
    }
    catch(Exception e){
        System.out.println("Clone lookup detail: " +e.toString());
        e.printStackTrace();
        out.print("Oops!");
    }
    
%>


