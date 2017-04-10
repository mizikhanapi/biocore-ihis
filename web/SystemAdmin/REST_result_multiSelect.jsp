<%-- 
    Document   : REST_result_multiSelect
    Created on : Mar 18, 2017, 11:38:18 AM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    String roleCode = request.getParameter("roleCode");
    String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    
    Conn conn = new Conn();
    
    String sqlexistingPageRole = "Select page_code from adm_responsibility where role_code = '"+roleCode+"' AND health_facility_code = '"+hfc_cd+"'";
    
    ArrayList<ArrayList<String>> dataCurRolePage = conn.getData(sqlexistingPageRole);
    
    ArrayList<String> curPages = new ArrayList<String>();
    
    for(int i = 0; i < dataCurRolePage.size(); i++){
        
        curPages.add(dataCurRolePage.get(i).get(0));
    
    }
    
    
    
    
    //                      0               1           2           3       
    String sql = "Select system_code, module_code, page_code, page_name from adm_page order by page_code";
    

    ArrayList<ArrayList<String>> dataPage = conn.getData(sql);
        if (dataPage.size() > 0)
        {
        
            for (int i = 0; i < dataPage.size(); i++)
            {
            %>
            <option <%if(curPages.contains(dataPage.get(i).get(2))){out.print("selected");}%> data-system="<%=dataPage.get(i).get(0)%>" data-module="<%=dataPage.get(i).get(1)%>" value="<%=dataPage.get(i).get(2)%>">(<%= dataPage.get(i).get(2)%>) <%= dataPage.get(i).get(3)%></option>
            <%
            }

       }else{
    %>
    <option disabled>No Record Found!</option>
    <% 
        }


%>
