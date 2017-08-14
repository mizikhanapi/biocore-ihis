<%-- 
    Document   : CIS030003_1
    Created on : 29-Mar-2017, 17:35:03
    Author     : ahmed
--%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="dBConn.Conn"%>
<%@page import="Config.Config"%>
<%@page import="java.util.ArrayList"%>

<%
//    Config.getBase_url(request);
//    Config.getFile_url(session);

    //String pmiNo = "";//session.getAttribute("patientPMINo").toString();
    String pmiNo = session.getAttribute("patientPMINo").toString();
    Conn conn = new Conn();
    String sql = "";
    String sql2 = "";
    sql = "select w.pmi_no,w.episode_date,h.hfc_name,d.discipline_name from wis_inpatient_episode w inner join adm_health_facility h on w.hfc_cd = h.hfc_cd inner join  adm_discipline d on w.discipline_cd = d.discipline_cd where w.pmi_no = '" + pmiNo + "'AND w.inpatient_status = '1' group by w.episode_date;";
    sql2 = "select p.pmi_no,p.episode_date,h.hfc_name,d.discipline_name from pms_episode p inner join adm_health_facility h on p.`HEALTH_FACILITY_CODE` = h.hfc_cd inner join  adm_discipline d on p.DISCIPLINE_CODE = d.discipline_cd where p.pmi_no = '" + pmiNo + "' and p.`STATUS` = '1' group by p.`EPISODE_DATE` ORDER BY p.`EPISODE_DATE` ASC;";

    ArrayList<ArrayList<String>> searchInpatient;
    searchInpatient = conn.getData(sql);

    ArrayList<ArrayList<String>> searchOutpatient;
    searchOutpatient = conn.getData(sql2);

%>
<div class="row">
    <div class="col-md-12">
        <h4 style="padding: 0px;">PREVIOUS VISIT (INPATIENT EPISODE) <% //out.print(pmiNo);%></h4><br/>
        <div id="inpatient" >
            <table id="inPatient" class="table table-stripout.print(pmiNo);ed table-bordered" cellspacing="0" width="100%">
                <thead>  
                    <tr>
                        <th class="col-sm-1">Episode Date</th>
                        <th class="col-sm-1">Health Care Facility</th>
                        <th class="col-sm-1">Discipline Name</th>
                        <th class="col-sm-1">Action</th>				 
                    </tr>
                </thead>

                <tbody id="inpatient">
                    <%
                        if (searchInpatient.size() > 0) {
                            for (int i = 0; i < searchInpatient.size(); i++) {

                    %>
                    <tr>
                        <td><%=searchInpatient.get(i).get(1)%>
                            <input type="hidden" id="pmi" value="<%=searchInpatient.get(i).get(0)%>">
                            <input type="hidden" id="episode" value="<%=searchInpatient.get(i).get(1)%>">
                            <input type="hidden" id="discipline" value="<%=searchInpatient.get(i).get(3)%>">
                        </td>
                        <td><%=searchInpatient.get(i).get(2)%></td>
                        <td><%=searchInpatient.get(i).get(3)%></td>
                        <td><a href="#inpatientProblem" id="inBtn" name="ViewDetail" class="btn btn-default" type="button" role="button">View Details</a></td>
                    </tr>
                    <%}
                        }%>
                </tbody>
            </table>
        </div>
    </div>
</div>

<div class="row">
    <hr/>
    <div class="col-md-12">
        <h4 style="padding: 0px;">PREVIOUS VISIT (OUTPATIENT EPISODE)</h4><br/>
        <div id="outpatient">
            <table id="outPatient"  class="table table-striped table-bordered" cellspacing="0" width="100%">
                <thead>  
                    <tr>
                        <th class="col-sm-1">Episode Date</th>
                        <th class="col-sm-1">Health Care Facility</th>
                        <th class="col-sm-1">Discipline Name</th>
                        <th class="col-sm-1">Action</th>				 
                    </tr>
                </thead>

                <tbody id="outpatient">
                    <%
                        if (searchOutpatient.size() > 0) {
                            for (int i = 0; i < searchOutpatient.size(); i++) {

                    %>
                    <tr>
                        <td><%=searchOutpatient.get(i).get(1)%>
                            <input type="hidden" id="pmi1" value="<%=searchOutpatient.get(i).get(0)%>">
                            <input type="hidden" id="episode1" value="<%=searchOutpatient.get(i).get(1)%>">
                            <input type="hidden" id="discipline1" value="<%=searchOutpatient.get(i).get(3)%>">
                        </td>
                        <td><%=searchOutpatient.get(i).get(2)%></td>
                        <td><%=searchOutpatient.get(i).get(3)%></td>       
                        <td>
                            <a href="#outpatientProblem" id="outBtn" name="ViewDetail" class="btn btn-default" type="button" role="button">View Details</a>
                        </td>
                    </tr>
                    <%
                            }
                        }
                    %>
                </tbody>
            </table>
            <script type="text/javascript">
                $(document).ready(function () {
                    $('#inPatient').DataTable();
                    $('#outPatient').DataTable();
                });
            </script>
        </div>
    </div>
</div>

<div  id="inpatientProblem">

</div>

<div  id="outpatientProblem">

</div>
<script type="text/javascript">

    $('#inpatient').on('click', '#inBtn', function () {
        var row = $(this).closest("tr");
        var pmi_no = row.find("#pmi").val();
        var episodeDate = row.find("#episode").val();
        var discipline = row.find("#discipline").val();

        $.ajax({
            type: 'post',
            data: {pmi_no: pmi_no, episodeDate: episodeDate, discipline: discipline},
            url: 'search/searchInpatient.jsp',
            timeout: 10000,
            success: function (getData) {
                if (getData.trim() === "1") {
                    alert("No Problem!");
                } else {
                    $('#inpatientProblem').html(getData);
                }
            }});

    });
</script>
<script type="text/javascript">
    $('#outpatient').on('click', '#outBtn', function () {
        var row = $(this).closest("tr");
        var pmi_no = row.find("#pmi1").val();
        var episodeDate = row.find("#episode1").val();
        var discipline = row.find("#discipline1").val();

        $.ajax({
            type: 'post',
            data: {pmi_no: pmi_no, episodeDate: episodeDate, discipline: discipline},
            url: 'search/searchOutpatient.jsp',
            timeout: 10000,
            success: function (getData) {
                if (getData.trim() === "1") {
                    
                    alert("No Problem!");
                    $('#outpatientProblem').html(getData);
                } else {
                    $('#outpatientProblem').html(getData);
                }
            }});

    });


</script>