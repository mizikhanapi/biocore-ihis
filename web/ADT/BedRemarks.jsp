<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="Config.connect"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>



<div id="wardTable" class="form-group">

    <div class="row">
<%
                Conn conn44 = new Conn();
                String hfcASS = session.getAttribute("HEALTH_FACILITY_CODE").toString();
                String sqlbedSum = "SELECT  d.discipline_name ,  b.ward_class_name,c.ward_name, a.bed_id,a.bed_status,  a.discipline_cd,  a.ward_class_code, a.ward_id,  a.hfc_cd,b.ward_class_code,  c.ward_id, d.discipline_cd FROM wis_bed_id a LEFT JOIN wis_ward_class b ON a.ward_class_code = b.ward_class_code LEFT JOIN wis_ward_name c ON a.ward_id = c.ward_id LEFT JOIN adm_discipline d ON a.discipline_cd = d.discipline_cd where a.hfc_cd = '"+hfcASS+"'";
                
                ArrayList<ArrayList<String>> databedSum = conn44.getData(sqlbedSum);

                int size29 = databedSum.size();
                for (int i = 0; i < size29; i++) {
            %>
        <div class="col-md-4" width="5%">

    <table id="wardBedTable"  class="table table-bordered"  >
          


        <tr>
            <th colspan="2" bgcolor="#a6a6a6"><%= databedSum.get(i).get(2)%></th>

        </tr>

        <tr>
            <th style="background:#33cc33">A</th>
            <td style="background:#33cc33">1</td>
        </tr>

        <tr>

            <th style="background:#ffff99">P</th>
            <td style="background:#ffff99">0</td>
        </tr>


        <tr>

            <th style="background:#ff5050">O</th>
            <td style="background:#ff5050">0</td>
        </tr>
        



        <tr>


            <th bgcolor="#a6a6a6"> Total</th>
            <td bgcolor="#a6a6a6">2</td>


        </tr>
         </table>
</div>
       
         <%
            }

        %>

    
</div>
        </br>
         </div>

<div id="remarksBedTable" class="form-group">



    <table id="remarksTable"  class="table table-bordered"  width="30%" cellspacing="0">



        <tr>
            <th bgcolor="#33cc33">A</th>
            <td bgcolor="#33cc33">AVAILABLE</td>
        </tr>

        <tr>

            <th bgcolor="#ffff99">P</th>
            <td bgcolor="#ffff99">PENDING</td>
        </tr>


        <tr>

            <th bgcolor="#ff5050">O</th>
            <td bgcolor="#ff5050">OCCUPIED</td>
        </tr>
       

    </table>
</div>