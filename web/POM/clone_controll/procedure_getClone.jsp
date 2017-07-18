<%-- 
    Document   : procedure_getClone
    Created on : Jul 18, 2017, 11:40:51 PM
    Author     : Ardhi Surya; rdsurya147@gmail.com; insta: @rdcfc
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    
    Conn con = new Conn();
    
    try{
        //                          0                1
        String query ="SELECT procedure_cd, procedure_name "
                + "FROM cis_procedure "
                + "where hfc_cd = '99_iHIS_99' and procedure_cd not in "
                + "(Select procedure_cd from cis_procedure where hfc_cd = '"+hfc_cd+"');";
        
        ArrayList<ArrayList<String>> clone = con.getData(query);
        
        if(clone.size() > 0){
            
            for(int i=0; i<clone.size(); i++){
       
%>
<option value="<%= clone.get(i).get(0)%>">(<%= clone.get(i).get(0)%>) <%= clone.get(i).get(1)%></option>
<%
            }//end for loop
        
        }
        else{
            out.print("<option disabled>Your procedure level 1 is up to date with our central data.</option>");
        }
    
    }
    catch(Exception e){
        System.out.println("Clone POM level 1: " +e.toString());
        e.printStackTrace();
        out.print("Oops!");
    }
    
%>
