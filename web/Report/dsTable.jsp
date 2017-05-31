<%-- 
    Document   : dsTable
    Created on : Apr 25, 2017, 3:49:31 AM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="Config.Config"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../assets/header.html"%>
<hr class="pemisah" />

<table id="mcTableDivision1" class="table table-filter table-striped margin-top-50px" style="background: #fff; border: 1px solid #ccc; margin-top: 20px">

    <thead>

    <th> Name </th>
    <th> Episode date </th>
    <th> PMI No </th>
    <th> Reprint </th>
<%
    Config.getBase_url(request);
    Config.getFile_url(session);
    Conn conn = new Conn();
    String dsType = request.getParameter("dsType");
    String dsInput = request.getParameter("dsInput");

    String sql = "";
    if (dsType.equals("001")) {
        sql = "SELECT A.`PATIENT_NAME`, B.`ORDER_DATE`, A.`PMI_NO` FROM PMS_PATIENT_BIODATA A JOIN PIS_ORDER_MASTER B ON A.`PMI_NO` = B.`PMI_NO` WHERE A.PMI_NO = '" + dsInput + "'";
    } else if (dsType.equals("002")) {
        sql = "SELECT A.`PATIENT_NAME`, B.`ORDER_DATE`, A.`PMI_NO` FROM PMS_PATIENT_BIODATA A JOIN PIS_ORDER_MASTER B ON A.`PMI_NO` = B.`PMI_NO` WHERE A.NEW_IC_N0 = '" + dsInput + "'";
    } else if (dsType.equals("003")) {
        sql = "SELECT A.`PATIENT_NAME`, B.`ORDER_DATE`, A.`PMI_NO` FROM PMS_PATIENT_BIODATA A JOIN PIS_ORDER_MASTER B ON A.`PMI_NO` = B.`PMI_NO` WHERE A.OLD_IC_NO = '" + dsInput + "'";
    } else {
        sql = "SELECT A.`PATIENT_NAME`, B.`ORDER_DATE`, A.`PMI_NO` FROM PMS_PATIENT_BIODATA A JOIN PIS_ORDER_MASTER B ON A.`PMI_NO` = B.`PMI_NO` WHERE A.ID_NO = '" + dsInput + "'";
    }
    ArrayList<ArrayList<String>> ds = conn.getData(sql);

    int size = ds.size();
     for (int i = 0; i < size; i++) {
           // String episodeDate = ds.get(i).get(1);
%>
</thead>
<tr>
    <td id="name"><%= ds.get(i).get(0)%></td>
    <td id="episodeDate2"><%= ds.get(i).get(1)%>
        <input type="hidden" id="episodeDate2_<%=i%>" value="<%= ds.get(i).get(1)%>">
    </td>
    <td id="pmino"><%= ds.get(i).get(2)%></td>
    <td>
        <input name="b_print" id="b_print<%=i%>" type="button" class="btn btn-success" value=" Print " data-toggle="modal" data-target="#basicModal">
        
        <script>
            $('#b_print<%=i%>').click(function () {

                $.ajax({
                    async: true,
                    type: "POST",
                    url: "DispensSheetReport.jsp",
                    data: {'name': "<%= ds.get(i).get(0)%>", 'episode': "<%= ds.get(i).get(1)%>", 'pmi': "<%= ds.get(i).get(2)%>"},
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
                <div class="modal-header">
                    <input name="b_print" id="b_print" type="button" class="btn btn-success" value=" Print ">
                    <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>

                </div>
                <br>
                <div id="test">

                </div>



            </div>
        </div>
    </div>
</div>

<script>

    $(document).ready(function () {
        $('#mcTableDivision1').DataTable({
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