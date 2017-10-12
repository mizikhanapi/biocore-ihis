<%-- 
    Document   : getSelectDiscipline
    Created on : Oct 11, 2017, 6:10:37 PM
    Author     : -D-
--%>

<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%
    Conn Conn = new Conn();
    String hfc_cd = request.getParameter("hfc_cd");
    
    String sql = "SELECT discipline_name,discipline_cd FROM adm_discipline WHERE discipline_hfc_cd = '"+hfc_cd+"';";
    ArrayList<ArrayList<String>> data = Conn.getData(sql);
    
    if(data.size() > 0){
        %>
        <div class="form-group"> 
            <select class="form-control" id="dis_code" name="dis_code" placeholder="Select Discipline" required >
            <option disabled selected>Select Hospital/Clinic</option>
            <%

           
                    for (int i = 0; i < data.size(); i++) {%>
            <option value="<%=data.get(i).get(1)%>"><%=data.get(i).get(0)%></option>
            <% }
            

            %>
        </select>
        </div>
        
        <%
    }
    
%>