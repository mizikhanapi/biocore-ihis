<%-- 
    Document   : procedure1_getClone
    Created on : Jul 19, 2017, 12:04:01 AM
    Author     : Ardhi Surya; rdsurya147@gmail.com; insta: @rdcfc
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    
    Conn con = new Conn();
    
    try{
        //                          0                1                          2
        String query ="SELECT c1.procedure_1_cd, c1.procedure_1_name, c.procedure_name "
                + "FROM cis_procedure_1 c1 "
                + "join cis_procedure c on c.procedure_cd=c1.procedure_cd and c.hfc_cd=c1.hfc_cd "
                + "where c1.hfc_cd = '99_iHIS_99' and c1.procedure_1_cd not in "
                + "(Select procedure_1_cd from cis_procedure_1 where hfc_cd = '"+hfc_cd+"');";
        
        ArrayList<ArrayList<String>> clone = con.getData(query);
        
        if(clone.size() > 0){
            
            for(int i=0; i<clone.size(); i++){
       
%>
<option value="<%= clone.get(i).get(0)%>">(<%= clone.get(i).get(0)%>) <%= clone.get(i).get(2)%> - <%= clone.get(i).get(1)%></option>
<%
            }//end for loop
        
        }
        else{
            out.print("<option disabled>Your procedure level 2 is up to date with our central data.</option>");
        }
    
    }
    catch(Exception e){
        System.out.println("Clone POM level 2: " +e.toString());
        e.printStackTrace();
        out.print("Oops!");
    }
    
%>

