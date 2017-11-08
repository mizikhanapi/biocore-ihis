<%@page import="ADM_helper.MySessionKey"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%
    String wcode = request.getParameter("ward");
    String hfcAS = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis_cd = (String) session.getAttribute(MySessionKey.DISCIPLINE_CD);
    Conn conn = new Conn();
//    String sql312 = "SELECT ward_id, ward_name FROM wis_ward_name where hfc_cd = '" + hfcAS + "'and ward_class_code ='"+wcode+"'";
    String sql312 = "SELECT ward_id, ward_name FROM wis_ward_name where hfc_cd = '" + hfcAS + "'and ward_class_code ='"+wcode+"' AND discipline_cd='"+dis_cd+"' ;";
    ArrayList<ArrayList<String>> dataID = conn.getData(sql312);
%>
<select id="Ward_ID" name="selectbasic" class="form-control">
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
<script>
     $('#Ward_ID').on('change', function () {
            console.log($('#Ward_ID').val());
            var BedID = $('#BedID').val();
            BedID += $('#Ward_ID').val() + "/";
            $('#BedID').val(BedID);
        });
</script>