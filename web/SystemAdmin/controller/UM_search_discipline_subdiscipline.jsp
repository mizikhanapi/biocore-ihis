<%-- 
    Document   : UM_search_discipline_subdiscipline
    Created on : Apr 8, 2017, 5:23:26 PM
    Author     : user
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    String hfc = request.getParameter("hfc");
    String dis = request.getParameter("discipline");
    String key = request.getParameter("searchKey");
    String process = request.getParameter("process");

    Conn conn = new Conn();
    
    if(process.equalsIgnoreCase("discipline")){
        String query = "Select distinct(a.discipline_cd), a.discipline_name from adm_discipline a "
                + "join adm_hfc_discipline b on a.discipline_cd = b.discipline_cd AND a.discipline_status = b.hfc_discipline_status AND a.discipline_hfc_cd = b.hfc_cd "
                + "WHERE a.discipline_status = '0' AND b.hfc_cd = '"+hfc+"' AND concat(a.discipline_cd, ' | ', a.discipline_name) like '%"+key+"%' "
                + "order by a.discipline_name";
        
        ArrayList<ArrayList<String>> dataDis = conn.getData(query);
        
        if(dataDis.size() > 0){
            
            %>
            <ul id="UM_discipline_matchlist" style="width: 300px; height: 100%; max-height: 100px; overflow: auto">
            <%        
            
            for(int i = 0; i < dataDis.size(); i++){
                
                %>
                <li><a style="cursor:pointer"><%=dataDis.get(i).get(0)%> | <%=dataDis.get(i).get(1)%></a></li>
                
                <%
            
            }
        
        
        }else{
        %>
        <span>No Record Found!</span>
        <%
        }
    
    
    }else if(process.equalsIgnoreCase("subdiscipline")){

        String query = "Select a.subdiscipline_cd, a.subdiscipline_name "
                + "from adm_subdiscipline a "
                + "join adm_hfc_discipline b on a.subdiscipline_cd = b.subdiscipline_cd AND a.subdiscipline_status = b.hfc_discipline_status AND a.subdiscipline_hfc_cd = b.hfc_cd AND a.discipline_cd=b.discipline_cd "
                + "WHERE a.subdiscipline_status = '0' AND b.hfc_discipline_status = '0' AND b.hfc_cd = '"+hfc+"' AND b.discipline_cd = '"+dis+"' AND concat(a.subdiscipline_cd, ' | ', a.subdiscipline_name) like '%"+key+"%'";
        
        ArrayList<ArrayList<String>> dataDis = conn.getData(query);
        
        if(dataDis.size() > 0){
            
            %>
            <ul id="UM_subdiscipline_matchlist" style="width: 300px; height: 100%; max-height: 100px; overflow: auto">
            <%        
            
            for(int i = 0; i < dataDis.size(); i++){
                
                %>
                <li><a style="cursor:pointer"><%=dataDis.get(i).get(0)%> | <%=dataDis.get(i).get(1)%></a></li>
                
                <%
            
            }
        
        
        }else{
        %>
        <span>No Record Found!</span>
        <%
        }
    
    
    }


%>