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



    <table id="wardBedTable"  border = "border" cellspacing="0" width="30%">

 <tr>
     <th colspan="2" bgcolor="#808080"></th>
           
        </tr>

        <tr>
            <th bgcolor="#33cc33">A</th>
            <td bgcolor="#33cc33">AVAILABLE</td>
        </tr>

        <tr>

            <th bgcolor="#ffff99">AB</th>
            <td bgcolor="#ffff99">AVAILABLE BUT BOOKED</td>
        </tr>


        <tr>

            <th bgcolor="#ff5050">D</th>
            <td bgcolor="#ff5050">DISCHARGED</td>
        </tr>
        <tr>

            <th bgcolor="#ffcc99">DB</th>
            <td bgcolor="#ffcc99">DISCHARGED BUT BOOKED</td>
        </tr>
        <tr>

            <th bgcolor="#3399ff">M</th>
            <td bgcolor="#3399ff">OCCUPIED MALE</td>
        </tr>
        <tr>

            <th bgcolor="#ffc0cb">F</th>
            <td bgcolor="#ffc0cb">OCCUPIED FEMALE</td>
        </tr>
        </tr>



        <tr>




        </tr>

    </table>
</div>

<div id="remarksBedTable" class="form-group">



    <table id="remarksTable"  border = "border" cellspacing="0" width="30%">



        <tr>
            <th bgcolor="#33cc33">A</th>
            <td bgcolor="#33cc33">AVAILABLE</td>
        </tr>

        <tr>

            <th bgcolor="#ffff99">AB</th>
            <td bgcolor="#ffff99">AVAILABLE BUT BOOKED</td>
        </tr>


        <tr>

            <th bgcolor="#ff5050">D</th>
            <td bgcolor="#ff5050">DISCHARGED</td>
        </tr>
        <tr>

            <th bgcolor="#ffcc99">DB</th>
            <td bgcolor="#ffcc99">DISCHARGED BUT BOOKED</td>
        </tr>
        <tr>

            <th bgcolor="#3399ff">M</th>
            <td bgcolor="#3399ff">OCCUPIED MALE</td>
        </tr>
        <tr>

            <th bgcolor="#ffc0cb">F</th>
            <td bgcolor="#ffc0cb">OCCUPIED FEMALE</td>
        </tr>
        </tr>



        <tr>




        </tr>

    </table>
</div>