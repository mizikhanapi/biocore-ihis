<%-- 
    Document   : ADM_result
    Created on : Feb 14, 2017, 6:29:20 PM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@include file="validateSession.jsp" %>


<%
    String input = request.getParameter("input");
    String process = request.getParameter("process");
    String disciplineCode = request.getParameter("disciplineCode");
    String hfc_cd = request.getParameter("hfc_cd");
    
    Conn conn = new Conn();
    
    if(process.equalsIgnoreCase("hfc")){
        
        String sql = "Select hfc_cd, hfc_name FROM adm_health_facility WHERE concat(hfc_cd, ' | ', hfc_name) like '%"+input+"%' and hfc_status='0';";
        ArrayList<ArrayList<String>> search = conn.getData(sql);
        
        if(search.size() > 0){
        
            %><ul id="ADM_hfc_matchlist" style="width: 300px; max-height: 200px; height: 100%; overflow: auto"><%
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
        
        String sql = "Select discipline_cd, discipline_name FROM adm_discipline "
                    + "WHERE  concat(discipline_cd, ' | ', discipline_name) like '%"+input+"%' and discipline_hfc_cd = '"+hfc_cd+"' and discipline_status='0';";
        ArrayList<ArrayList<String>> search = conn.getData(sql);
        
        if(search.size() > 0){
        
            %><ul id="ADM_discipline_matchlist" style="width: 300px; max-height: 200px; height: 100%; overflow: auto"><%
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
        
        String sql = "Select subdiscipline_cd, subdiscipline_name FROM adm_subdiscipline "
                    + "WHERE discipline_cd = '"+disciplineCode+"' AND subdiscipline_hfc_cd = '"+hfc_cd+"' AND (concat(subdiscipline_cd, ' | ', subdiscipline_name) like '%"+input+"%') AND subdiscipline_status='0';";
        ArrayList<ArrayList<String>> search = conn.getData(sql);
        
        if(search.size() > 0){
        
            %><ul id="ADM_subdiscipline_matchlist" style="width: 300px; max-height: 200px; height: 100%; overflow: auto"><%
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
