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
    <th>Episode Date</th>


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
        String status = "0";

        Conn conn = new Conn();
        //1 --- search by patient
        //0 --- search by ward list
        if (methodSearching.equalsIgnoreCase("1")) {
            if (idType.equals("pmino") || idType.equals("001")) {
                //                        0        1           2        3         4            5        6           7          8              9                    10
                searching = "select a.new_ic_no,a.old_ic_no,a.id_type,a.id_no,a.police_case,a.hfc_cd,a.pmi_no,a.episode_date,a.discipline_cd,a.subdiscipline_cd,a.ward_class_code,"
                        //      11         12      13            14                   15               16                17                     18                          19               20
                        + "a.ward_id,a.bed_id,a.payer_group,a.patient_category_cd,a.visit_type_cd,a.emergency_type_cd,a.eligibility_type_cd,a.eligibility_category_cd,a.referred_from_hfc,a.referred_from_discipline,"
                        //          21                    22       23                  24                      25           26              27                 28                  29         30          
                        + "a.referred_reference_no,a.order_by,a.admission_reason,a.admission_description,a.guardian_ind,a.group_guardian,a.gl_expiry_date,a.inpatient_status,a.created_by,a.created_date,"
                        //          31            32                   33      34             35             36           37          38            39          40
                        + "a.deposit_inpatient,a.document_type,a.document_no,a.patient_name,c.PATIENT_NAME,c.SEX_CODE,c.BIRTH_DATE,c.BLOOD_TYPE,b.order_no,b.order_date"
                        //    41       42                 43                44        45
                        + ",b.hfc_cd,wwn.ward_name,wieh.ward_class_code,wieh.hfc_cd, wieh.ward_id"
                        + " from wis_inpatient_episode a left join wis_order_master b on a.pmi_no = b.pmi_no "
                        + "left join pms_patient_biodata c on a.pmi_no = c.pmi_no "
                        + "left join wis_ward_name wwn on wwn.ward_id = a.ward_id "
                        + "left join wis_inpatient_episode_history wieh on a.pmi_no = wieh.pmi_no "
                        + " where a.inpatient_status ='" + status + "' and a.pmi_no='" + idInput + "' and b.txn_type ='" + txntype + "' and a.hfc_cd='" + hfc + "' group by  a.pmi_no";
            } else if (idType.equals("icnew") || idType.equals("002")) {
                searching = "select a.new_ic_no,a.old_ic_no,a.id_type,a.id_no,a.police_case,a.hfc_cd,a.pmi_no,a.episode_date,a.discipline_cd,a.subdiscipline_cd,a.ward_class_code,a.ward_id,a.bed_id,a.payer_group,a.patient_category_cd,a.visit_type_cd,a.emergency_type_cd,a.eligibility_type_cd,a.eligibility_category_cd,a.referred_from_hfc,a.referred_from_discipline,a.referred_reference_no,a.order_by,a.admission_reason,a.admission_description,a.guardian_ind,a.group_guardian,a.gl_expiry_date,a.inpatient_status,a.created_by,a.created_date,a.deposit_inpatient,a.document_type,a.document_no,a.patient_name,c.PATIENT_NAME,c.SEX_CODE,c.BIRTH_DATE,c.BLOOD_TYPE,b.order_no,b.order_date"
                        + ",b.hfc_cd,wwn.ward_name,wieh.ward_class_code,wieh.hfc_cd, wieh.ward_id"
                        + " from wis_inpatient_episode a left join wis_order_master b on a.pmi_no = b.pmi_no "
                        + "left join pms_patient_biodata c on a.pmi_no = c.pmi_no "
                        + "left join wis_ward_name wwn on wwn.ward_id = a.ward_id "
                        + "left join wis_inpatient_episode_history wieh on a.pmi_no = wieh.pmi_no "
                        + " where a.inpatient_status ='" + status + "' and a.NEW_IC_NO='" + idInput + "' and b.txn_type ='" + txntype + "' and a.hfc_cd='" + hfc + "' group by  a.pmi_no";

            } else if (idType.equals("icold") || idType.equals("003")) {
                searching = "select a.new_ic_no,a.old_ic_no,a.id_type,a.id_no, a.police_case,a.hfc_cd,a.pmi_no,a.episode_date,a.discipline_cd,a.subdiscipline_cd,a.ward_class_code,a.ward_id,a.bed_id,a.payer_group,a.patient_category_cd,a.visit_type_cd,a.emergency_type_cd,a.eligibility_type_cd,a.eligibility_category_cd,a.referred_from_hfc,a.referred_from_discipline,a.referred_reference_no,a.order_by,a.admission_reason,a.admission_description,a.guardian_ind,a.group_guardian,a.gl_expiry_date,a.inpatient_status,a.created_by,a.created_date,a.deposit_inpatient,a.document_type,a.document_no,a.patient_name,c.PATIENT_NAME,c.SEX_CODE,c.BIRTH_DATE,c.BLOOD_TYPE,b.order_no,b.order_date"
                        + ",b.hfc_cd,wwn.ward_name,wieh.ward_class_code,wieh.hfc_cd, wieh.ward_id"
                        + " from wis_inpatient_episode a left join wis_order_master b on a.pmi_no = b.pmi_no"
                        + "left join pms_patient_biodata c on a.pmi_no = c.pmi_no "
                        + "left join wis_ward_name wwn on wwn.ward_id = a.ward_id "
                        + "left join wis_inpatient_episode_history wieh on a.pmi_no = wieh.pmi_no "
                        + " where a.inpatient_status ='" + status + "' and  a.OLD_IC_NO='" + idInput + "' and b.txn_type ='" + txntype + "' and a.hfc_cd='" + hfc + "' group by  a.pmi_no";
            } else {
                searching = "select a.new_ic_no,a.old_ic_no,a.id_type,a.id_no,a.police_case,a.hfc_cd,a.pmi_no,a.episode_date,a.discipline_cd,a.subdiscipline_cd,a.ward_class_code,a.ward_id,a.bed_id,a.payer_group,a.patient_category_cd,a.visit_type_cd,a.emergency_type_cd,a.eligibility_type_cd,a.eligibility_category_cd,a.referred_from_hfc,a.referred_from_discipline,a.referred_reference_no,a.order_by,a.admission_reason,a.admission_description,a.guardian_ind,a.group_guardian,a.gl_expiry_date,a.inpatient_status,a.created_by,a.created_date,a.deposit_inpatient,a.document_type,a.document_no,a.patient_name,c.PATIENT_NAME,c.SEX_CODE,c.BIRTH_DATE,c.BLOOD_TYPE,b.order_no,b.order_date"
                        + ",b.hfc_cd,wwn.ward_name,wieh.ward_class_code,wieh.hfc_cd, wieh.ward_id"
                        + " from wis_inpatient_episode a left join wis_order_master b on a.pmi_no = b.pmi_no "
                        + "left join pms_patient_biodata c on a.pmi_no = c.pmi_no "
                        + "left join wis_ward_name wwn on wwn.ward_id = a.ward_id "
                        + "left join wis_inpatient_episode_history wieh on a.pmi_no = wieh.pmi_no "
                        + " where a.inpatient_status ='" + status + "' and a.ID_NO='" + idInput + "' and b.txn_type ='" + txntype + "'AND a.ID_TYPE='" + idType + "' and a.hfc_cd='" + hfc + "' group by  a.pmi_no";
            }

        } else if (methodSearching.equalsIgnoreCase("0")) {
            searching = "select a.new_ic_no,a.old_ic_no,a.id_type,a.id_no,a.police_case,a.hfc_cd,a.pmi_no,a.episode_date,a.discipline_cd,a.subdiscipline_cd,a.ward_class_code,a.ward_id,a.bed_id,a.payer_group,a.patient_category_cd,a.visit_type_cd,a.emergency_type_cd,a.eligibility_type_cd,a.eligibility_category_cd,a.referred_from_hfc,a.referred_from_discipline,a.referred_reference_no,a.order_by,a.admission_reason,a.admission_description,a.guardian_ind,a.group_guardian,a.gl_expiry_date,a.inpatient_status,a.created_by,a.created_date,a.deposit_inpatient,a.document_type,a.document_no,a.patient_name,c.PATIENT_NAME,c.SEX_CODE,c.BIRTH_DATE,c.BLOOD_TYPE,b.order_no,b.order_date"
                    + ",b.hfc_cd,wwn.ward_name,wieh.ward_class_code,wieh.hfc_cd, wieh.ward_id "
                    + " from wis_inpatient_episode a left join wis_order_master b on a.pmi_no = b.pmi_no "
                    + "left join pms_patient_biodata c on a.pmi_no = c.pmi_no "
                    + "left join wis_ward_name wwn on wwn.ward_id = a.ward_id "
                    + "left join wis_inpatient_episode_history wieh on a.pmi_no = wieh.pmi_no "
                    + "where a.inpatient_status ='" + status + "' and a.ward_id ='" + idWard + "' and b.txn_type ='" + txntype + "' and b.hfc_cd='" + hfc + "' group by  a.pmi_no ";
        }
        
         
       

        ArrayList<ArrayList<String>> dataList = conn.getData(searching);
        //out.print(searching);
        int size1141 = dataList.size();
        if (size1141 > 0) {
           

            for (int i = 0; i < size1141; i++) {


    %>




<input type="hidden" value="<%= dataList.get(i).get(8)%>" id="disi">
<input type="hidden"  value="<%= dataList.get(i).get(11)%>" id="wnamei">
<input type="hidden"  value="<%= dataList.get(i).get(18)%>" id="EliSrci">
<input type="hidden"  value="<%= dataList.get(i).get(10)%>" id="wtypei">
<input type="hidden"  value="<%= dataList.get(i).get(17)%>" id="EliTy1">
<input type="hidden"  value="<%= dataList.get(i).get(7)%>" id="admissionDate">


<input type="hidden" value="<%= dataList.get(i).get(10)%>" id="i">

<tr id="moveToPatientTransferButton">

<input id="dataWardhidden" type="hidden" value="<%=String.join("|", dataList.get(i))%>">
<td><%= dataList.get(i).get(42)%></td>
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
<td colspan="7"> No patient found! </td>
<% }
%>
<div id="resultPatientDischarge">
    <div class="col-md-6" id="depositResult">



        <!--        <input id="dDeposit"   class="form-control input-md">
                <input id="dCost"   class="form-control input-md">
                <input id="dDiscount"  class="form-control input-md">
                <input id="TotalDischarge"   class="form-control input-md">-->

    </div>

</div>

</tbody>
</table>


<%
//    String EliTy1 = request.getParameter("EliTy1");
//
//    String resultEliSrc = "select  Master_Reference_Code, Detail_Reference_Code, Description from adm_lookup_detail where master_reference_code = '0034' and  Detail_Reference_Code like '" + EliTy1 + "%' and hfc_cd ='" + hfc + "' ";
//    ArrayList<ArrayList<String>> dataresultEliSrc = conn.getData(resultEliSrc);
//
//    int size = dataresultEliSrc.size();
//    for (int i2 = 0; i2 < size; i2++) {
//
//        String reEliSrc = dataresultEliSrc.get(i2).get(1);
//       
//    }
%>


<script>
    $(document).ready(function () {


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
            var RefFrom = arrayData[19];
            var RefBy = arrayData[20];
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
            var Btype = arrayData[38];
            var Bdate = arrayData[37];
            var gender = arrayData[36];
            var order_no = arrayData[39];
            var order_date = arrayData[40];
            var hfc_cd = arrayData[41];
            var tWWC = arrayData[43];
            var tWI = arrayData[45];
            var thfc_cd = arrayData[44];





            var data = {
                EliSrc: EliSrc,
                EliTy: EliTy,
                Dis: Dis,
                WardType: WardType,
                wname: wname,
                admissionDate: admissionDate,
                DocTy: DocTy,
                AdmTy: AdmTy,
                pmino: pmino,
                tWWC: tWWC,
                tWI: tWI,
                thfc_cd: thfc_cd

            };
            $.ajax({
                type: "post",
                url: "resultDischarge.jsp",
                data: data,
                timeout: 10000,
                success: function (list) {
                    //remove the loading 
                    //console.log(list);
                    $('#depositResult').html(list);




///////total normal discharge/////
                    var totalday = $('#totalday').val();
                    var Deposit = $('#dDeposit').val();
                    var Discount = $('#dDiscount').val();
                    var Rate = $('#dCost').val();

                    var TotalDiscount = (Discount / 100) * Rate;
                    var TotalDischargeNORMAL = (Rate * totalday) - TotalDiscount - Deposit;

///////total transfer discharge/////
                    var totaltransferday = $('#totaltransferday').val();
                    var DepositTRANSFER = $('#dDepositTRANSFER').val();
                    var DiscountTRANSFER = $('#dDiscountTRANSFER').val();
                    var RateTRANSFER = $('#dCostTRANSFER').val();

                    var TotalDiscountTRANSFER = (DiscountTRANSFER / 100) * RateTRANSFER;
                    var TotalDischargeTRANSFER = (RateTRANSFER * totaltransferday) - TotalDiscountTRANSFER - DepositTRANSFER;

                    var TotalDischarge = TotalDischargeTRANSFER + TotalDischargeNORMAL;




                    $("#totaltransferday").val(totaltransferday);
                    $("#TotalDischargeNORMAL").val(TotalDischargeNORMAL);
                    $("#TotalDischargeTRANSFER").val(TotalDischargeTRANSFER);

                  //  $("#TotalDischarge").val(TotalDischarge);
                }
                ,
                error: function (xhr, status, error) {
                    var err = eval("(" + xhr.responseText + ")");
                    //bootbox.alert(err.Message);
                }
            }
            );
            $("#Btype").val(Btype);
            $("#Bdate").val(Bdate);
            $("#gender").val(gender);
            $("#order_no").val(order_no);
            $("#order_date").val(order_date);
            $("#hfc_cd").val(hfc_cd);



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
            $("#disb").val(Dis);
            $("#WardTypeb").val(WardType);
            $("#wnameb").val(wname);
            $("#Deposit").val(Deposit);
            $("#BedIDReg").val(BedIDReg);
            $("#hfcTo").val(hfcTo);
            $("#DrAttain").val(DrAttain);
            $("#hfc_cd").val(hfc_cd);



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

    });

</script>