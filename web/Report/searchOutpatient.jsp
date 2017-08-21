<%-- 
    Document   : searchOutpatient
    Created on : 15-Mar-2017, 13:20:06
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
    Conn conn = new Conn();

//    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
//    Date date = new Date();
    String pmi_no = request.getParameter("pmi_no");
    String episodeDate = request.getParameter("episodeDate");
    String disiplineName = request.getParameter("discipline");
    String sql = "";
    //out.println(pmi_no);
    //out.println(episodeDate);

    sql = "SELECT symptom_name,severity_desc FROM lhr_signs where pmi_no = '" + pmi_no + "' and episode_date = '" + episodeDate + "'";
    ArrayList<ArrayList<String>> searchEpisode = conn.getData(sql);
    //out.println(sql);
    String sql1 = "select icd10_description from lhr_family_history where pmi_no = '" + pmi_no + "' and episode_date = '" + episodeDate + "'";
    ArrayList<ArrayList<String>> searchEpisode1 = conn.getData(sql1);

    String sql2 = "select icd10_description from lhr_past_medical_history where pmi_no = '" + pmi_no + "' and onset_data = '" + episodeDate + "'";
    ArrayList<ArrayList<String>> searchEpisode2 = conn.getData(sql2);

    String sql3 = "select icd10_description from lhr_immunisation where pmi_no = '" + pmi_no + "' and episode_date = '" + episodeDate + "'";
    ArrayList<ArrayList<String>> searchEpisode3 = conn.getData(sql3);

    String sql4 = "select leave_type from lhr_med_leave where pmi_no = '" + pmi_no + "' and episode_date = '" + episodeDate + "'";
    ArrayList<ArrayList<String>> searchEpisode4 = conn.getData(sql4);

    String sql5 = "select drug_name from lhr_medication where pmi_no = '" + pmi_no + "' and episode_date = '" + episodeDate + "'";
    ArrayList<ArrayList<String>> searchEpisode5 = conn.getData(sql5);

    String sql6 = "select icd10_description from lhr_diagnosis where pmi_no = '" + pmi_no + "' and episode_date = '" + episodeDate + "'";
    ArrayList<ArrayList<String>> searchEpisode6 = conn.getData(sql6);

    String sql7 = "select procedure_name from lhr_procedure where pmi_no = '" + pmi_no + "' and episode_date = '" + episodeDate + "'";
    ArrayList<ArrayList<String>> searchEpisode7 = conn.getData(sql7);

    String sql8 = "select icd10_description  from lhr_allergy where pmi_no = '" + pmi_no + "' and episode_date = '" + episodeDate + "'";
    ArrayList<ArrayList<String>> searchEpisode8 = conn.getData(sql8);

    String sql9 = "select temperature_reading from lhr_temperature where pmi_no = '" + pmi_no + "' and episode_date = '" + episodeDate + "'";
    ArrayList<ArrayList<String>> searchEpisode9 = conn.getData(sql9);

    String sql10 = "select investigation_name from lhr_radiology_result where pmi_no = '" + pmi_no + "' and episode_date = '" + episodeDate + "'";
    ArrayList<ArrayList<String>> searchEpisode10 = conn.getData(sql10);

    String sql11 = "select symptom_name from lhr_signs where pmi_no = '" + pmi_no + "' and episode_date = '" + episodeDate + "'";
    ArrayList<ArrayList<String>> searchEpisode11 = conn.getData(sql11);

    String sql12 = "select test_name from lhr_test where pmi_no = '" + pmi_no + "' and episode_date = '" + episodeDate + "'";
    ArrayList<ArrayList<String>> searchEpisode12 = conn.getData(sql12);

    String sqlActivDrug = "Select distinct m.pmi_no,m.hfc_cd,m.episode_date,m.encounter_date,m.discipline_cd,m.subdiscipline_cd,m.onset_date,m.drug_cd,m.created_by,m.created_date,p.d_trade_name from lhr_active_medication m join pis_mdc2 p on m.drug_cd = p.ud_mdc_code and m.hfc_cd = p.hfc_cd where pmi_no = '" + pmi_no + "' order by m.onset_date desc;";
    ArrayList<ArrayList<String>> searchActivDrug;
    searchActivDrug = conn.getData(sqlActivDrug);

    if (searchEpisode.size() > 0 || searchEpisode1.size() > 0 || searchEpisode2.size() > 0 || searchEpisode3.size() > 0 || searchEpisode4.size() > 0
            || searchEpisode5.size() > 0 || searchEpisode6.size() > 0 || searchEpisode7.size() > 0 || searchEpisode8.size() > 0 || searchEpisode9.size() > 0 || searchActivDrug.size() > 0 || searchEpisode10.size() > 0 || searchEpisode11.size() > 0 || searchEpisode12.size() > 0) {


%>




<div id="medicalHistorydivision">
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" media="print" type="text/css"/>
    <div div class="col-xs-12 col-md-12">
        <div class="row">
            <strong>
                <h4 style="margin: 0px; padding: 0px;"><b>Patient Medical History</b> </h4>
                <hr class="pemisah"/>
            </strong>
        </div>

        <div class="row">
            <div class="col-xs-4 col-md-4">
                <table>
                    <th>
                        Diagnosis :
                    </th>
                    <th></th>
                    <tbody>
                        <%                        if (searchEpisode6.size() > 0) {
                                for (int i = 0; i < searchEpisode6.size(); i++) {%>
                        <tr>
                            <td></td>
                            <td><%=i + 1%>. <%=searchEpisode6.get(i).get(0)%></td>
                        </tr>
                        <% }
                        } else { %>
                        <tr>
                            <td></td>
                            <td>-</td>
                        </tr>
                        <% }
                        %>
                        <tr></tr>
                    </tbody>
                </table><br/>


                <table>
                    <th>
                        Past Medical History :
                    </th>
                    <th></th>
                    <tbody>
                        <%
                            if (searchEpisode2.size() > 0) {
                                for (int i = 0; i < searchEpisode2.size(); i++) {%>
                        <tr>
                            <td></td>
                            <td><%=i + 1%>. <%=searchEpisode2.get(i).get(0)%></td>
                        </tr>
                        <% }
                        } else { %>
                        <tr>
                            <td></td>
                            <td>-</td>
                        </tr>
                        <% }
                        %>
                        <tr></tr>
                    </tbody>
                </table><br/>


                <table>
                    <th>
                        Family History :
                    </th>
                    <th></th>
                    <tbody>
                        <%
                            if (searchEpisode1.size() > 0) {
                                for (int i = 0; i < searchEpisode1.size(); i++) {%>
                        <tr>
                            <td></td>
                            <td><%=i + 1%>. <%=searchEpisode1.get(i).get(0)%></td>
                        </tr>
                        <% }
                        } else { %>
                        <tr>
                            <td></td>
                            <td>-</td>
                        </tr>
                        <% }
                        %>
                        <tr></tr>
                    </tbody>
                </table><br/>



                <table>
                    <th>
                        Medication (Active):
                    </th>
                    <th></th>
                    <tbody>
                        <%
                            if (searchActivDrug.size() > 0) {
                                for (int i = 0; i < searchActivDrug.size(); i++) {%>
                        <tr>
                            <td></td>
                            <td><%=i + 1%>. <%=searchActivDrug.get(i).get(10)%></td>
                        </tr>
                        <% }
                        } else { %>
                        <tr>
                            <td></td>
                            <td>-</td>
                        </tr>
                        <% }
                        %>
                        <tr></tr>
                    </tbody>
                </table><br/>
            </div>
            <div class="col-xs-4 col-md-4">
                <table>
                    <th>
                        Complaint :
                    </th>
                    <th></th>
                    <tbody>
                        <%
                            if (searchEpisode11.size() > 0) {
                                for (int i = 0; i < searchEpisode11.size(); i++) {%>
                        <tr>
                            <td></td>
                            <td><%=i + 1%>. <%=searchEpisode11.get(i).get(0)%></td>
                        </tr>
                        <% }
                        } else { %>
                        <tr>
                            <td></td>
                            <td>-</td>
                        </tr>
                        <% }
                        %>
                        <tr></tr>
                    </tbody>
                </table><br/>

                <table>
                    <th>
                        Immunization :
                    </th>
                    <th></th>
                    <tbody>
                        <%
                            if (searchEpisode3.size() > 0) {
                                for (int i = 0; i < searchEpisode3.size(); i++) {%>
                        <tr>
                            <td></td>
                            <td><%=i + 1%>. <%=searchEpisode3.get(i).get(0)%></td>
                        </tr>
                        <% }
                        } else { %>
                        <tr>
                            <td></td>
                            <td>-</td>
                        </tr>
                        <% }
                        %>
                        <tr></tr>
                    </tbody>
                </table><br/>



                <table>
                    <th>
                        Procedure (Lab) :
                    </th>
                    <th></th>
                    <tbody>
                        <%
                            if (searchEpisode12.size() > 0) {
                                for (int i = 0; i < searchEpisode12.size(); i++) {%>
                        <tr>
                            <td></td>
                            <td><%=i + 1%>. <%=searchEpisode12.get(i).get(0)%></td>
                        </tr>
                        <% }
                        } else { %>
                        <tr>
                            <td></td>
                            <td>-</td>
                        </tr>
                        <% }
                        %>
                        <tr></tr>
                    </tbody>
                </table><br/>


                <table>
                    <th>
                        Procedure (Surgical) :
                    </th>
                    <th></th>
                    <tbody>
                        <%
                            if (searchEpisode7.size() > 0) {
                                for (int i = 0; i < searchEpisode7.size(); i++) {%>
                        <tr>
                            <td></td>
                            <td><%=i + 1%>. <%=searchEpisode7.get(i).get(0)%></td>
                        </tr>
                        <% }
                        } else { %>
                        <tr>
                            <td></td>
                            <td>-</td>
                        </tr>
                        <% }
                        %>
                        <tr></tr>
                    </tbody>
                </table><br/>

                <table>
                    <th>
                        Procedure (X-RAY) :
                    </th>
                    <th></th>
                    <tbody>
                        <%
                            if (searchEpisode10.size() > 0) {
                                for (int i = 0; i < searchEpisode10.size(); i++) {%>
                        <tr>
                            <td></td>
                            <td><%=i + 1%>. <%=searchEpisode10.get(i).get(0)%></td>
                        </tr>
                        <% }
                        } else { %>
                        <tr>
                            <td></td>
                            <td>-</td>
                        </tr>
                        <% }
                        %>
                        <tr></tr>
                    </tbody>
                </table><br/>
            </div>

        </div>

    </div>
</div>
<div id="commentModal"><div class="row">
        <div class="col-xs-6 col-md-6">
            <textarea placeholder="Comments.." rows="4" cols="500" style="width:500px;" id="patientmedicalcomments"></textarea>
        </div>
    </div></div>
<div>
    <button class="btn btn-success" data-toggle="modal" data-target="#basicModalMedical" id="btnPrintmedicalHistory">Print</button>
</div>
<%
    } else {
        out.println("1");
    }
%>