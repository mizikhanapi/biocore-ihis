<%-- 
    Document   : ARM_result
    Created on : Feb 20, 2017, 3:08:32 AM
    Author     : user
--%>

<%@page import="ADM_helper.MySession"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn conn = new Conn();
    String adminHFC = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String user_id = session.getAttribute("USER_ID").toString();
    
    MySession mys = new MySession(user_id, adminHFC);
        
    String process = request.getParameter("process");
    //String user = request.getParameter("user");
    String hfc = request.getParameter("hfc");
    String discipline = request.getParameter("discipline");
    
    
    if(process.equalsIgnoreCase("user")){
        
        String whereClause = "";
        if(!mys.isSuperUser()){
        
            whereClause = " AND health_facility_code = '"+adminHFC+"' ";
        }
        
        String searchProblem = "Select user_id, user_name from adm_users where user_name is not null AND "
                + "user_id in (Select user_id from adm_user_access_role where role_code = '-x-') "
                +whereClause
                + "order by user_name, user_id";
        ArrayList<ArrayList<String>> search = conn.getData(searchProblem);
        if (search.size() > 0)
        {
        
            for (int i = 0; i < search.size(); i++)
            {
            %>
                <option value="<%= search.get(i).get(0)%>">(<%= search.get(i).get(0)%>) <%= search.get(i).get(1)%></option>
            <%
            }

       }else{
    %>
    <option disabled>No new user found!</option>
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
