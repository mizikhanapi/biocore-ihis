<%-- 
    Document   : procedure_getClone
    Created on : Jul 18, 2017, 10:49:16 PM
    Author     : Ardhi Surya; rdsurya147@gmail.com; insta: @rdcfc
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    
    Conn con = new Conn();
    
    try{
        //                          0                1
        String query ="select pro.ris_procedure_cd, pro.ris_procedure_name "
                + "from ris_procedure_master pro "
                + "join ris_modality md on pro.modality_cd=md.modality_cd and md.hfc_cd='"+hfc_cd+"' "
                + "join ris_body_system bs on bs.body_system_cd=pro.body_system_cd and bs.hfc_cd='"+hfc_cd+"' "
                + "where pro.hfc_cd='99_iHIS_99' and pro.ris_procedure_cd not in "
                + "(Select ris_procedure_cd from ris_procedure_master WHERE hfc_cd='"+hfc_cd+"');";
        
        ArrayList<ArrayList<String>> clone = con.getData(query);
        
        if(clone.size() > 0){
            
            for(int i=0; i<clone.size(); i++){
       
%>
<option value="<%= clone.get(i).get(0)%>">(<%= clone.get(i).get(0)%>) <%= clone.get(i).get(1)%></option>
<%
            }//end for loop
        
        }
        else{
            out.print("<option disabled>Your procedure is up to date with our central data.</option>");
        }
    
    }
    catch(Exception e){
        System.out.println("Clone RIS procedure: " +e.toString());
        e.printStackTrace();
        out.print("Oops!");
    }
    
%>
