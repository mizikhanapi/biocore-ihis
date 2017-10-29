<%-- 
    Document   : mcTable
    Created on : Apr 17, 2017, 3:25:01 PM
    Author     : user
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%

    Conn conn = new Conn();
    String mcType = request.getParameter("mcType");
    String mcInput = request.getParameter("mcInput");

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<hr class="pemisah" />

<table id="mcTableDivision1" class="table table-filter table-striped margin-top-50px" style="background: #fff; border: 1px solid #ccc; margin-top: 20px">

    <thead>

    <th> Nama </th>
    <th> Episode date </th>
    <th> PMI No </th>
    <th> Reprint </th>

    <%  String sql = "";
        if (mcType.equals("001")) {
            sql = "SELECT A.PATIENT_NAME , B.EPISODE_DATE, A.`PMI_NO`,B.start_date,B.end_date,B.comment,A.`NEW_IC_NO` FROM PMS_PATIENT_BIODATA A JOIN LHR_MED_LEAVE B ON A.`PMI_NO` = B.pmi_no WHERE A.PMI_NO = '" + mcInput + "'";
        } else if (mcType.equals("002")) {
            sql = "SELECT A.PATIENT_NAME , B.EPISODE_DATE, A.`PMI_NO`,B.start_date,B.end_date,B.comment,A.`NEW_IC_NO` FROM PMS_PATIENT_BIODATA A JOIN LHR_MED_LEAVE B ON A.`PMI_NO` = B.pmi_no WHERE A.NEW_IC_NO = '" + mcInput + "'";
        } else if (mcType.equals("003")) {
            sql = "SELECT A.PATIENT_NAME , B.EPISODE_DATE, A.`PMI_NO`,B.start_date,B.end_date,B.comment,A.`NEW_IC_NO` FROM PMS_PATIENT_BIODATA A JOIN LHR_MED_LEAVE B ON A.`PMI_NO` = B.pmi_no WHERE A.OLD_IC_NO = '" + mcInput + "'";
        } else {
            sql = "SELECT A.PATIENT_NAME , B.EPISODE_DATE, A.`PMI_NO`,B.start_date,B.end_date,B.comment,A.`NEW_IC_NO` FROM PMS_PATIENT_BIODATA A JOIN LHR_MED_LEAVE B ON A.`PMI_NO` = B.pmi_no WHERE A.ID_NO = '" + mcInput + "'";
        }
        ArrayList<ArrayList<String>> mc = conn.getData(sql);

        int size = mc.size();
        for (int i = 0; i < size; i++) {
    %>
</thead>
<tr>
    <td id="name"><%= mc.get(i).get(0)%></td>
    <td id="episodeDate2"><%= mc.get(i).get(1)%>
        <input type="hidden" id="episodeDate2_<%=i%>" value="<%= mc.get(i).get(1)%>">
    </td>
    <td id="pmino"><%= mc.get(i).get(2)%></td>
    <td>
        <input name="b_print" id="b_print<%=i%>" type="button" class="btn btn-success" value=" Print " data-toggle="modal" data-target="#basicModal">

        <script>
            $('#b_print<%=i%>').click(function () {

                $.ajax({
                    async: true,
                    type: "POST",
                    url: "mcReport.jsp",
                    data: {'name': "<%=mc.get(i).get(0)%>",
                        'episode': "<%=mc.get(i).get(1)%>",
                        'pmi': "<%=mc.get(i).get(2)%>",
                        'start_date': "<%=mc.get(i).get(3)%>",
                        'end_date': "<%=mc.get(i).get(4)%>",
                        'comment': "<%=mc.get(i).get(5)%>",
                        'ic': "<%=mc.get(i).get(6)%>"},
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
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title">Sijil Cuti Sakit</h3>
            </div>
            <div class="modal-body">
                <div id="test"></div>
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <input name="b_print" id="b_print" type="button" class="btn btn-success btn-lg" value=" Approve ">        
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-default btn-lg" data-dismiss="modal">Close</button>     
                    </div>
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
        var popupWin = window.open('', '_blank');
        popupWin.document.open();
        popupWin.document.write('<html><head><title>Print MC</title></head><body>' + divElements + '</body></html>');
        popupWin.document.close();
        popupWin.focus();
        popupWin.print();
        popupWin.close();
    }
</script>
