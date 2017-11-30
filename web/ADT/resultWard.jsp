<%@page import="java.util.Calendar"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="dBConn.Conn"%>
<%@page import="Config.Config"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Formatter.CheckDateFormat"%>
<%@page import="main.RMIConnector"%>




<hr class="pemisah" />
<table id="OccuTableTT"  class="table table-striped table-bordered" cellspacing="0" width="100%">


    <thead>


    <th>Ward Name</th>
    <th>Bed</th>
    <th>Patient Name</th>
    <th>Patient PMI NO</th>
    <th>Date</th>
    <th>Transfer</th>
</thead>
<tbody>

    <%
        String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
        String idWard = request.getParameter("idWard");
        String idType = request.getParameter("idType");
        String idInput = request.getParameter("idInput");
        String methodSearching = request.getParameter("methodSearch");
        String searching = "";
        Conn conn = new Conn();
        RMIConnector rmic = new RMIConnector();
        CheckDateFormat cdf = new CheckDateFormat();

        int age = 0;

        String status = "0";
        String dataFull = "";
        String ageS = "";
        boolean check;

        Calendar now = Calendar.getInstance();
        int year = now.get(Calendar.YEAR);
        int month = now.get(Calendar.MONTH);

        String whereCon = "";

        //1 --- search by patient
        //0 --- search by ward list
        if (methodSearching.equalsIgnoreCase("1")) {
            if (idType.equals("pmino") || idType.equals("001")) {
                whereCon=" AND a.pmi_no='"+idInput+"'";
                
            } else if (idType.equals("icnew") || idType.equals("002")) {
                whereCon=" AND a.`NEW_IC_NO`='"+idInput+"'";

            } else if (idType.equals("icold") || idType.equals("003")) {
                whereCon=" AND a.`OLD_IC_NO`='"+idInput+"'";
                
            } else {
               whereCon=" AND a.`ID_NO`='"+idInput+"'";
            }

        } else if (methodSearching.equalsIgnoreCase("0")) {
            whereCon=" AND a.ward_id='"+idWard+"'";
        }
        //                     0            1           2       3          4            5       6           7               8               9                   10                                  
        searching = "select a.new_ic_no,a.old_ic_no,a.id_type,a.id_no,a.police_case,a.hfc_cd,a.pmi_no,a.episode_date,a.discipline_cd,a.subdiscipline_cd, a.ward_class_code,"
                //    11       12        13           14                    15              16                    17                    18                       19                       20        
                + "a.ward_id,a.bed_id,a.payer_group,a.patient_category_cd,a.visit_type_cd,a.emergency_type_cd,a.eligibility_type_cd,a.eligibility_category_cd,a.referred_from_hfc,a.referred_from_discipline,"
                //   21                     22       23              24                    25             26            27            28               29          30
                + "a.referred_reference_no,a.order_by,a.admission_reason,a.admission_description,a.guardian_ind,a.group_guardian,a.gl_expiry_date,a.inpatient_status,a.created_by,a.created_date,"
                // 31                          32         33             34                 35       36                 37               38                                                     39                                      40
                + "a.deposit_inpatient,a.document_type,a.document_no,a.patient_name,b.ward_name,d.ward_class_name, e.`Description`, TIMESTAMPDIFF(YEAR, c.BIRTH_DATE, CURDATE()), date_format(a.episode_date, '%Y-%m-%d %H:%i:%s'), a.startDate  "
                + " from wis_inpatient_episode a  "
                + " left join wis_ward_name b on a.ward_id = b.ward_id AND b.hfc_cd=a.hfc_cd "
                + " left join pms_patient_biodata c on a.pmi_no = c.PMI_NO "
                + " left join wis_ward_class d on d.ward_class_code = a.ward_class_code AND d.hfc_cd=a.hfc_cd "
                + "left join adm_lookup_detail e on e.hfc_cd = a.hfc_cd  AND e.Master_Reference_code = '0041' AND e.`Detail_Reference_code`=c.`SEX_CODE` "
                + " where a.inpatient_status!='1' and a.hfc_cd='"+hfc+"' "+whereCon;

        ArrayList<ArrayList<String>> dataList = conn.getData(searching);
        // Get Age from Date of Birth
