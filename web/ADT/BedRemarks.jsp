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
                String sqlbedRemarks = "SELECT  a.ward_class_name, b.ward_name,  a.hfc_cd, a.ward_class_code,b.ward_class_code,  b.ward_id  FROM wis_ward_class a LEFT JOIN wis_ward_name b ON a.ward_class_code = b.ward_class_code  where a.hfc_cd = '" + hfc + "'";

            ArrayList<ArrayList<String>> databedRemarks = conn.getData(sqlbedRemarks);

            int sizeR = databedRemarks.size();
            for (int i = 0; i < sizeR; i++) {
            %>
        <div class="col-md-4" width="5%">

    <table id="wardBedTable"  class="table table-bordered"  >
          


        <tr>
            <th colspan="2" bgcolor="#a6a6a6"><%= databedRemarks.get(i).get(0) + " | " + databedRemarks.get(i).get(1)%></th>

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