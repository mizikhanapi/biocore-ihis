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
    String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    
    if(process.equalsIgnoreCase("role")){
        
        String sql = "Select role_code, role_name from adm_role "
                + "where role_code not in(Select role_code from adm_responsibility WHERE health_facility_code = '"+hfc_cd+"') "
                + "AND hfc_cd = '"+hfc_cd+"' and status='0'";
        
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

/*
select p.system_code, p.module_code, p.page_code, p.page_name
from adm_page p
join adm_module m on m.module_code=p.module_code and m.system_code=p.system_code and m.status=p.status
join adm_system s on s.system_code=p.system_code and s.status=p.status
where p.status='0';

Select system_code, module_code, page_code, page_name from adm_page order by page_code
*/
    
        //                           0      1               2           3
        String sql = "select p.system_code, p.module_code, p.page_code, p.page_name "
                    + "from adm_page p "
                    + "join adm_module m on m.module_code=p.module_code and m.system_code=p.system_code and m.status=p.status "
                    + "join adm_system s on s.system_code=p.system_code and s.status=p.status "
                    + "where p.status='0' order by p.page_code;";
        
        ArrayList<ArrayList<String>> dataPage = conn.getData(sql);
        
        if(dataPage.size() <= 0){
        
            %>
            <option disabled>No data available</option>
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