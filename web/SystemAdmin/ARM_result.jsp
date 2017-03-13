<%-- 
    Document   : ARM_result
    Created on : Feb 20, 2017, 3:08:32 AM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn conn = new Conn();
    String adminHFC = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String process = request.getParameter("process");
    String user = request.getParameter("user");
    String hfc = request.getParameter("hfc");
    String discipline = request.getParameter("discipline");
    
    
    if(process.equalsIgnoreCase("user")){
        
        String searchProblem = "SELECT user_id, user_name, health_facility_code FROM adm_users WHERE  (user_id like '%"+user+"%' OR user_name like '%"+user+"%') AND health_facility_code = '"+adminHFC+"' ";
        ArrayList<ArrayList<String>> search = conn.getData(searchProblem);
        if (search.size() > 0)
        {
        %>
        <ul id="ARM_user_matchlist" style="width: 300px; height: 100%; max-height: 200px; overflow: auto">
        <% 
            for (int i = 0; i < search.size(); i++)
            {
            %>
                <li data-hfc="<%=search.get(i).get(2)%>"><a style="cursor:pointer"><%=search.get(i).get(0)%> | <%=search.get(i).get(1)%></a></li>
            <%
            }
        %>
        </ul>

    <%}else{%>
    <span>No Record Found!</span>
    <% 
        }
    
    }else if(process.equalsIgnoreCase("discipline")){

        String sql = "select discipline_cd, discipline_name from adm_discipline "
                    + "where discipline_cd in(select discipline_cd from adm_hfc_discipline where hfc_cd = '"+hfc+"')";

        ArrayList<ArrayList<String>> list = conn.getData(sql);
        
        if(list.size() <= 0){
        
            %>  
                <option  value="" >-- Select the discipline --</option>
                <option value="-"> - </option>
            <%
            
        }else{
        
            %>
            <option  value="" >-- Select the discipline --</option>
            <option value="-"> - </option>
            <%
            
             for(int i =0; i < list.size(); i++){
        
            %><option value="<%=list.get(i).get(0)%>"><%=list.get(i).get(1)%></option>><%
        
            }
        
        }
    
    }else if(process.equalsIgnoreCase("subdiscipline")){

        String sql = "Select a.subdiscipline_cd, subdiscipline_name from adm_hfc_discipline a join adm_subdiscipline using(subdiscipline_cd) "
                    + "where hfc_cd = '"+hfc+"' AND a.discipline_cd = '"+discipline+"' order by subdiscipline_name";

        ArrayList<ArrayList<String>> list = conn.getData(sql);
        
        if(list.size() <= 0){
        
            %>
            <option  value="" >-- Select the subdiscipline --</option>
            <option value="-"> - </option>
            <%
            
        }else{
        
            %>
            <option  value="" >-- Select the subdiscipline --</option>
            <option value="-"> - </option>
            <%
            
             for(int i =0; i < list.size(); i++){
        
            %><option value="<%=list.get(i).get(0)%>"><%=list.get(i).get(1)%></option><%
        
            }
        
        }

    }
    
%>
