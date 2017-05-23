<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%
    String wcode = request.getParameter("wclasscode");
    String hfc = request.getParameter("hfc");
    Conn conn = new Conn();
    String sql312 = "SELECT ward_id, ward_name FROM wis_ward_name where hfc_cd = '" + hfc + "'and ward_class_code ='"+wcode+"'";
    ArrayList<ArrayList<String>> dataID = conn.getData(sql312);
%>
<select id="wname" name="selectbasic" class="form-control">
    <option value="null" selected="" disabled="">Select Ward ID/Name</option>
    <%        
        int size312 = dataID.size();
        for (int i = 0; i < size312; i++) {
    %>
    <option value="<%= dataID.get(i).get(0)%>"><%= dataID.get(i).get(0)%> ( <%= dataID.get(i).get(1)%> ) </option>
    <%
        }
    %>
</select>