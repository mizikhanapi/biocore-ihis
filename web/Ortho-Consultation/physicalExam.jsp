<%-- 
    Document   : physicalExam
    Created on : Jun 6, 2017, 11:59:21 AM
    Author     : user
--%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<div id="get_physicalExam">

    <%

        if (session.getAttribute("patientPMINo") == null || session.getAttribute("patientPMINo").equals(" ")) {
            out.print("<br>No data recorded.");
        } else {
            try {

                String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
                String pmino = session.getAttribute("patientPMINo").toString();
                String user_id = session.getAttribute("USER_ID").toString();
                String episodeDate = session.getAttribute("episodeDate").toString();

                //out.print(hfc + " ----- " + pmino + " ----- " + episodeDate + " ------ " + user_id);
                Conn conn = new Conn();
                String sql = "SELECT p.encounter_date,p.physical_exam,p.search_content,p.comment FROM lhr_ort_neu_physical_examination p WHERE p.pmi_no='" + pmino + "'";
                ArrayList<ArrayList<String>> q4 = conn.getData(sql);

                DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");
                DateFormat timeFormat = new SimpleDateFormat("hh:mm:ss");

                String dateTime = q4.get(0).get(0);

                DateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                DateFormat outputFormat = new SimpleDateFormat("dd-MM-yyyy");
                DateFormat outputFormat1 = new SimpleDateFormat("KK:mm a");
    %>
    <div class="row">
        <div class="col-md-8">
            <h4>Consultation Notes</h4>
        </div>
        <div class="col-md-4" style="padding-top: 20px">
            <label class="col-sm-6 control-label text-right" for="formGroupInputLarge">View history assessment:</label>
            <div class="col-sm-6" style="padding-right: 0px;">
                <select class="form-control">
                    <option>View by</option>
                    <option>Today</option>
                    <option>Yesterday</option>
                    <option>7 Days</option>
                    <option>30 Days</option>
                    <option>60 Days</option>
                    <option>Select date</option>
                </select>
            </div>
        </div>
        <div class="col-md-6 col-md-offset-6 text-right margin-bottom-30px">
            <div class="col-sm-12 form-inline" style="padding-right: 0px;">
                <div class="form-group">
                    <label for="exampleInputName2">Start</label>
                    <input type="text" class="form-control" id="exampleInputName2" placeholder="14/06/2017" style="margin-bottom: 0px !important;">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail2">to</label>
                    <input type="email" class="form-control" id="exampleInputEmail2" placeholder="15/06/2017" style="margin-bottom: 0px !important;">
                </div>
                <button type="submit" class="btn btn-default"><i class="fa fa-search fa-lg"></i></button>
            </div>
        </div>
    </div>
    <table class="table table-bordered table-striped">
        <tr>
            <th style="width: 10%">Physical Examination</th>
            <td style="width: 60%">
        <dd>Information</dd>
        </td>
        <td style="width: 20%">Comment</td>
        <td style="width: 10%">Action</td>
        </tr>
        <%
            if (q4.size() > 0) {
                for (int i = 0; i < q4.size(); i++) {%>
        <tr>
            <th><%=q4.get(i).get(1)%></th>
            <td><%=q4.get(i).get(2)%></td>
            <td><%=q4.get(i).get(3)%></td>
            <td>
                <a href="#" class="deleteBtn" id="delete_PE_<%=i%>"><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block; color: #d9534f;"></i></a>
                <script>
        $("#delete_PE_<%=i%>").click(function () {

            //alert("Are you sure to delete the data?");
            var dateTime = "<%=q4.get(i).get(0)%>";
            var r = confirm("Are you sure to delete the data?");
            if (r == true) {
                $.ajax({
                    url: "../Ortho-Consultation/modal/action/delete_physical_exam.jsp",
                    type: "post",
                    data: {dateTime: dateTime
                    },
                    timeout: 10000,
                    success: function () {
                        alert("Data recorded is deleted.");
                        $("#get_physicalExam").load("../Ortho-Consultation/physicalExam.jsp");
                    },
                    error: function (err) {
                        alert("Error update!");
                    }
                });
            } else {
                //txt = "You pressed Cancel!";
            }


        });
                </script>
            </td>
        </tr>
        <%             }
                    } else {
                        out.print("<br>No data recorded.");
                    }
                } catch (Exception e) {
                }

            }
        %>
    </table>
</div>