//        dob = dataList.get(0).get(38).toString();
//        if (dob.contains("/")) {
//            check = cdf.isValidFormat("dd/MM/yyyy", dob);
//            if (check) {
//                String[] dobAr = StringUtils.split(dob, "/");
//                int dobYear = Integer.parseInt(dobAr[2]);
//                int dobMonth = Integer.parseInt(dobAr[1]);
//                age = year - dobYear;
//                ageS = Integer.toString(age);
//            } else {
//                ageS = "undefined";
//            }
//        } else if (dob.contains("-")) {
//            check = cdf.isValidFormat("yyyy-MM-dd", dob);
//            if (check) {
//                String[] dobAr = StringUtils.split(dob, "-");
//                int dobYear = Integer.parseInt(dobAr[0]);
//                int dobMonth = Integer.parseInt(dobAr[1]);
//                age = year - dobYear;
//                ageS = Integer.toString(age);
//            } else {
//                ageS = "undefined";
//            }
//        }

//        String patientBio = ageS;
//        session.setAttribute("patientCategory", patientBio);
//          out.print(patientBio);
        int size1141 = dataList.size();
//        out.print(searching);
        if (size1141 > 0) {

            for (int i = 0; i < size1141; i++) {


    %>


    <tr id="moveToPatientTransferButton">

<input id="dataWardhidden" type="hidden" value="<%=String.join("|", dataList.get(i))%>">
<td><%= dataList.get(i).get(35)%></td>
<td><%= dataList.get(i).get(12)%></td>
<td><%= dataList.get(i).get(34)%></td>
<td><%= dataList.get(i).get(6)%></td>
<td><%= dataList.get(i).get(7)%></td>

<td>
    <!-- Update Part Start -->
    <a id="Occu_transfer"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>

    <!-- Update Part End -->
</td>

</tr>
<%
    }
} else if (size1141 < 1) { %>
<td colspan="7"> No patient found. </td>
<% }
%>

</tbody>
</table>

<script>
    $("#WardOccuTable").off('click').on('click', "#OccuTableTT #Occu_transfer", function () {
        //get the row value
        var row = $(this).closest("tr");
        var rowData = row.find("#dataWardhidden").val();
        var arrayData = rowData.split("|");
        console.log(arrayData);
        $('.nav-tabs a[href="#tab_default_2"]').tab('show');

        var pmi = arrayData[6];
        var icno = arrayData[0];
        //var gender = arrayData[];
        var name = arrayData[34];
        var wardClass = arrayData[36];
        var wardName = arrayData[35];
        var bedId = arrayData[12];
        var rate = arrayData[31];
        var admissionDate = arrayData[39];
        var inStat = arrayData[28];
        var oldDis = arrayData[8];
        var SEX_CODE = arrayData[37];
        var wardClass_CD = arrayData[10];
        var wardName_CD = arrayData[11];
        var age = arrayData[38];
        var eliSource = arrayData[18];
        var eliTy = arrayData[17];
        


        $("#pmino").val(pmi);
        $("#pinof").val(icno);
        $("#WardClassf").val(wardClass);
        $("#Bedf").val(bedId);
        $("#pnamef").val(name);
        $("#WardNamef").val(wardName);
        $("#Ratef").val(rate);
        $("#AdmissionDatef").val(admissionDate);
        $("#inStat").val(inStat);
        $("#oldDis").val(oldDis);
        $("#gender").val(SEX_CODE);
        $("#wardClass_CD").val(wardClass_CD);
        $("#wardName_CD").val(wardName_CD);
        $('#age').val(age);
        $('#EliSource').val(eliSource);
        $('#EliTy').val(eliTy);
        $('#preStartDate').val(arrayData[40]);




    });
</script>