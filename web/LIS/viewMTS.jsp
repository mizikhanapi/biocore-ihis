<%@page import="java.util.Calendar"%>
<%@page import="jxl.format.Pattern"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Config.connect"%>
<%@page import="java.util.ArrayList"%>
<%
    String result = request.getParameter("process");
    String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    Conn conn = new Conn();
    
    String sql = "";
    if (result.equals("1")) {
        sql = "SELECT DISTINCT lis_order_master.order_date,lis_order_master.order_from_discipline,lis_order_master.order_to_discipline,lis_order_master.HFC_FROM,lis_order_master.HFC_TO,lis_order_master.created_by,lis_order_master.order_status,pms_patient_biodata.NEW_IC_NO,pms_patient_biodata.BIRTH_DATE,pms_patient_biodata.SEX_CODE,pms_patient_biodata.BLOOD_TYPE,lis_order_master.order_status,ls.specimen_no,lis_order_master.ORDER_NO,ls.item_cd,lis_order_master.PMI_NO,pms_patient_biodata.`PATIENT_NAME`,s.description,b.description,c.`Description`,d.`Description`,e.`USER_NAME`,f.hfc_name,ls.receive_specimen_status FROM lis_order_master JOIN pms_patient_biodata ON (lis_order_master.PMI_NO = pms_patient_biodata.PMI_NO) JOIN adm_lookup_detail s on pms_patient_biodata.SEX_CODE = s.detail_reference_code AND s.master_reference_code = '0041' AND s.hfc_cd = lis_order_master.hfc_cd LEFT JOIN adm_lookup_detail b on pms_patient_biodata.BLOOD_TYPE = b.detail_reference_code AND b.master_reference_code = '0074' AND b.hfc_cd = lis_order_master.hfc_cd LEFT JOIN adm_users a on lis_order_master.order_by = a.`USER_ID` LEFT JOIN adm_lookup_detail c on pms_patient_biodata.NATIONALITY = c.detail_reference_code AND c.master_reference_code = '0011' AND b.hfc_cd = lis_order_master.hfc_cd LEFT JOIN adm_lookup_detail d on pms_patient_biodata.`RACE_CODE` = d.detail_reference_code AND d.master_reference_code = '0004' LEFT JOIN adm_users e on lis_order_master.order_by = e.`USER_ID` LEFT JOIN adm_health_facility f ON f.hfc_cd = lis_order_master.hfc_cd, lis_specimen ls,lis_order_detail lod WHERE lis_order_master.order_no=lod.order_no AND ls.order_no=lod.order_no AND lis_order_master.pmi_no = pms_patient_biodata.PMI_NO AND lis_order_master.hfc_cd = '" + hfc_cd + "' AND ls.Collection_date = CURDATE() GROUP BY ls.specimen_no";
    }
    if (result.equals("2")) {
        sql = "SELECT DISTINCT lis_order_master.order_date,lis_order_master.order_from_discipline,lis_order_master.order_to_discipline,lis_order_master.HFC_FROM,lis_order_master.HFC_TO,lis_order_master.created_by,lis_order_master.order_status,pms_patient_biodata.NEW_IC_NO,pms_patient_biodata.BIRTH_DATE,pms_patient_biodata.SEX_CODE,pms_patient_biodata.BLOOD_TYPE,lis_order_master.order_status,ls.specimen_no,lis_order_master.ORDER_NO,ls.item_cd,lis_order_master.PMI_NO,pms_patient_biodata.`PATIENT_NAME`,s.description,b.description,c.`Description`,d.`Description`,e.`USER_NAME`,f.hfc_name,ls.receive_specimen_status FROM lis_order_master JOIN pms_patient_biodata ON (lis_order_master.PMI_NO = pms_patient_biodata.PMI_NO) JOIN adm_lookup_detail s on pms_patient_biodata.SEX_CODE = s.detail_reference_code AND s.master_reference_code = '0041' AND s.hfc_cd = lis_order_master.hfc_cd LEFT JOIN adm_lookup_detail b on pms_patient_biodata.BLOOD_TYPE = b.detail_reference_code AND b.master_reference_code = '0074' AND b.hfc_cd = lis_order_master.hfc_cd LEFT JOIN adm_users a on lis_order_master.order_by = a.`USER_ID` LEFT JOIN adm_lookup_detail c on pms_patient_biodata.NATIONALITY = c.detail_reference_code AND c.master_reference_code = '0011' AND b.hfc_cd = lis_order_master.hfc_cd LEFT JOIN adm_lookup_detail d on pms_patient_biodata.`RACE_CODE` = d.detail_reference_code AND d.master_reference_code = '0004' LEFT JOIN adm_users e on lis_order_master.order_by = e.`USER_ID` LEFT JOIN adm_health_facility f ON f.hfc_cd = lis_order_master.hfc_cd, lis_specimen ls,lis_order_detail lod WHERE lis_order_master.order_no=lod.order_no AND ls.order_no=lod.order_no AND lis_order_master.pmi_no = pms_patient_biodata.PMI_NO AND lis_order_master.hfc_cd = '" + hfc_cd + "' AND MONTH(ls.Collection_date) = MONTH(CURRENT_DATE()) GROUP BY ls.specimen_no";
    }
    if (result.equals("3")) {
        sql = "SELECT DISTINCT lis_order_master.order_date,lis_order_master.order_from_discipline,lis_order_master.order_to_discipline,lis_order_master.HFC_FROM,lis_order_master.HFC_TO,lis_order_master.created_by,lis_order_master.order_status,pms_patient_biodata.NEW_IC_NO,pms_patient_biodata.BIRTH_DATE,pms_patient_biodata.SEX_CODE,pms_patient_biodata.BLOOD_TYPE,lis_order_master.order_status,ls.specimen_no,lis_order_master.ORDER_NO,ls.item_cd,lis_order_master.PMI_NO,pms_patient_biodata.`PATIENT_NAME`,s.description,b.description,c.`Description`,d.`Description`,e.`USER_NAME`,f.hfc_name,ls.receive_specimen_status FROM lis_order_master JOIN pms_patient_biodata ON (lis_order_master.PMI_NO = pms_patient_biodata.PMI_NO) JOIN adm_lookup_detail s on pms_patient_biodata.SEX_CODE = s.detail_reference_code AND s.master_reference_code = '0041' AND s.hfc_cd = lis_order_master.hfc_cd LEFT JOIN adm_lookup_detail b on pms_patient_biodata.BLOOD_TYPE = b.detail_reference_code AND b.master_reference_code = '0074' AND b.hfc_cd = lis_order_master.hfc_cd LEFT JOIN adm_users a on lis_order_master.order_by = a.`USER_ID` LEFT JOIN adm_lookup_detail c on pms_patient_biodata.NATIONALITY = c.detail_reference_code AND c.master_reference_code = '0011' AND b.hfc_cd = lis_order_master.hfc_cd LEFT JOIN adm_lookup_detail d on pms_patient_biodata.`RACE_CODE` = d.detail_reference_code AND d.master_reference_code = '0004' LEFT JOIN adm_users e on lis_order_master.order_by = e.`USER_ID` LEFT JOIN adm_health_facility f ON f.hfc_cd = lis_order_master.hfc_cd, lis_specimen ls,lis_order_detail lod WHERE lis_order_master.order_no=lod.order_no AND ls.order_no=lod.order_no AND lis_order_master.pmi_no = pms_patient_biodata.PMI_NO AND lis_order_master.hfc_cd = '" + hfc_cd + "' AND YEAR(ls.Collection_date) = YEAR(CURDATE()) GROUP BY ls.specimen_no";
    }
    if (result.equals("4")) {
        sql = "SELECT DISTINCT lis_order_master.order_date,lis_order_master.order_from_discipline,lis_order_master.order_to_discipline,lis_order_master.HFC_FROM,lis_order_master.HFC_TO,lis_order_master.created_by,lis_order_master.order_status,pms_patient_biodata.NEW_IC_NO,pms_patient_biodata.BIRTH_DATE,pms_patient_biodata.SEX_CODE,pms_patient_biodata.BLOOD_TYPE,lis_order_master.order_status,ls.specimen_no,lis_order_master.ORDER_NO,ls.item_cd,lis_order_master.PMI_NO,pms_patient_biodata.`PATIENT_NAME`,s.description,b.description,c.`Description`,d.`Description`,e.`USER_NAME`,f.hfc_name,ls.receive_specimen_status FROM lis_order_master JOIN pms_patient_biodata ON (lis_order_master.PMI_NO = pms_patient_biodata.PMI_NO) JOIN adm_lookup_detail s on pms_patient_biodata.SEX_CODE = s.detail_reference_code AND s.master_reference_code = '0041' AND s.hfc_cd = lis_order_master.hfc_cd LEFT JOIN adm_lookup_detail b on pms_patient_biodata.BLOOD_TYPE = b.detail_reference_code AND b.master_reference_code = '0074' AND b.hfc_cd = lis_order_master.hfc_cd LEFT JOIN adm_users a on lis_order_master.order_by = a.`USER_ID` LEFT JOIN adm_lookup_detail c on pms_patient_biodata.NATIONALITY = c.detail_reference_code AND c.master_reference_code = '0011' AND b.hfc_cd = lis_order_master.hfc_cd LEFT JOIN adm_lookup_detail d on pms_patient_biodata.`RACE_CODE` = d.detail_reference_code AND d.master_reference_code = '0004' LEFT JOIN adm_users e on lis_order_master.order_by = e.`USER_ID` LEFT JOIN adm_health_facility f ON f.hfc_cd = lis_order_master.hfc_cd, lis_specimen ls,lis_order_detail lod WHERE lis_order_master.order_no=lod.order_no AND ls.order_no=lod.order_no AND lis_order_master.pmi_no = pms_patient_biodata.PMI_NO AND lis_order_master.hfc_cd = '" + hfc_cd + "' GROUP BY ls.specimen_no";
    }
