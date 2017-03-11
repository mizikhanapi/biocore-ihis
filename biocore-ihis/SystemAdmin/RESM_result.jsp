<%-- 
    Document   : RESM_result
    Created on : Mar 1, 2017, 10:39:26 AM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Conn conn = new Conn();
    String process = request.getParameter("process");
    
    if(process.equalsIgnoreCase("role")){
        
        String sql = "Select role_code, role_name from adm_role";
        
        ArrayList<ArrayList<String>> dataRole = conn.getData(sql);
        
        %><option value="">--Select Role--</option><%
        
        if(dataRole.size() <= 0){
        
            %>
            <option value="-">-</option>
            <%
        
        }else{
            
            
            for(int i = 0; i < dataRole.size(); i++){

            %>
            
            <option value="<%=dataRole.get(i).get(0)%>"><%=dataRole.get(i).get(1)%></option>
            <%
            }
            
        
        }
    
    
    }else{ 
    
        //                           0      1               2           3
        String sql = "Select system_code, module_code, page_code, page_name from adm_page order by page_code";
        
        ArrayList<ArrayList<String>> dataPage = conn.getData(sql);
        
        %><option value="">--Select Page--</option><%
        
        if(dataPage.size() <= 0){
        
            %>
            <option value="-">-</option>
            <%
        
        }else{
            
            
            for(int i = 0; i < dataPage.size(); i++){

            %>
            
            <option data-system="<%=dataPage.get(i).get(0)%>" data-module="<%=dataPage.get(i).get(1)%>" value="<%=dataPage.get(i).get(2)%>"><%=dataPage.get(i).get(2)+" | "+dataPage.get(i).get(3)%></option>
            <%
            }
            
        
        }
      
    
    }

%>