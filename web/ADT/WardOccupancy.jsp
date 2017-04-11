
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="Config.connect"%>
<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>

<%--<%@page contentType="text/html" pageEncoding="UTF-8"%>--%>

<%
//    String idTYpe = "select * from adm_lookup_detail where master_reference_code = '0012' ";
//    ArrayList<ArrayList<String>> dataIdType;
//    Conn conn = new Conn();
//    dataIdType = conn.getData(idTYpe);
//    String dataSystemStatus15 = session.getAttribute("SYSTEMSTAT").toString();


%>



<div class="row" id="transfer_Patient">
    <div class="col-md-12">


        <div id="searchPatientTransfer">
            <%@include file = "searchPatientTransfer.jsp" %>
        </div>



        <div id="searchWardTransfer">
            <%@include file = "searchWardTransfer.jsp" %>
        </div>

        <div class="text-center">
            <button id="clearSearch" name="clearSearch" type="button" class="btn btn-default"><i class="fa fa-ban fa-lg"></i>&nbsp; Clear</button>
            <button id="button2id" name="button2id" type="button" class="btn btn-success "><i class="fa fa-user fa-lg"></i>&nbsp; Read MyKad Info</button>

        </div>
        </br>

        </form>
    </div>

    </br>


    <div id="OccuTable">

    </div>



</div>

<!--</div>-->

<!--</div>-->
<!-- main -->		

<!--</div>-->





<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://www.w3schools.com/lib/w3data.js"></script>-->





</body>



<script>

//s
//    $("#searchWardTransfer").load("searchWardTransfer.jsp");
//    $("#searchPatientTransfer").load("searchPatientTransfer.jsp");
    //$("#OccuTable").load("testtable.jsp");


</script>