%>
<table id="MTC"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <%
        
        ArrayList<ArrayList<String>> dataPatientApp = conn.getData(sql);
    %>
    <thead>
        <tr>
            <th >Specimen No</th>
            <th >Order No</th>
            <th >PMI No</th>				 
            <th >Patient Name</th>
            <th >Order Source</th>
            <th >Receive Specimen</th>
            <th >Action</th>
        </tr>
    </thead>
    <tbody>

        <%if (dataPatientApp.size() > 0) {
                for (int i = 0; i < dataPatientApp.size(); i++) {%>
        <tr>
            <td><%=dataPatientApp.get(i).get(12)%></td>
            <td><%=dataPatientApp.get(i).get(13)%></td>
            <td>
                <button  class='btn btn-link' data-toggle="modal" data-target="#PMI_<%=i%>"><%=dataPatientApp.get(i).get(15)%></button>
                <div class="modal fade" id="PMI_<%=i%>" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><%= new SimpleDateFormat("HH:mm:ss").format(new java.util.Date())%></button>
                                    <h4 class="modal-title" id="myModalLabel">Patient Information</h4>
                                </div>
                                <br><br>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1"> PMI No: <%=dataPatientApp.get(i).get(15)%></label>
                                        </div>
                                        <br>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1"> IC No: <%=dataPatientApp.get(i).get(7)%></label>
                                        </div>
                                        <br>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1"> Gender: 
                                                <%=dataPatientApp.get(i).get(17)%>
                                            </label>
                                        </div>
                                        <br>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1"> Race: <%=dataPatientApp.get(i).get(20)%></label>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1"> Name: <%=dataPatientApp.get(i).get(16)%></label>
                                        </div>
                                        <br>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1"> Age: <%
                                                String birth = dataPatientApp.get(i).get(8);
                                                boolean retval = birth.contains("-");
                                                if (birth.contains("-")) {
                                                    String[] parts = birth.split("-");
                                                    int years = Integer.parseInt(parts[0]);
                                                    Calendar now = Calendar.getInstance();   // Gets the current date and time
                                                    int year = now.get(Calendar.YEAR);
                                                    int age = year - years;
                                                    out.println(age);

                                                } else {
                                                    String[] parts = birth.split("/");
                                                    int years = Integer.parseInt(parts[2]);
                                                    Calendar now = Calendar.getInstance();   // Gets the current date and time
                                                    int year = now.get(Calendar.YEAR);
                                                    int age = year - years;
                                                    out.println(age);
                                                }%></label>
                                        </div>
                                        <br>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1"> Date of Birth: <%=dataPatientApp.get(i).get(8)%></label>
                                        </div>
                                        <br>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1"> Nationality: <%=dataPatientApp.get(i).get(19)%></label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </td>
            <td style="font-weight: 500;"><%=dataPatientApp.get(i).get(16)%></td>
            <td>
                <button  class='btn btn-link' data-toggle="modal" data-target="#basicModal_<%=i%>">View Detail</button>
                <div class="modal fade" id="basicModal_<%=i%>" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><%= new SimpleDateFormat("HH:mm:ss").format(new java.util.Date())%></button>
                                    <h4 class="modal-title" id="myModalLabel">Order Source</h4>
                                </div>
                                <br><br>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1"> Requester Name: <%=dataPatientApp.get(i).get(21)%></label>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1"> Requester Location: <%=dataPatientApp.get(i).get(22)%></label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </td>
            <td><%=dataPatientApp.get(i).get(23)%></td>
            <td>
                <a href='ReceiveSpecimen.jsp?pmi=<%=dataPatientApp.get(i).get(15)%> &specimen_no=<%=dataPatientApp.get(i).get(12)%>' class='btn btn-primary btn-block' >Identify Specimen</a>
            </td>

        </tr>
        <%
            }
        }
        %>
    </tbody>
</table>

<script type="text/javascript" charset="utf-8">
    $(document).ready(function () {
        $('#MTC').DataTable();
    });
</script>