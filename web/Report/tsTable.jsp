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
    String tsType = request.getParameter("tsType");
    String tsInput = request.getParameter("tsInput");
//    String episodeDate2 = request.getParameter("episodeDate2");

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<hr class="pemisah" />
<table id="tsTableDivision1" class="table table-filter table-striped margin-top-50px" style="background: #fff; border: 1px solid #ccc; margin-top: 20px">

    <thead>

    <th> Name </th>
    <th> Episode date </th>
    <th> PMI No</th>
    <th> Reprint </th>
</thead>
<%  String sql = "";
    if (tsType.equals("001")) {
        sql = "SELECT A.PATIENT_NAME , B.EPISODE_DATE, A.`PMI_NO`,B.start_date,B.end_date,B.comment,A.`NEW_IC_NO` FROM PMS_PATIENT_BIODATA A JOIN LHR_MED_LEAVE B ON A.`PMI_NO` = B.pmi_no WHERE A.PMI_NO = '" + tsInput + "'";
    } else if (tsType.equals("002")) {
        sql = "SELECT A.PATIENT_NAME , B.EPISODE_DATE, A.`PMI_NO`,B.start_date,B.end_date,B.comment,A.`NEW_IC_NO` FROM PMS_PATIENT_BIODATA A JOIN LHR_MED_LEAVE B ON A.`PMI_NO` = B.pmi_no WHERE A.PMI_NO = '" + tsInput + "'";
    } else if (tsType.equals("003")) {
        sql = "SELECT A.PATIENT_NAME , B.EPISODE_DATE, A.`PMI_NO`,B.start_date,B.end_date,B.comment,A.`NEW_IC_NO` FROM PMS_PATIENT_BIODATA A JOIN LHR_MED_LEAVE B ON A.`PMI_NO` = B.pmi_no WHERE A.PMI_NO = '" + tsInput + "'";
    } else {
        sql = "SELECT A.PATIENT_NAME , B.EPISODE_DATE, A.`PMI_NO`,B.start_date,B.end_date,B.comment,A.`NEW_IC_NO` FROM PMS_PATIENT_BIODATA A JOIN LHR_MED_LEAVE B ON A.`PMI_NO` = B.pmi_no WHERE A.ID_NO = '" + tsInput + "'";
    }
    ArrayList<ArrayList<String>> ts = conn.getData(sql);

    int size = ts.size();
    for (int i = 0; i < size; i++) {
%>

<tr>
    <td id="PMI_NO"><%= ts.get(i).get(0)%></td>
    <td id="episodeDate2"><%= ts.get(i).get(1)%>
        <input type="hidden" id="episodeDate2_<%=i%>" value="<%= ts.get(i).get(1)%>">
    </td>
    <td id="status"><%= ts.get(i).get(2)%></td>

    <td><input name="b_print" id="b_print<%=i%>" type="button" class="btn btn-success" value=" Print " data-toggle="modal" data-target="#basicModal">
        
        <script>
            $('#b_print<%=i%>').click(function () {

                $.ajax({
                    async: true,
                    type: "POST",
                    url: "timeSlipReport.jsp",
                    data: {'name': "<%=ts.get(i).get(0)%>",
                           'episode': "<%=ts.get(i).get(1)%>", 
                           'pmi': "<%=ts.get(i).get(2)%>", 
                           'start_date': "<%=ts.get(i).get(3)%>",
                           'end_date': "<%=ts.get(i).get(4)%>",
                           'comment': "<%=ts.get(i).get(5)%>",
                           'ic': "<%=ts.get(i).get(6)%>"},
                           
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
            <div class="modal-dialog">
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
        $('#tsTableDivision1').DataTable({
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






