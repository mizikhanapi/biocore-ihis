<%@page import="java.util.Calendar"%>
<%@page import="jxl.format.Pattern"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Config.connect"%>
<%@page import="java.util.ArrayList"%>
<table id="MTC"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <%
        Conn conn = new Conn();
String sql = "SELECT DISTINCT lis_order_master.order_date,lis_order_master.order_from_discipline,lis_order_master.order_to_discipline,lis_order_master.HFC_FROM,lis_order_master.HFC_TO,lis_order_master.created_by,lis_order_master.order_status,pms_patient_biodata.NEW_IC_NO,pms_patient_biodata.BIRTH_DATE,pms_patient_biodata.SEX_CODE,pms_patient_biodata.BLOOD_TYPE,lis_order_master.order_status,ls.specimen_no,lis_order_master.ORDER_NO,ls.item_cd,lis_order_master.PMI_NO,pms_patient_biodata.`PATIENT_NAME`,s.description,b.description,c.`Description`,d.`Description`,e.`USER_NAME`,f.hfc_name FROM lis_order_master JOIN pms_patient_biodata ON (lis_order_master.PMI_NO = pms_patient_biodata.PMI_NO) JOIN adm_lookup_detail s on pms_patient_biodata.SEX_CODE = s.detail_reference_code AND s.master_reference_code = '0041' AND s.hfc_cd = lis_order_master.hfc_cd LEFT JOIN adm_lookup_detail b on pms_patient_biodata.BLOOD_TYPE = b.detail_reference_code AND b.master_reference_code = '0074' AND b.hfc_cd = lis_order_master.hfc_cd LEFT JOIN adm_users a on lis_order_master.order_by = a.`USER_ID` LEFT JOIN adm_lookup_detail c on pms_patient_biodata.NATIONALITY = c.detail_reference_code AND c.master_reference_code = '0011' AND b.hfc_cd = lis_order_master.hfc_cd LEFT JOIN adm_lookup_detail d on pms_patient_biodata.`RACE_CODE` = d.detail_reference_code AND d.master_reference_code = '0004' LEFT JOIN adm_users e on lis_order_master.order_by = e.`USER_ID` LEFT JOIN adm_health_facility f ON f.hfc_cd = lis_order_master.hfc_cd, lis_specimen ls,lis_order_detail lod WHERE lis_order_master.order_no=lod.order_no AND ls.order_no=lod.order_no AND lis_order_master.pmi_no = pms_patient_biodata.PMI_NO AND lis_order_master.hfc_cd = '04010103'";
ArrayList<ArrayList<String>> dataPatientApp = conn.getData(sql);
    %>
    <thead>
        <tr>
            <th class="col-sm-1">Specimen No</th>
            <th class="col-sm-1">Order No</th>
            <th class="col-sm-1">Item Code</th>
            <th class="col-sm-1">PMI No</th>				 
            <th class="col-sm-1">Patient Name</th>
            <th class="col-sm-1">Order Source</th>
            <th class="col-sm-1">Receive Specimen</th>
            <th class="col-sm-1">Action</th>
        </tr>
    </thead>
    <tbody>

        <%if (dataPatientApp.size() > 0) {
                for (int i = 0; i < dataPatientApp.size(); i++) {%>
        <tr>
            <td><%=dataPatientApp.get(i).get(12)%></td>
            <td><%=dataPatientApp.get(i).get(13)%></td>
            <td><%=dataPatientApp.get(i).get(14)%></td>
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
                                            <label for="exampleInputEmail1"> PMI No: <%=dataPatientApp.get(i).get(12)%></label>
                                        </div>
                                        <br>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1"> IC No: <%=dataPatientApp.get(i).get(15)%></label>
                                        </div>
                                        <br>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1"> Gender: 
                                                <%
//                                                    String getGender = "SELECT ald.`Description` FROM adm_lookup_master alm,adm_lookup_detail ald WHERE alm.`Master_Reference_code`=ald.`Master_Reference_code` AND alm.`Description` = 'Gender' AND ald.`Detail_Reference_code` = '"+dataPatientApp.get(i).get(6)+"'";
//                                                    ArrayList<ArrayList<String>> q2 = conn.getData(getGender);
//                                                    //out.println(q2.get(0).get(0));
                                                %>
                                            </label>
                                        </div>
                                        <br>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1"> Race: <%=dataPatientApp.get(i).get(15)%></label>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1"> Name: <%=dataPatientApp.get(i).get(15)%></label>
                                        </div>
                                        <br>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1"> Age: <%
//                                                String birth = dataPatientApp.get(i).get(8);
//                                                String[] parts = birth.split("/");
//                                                int years = Integer.parseInt(parts[2]);
//                                                Calendar now = Calendar.getInstance();   // Gets the current date and time
//                                                int year = now.get(Calendar.YEAR); 
//                                                int age = year-years;
//                                                out.println(age);
                                                
                                            %></label>
                                        </div>
                                        <br>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1"> Date of Birth: <%=dataPatientApp.get(i).get(15)%></label>
                                        </div>
                                        <br>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1"> Nationality: <%=dataPatientApp.get(i).get(15)%></label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </td>
            <td><%=dataPatientApp.get(i).get(13)%></td>
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
                                            <label for="exampleInputEmail1"> Requester Name: <%=dataPatientApp.get(i).get(14)%></label>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1"> Requester Location: <%=dataPatientApp.get(i).get(14)%></label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </td>
            <td><%=dataPatientApp.get(i).get(14)%></td>
            <td>
                <a href='ReceiveSpecimen.jsp?pmi=<%=dataPatientApp.get(i).get(12)%> &specimen_no=<%=dataPatientApp.get(i).get(14)%>' class='btn btn-primary btn-block' >Identify Specimen</a>
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
