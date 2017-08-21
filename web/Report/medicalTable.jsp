<%-- 
    Document   : mcTable
    Created on : Augt,15 2017, 3:25:01 PM
    Author     : shay
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
    String idType = request.getParameter("mcType");
    String idInput = request.getParameter("mcInput");
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    Conn conn = new Conn();
    String sql = "";
    String sql2 = "";
    String sqlPatient = "";
                         //0             1             2         3              4           5             6            7           8           9                                            10           11             12            13      
    String half = "select b.pmi_no,b.patient_name,b.new_ic_no,b.blood_type,a.description,b.sex_code,c.description,b.id_type,d.description,YEAR(curdate()) - YEAR(b.birth_date) - (RIGHT(curdate(), 5) < RIGHT(b.birth_date, 5)) as age,b.race_code,e.description,b.allergy_ind,f.description from pms_patient_biodata b "
            + "join adm_lookup_detail a on a.master_reference_code = '0074' and a.detail_reference_code = b.blood_type and a.hfc_cd='" + hfc + "' "
            + "join adm_lookup_detail c on c.master_reference_code = '0041' and c.detail_reference_code = b.sex_code and c.hfc_cd='" + hfc + "' "
            + "join adm_lookup_detail d on d.master_reference_code = '0012' and d.detail_reference_code = b.id_type and d.hfc_cd='" + hfc + "' "
            + "join adm_lookup_detail e on e.master_reference_code = '0004' and e.detail_reference_code = b.race_code and e.hfc_cd='" + hfc + "' "
            + "join adm_lookup_detail f on f.master_reference_code = '0075' and f.detail_reference_code = b.allergy_ind and f.hfc_cd='" + hfc + "'";

    if (idType.equals("001")) {
        sqlPatient = half + " where b.pmi_no = '" + idInput + "'";
    } else if (idType.equals("002")) {
        sqlPatient = half + " where b.new_ic_no = '" + idInput + "'";
    } else if (idType.equals("003")) {
        sqlPatient = half + " where b.old_ic_no = '" + idInput + "'";
    } else {
        sqlPatient = half + " where b.id_no = '" + idInput + "' and b.id_type='" + idType + "'";
    }

    ArrayList<ArrayList<String>> dataQueue = conn.getData(sqlPatient);
    if (dataQueue.size() > 0) {
        sql = "select w.pmi_no,w.episode_date,h.hfc_name,d.discipline_name from wis_inpatient_episode w inner join adm_health_facility h on w.hfc_cd = h.hfc_cd inner join  adm_discipline d on w.discipline_cd = d.discipline_cd where w.pmi_no = '" + dataQueue.get(0).get(0) + "'AND w.inpatient_status = '1' group by w.episode_date;";
        sql2 = "select p.pmi_no,p.episode_date,h.hfc_name,d.discipline_name from pms_episode p inner join adm_health_facility h on p.`HEALTH_FACILITY_CODE` = h.hfc_cd inner join  adm_discipline d on p.DISCIPLINE_CODE = d.discipline_cd where p.pmi_no = '" + dataQueue.get(0).get(0) + "' and p.`STATUS` = '1' group by p.`EPISODE_DATE` ORDER BY p.`EPISODE_DATE` ASC;";

        ArrayList<ArrayList<String>> searchInpatient;
        searchInpatient = conn.getData(sql);

        ArrayList<ArrayList<String>> searchOutpatient;
        searchOutpatient = conn.getData(sql2);
%>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<div class="row" id="patientDemographic">
    <div class="col-md-12">
        <div>
            <h4 style="margin: 0px; padding: 0px;"><b>Patient Details</b> </h4>
            <hr class="pemisah"/>
            <table class="p-table" style="width: 100%; color: #999;">
                <tr>
                    <td>
                        <b>Name:</b>
                        <span class="p-label" id="pName"><%=dataQueue.get(0).get(1)%></span>
                    </td>
                    <td>
                        <b>IC/ID No:</b>
                        <span class="p-label" id="pIC"><%=dataQueue.get(0).get(2)%></span>
                    </td>
                    <td>
                        <b>BloodGroup/G6PD:</b>
                        <span class="p-label" id="pBloodType"><%=dataQueue.get(0).get(4)%></span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Gender:</b>
                        <span class="p-label" id="pSex"><%=dataQueue.get(0).get(6)%></span>
                    </td>
                    <td>
                        <b>ID Type:</b>
                        <span class="p-label" id="pIdType"><%=dataQueue.get(0).get(8)%></span>
                    </td>
                    <td>
                        <b>Allergy:</b>
                        <span class="p-label" id="pAllergy"><%=dataQueue.get(0).get(13)%></span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Age:</b>
                        <span class="p-label" id="pAge"><%=dataQueue.get(0).get(9)%></span>
                    </td>
                    <td>
                        <b>Race:</b>
                        <span class="p-label" id="pRace"><%=dataQueue.get(0).get(11)%></span>
                    </td>
                    <td>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
<br/>
<br/>
<br/>
<div class="row">
    <div class="col-md-12" hidden="">
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
        <h4 style="padding: 0px;"> PREVIOUS VISIT </h4><br/>
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

//    $('#inpatient').on('click', '#inBtn', function () {
//        var row = $(this).closest("tr");
//        var pmi_no = row.find("#pmi").val();
//        var episodeDate = row.find("#episode").val();
//        var discipline = row.find("#discipline").val();
//
//        $.ajax({
//            type: 'post',
//            data: {pmi_no: pmi_no, episodeDate: episodeDate, discipline: discipline},
//            url: 'searchInpatient.jsp',
//            timeout: 10000,
//            success: function (getData) {
//                if (getData.trim() === "1") {
//                    alert("No Problem!");
//                    $('#inpatientProblem').html("");
//                } else {
//                    $('#inpatientProblem').html(getData);
//                }
//            }});
//    });
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
            url: 'searchOutpatient.jsp',
            timeout: 10000,
            success: function (getData) {
                if (getData.trim() === "1") {

                    alert("No Problem!");
                    $('#outpatientProblem').html("");
                } else {
                    $('#outpatientProblem').html(getData);
                }
            }});
    });
</script>

<%
    } else {
        out.print("error");
    }
%>