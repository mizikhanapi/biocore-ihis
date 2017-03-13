<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="Config.connect"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!--    <input type="text" id="test">-->

<%
//    Config.getBase_url(request);
//    Config.getFile_url(session);
//    Conn conn = new Conn();
%>
<%
    String sqlBedID = "SELECT bed_id ,bed_status FROM wis_bed_id ORDER BY bed_id";
    ArrayList<ArrayList<String>> dataBedID = conn.getData(sqlBedID);
    ArrayList<String> data = dataBedID.get(0);

%>
<div id="bedDiv">
    <table id="tableBed">
        <tbody>
            <%  int count = 0;
                String sqlBedID1 = "SELECT bed_id ,bed_status FROM wis_bed_id ORDER BY bed_id";
                ArrayList<ArrayList<String>> dataBedID1 = conn.getData(sqlBedID1);

                int a = dataBedID1.size();

//                int z = a % 2;
//
//                //out.print("z" +z );
//                if (z > 0) {
//                    a = a + 1;
//                }
                //out.print("a"  +a);

                //int a = (int) Math.round(dataBedID1.size() / 4); //+ 1;
                //out.print(dataBedID1.size() / 3);
                for (int i = 0; i < a; i++) { %>
        <div class="col-md-1" id="bedCol">
            <%
                //int x = (dataBedID1.size() / a) + 1;
                //out.print(x);
                for (int b = 0; b < dataBedID1.size() / a; b++) { %>

            <div class="bed"><%
                            if (dataBedID.get(count).get(1).equals("Available")) {%>
                            <button style="background-color: #bada55"  type="button"  class="btn btn-default" id="bed_<%=count%>">&nbsp; <%= dataBedID.get(count).get(0)%> </button>
                <input id="bedID" name="bedID" type="hidden"  class="form-control input-md" value="<%=String.join("|", dataBedID.get(count))%>">

                <%   } else if (dataBedID.get(count).get(1).equals("Occupied")) {%>
                <button style="background-color: #FA424A" type="button"  disabled class="btn btn-default" id="bed_occu<%=count%>">&nbsp; <%= dataBedID.get(count).get(0)%> </button>
                <input id="bedID" name="bedID" type="hidden"  class="form-control input-md" value="<%=String.join("|", dataBedID.get(count))%>">

                <% } else if (dataBedID.get(count).get(1).equals("Pending")) {%>
                <button style="background-color: #FEB405"  type="button" disabled class="btn btn-default" id="bed_pen<%=count%>">&nbsp; <%= dataBedID.get(count).get(0)%> </button>
                <input id="bedID" name="bedID" type="hidden"  class="form-control input-md" value="<%=String.join("|", dataBedID.get(count))%>">

                <% } %>
                <%
                    count += 1;

                %></div>
                <%   } %>
        </div>
        <%    }
        %>
        </tbody>
    </table>
</div>
<script>
    $(function(){
         $('#bedDiv').on('click', '#tableBed button', function () {
        var row = $(this).closest("div");
        //var str = $('#bedID').val();
        var te = row.find('#bedID').val();

        var array = te.split("|");

        var status = array[1], bedID = array[0];
        //alert(te);
        bootbox.alert({
            message: "The bed status : " + status +
                    ",  the bed ID: " + bedID,
            title: "Process Result",
            backdrop: true
        });

        if (status === "Available") {

            //set value
            $('#BedIDReg').val(bedID);
        }



    });
    

    });
   
</script>