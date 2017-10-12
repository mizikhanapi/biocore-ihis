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
    String dis_cd = request.getParameter("dis_cd");
    
    String sql = "SELECT subdiscipline_name,subdiscipline_cd FROM adm_subdiscipline WHERE subdiscipline_hfc_cd = '"+hfc_cd+"' AND discipline_cd = '"+dis_cd+"';";
    ArrayList<ArrayList<String>> data = Conn.getData(sql);
    
    if(data.size() > 0){
        %>
        <div class="form-group"> 
        <select class="form-control" id="subdis_code" name="subdis_code" placeholder="Select Discipline" required>
            <option disabled selected>Select Hospital/Clinic</option>
            <%

           
                    for (int i = 0; i < data.size(); i++) {%>
            <option value="<%=data.get(i).get(1)%>"><%=data.get(i).get(0)%></option>
            <% }
            

            %>
        </select>
        </div>
        <%
    }else{
 
}
    
%>