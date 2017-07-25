<%-- 
    Document   : search_procedure
    Created on : Jun 13, 2017, 6:02:16 PM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    String key = request.getParameter("key");
    
    Conn con = new Conn();
    String query ="select ifnull(cp2.`PROCEDURE_2_CD`, ifnull(cp1.`PROCEDURE_1_CD`, cp.`PROCEDURE_CD`)) as code, "
            + "cp.`PROCEDURE_NAME`, ifnull(cp1.`PROCEDURE_1_NAME`, ''), ifnull(cp2.`PROCEDURE_2_NAME`, '') "
            + "from cis_procedure cp "
            + "left join cis_procedure_1 cp1 on cp1.`PROCEDURE_CD` = cp.`PROCEDURE_CD` and cp1.hfc_cd = cp.hfc_cd "
            + "left join cis_procedure_2 cp2 on cp2.`PROCEDURE_1_CD` = cp1.`PROCEDURE_1_CD` and cp2.hfc_cd = cp1.hfc_cd "
            + "where cp.hfc_cd = '"+hfc_cd+"' and "
            + "(concat(cp2.`PROCEDURE_2_CD`, '|', cp2.procedure_2_name) like '%"+key+"%' "
            + "or concat(cp1.`PROCEDURE_1_CD`, '|', cp1.procedure_1_name)  like '%"+key+"%' "
            + "or concat(cp.`PROCEDURE_CD`, '|', cp.procedure_name) like '%"+key+"%');";
    
    ArrayList<ArrayList<String>> dataPom = con.getData(query);
    
    
    
    if(dataPom.size() < 1){
        out.print("<span>No procedure found. Try different word.</span>");
    }
    else{
    
        out.print("<ul id='matchlist' style='width: 200px; max-height: 300px; height: 100%; overflow: auto'>");
        for(int i=0; i<dataPom.size(); i++){
        
            String proName="";
            proName = dataPom.get(i).get(1);
            if(!dataPom.get(i).get(2).equalsIgnoreCase("")){
                proName += "-"+dataPom.get(i).get(2);
                if(!dataPom.get(i).get(3).equalsIgnoreCase("")){
                    proName += "-"+dataPom.get(i).get(3);
                }// end if level 3
            }// end if level 2
            out.print("<li>"+dataPom.get(i).get(0) + " | "+ proName+"</li>");
        }// end for <ul>
        
        out.print("</ul>");
    }
    
%>
