<%-- 
    Document   : searchID
    Created on : 07-Mar-2017, 17:47:59
    Author     : ahmed
--%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Config.Config"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Formatter.CheckDateFormat"%>
<%
    Conn conn = new Conn();
//    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
//    Date date = new Date();
    CheckDateFormat cdf = new CheckDateFormat();
    String idType = request.getParameter("idType");
    String idInput = request.getParameter("idInput");

    String sql = "";
    String sql2 = "";

    //Patient Info
    String bloodType = "";
    String sex = "";
    String IdType = "";
    int age = 0;
    String race = "";
    String allergy = "";
    String dob = "";
    String dataFull = "";
    String ageS = "";

    boolean check;

    Calendar now = Calendar.getInstance();
    int year = now.get(Calendar.YEAR);
    int month = now.get(Calendar.MONTH);

    Config.getBase_url(request);
    Config.getFile_url(session);

    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    
    //search based on ID Type
    if (idType.equals("001")) { //PMI No
        sql = "select w.pmi_no, w.episode_date,h.hfc_name,d.discipline_name,w.new_ic_no,w.old_ic_no "
                + "from wis_inpatient_episode w "
                + "inner join adm_health_facility h on w.hfc_cd = h.hfc_cd "
                + "inner join  adm_discipline d on w.discipline_cd = d.discipline_cd "
                + "where w.pmi_no = '" + idInput + "' AND  "
                + "GROUP BY w.`EPISODE_DATE` "
                + "ORDER BY w.`EPISODE_DATE` DESC;";
        
        sql2 = "select p.pmi_no,p.episode_date,h.hfc_name,d.discipline_name,p.new_ic_no,p.old_ic_no "
                + "from pms_episode p "
                + "inner join adm_health_facility h on p.`HEALTH_FACILITY_CODE` = h.hfc_cd "
                + "inner join  adm_discipline d on p.DISCIPLINE_CODE = d.discipline_cd "
                + "where p.pmi_no = '" + idInput + "' "
                + "GROUP BY p.`EPISODE_DATE` "
                + "ORDER BY p.`EPISODE_DATE` DESC;";

    } else if (idType.equals("002")) { // IC No (New)
        sql = "select w.pmi_no,w.episode_date,h.hfc_name,d.discipline_name,w.new_ic_no,w.old_ic_no "
                + "from wis_inpatient_episode w "
                + "inner join adm_health_facility h on w.hfc_cd = h.hfc_cd "
                + "inner join  adm_discipline d on w.discipline_cd = d.discipline_cd "
                 + "where w.`NEW_IC_NO` = '" + idInput + "'  "
                + "GROUP BY w.`EPISODE_DATE` "
                + "ORDER BY w.`EPISODE_DATE` "
                + "DESC;";
        sql2 = "select p.pmi_no,p.episode_date,h.hfc_name,d.discipline_name,p.new_ic_no,p.old_ic_no from pms_episode p "
                + "inner join adm_health_facility h on p.`HEALTH_FACILITY_CODE` = h.hfc_cd "
                + "inner join  adm_discipline d on p.DISCIPLINE_CODE = d.discipline_cd "
                + "where p.`NEW_IC_NO` = '" + idInput + "' "
                + "GROUP BY p.`EPISODE_DATE` "
                + "ORDER BY p.`EPISODE_DATE` DESC;";

    } else if (idType.equals("003")) { // IC No (Old)
        sql = "select w.pmi_no,w.episode_date,h.hfc_name,d.discipline_name,w.new_ic_no,w.old_ic_no "
                + "from wis_inpatient_episode w "
                + "inner join adm_health_facility h on w.hfc_cd = h.hfc_cd "
                + "inner join  adm_discipline d on w.discipline_cd = d.discipline_cd "
                 + "where w.`OLD_IC_NO` = '" + idInput + "'  "
                + "GROUP BY w.`EPISODE_DATE` "
                + "ORDER BY w.`EPISODE_DATE` DESC;";
        
        sql2 = "select p.pmi_no,p.episode_date,h.hfc_name,d.discipline_name,p.new_ic_no,p.old_ic_no "
                + "from pms_episode p "
                + "inner join adm_health_facility h on p.`HEALTH_FACILITY_CODE` = h.hfc_cd "
                + "inner join  adm_discipline d on p.DISCIPLINE_CODE = d.discipline_cd "
                + "where p.`OLD_IC_NO` = '" + idInput + "' "
                + " GROUP BY p.`EPISODE_DATE` "
                + " ORDER BY p.`EPISODE_DATE` DESC;";
       
    }else if (idType.equals("004")) { // Matric No
        sql = "select w.pmi_no,w.episode_date,h.hfc_name,d.discipline_name,w.new_ic_no,w.old_ic_no "
                + "from wis_inpatient_episode w "
                + "inner join adm_health_facility h on w.hfc_cd = h.hfc_cd "
                + "inner join  adm_discipline d on w.discipline_cd = d.discipline_cd "
                 + "where w.`ID_NO` = '" + idInput + "'  "
                + "GROUP BY w.`EPISODE_DATE` "
                + "ORDER BY w.`EPISODE_DATE` DESC;";
        
        sql2 = "select p.pmi_no,p.episode_date,h.hfc_name,d.discipline_name,p.new_ic_no,p.old_ic_no "
                + "from pms_episode p "
                + "inner join adm_health_facility h on p.`HEALTH_FACILITY_CODE` = h.hfc_cd "
                + "inner join  adm_discipline d on p.DISCIPLINE_CODE = d.discipline_cd "
                + "where p.id_no = '" + idInput + "' "
                + "GROUP BY p.`EPISODE_DATE` "
                + "ORDER BY p.`EPISODE_DATE` "
                + "DESC;";
    }else if (idType.equals("005")) { // Staff No
        sql = "select w.pmi_no,w.episode_date,h.hfc_name,d.discipline_name,w.new_ic_no,w.old_ic_no "
                + "from wis_inpatient_episode w "
                + "inner join adm_health_facility h on w.hfc_cd = h.hfc_cd "
                + "inner join  adm_discipline d on w.discipline_cd = d.discipline_cd "
                 + "where w.`ID_NO` = '" + idInput + "'  "
                + "GROUP BY w.`EPISODE_DATE` "
                + "ORDER BY w.`EPISODE_DATE` DESC;";
        
        sql2 = "select p.pmi_no,p.episode_date,h.hfc_name,d.discipline_name,p.new_ic_no,p.old_ic_no "
                + "from pms_episode p "
                + "inner join adm_health_facility h on p.`HEALTH_FACILITY_CODE` = h.hfc_cd "
                + "inner join  adm_discipline d on p.DISCIPLINE_CODE = d.discipline_cd "
                + "where p.`ID_NO` = '" + idInput + "' "
                + "GROUP BY p.`EPISODE_DATE` "
                + "ORDER BY p.`EPISODE_DATE` DESC;";
    }
    
    ArrayList<ArrayList<String>> searchID;
    searchID = conn.getData(sql);

    ArrayList<ArrayList<String>> searchID1;
    searchID1 = conn.getData(sql2);

  
    if (searchID.size() > 0 || searchID1.size() > 0) {

        //Convert Code to Description
        String sqlPatient = "select pmi_no,patient_name,new_ic_no,blood_type,sex_code,id_type,year(birth_date),race_code,allergy_ind,old_ic_no from pms_patient_biodata where pmi_no = '" + idInput + "' or new_ic_no = '" + idInput + "' or old_ic_no = '" + idInput + "' or id_no =  '"+idInput+"' ";
        ArrayList<ArrayList<String>> dataQueue = conn.getData(sqlPatient);

        String pmino = dataQueue.get(0).get(0);
        String patient_name = dataQueue.get(0).get(1);
        String icnew = dataQueue.get(0).get(2);
        String icold = dataQueue.get(0).get(9);

        String sqlFullPatient = "select * from emedica.pms_patient_biodata where pmi_no = '" + pmino + "' or new_ic_no = '" + icnew + "' or old_ic_no = '" + icold + "' or id_no =  '"+idInput+"'";
        ArrayList<ArrayList<String>> dataPatientFull = conn.getData(sqlFullPatient);

        if (dataQueue.get(0).get(3).equals("-")) {
            bloodType = "-";
        } else {
            String sqlGetBlood = "select* from adm_lookup_detail where master_reference_code = '0074' and detail_reference_code = '" + dataQueue.get(0).get(3) + "'";
            ArrayList<ArrayList<String>> dataBlood = conn.getData(sqlGetBlood);
            if (dataBlood.size() < 1) {
                bloodType = "-";
            } else {
                bloodType = dataBlood.get(0).get(2);
            }

        }

        if (dataQueue.get(0).get(4).equals("-")) {
            sex = "-";
        } else {
            String sqlGetSexCd = "select* from adm_lookup_detail where master_reference_code = '0041' and detail_reference_code = '" + dataQueue.get(0).get(4) + "'";
            ArrayList<ArrayList<String>> dataSexCd = conn.getData(sqlGetSexCd);
            if (dataSexCd.size() < 1) {
                sex = "-";
            } else {
                sex = dataSexCd.get(0).get(2);
            }

        }

        if (dataQueue.get(0).get(5).equals("-")) {
            IdType = "-";
        } else {
            String sqlGetIdType = "select* from adm_lookup_detail where master_reference_code = '0012' and detail_reference_code = '" + dataQueue.get(0).get(5) + "'";
            ArrayList<ArrayList<String>> dataIdType = conn.getData(sqlGetIdType);
            if (dataIdType.size() < 1) {
                IdType = "-";
            } else {
                IdType = dataIdType.get(0).get(2);
            }

        }

        if (dataQueue.get(0).get(7).equals("-")) {
            race = "-";
        } else {
            String sqlGetRace = "select* from adm_lookup_detail where master_reference_code = '0004' and detail_reference_code = '" + dataQueue.get(0).get(7) + "'";
            ArrayList<ArrayList<String>> dataRace = conn.getData(sqlGetRace);
            if (dataRace.size() < 1) {
                race = "-";
            } else {
                race = dataRace.get(0).get(2);
            }

        }

        if (dataQueue.get(0).get(8).equals("-")) {
            allergy = "-";
        } else {
            String sqlAllergy = "select* from adm_lookup_detail where master_reference_code = '0075' and detail_reference_code = '" + dataQueue.get(0).get(8) + "'";
            ArrayList<ArrayList<String>> dataAllergy = conn.getData(sqlAllergy);
            if (dataAllergy.size() < 1) {
                allergy = "-";
            } else {
                allergy = dataAllergy.get(0).get(2);
            }

        }

        for (int i = 0; i < dataPatientFull.get(0).size(); i++) {
            dataFull = dataFull + "#" + dataPatientFull.get(0).get(i);
        }

// Get Age from Date of Birth
        if(dataQueue.get(0).get(6) != null){
            dob = dataQueue.get(0).get(6);
            age = year - Integer.parseInt(dob);
            ageS = Integer.toString(age);
        }
        else{
            ageS = "undefined";
        }
        

//        check = cdf.isValidFormat("dd/MM/yyyy", dob);
//        if (check) {
//            String[] dobAr = StringUtils.split(dob, "/");
//            int dobYear = Integer.parseInt(dobAr[2]);
//            int dobMonth = Integer.parseInt(dobAr[1]);
//            age = year - dobYear;
//            ageS = Integer.toString(age);
//        } else {
//            ageS = "undefined";
//        }



%>
<div class="row">
    <hr/>
    <div class="col-md-12">
        <h4 style="padding: 0px;">Patient Info</h4>
    </div>
    <div class="col-md-3">
        <address>
            <p>Name: <span class="p-label"><%=patient_name%></span></p>
            <p>IC/ID No: <span class="p-label"><%=icnew%></span></p>
        </address>
    </div>
    <div class="col-md-3">
        <address>
            <p>gender: <span class="p-label"><%=sex%></span></p>
            <p>Age: <span class="p-label"><%= ageS%></span></p>
        </address>
    </div>
    <div class="col-md-3">
        <address>
            <p>ID Type: <span class="p-label"><%=IdType%></span></p>
            <p>Race: <span class="p-label"><%=race%></span></p>
        </address>
    </div>
    <div class="col-md-3">
        <address>
            <p>Blood Type: <span class="p-label"><%=bloodType%></span></p>
            <p>Allergy: <span class="p-label"><%=allergy%></span></p>
        </address>
    </div>
</div>
<div class="row">
    <hr/>
    <div class="col-md-12">
        <h4 style="padding: 0px;">Previous Visit (Inpatient Episode)</h4>
        <br/>
        <table class="table table-filter table-striped" style="background: #fff; border: 1px solid #ccc;" id="searchPatient">
            <thead>
            <th>Episode Date</th>
            <th>Health Care Facility</th>
            <th>Discipline</th>
            <th>Action</th>
            </thead>
            <tbody id="detailList">
                <%        for (int i = 0; i < searchID.size(); i++) {
                        if (searchID.size() > 0) {
                            //out.print(String.join("|", searchID.get(i)));

                %>
                <tr>
                    <td><%=searchID.get(i).get(1)%>
                        <input type="hidden" id="pmi" value="<%=searchID.get(i).get(0)%>">
                        <input type="hidden" id="episode" value="<%=searchID.get(i).get(1)%>">
                        <input type="hidden" id="disipline" value="<%=searchID.get(i).get(3)%>">
                        <input type="hidden" id="ic_no" value="<%=searchID.get(i).get(4)%>">
                        <input type="hidden" id="old_ic_no" value="<%=searchID.get(i).get(5)%>">
                    </td>
                    <td><%=searchID.get(i).get(2)%></td>
                    <td><%=searchID.get(i).get(3)%></td>
                    <td><a href="#episodeDetail" id="ViewDetail" name="ViewDetail" class="btn btn-default" role="button">View Details</a></td>
                </tr>

                <% }
                    }
                %>
            </tbody>
        </table>
    </div>
</div>
<div class="row">
    <hr/>
    <div class="col-md-12">
        <h4 style="padding: 0px;">Previous Visit (Outpatient Episode)</h4>
        <table class="table table-filter table-striped" style="background: #fff; border: 1px solid #ccc;" id="searchPatient1">
            <thead>
            <th>Episode Date</th>
            <th>Health Care Facility</th>
            <th>Discipline</th>
            <th>Action</th>
            </thead>
            <tbody id="detailList1">
                <%
                    for (int i = 0; i < searchID1.size(); i++) {
                            //out.print(String.join("|", searchID1.get(i)));
                %>
                <tr>
                    <td><%=searchID1.get(i).get(1)%>
                        <input type="hidden" id="pmi1" value="<%=searchID1.get(i).get(0)%>">
                        <input type="hidden" id="episode1" value="<%=searchID1.get(i).get(1)%>">
                        <input type="hidden" id="disipline1" value="<%=searchID1.get(i).get(3)%>">
                        <input type="hidden" id="ic_no1" value="<%=searchID1.get(i).get(4)%>">
                        <input type="hidden" id="old_ic_no1" value="<%=searchID1.get(i).get(5)%>">
                    </td>
                    <td><%=searchID1.get(i).get(2)%></td>
                    <td><%=searchID1.get(i).get(3)%></td>
                    <td><a href="#episodeDetail" id="ViewDetail1" name="ViewDetail" class="btn btn-default" role="button">View Details</a></td>
                </tr>

                <% 
                    }
                %>
            </tbody>
        </table>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $('#searchPatient').DataTable();
        $('#searchPatient1').DataTable({
            "order": [],
        });
    });
</script>
<%
    } else {
        out.print("1");
       
    }
%>

