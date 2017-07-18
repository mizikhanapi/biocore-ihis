<%-- 
    Document   : bodySystem_getClone
    Created on : Jul 18, 2017, 5:50:22 PM
    Author     : Ardhi Surya; rdsurya147@gmail.com; insta: @rdcfc
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    
    Conn con = new Conn();
    
    try{
        //                          0                1
        String query ="SELECT body_system_cd, body_system_name "
                + "FROM ris_body_system "
                + "where hfc_cd = '99_iHIS_99' and body_system_cd not in "
                + "(Select body_system_cd from ris_body_system where hfc_cd = '"+hfc_cd+"');";
        
        ArrayList<ArrayList<String>> clone = con.getData(query);
        
        if(clone.size() > 0){
            
            for(int i=0; i<clone.size(); i++){
       
%>
<option value="<%= clone.get(i).get(0)%>">(<%= clone.get(i).get(0)%>) <%= clone.get(i).get(1)%></option>
<%
            }//end for loop
        
        }
        else{
            out.print("<option disabled>Your lookup detail for body system is up to date with our central data.</option>");
        }
    
    }
    catch(Exception e){
        System.out.println("Clone body system: " +e.toString());
        e.printStackTrace();
        out.print("Oops!");
    }
    
%>