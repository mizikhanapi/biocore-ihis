<%-- 
    Document   : psTable
    Created on : Apr 25, 2017, 3:07:58 AM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="Config.Config"%>

<%
    Config.getBase_url(request);
    Config.getFile_url(session);
    Conn conn = new Conn();
    String psType = request.getParameter("psType");
    String psInput = request.getParameter("psInput");

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="../assets/header.html"%>
<hr class="pemisah" />
<table id="psTableDivision1" class="table table-filter table-striped table-bordered margin-top-50px" style="background: #fff; border: 1px solid #ccc; margin-top: 20px">

    <thead>

    <th> Name </th>
    <th> Date </th>
    <th> PMI NO </th>
    <th> Reprint </th>

    <%  String sql = "";
        if (psType.equals("001")) {
            sql = "SELECT A.`PATIENT_NAME`, B.`ORDER_DATE`, A.`PMI_NO` FROM PMS_PATIENT_BIODATA A JOIN PIS_ORDER_MASTER B ON A.`PMI_NO` = B.`PMI_NO` WHERE A.PMI_NO = '" + psInput + "'";
        } else if (psType.equals("002")) {
            sql = "SELECT A.`PATIENT_NAME`, B.`ORDER_DATE`, A.`PMI_NO` FROM PMS_PATIENT_BIODATA A JOIN PIS_ORDER_MASTER B ON A.`PMI_NO` = B.`PMI_NO` WHERE A.NEW_IC_N0 = '" + psInput + "'";
        } else if (psType.equals("003")) {
            sql = "SELECT A.`PATIENT_NAME`, B.`ORDER_DATE`, A.`PMI_NO` FROM PMS_PATIENT_BIODATA A JOIN PIS_ORDER_MASTER B ON A.`PMI_NO` = B.`PMI_NO` WHERE A.OLD.IC_NO = '" + psInput + "'";
        } else {
            sql = "SELECT A.`PATIENT_NAME`, B.`ORDER_DATE`, A.`PMI_NO` FROM PMS_PATIENT_BIODATA A JOIN PIS_ORDER_MASTER B ON A.`PMI_NO` = B.`PMI_NO` WHERE A.ID_NO = '" + psInput + "'";
        }
        ArrayList<ArrayList<String>> ps = conn.getData(sql);

        int size = ps.size();
        for (int i = 0; i < size; i++) {
    %>
</thead>
<tr>
    <td id="name"><%= ps.get(i).get(0)%></td>
    <td id="episodeDate2"><%= ps.get(i).get(1)%>
        <input type="hidden" id="episodeDate2_<%=i%>" value="<%= ps.get(i).get(1)%>">
    </td>
    <td id="pmino"><%= ps.get(i).get(2)%></td>
    <td>
        <input name="b_print" id="b_print<%=i%>" type="button" class="btn btn-success" value=" Print " data-toggle="modal" data-target="#basicModal">

        <script>
            $('#b_print<%=i%>').click(function () {

                $.ajax({
                    async: true,
                    type: "POST",
                    url: "PrescriptionSheetReport.jsp",
                    data: {'name': "<%= ps.get(i).get(0)%>", 'episode': "<%= ps.get(i).get(1)%>", 'pmi': "<%= ps.get(i).get(2)%>"},
                    timeout: 10000,
                    success: function (list) {

                        $("#test").val(list.trim());
                        $('#test').html(list);
                        $('#test').trigger('contentchanged');
                        //printReport();
                    },
                    error: function (xhr, status, error) {
                        var err = eval("(" + xhr.responseText + ")");
                        bootbox.alert(err.Message);
                    }
                });

            });

        </script>

    </td>

</tr>



<%
    }
%>
</table>
<div class="modal fade" id="basicModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <input name="b_print" id="b_print" type="button" class="btn btn-success" value=" Print ">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
            </div>
            <br>
            <div class="modal-body">
                <div id="test">

                </div> 
            </div>

        </div>
    </div>
</div>
<script>

    $(document).ready(function () {
        $('#psTableDivision1').DataTable({
            dom: 'Bfrtip',
            buttons: [
                'csv', 'excel', 'pdf', 'print'
            ]
        });

        $('#b_print').click(function () {
            printReport();
        });
    });
</script>
<script language="javascript">



    function printReport() {
        var divElements = $('#test').html();
        var popupWin = window.open('', '_blank', 'width=1200,height=500');
        popupWin.document.open();
        popupWin.document.write('<html><body onload="window.print()">' + divElements + '</html>');
        popupWin.document.close();
    }
</script>