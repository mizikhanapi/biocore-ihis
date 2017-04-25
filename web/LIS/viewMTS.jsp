<%@page import="java.util.Calendar"%>
<%@page import="jxl.format.Pattern"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Config.connect"%>
<%@page import="java.util.ArrayList"%>

<table id="MTC"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <%
        // Statement st = con.createStatement();
        //  ResultSet resultset = 
        // st.executeQuery("SELECT om.order_no,OM.PMI_NO,PMS.PATIENT_NAME,OM.ORDER_DATE,OM.HFC_CD,OM.EPISODE_DATE,OM.ORDER_BY FROM LIS_ORDER_MASTER OM, PMS_PATIENT_BIODATA PMS WHERE OM.pmi_no = PMS.PMI_NO");
        Conn conn = new Conn();
        String sqlPatientApp = "SELECT DISTINCT ls.item_cd,ls.specimen_no,ls.pmi_no,ls.patient_name,lom.order_by,pms.NEW_IC_NO,pms.SEX_CODE,pms.RACE_CODE,pms.BIRTH_DATE,pms.NATIONALITY,ls.hfc_cd,ls.specimen_status,ls.order_no,ls.item_cd,ls.receive_specimen_status FROM lis_specimen ls,lis_order_detail lod,lis_order_master lom,pms_patient_biodata pms WHERE ls.order_no=lod.order_no AND lod.order_no= lom.order_no AND lom.pmi_no = pms.PMI_NO GROuP BY(ls.specimen_no)";
        ArrayList<ArrayList<String>> dataPatientApp = conn.getData(sqlPatientApp);

    %>
    <thead>
        <tr>
            <th class="col-sm-1">Specimen No</th>
            <th class="col-sm-1">Order No</th>
            <th class="col-sm-1">Item Code</th>
            <th class="col-sm-1">PMI No</th>
            <th class="col-sm-1">Registration No</th>				 
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
            <td><%=dataPatientApp.get(i).get(1)%></td>
            <td><%=dataPatientApp.get(i).get(12)%></td>
            <td><%=dataPatientApp.get(i).get(13)%></td>
            <td>
                <button  class='btn btn-link' data-toggle="modal" data-target="#PMI_<%=i%>"><%=dataPatientApp.get(i).get(2)%></button>
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
                                            <label for="exampleInputEmail1"> PMI No: <%=dataPatientApp.get(i).get(2)%></label>
                                        </div>
                                        <br>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1"> IC No: <%=dataPatientApp.get(i).get(5)%></label>
                                        </div>
                                        <br>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1"> Gender: 
                                                <%
                                                    String getGender = "SELECT ald.`Description` FROM adm_lookup_master alm,adm_lookup_detail ald WHERE alm.`Master_Reference_code`=ald.`Master_Reference_code` AND alm.`Description` = 'Gender' AND ald.`Detail_Reference_code` = '"+dataPatientApp.get(i).get(6)+"'";
                                                    ArrayList<ArrayList<String>> q2 = conn.getData(getGender);
                                                    out.println(q2.get(0).get(0));
                                                %>
                                            </label>
                                        </div>
                                        <br>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1"> Race: <%=dataPatientApp.get(i).get(7)%></label>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1"> Name: <%=dataPatientApp.get(i).get(3)%></label>
                                        </div>
                                        <br>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1"> Age: <%
                                                String birth = dataPatientApp.get(i).get(8);
                                                String[] parts = birth.split("/");
                                                int years = Integer.parseInt(parts[2]);
                                                Calendar now = Calendar.getInstance();   // Gets the current date and time
                                                int year = now.get(Calendar.YEAR); 
                                                int age = year-years;
                                                out.println(age);
                                                
                                            %></label>
                                        </div>
                                        <br>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1"> Date of Birth: <%=dataPatientApp.get(i).get(8)%></label>
                                        </div>
                                        <br>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1"> Nationality: <%=dataPatientApp.get(i).get(9)%></label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </td>
            <td></td>
            <td><%=dataPatientApp.get(i).get(3)%></td>
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
                                            <label for="exampleInputEmail1"> Requester Name: <%=dataPatientApp.get(i).get(4)%></label>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1"> Requester Location: <%=dataPatientApp.get(i).get(10)%></label>
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
                <a href='ReceiveSpecimen.jsp?pmi=<%=dataPatientApp.get(i).get(2)%> &specimen_no=<%=dataPatientApp.get(i).get(1)%>' class='btn btn-primary btn-block' >Identify Specimen</a>
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