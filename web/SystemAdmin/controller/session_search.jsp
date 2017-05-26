<%-- 
    Document   : session_search
    Created on : Apr 16, 2017, 1:49:01 AM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    String input = request.getParameter("input");
    String process = request.getParameter("process");
    
    
    Conn conn = new Conn();
    
    if(process.equalsIgnoreCase("hfc")){
        
        String sql = "Select hfc_cd, hfc_name FROM adm_health_facility WHERE concat(hfc_cd, ' | ', hfc_name) like '%"+input+"%'";
        ArrayList<ArrayList<String>> search = conn.getData(sql);
        
        if(search.size() > 0){
        
            %><ul id="SS_hfc_matchlist" style="width: 300px; max-height: 200px; height: 100%; overflow: auto"><%
            for(int i = 0; i < search.size(); i++){
            
                %>
                <li><a style="cursor:pointer"><%=search.get(i).get(0)%> | <%=search.get(i).get(1)%></a></li>
                <%
            
            
            }
            %>
            </ul>
            <%
        
        }else{
        
            %>
                <span>No Record Found!</span>
            <%
        
        }
    
    
    }else if(process.equalsIgnoreCase("discipline")){

        String hfc_cd = request.getParameter("hfc_cd");
        
        String sql = "Select distinct(d.discipline_cd), d.discipline_name FROM adm_discipline d "
+ "join adm_hfc_discipline hd on d.discipline_cd = hd.discipline_cd AND hd.hfc_cd = '"+hfc_cd+"' "
+ "WHERE d.discipline_hfc_cd = '"+hfc_cd+"' AND  concat(d.discipline_cd, ' | ', d.discipline_name) like '%"+input+"%' ";
        ArrayList<ArrayList<String>> search = conn.getData(sql);
        
        if(search.size() > 0){
        
            %><ul id="SS_discipline_matchlist" style="width: 300px; max-height: 200px; height: 100%; overflow: auto"><%
            for(int i = 0; i < search.size(); i++){
            
                %>
                <li><a style="cursor:pointer"><%=search.get(i).get(0)%> | <%=search.get(i).get(1)%></a></li>
                <%
            
            
            }    
            %>
            </ul>
            <%
        }else{
            
            %>
                <span>No Record Found!</span>
            <%
        
        }        
    
    }else if(process.equalsIgnoreCase("subdiscipline")){
        String hfc_cd = request.getParameter("hfc_cd");
        String disciplineCode = request.getParameter("discipline_cd");
        
        String sql = "Select s.subdiscipline_cd, s.subdiscipline_name FROM adm_subdiscipline s "
+ "join adm_hfc_discipline hd on s.subdiscipline_cd = hd.subdiscipline_cd AND hd.hfc_cd = '"+hfc_cd+"'"
+ "WHERE s.discipline_cd = '"+disciplineCode+"' AND s.subdiscipline_hfc_cd = '"+hfc_cd+"' AND (concat(s.subdiscipline_cd, ' | ', s.subdiscipline_name) like '%"+input+"%')";
        ArrayList<ArrayList<String>> search = conn.getData(sql);
        
        if(search.size() > 0){
        
            %><ul id="SS_subdiscipline_matchlist" style="width: 300px; max-height: 200px; height: 100%; overflow: auto"><%
            for(int i = 0; i < search.size(); i++){
            
                %>
                <li><a style="cursor:pointer"><%=search.get(i).get(0)%> | <%=search.get(i).get(1)%></a></li>
                <%
            
            
            }    
            %>
            </ul>
            <%
        }else{
            
            %>
                <span>No Record Found!</span>
            <%
        
        }        

    }


%>
