<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="dBConn.Conn"%>
<%@page import="Config.Config"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>



<hr class="pemisah" />
<table id="OccuTableTT"  class="table table-striped table-bordered margin-top-30px" cellspacing="0" width="100%">


    <thead>


    <th>Ward Name</th>
    <th>Bed</th>
    <th>Patient Name</th>
    <th>Patient ID</th>
    <th>Sponsor</th>
    <th>Discharge</th>
</thead>
<tbody>

    <%
        String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
        String idWard = request.getParameter("idWard");
        String idType = request.getParameter("idType");
        String idInput = request.getParameter("idInput");
        String methodSearching = request.getParameter("methodSearch");
        String searching = "";
        String txntype = "T12115";

        Conn conn = new Conn();
        //1 --- search by patient
        //0 --- search by ward list
        if (methodSearching.equalsIgnoreCase("1")) {
            if (idType.equals("pmino") || idType.equals("001")) {
                searching = "select a.new_ic_no,a.old_ic_no,a.id_type,a.id_no,a.police_case,a.hfc_cd,a.pmi_no,a.episode_date,a.discipline_cd,a.subdiscipline_cd,a.ward_class_code,a.ward_id,a.bed_id,a.payer_group,a.patient_category_cd,a.visit_type_cd,a.emergency_type_cd,a.eligibility_type_cd,a.eligibility_category_cd,a.referred_from_hfc,a.referred_from_discipline,a.referred_reference_no,a.order_by,a.admission_reason,a.admission_description,a.guardian_ind,a.group_guardian,a.gl_expiry_date,a.inpatient_status,a.created_by,a.created_date,a.deposit_inpatient,a.document_type,a.document_no,a.patient_name,c.PATIENT_NAME"
                        + " from wis_inpatient_episode a left join wis_order_master b on a.pmi_no = b.pmi_no "
                        + "left join pms_patient_biodata c on a.pmi_no = c.pmi_no "
                        + " where a.pmi_no='" + idInput + "' and b.txn_type ='" + txntype + "' and a.hfc_cd='" + hfc + "'";
            } else if (idType.equals("icnew") || idType.equals("002")) {
                searching = "select a.new_ic_no,a.old_ic_no,a.id_type,a.id_no,a.police_case,a.hfc_cd,a.pmi_no,a.episode_date,a.discipline_cd,a.subdiscipline_cd,a.ward_class_code,a.ward_id,a.bed_id,a.payer_group,a.patient_category_cd,a.visit_type_cd,a.emergency_type_cd,a.eligibility_type_cd,a.eligibility_category_cd,a.referred_from_hfc,a.referred_from_discipline,a.referred_reference_no,a.order_by,a.admission_reason,a.admission_description,a.guardian_ind,a.group_guardian,a.gl_expiry_date,a.inpatient_status,a.created_by,a.created_date,a.deposit_inpatient,a.document_type,a.document_no,a.patient_name,c.PATIENT_NAME"
                        + " from wis_inpatient_episode a left join wis_order_master b on a.pmi_no = b.pmi_no "
                        + "left join pms_patient_biodata c on a.pmi_no = c.pmi_no "
                        + " where a.NEW_IC_NO='" + idInput + "' and b.txn_type ='" + txntype + "' and a.hfc_cd='" + hfc + "'";

            } else if (idType.equals("icold") || idType.equals("003")) {
                searching = "select a.new_ic_no,a.old_ic_no,a.id_type,a.id_no, a.police_case,a.hfc_cd,a.pmi_no,a.episode_date,a.discipline_cd,a.subdiscipline_cd,a.ward_class_code,a.ward_id,a.bed_id,a.payer_group,a.patient_category_cd,a.visit_type_cd,a.emergency_type_cd,a.eligibility_type_cd,a.eligibility_category_cd,a.referred_from_hfc,a.referred_from_discipline,a.referred_reference_no,a.order_by,a.admission_reason,a.admission_description,a.guardian_ind,a.group_guardian,a.gl_expiry_date,a.inpatient_status,a.created_by,a.created_date,a.deposit_inpatient,a.document_type,a.document_no,a.patient_name,c.PATIENT_NAME"
                        + " from wis_inpatient_episode a left join wis_order_master b on a.pmi_no = b.pmi_no"
                        + "left join pms_patient_biodata c on a.pmi_no = c.pmi_no "
                        + " where a.OLD_IC_NO='" + idInput + "' and b.txn_type ='" + txntype + "' and a.hfc_cd='" + hfc + "'";
            } else {
                searching = "select a.new_ic_no,a.old_ic_no,a.id_type,a.id_no,a.police_case,a.hfc_cd,a.pmi_no,a.episode_date,a.discipline_cd,a.subdiscipline_cd,a.ward_class_code,a.ward_id,a.bed_id,a.payer_group,a.patient_category_cd,a.visit_type_cd,a.emergency_type_cd,a.eligibility_type_cd,a.eligibility_category_cd,a.referred_from_hfc,a.referred_from_discipline,a.referred_reference_no,a.order_by,a.admission_reason,a.admission_description,a.guardian_ind,a.group_guardian,a.gl_expiry_date,a.inpatient_status,a.created_by,a.created_date,a.deposit_inpatient,a.document_type,a.document_no,a.patient_name,c.PATIENT_NAME"
                        + " from wis_inpatient_episode a left join wis_order_master b on a.pmi_no = b.pmi_no "
                        + "left join pms_patient_biodata c on a.pmi_no = c.pmi_no "
                        + " where a.ID_NO='" + idInput + "' and b.txn_type ='" + txntype + "'AND a.ID_TYPE='" + idType + "' and a.hfc_cd='" + hfc + "'";
            }

        } else if (methodSearching.equalsIgnoreCase("0")) {
            searching = "select a.new_ic_no,a.old_ic_no,a.id_type,a.id_no,a.police_case,a.hfc_cd,a.pmi_no,a.episode_date,a.discipline_cd,a.subdiscipline_cd,a.ward_class_code,a.ward_id,a.bed_id,a.payer_group,a.patient_category_cd,a.visit_type_cd,a.emergency_type_cd,a.eligibility_type_cd,a.eligibility_category_cd,a.referred_from_hfc,a.referred_from_discipline,a.referred_reference_no,a.order_by,a.admission_reason,a.admission_description,a.guardian_ind,a.group_guardian,a.gl_expiry_date,a.inpatient_status,a.created_by,a.created_date,a.deposit_inpatient,a.document_type,a.document_no,a.patient_name,c.PATIENT_NAME"
                    + " from wis_inpatient_episode a left join wis_order_master b on a.pmi_no = b.pmi_no "
                    + "left join pms_patient_biodata c on a.pmi_no = c.pmi_no "
                    + "where a.ward_id ='" + idWard + "'and b.txn_type ='" + txntype + "' and a.hfc_cd='" + hfc + "'";
        }

        ArrayList<ArrayList<String>> dataList = conn.getData(searching);

        int size1141 = dataList.size();
        if (size1141 > 0) {

            for (int i = 0; i < size1141; i++) {


    %>
<input  value="<%= dataList.get(i).get(8)%>" id="disi">
<input  value="<%= dataList.get(i).get(11)%>" id="wnamei">
<input  value="<%= dataList.get(i).get(18)%>" id="EliSrci">
<input type="hidden" value="<%= dataList.get(i).get(10)%>" id="i">

    <tr id="moveToPatientTransferButton">

<input id="dataWardhidden" type="hidden" value="<%=String.join("|", dataList.get(i))%>">
<td><%= dataList.get(i).get(10)%></td>
<td><%= dataList.get(i).get(12)%></td>
<td><%= dataList.get(i).get(34)%></td>
<td><%= dataList.get(i).get(6)%></td>
<td><%= dataList.get(i).get(6)%></td>

<td>
    <!-- Update Part Start -->
    <a id="Occu_transfer"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>

    <!-- Update Part End -->
</td>

</tr>
<%
    }
} else if (size1141 < 1) { %>
<td colspan="7"> No row selected! </td>
<% }
%>

