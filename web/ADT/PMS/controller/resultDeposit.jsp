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

<div id="depDiv">
    <%

        Conn conn = new Conn();
    %>
    <%
        String disb = request.getParameter("Dis");
        String wnameb = request.getParameter("wname");
        String WardTypeb = request.getParameter("WardType");
        String citizen = request.getParameter("citizen");
        String non_citizen = request.getParameter("non_citizen");
        String pensioner = request.getParameter("pensioner");
        
        
        
        
        
        
        
        
        
        
        

        String deposit = "SELECT  citizen_deposit, non_citizen_deposit, pensioner_deposit FROM wis_ward_name WHERE "
                + "discipline_cd =' " + disb + "'  ward_class_code = ' " + WardTypeb + "' AND ward_id =  '" + wnameb + "'  ";
        ArrayList<ArrayList<String>> dataDeposit = conn.getData(deposit);
        int dep = dataDeposit.size();
        for (int i = 0; i < dep; i++) {

            if (deposit == citizen) {
    %>
    <input id="Deposit" type="hidden" value="<%= dataDeposit.get(i).get(0)%>">

    <%

    } else if (deposit == non_citizen) {
    %>
    <input id="Deposit" type="hidden" value="<%= dataDeposit.get(i).get(1)%>">

    <%

    } else if (deposit == pensioner) {

    %>
    <input id="Deposit" type="hidden" value="<%= dataDeposit.get(i).get(2)%>">

    <%
            }

        }


    %>
</div>

<script>
    $(function () {
        $('#depDiv').on('click', '.bed button', function () {

            var Deposit;
            $('#Deposit').val(Deposit);


        });
    });

</script>