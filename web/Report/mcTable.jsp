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

    <th> Name </th>
    <th> Episode date </th>
    <th> PMI No </th>
    <th> Reprint </th>

    <%  String sql = "";
        if (mcType.equals("001")) {
            sql = "SELECT A.PATIENT_NAME , B.EPISODE_DATE, A.`PMI_NO` FROM PMS_PATIENT_BIODATA A JOIN LHR_MED_LEAVE B ON A.`PMI_NO` = B.pmi_no WHERE A.PMI_NO = '" + mcInput + "'";
        } else if (mcType.equals("002")) {
            sql = "SELECT A.PATIENT_NAME , B.EPISODE_DATE, A.`PMI_NO` FROM PMS_PATIENT_BIODATA A JOIN LHR_MED_LEAVE B ON A.`PMI_NO` = B.pmi_no WHERE A.NEW_IC_NO = '" + mcInput + "'";
        } else if (mcType.equals("003")) {
            sql = "SELECT A.PATIENT_NAME , B.EPISODE_DATE, A.`PMI_NO` FROM PMS_PATIENT_BIODATA A JOIN LHR_MED_LEAVE B ON A.`PMI_NO` = B.pmi_no WHERE A.OLD_IC_NO = '" + mcInput + "'";
        } else {
            sql = "SELECT A.PATIENT_NAME , B.EPISODE_DATE, A.`PMI_NO` FROM PMS_PATIENT_BIODATA A JOIN LHR_MED_LEAVE B ON A.`PMI_NO` = B.pmi_no WHERE A.ID_NO = '" + mcInput + "'";
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
        <button  class='btn btn-link' data-toggle="modal" data-target="#basicModal_<%=i%>">View Detail</button>
        <div class="modal fade" id="basicModal_<%=i%>" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="modal-header">
                            <input name="b_print" type="button" class="btn btn-success"  onClick="printdiv('div_print<%=i%>');" value=" Print ">
                             <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><%= new SimpleDateFormat("HH:mm:ss").format(new java.util.Date())%></button>
                            
                        </div>
                        <br>


                        <div class="row" id="div_print<%=i%>">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for=""> Name: <%=mc.get(i).get(0)%></label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for=""> Episode Date: <%=mc.get(i).get(1)%></label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for=""> PMI No.: <%=mc.get(i).get(2)%></label>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </td>

</tr>



<%
    }
%>
</table>

                            
<script>

    $(document).ready(function () {
        $('#mcTableDivision1').DataTable({
            dom: 'Bfrtip',
            buttons: [
                'csv', 'excel', 'pdf', 'print'
            ]
        });


    });
</script>
<script language="javascript">
    function printdiv(printpage)
    {
        var headstr = "<html><head><title></title></head><body>";
        var footstr = "</body>";
        var newstr = document.all.item(printpage).innerHTML;
        var oldstr = document.body.innerHTML;
        document.body.innerHTML = headstr + newstr + footstr;
        window.print();
        document.body.innerHTML = oldstr;
        return false;
    }
</script>
