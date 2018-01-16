<%-- 
    Document   : ViewClinicDay
    Created on : Sep 14, 2017, 8:20:33 PM
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
    String hfc = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    String hfc_state_name = null;
    String hfc_state_code = null;

    /*
    String sqlDisplayClinic = "SELECT d.*, sub.description AS subdiscipline_name FROM adm_lookup_detail sub,"
            + " (SELECT c.*, al.description AS discipline_name FROM adm_lookup_detail al, "
            + "(SELECT b.*,hfc.description AS hfc_name FROM adm_lookup_detail hfc,"
            + " (SELECT t.*,ld.description AS state_name FROM adm_lookup_detail ld,  "
            + "(SELECT state_code, hfc_cd, day_cd, discipline_cd, subdiscipline_cd, start_time, end_time, status FROM pms_clinic_day WHERE hfc_cd = '" + hfc + "' )t "
            + " WHERE t.state_code=ld.`Detail_Reference_code` AND ld.`Master_Reference_code` = '0002' AND ld.hfc_cd = '" + hfc + "')b  "
            + "WHERE hfc.Master_Reference_code='0081' AND hfc.Detail_Reference_code = b.hfc_cd AND hfc.hfc_cd = '" + hfc + "')c"
            + "  WHERE al.`Master_Reference_code`='0072' AND al.`Detail_Reference_code` = c.discipline_cd AND al.hfc_cd = '" + hfc + "')d  "
            + "WHERE sub.`Master_Reference_code` = '0071' AND sub.`Detail_Reference_code` = d.subdiscipline_cd  AND sub.hfc_cd = '" + hfc + "'"
            + " ORDER BY state_name ASC";
    */
     String sqlDisplayClinic="SELECT cli.state_code, cli.hfc_cd, cli.day_cd, cli.discipline_cd, cli.subdiscipline_cd, cli.start_time, cli.end_time, cli.status, sta.`Description` as state_name, hfc.hfc_name, dis.discipline_name, sub.subdiscipline_name "
            + "FROM pms_clinic_day cli "
            + "JOIN adm_health_facility hfc on hfc.hfc_cd=cli.hfc_cd "
            + "LEFT JOIN adm_discipline dis on dis.discipline_hfc_cd=cli.hfc_cd and dis.discipline_cd=cli.discipline_cd "
            + "LEFT JOIN adm_subdiscipline sub on sub.subdiscipline_hfc_cd=cli.hfc_cd and sub.discipline_cd=cli.discipline_cd and sub.subdiscipline_cd=cli.subdiscipline_cd "
            + "JOIN adm_lookup_detail sta on sta.hfc_cd=cli.hfc_cd and sta.`Detail_Reference_code`=cli.state_code and sta.`Master_Reference_code`='0002' "
            + "WHERE cli.hfc_cd='"+hfc+"' Order By state_name;";
    ArrayList<ArrayList<String>> dataClinicDay = Conn.getData(sqlDisplayClinic);

    String sql_hfc_state = "SELECT ld.`Description`, hf.state_cd FROM adm_health_facility hf  INNER JOIN adm_lookup_detail ld ON ld.`Detail_Reference_code` = hf.state_cd WHERE hf.hfc_cd = '" + hfc + "' AND ld.hfc_cd = '04010101' AND ld.`Master_Reference_code` = '0002'";
    ArrayList<ArrayList<String>> data_hfc_state = Conn.getData(sql_hfc_state);

    hfc_state_code = data_hfc_state.get(0).get(1);
    hfc_state_name = data_hfc_state.get(0).get(0);

    String sql_hfc_list = " SELECT hfc_cd,hfc_name FROM adm_health_facility WHERE state_cd = '" + hfc_state_code + "'  ";
    ArrayList<ArrayList<String>> data_hfc_list = Conn.getData(sql_hfc_list);

    String e7 = null;

    String stateCode = null;
%>


    <h3 class="headerTitle">View Clinic Day</h3>  
    <div class="table-responsive">
        <table class="table table-bordered table-hover">
            <thead>

                <tr> 
                    <th><center>No</center></th>
            <th><center>State</center></th>
            <th><center>Health Facility Name </center></th>
            <th><center>Discipline</center></th>
            <th><center>Subdiscipline</center></th>
            <th><center>Clinic Day</center></th>
            <th><center>Start Time</center></th>
            <th><center>End Time</center></th>
            <!--<th><center>Status</center></th>-->
            </tr>
            </thead>
            <tbody>
                <%
                    if (dataClinicDay.size() > 0) {
                        for (int i = 0; i < dataClinicDay.size(); i++) {%> 
                <tr>
                    <td><center><%out.print(i + 1);%></center></td>
            <td><left><%=dataClinicDay.get(i).get(8)%></left></td>
            <td><left><%=dataClinicDay.get(i).get(9)%></left></td>
            <td><left><%=dataClinicDay.get(i).get(10)%></left></td>
            <td><left><%=dataClinicDay.get(i).get(11)%></left></td>
            <td><left><%=dataClinicDay.get(i).get(2)%></left></td>
            <td><center><%=dataClinicDay.get(i).get(5)%></center></td>
            <td><center><%=dataClinicDay.get(i).get(6)%></center></td>
            </tr>
            <%
                    }
                }%>
            </tbody>
        </table>
    </div>