</tbody>
</table>
<script>
    $("#WardOccuTable").on('click', "#OccuTableTT #Occu_transfer", function () {
        //get the row value
        var row = $(this).closest("tr");
        var rowData = row.find("#dataWardhidden").val();
        var arrayData = rowData.split("|");
        //console.log("hai");
        $('.nav-tabs a[href="#tab_default_2"]').tab('show');

        var pmino = arrayData[6];
        var poic = arrayData[1];
        var pit = arrayData[2];
        var pname = arrayData[35];
        var pnic = arrayData[0];
        var pino = arrayData[3];
        var EliSrc = arrayData[18];
        var EliTy = arrayData[17];
        var AdmTy = arrayData[23];
        var AdmRe = arrayData[24];
        var DocTy = arrayData[32];
        var DocNo = arrayData[33];
        var RefFrom = arrayData[28];
        var RefBy = arrayData[28];
        var GL = arrayData[27];
        var PayerGrp = arrayData[13];
        var Police = arrayData[4];
        var Dis = arrayData[8];
        var WardType = arrayData[10];
        var wname = arrayData[11];
        var Deposit = arrayData[31];
        var BedIDReg = arrayData[12];
        var hfcTo = arrayData[28];
        var DrAttain = arrayData[28];
        var admissionDate = arrayData[7];

        $("#pmino").val(pmino);
        $("#poic").val(poic);
        $("#pit").val(pit);
        $("#pname").val(pname);
        $("#pnic").val(pnic);
        $("#pino").val(pino);
        $("#EliSrc").val(EliSrc);
         $("#EliTy").val(EliTy);
        $("#AdmTy").val(AdmTy);
        $("#AdmRe").val(AdmRe);
        $("#DocTy").val(DocTy);
        $("#DocNo").val(DocNo);
        $("#RefFrom").val(RefFrom);
        $("#RefBy").val(RefBy);
        $("#GL").val(GL);
        $("#PayerGrp").val(PayerGrp);
        $("#Police").val(Police);
        $("#Dis").val(Dis);
        $("#WardType").val(WardType);
        $("#wname").val(wname);
        $("#Deposit").val(Deposit);
        $("#BedIDReg").val(BedIDReg);
        $("#hfcTo").val(hfcTo);
        $("#DrAttain").val(DrAttain);

        var disi = $("#disi").val();
        var EliTy = $("#EliTy").val();
//
//                var data = {
//                    EliSrc: EliSrc,
//                    EliTy: EliTy,
//                    Dis: Dis,
//                    WardType: WardType,
//                    wname: wname
//                  
//
//                };
//
//                $.ajax({
//                    url: "DischargePatient.jsp",
//                    type: "post",
//                    data: data,
//                    timeout: 10000,
//                    success: function (data) {
//
//                        console.log(data);
//
//                    
//
//                    }, error: function (err) {
//                        console.log("Ajax Is Not Success");
//
//                    }
//
//                });


    });
</script>