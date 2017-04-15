
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="Config.connect"%>
<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>



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


    <div id="WardOccuTable" class="form-group">

    </div>



</div>





</body>


