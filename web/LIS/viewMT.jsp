<%@page import="dBConn.Conn"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Config.connect"%>
<%@page import="java.util.ArrayList"%>
<table id="MTC"  class="table table-striped table-bordered" cellspacing="0" width="100%">
                            <%
                                Conn conn = new Conn();
                              // Statement st = con.createStatement();
                             //  ResultSet resultset = 
                              // st.executeQuery("SELECT om.order_no,OM.PMI_NO,PMS.PATIENT_NAME,OM.ORDER_DATE,OM.HFC_CD,OM.EPISODE_DATE,OM.ORDER_BY FROM LIS_ORDER_MASTER OM, PMS_PATIENT_BIODATA PMS WHERE OM.pmi_no = PMS.PMI_NO");
                                     String sqlPatientApp = "SELECT DISTINCT ls.specimen_no,ls.pmi_no,pms.NEW_IC_NO,pms.PATIENT_NAME,lom.order_no,lom.order_date FROM lis_specimen ls,lis_order_detail lod,lis_order_master lom,pms_patient_biodata pms WHERE ls.order_no=lod.order_no AND lod.order_no= lom.order_no AND lom.pmi_no = pms.PMI_NO GROuP BY(ls.specimen_no)";
                                     ArrayList<ArrayList<String>> dataPatientApp = conn.getData(sqlPatientApp);    

                        %>
                        <thead>
                            <tr>
                                <th class="col-sm-1">Specimen No</th>
                                <th class="col-sm-1">PMI No</th>
                                <th class="col-sm-1">IC No</th>
                                <th class="col-sm-1">Name</th>
                                <th class="col-sm-1">Registration No</th>				 
                                <th class="col-sm-1">Order No</th>
                                <th class="col-sm-1">Order Date</th>
                                <th class="col-sm-1">Order Time</th>
                                <th class="col-sm-1">Action</th>
                            </tr>
                        </thead>
                        <tbody>
           
                        <%if (dataPatientApp.size() > 0) 
                          {
                              for (int i = 0; i < dataPatientApp.size(); i++) 
                          {%>
                          <tr>
                              <td><%=dataPatientApp.get(i).get(0)%><input type="text" id="specimen_no" value="<%=dataPatientApp.get(i).get(0)%>" style="display: none;"></td>
                              <td><%=dataPatientApp.get(i).get(1)%><input type="text" id="pmi" value="<%=dataPatientApp.get(i).get(1)%>" style="display: none;"></td>
                              <td><%=dataPatientApp.get(i).get(2)%></td>
                              <td><%=dataPatientApp.get(i).get(3)%></td>
                              <td></td>
                              <td><%=dataPatientApp.get(i).get(4)%></td>
                              <td><%=dataPatientApp.get(i).get(5)%></td>
                              <td><%=dataPatientApp.get(i).get(5)%></td>
                              <td><a href='VerifySpecimen.jsp?pmi=<%=dataPatientApp.get(i).get(1)%> &specimen_no=<%=dataPatientApp.get(i).get(0)%>' class='btn btn-primary btn' ><span class='glyphicon glyphicon-'></span>Assign</a></td>
                          </tr>
                     <%
                      }}
                     %>
                     </tbody>
                  </table>
<script type="text/javascript" charset="utf-8">
    $(document).ready(function () {
        $('#MTC').DataTable();
    });
</script>
