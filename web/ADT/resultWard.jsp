<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="dBConn.Conn"%>
<%@page import="Config.Config"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>




<table id="OccuTableTT"  class="table table-striped table-bordered" cellspacing="0" width="100%">


    <thead>


    <th>Ward Name</th>
    <th>Bed</th>
    <th>Patient Name</th>
    <th>Patient ID</th>
    <th>Sponsor</th>
    <th>Transfer</th>
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
    Conn conn = new Conn();
    //1 --- search by patient
    //0 --- search by ward list
    if(methodSearching.equalsIgnoreCase("1")){
        if (idType.equals("pmino") || idType.equals("001")) {
            searching = "select new_ic_no,old_ic_no,id_type,id_no,police_case,hfc_cd,pmi_no,episode_date,discipline_cd,subdiscipline_cd,ward_class_code,ward_id,bed_id,payer_group,patient_category_cd,visit_type_cd,emergency_type_cd,eligibility_type_cd,eligibility_category_cd,referred_from_hfc,referred_from_discipline,referred_reference_no,order_by,admission_reason,admission_description,guardian_ind,group_guardian,gl_expiry_date,inpatient_status,created_by,created_date,deposit_inpatient,document_type,document_no,patient_name"
                    + " from wis_inpatient_episode "
                    + " where pmi_no='" + idInput + "' and hfc_cd='"+hfc+"'";
        } else if (idType.equals("icnew") || idType.equals("002")) {
            searching = "select new_ic_no,old_ic_no,id_type,id_no,police_case,hfc_cd,pmi_no,episode_date,discipline_cd,subdiscipline_cd,ward_class_code,ward_id,bed_id,payer_group,patient_category_cd,visit_type_cd,emergency_type_cd,eligibility_type_cd,eligibility_category_cd,referred_from_hfc,referred_from_discipline,referred_reference_no,order_by,admission_reason,admission_description,guardian_ind,group_guardian,gl_expiry_date,inpatient_status,created_by,created_date,deposit_inpatient,document_type,document_no,patient_name"
                    + " from wis_inpatient_episode"
                    + " where NEW_IC_NO='" + idInput + "' and hfc_cd='"+hfc+"'";

        } else if (idType.equals("icold") || idType.equals("003")) {
            searching = "select new_ic_no,old_ic_no,id_type,id_no,police_case,hfc_cd,pmi_no,episode_date,discipline_cd,subdiscipline_cd,ward_class_code,ward_id,bed_id,payer_group,patient_category_cd,visit_type_cd,emergency_type_cd,eligibility_type_cd,eligibility_category_cd,referred_from_hfc,referred_from_discipline,referred_reference_no,order_by,admission_reason,admission_description,guardian_ind,group_guardian,gl_expiry_date,inpatient_status,created_by,created_date,deposit_inpatient,document_type,document_no,patient_name"
                    + " from wis_inpatient_episode"
                    + " where OLD_IC_NO='" + idInput + "' and hfc_cd='"+hfc+"'";
        } else {
            searching = "select new_ic_no,old_ic_no,id_type,id_no,police_case,hfc_cd,pmi_no,episode_date,discipline_cd,subdiscipline_cd,ward_class_code,ward_id,bed_id,payer_group,patient_category_cd,visit_type_cd,emergency_type_cd,eligibility_type_cd,eligibility_category_cd,referred_from_hfc,referred_from_discipline,referred_reference_no,order_by,admission_reason,admission_description,guardian_ind,group_guardian,gl_expiry_date,inpatient_status,created_by,created_date,deposit_inpatient,document_type,document_no,patient_name"
                    + " from wis_inpatient_episode"
                    + " where ID_NO='" + idInput + "' AND ID_TYPE='" + idType + "' and hfc_cd='"+hfc+"'";
        }
        
    }else if(methodSearching.equalsIgnoreCase("0")){
        searching = "select new_ic_no,old_ic_no,id_type,id_no,police_case,hfc_cd,pmi_no,episode_date,discipline_cd,subdiscipline_cd,ward_class_code,ward_id,bed_id,payer_group,patient_category_cd,visit_type_cd,emergency_type_cd,eligibility_type_cd,eligibility_category_cd,referred_from_hfc,referred_from_discipline,referred_reference_no,order_by,admission_reason,admission_description,guardian_ind,group_guardian,gl_expiry_date,inpatient_status,created_by,created_date,deposit_inpatient,document_type,document_no,patient_name from wis_inpatient_episode where ward_id ='"+idWard+"' and hfc_cd='"+hfc+"'";
    }
    
    ArrayList<ArrayList<String>> dataList = conn.getData(searching);

        int size1141 = dataList.size();
        if(size1141 > 0 ){
        
        for (int i = 0; i < size1141; i++) {


    %>


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
<td>
    <!-- Delete Button Start -->
    <a id="Occu_delete" class="testing"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;" ></i></a>
    <!-- Delete Button End -->
</td>
</tr>
<%
    }
}else if(size1141 < 1){ %>
<td colspan="7"> No row selected! </td>
<% }
%>

</tbody>
</table>
