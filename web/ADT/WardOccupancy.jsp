<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="Config.connect"%>
<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>



<div class="row" id="transfer_Patient">

    <div class="col-md-6" style="border-right: 1px solid #ddd;">
        <h4>Search patient by ID <button id="button2id" name="button2id" class="btn btn-success pull-right disabled"><i class="fa fa-user fa-lg"></i>&nbsp; Read MyKad Info</button> </h4>
        
        <div id="searchPatientTransfer">
            <%@include file = "searchPatientTransfer.jsp" %>
        </div>
    </div>

    <div class="col-md-6">
        <h4>Search patient by Ward </h4>
        <div id="searchWardTransfer">
            <%@include file = "searchWardTransfer.jsp" %>
        </div>
    </div>

<!--    <div class="row ">
        <div class="col-md-12">
            <div class="text-center margin-top-30px">
                <button id="clearSearch" name="clearSearch" type="button" class="btn btn-default"><i class="fa fa-ban fa-lg"></i>&nbsp; Clear</button>
                <button id="button2id" name="button2id" type="button" class="btn btn-success "><i class="fa fa-user fa-lg"></i>&nbsp; Read MyKad Info</button>
            </div> 
        </div>
    </div>-->

</div>
<div id="WardOccuTable" class="form-group"></div>
<script src="ReportLibraries/js/bootstrap.min.js" type="text/javascript"></script>
<script src="ReportLibraries/js/bootbox.min.js" type="text/javascript"></script>
<script src="ReportLibraries/js/jquery.dataTables.min.js"></script>
<script src="ReportLibraries/js/dataTables.bootstrap.min.js" type="text/javascript"></script>
<script src="ReportLibraries/js/dataTables.buttons.min.js" type="text/javascript"></script>
<script src="ReportLibraries/js/buttons.flash.min.js" type="text/javascript"></script>
<script src="ReportLibraries/js/jszip.min.js" type="text/javascript"></script>
<script src="ReportLibraries/js/pdfmake.min.js" type="text/javascript"></script>
<script src="ReportLibraries/js/vfs_fonts.js" type="text/javascript"></script>
<script src="ReportLibraries/js/buttons.html5.min.js" type="text/javascript"></script>
<script src="ReportLibraries/js/buttons.print.min.js" type="text/javascript"></script>
<script src="ReportLibraries/js/buttons.colVis.min.js" type="text/javascript"></script>
<script src="ReportLibraries/js/papaparse.min.js"></script>
<script src="ReportLibraries/js/jquery.multi-select.js" type="text/javascript"></script>