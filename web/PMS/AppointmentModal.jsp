
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="dBConn.Conn"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>

<%
    //Conn conn = new Conn();
    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    Date date = new Date();
    //out.println(dateFormat.format(date));
    //String sql = "select a.pmi_no,a.appointment_date,a.start_time,a.appointment_type,b.PATIENT_NAME,b.NEW_IC_NO,b.OLD_IC_NO,b.ID_TYPE,b.ID_NO from pms_appointment a inner join pms_patient_biodata b on a.pmi_no = b.`PMI_NO` where appointment_date like '%" + dateFormat.format(date) + "%' and status ='active' and hfc_cd='" + session.getAttribute("HFC") + "'";
    //out.println(sql);
    String idTYpe3 = "select master_reference_code,detail_reference_code,description,priority_indicator,start_date,end_date,status,created_by,created_date from adm_lookup_detail where master_reference_code = '0012' AND hfc_cd = '" + hfc + "' and status ='0' ";

    ArrayList<ArrayList<String>> dataAppointment, dataIdType3;
    //dataAppointment = conn.getData(sql);
    String dataSystemStatus3 = session.getAttribute("SYSTEM_PARAMETER").toString();
    
    //testing->>
    //String dataSystemStatus3 = "0";
    // end of testing->>
    dataIdType3 = conn.getData(idTYpe3);
    ArrayList<ArrayList<String>> data3 = new ArrayList();
    //out.println(dataAppointment);
%>

<!-- Modal -->
<div class="modal fade" id="appointmentModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Appointment List</h3>
            </div>
            <div class="modal-body" >
                <div class="row" id="searchAppointment" style="    margin-top: 30px;">
                    <form class="form-horizontal" name="myFormApp" id="myFormApp">
                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">ID Type</label>
                            <div class="col-md-4">
                                <select id="idTypeApp" name="idTypeApp" class="form-control" required="">
                                    <option selected="" disabled="" value="-"> Please select ID type</option>
                                    <%  if (dataSystemStatus3.equals("0")) {
                                            for (int j = 0; j < dataIdType3.size(); j++) {
                                                if (dataIdType3.get(j).get(1).equalsIgnoreCase("004")) {
                                                    dataIdType3.remove(j);
                                                }

                                                if (dataIdType3.get(j).get(1).equalsIgnoreCase("005")) {
                                                    dataIdType3.remove(j);
                                                }
                                            }
                                            data3 = dataIdType3;

                                        } else if (dataSystemStatus3.equals("1")) {
                                            data3 = dataIdType3;
                                        }
                                        for (int i = 0; i < data3.size(); i++) {%>
                                    <option value="<%=data3.get(i).get(1)%>"><%=data3.get(i).get(2)%></option>
                                    <%  }
                                    %>
                                </select>
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">IC No. / ID No.</label>
                            <div class="col-md-4">
                                <input type="text" class="form-control input-md" id="idInputApp" name="idInputApp" placeholder="ID" maxlength="0"/>
                            </div>
                        </div>
                        <div class="text-center">
                            <button class="btn btn-primary" type="button" id="searchApp" name="searchPatient"><i class="fa fa-search fa-lg"></i>&nbsp; Search</button>

                            <button id="clearApp" name="clearApp" type="button" class="btn btn-default"><i class="fa fa-ban fa-lg"></i>&nbsp; Clear</button>
                        </div>
                    </form>
                </div>
            </div>
            <hr/>
            <div class="modal-table"><div class="row"id="modalBodyAppointment" >
                    <!-- content goes here -->
                    <form role="form" id="formAppointmentSaya" method="post">
                        <table class="table table-filter table-striped" style="background: #fff; border: 1px solid #ccc;" id="listAppointment">
                            <thead>
                            <th>PMI No.</th>
                            <th>Name</th>
                            <th>Appointment Date</th>
                            <th>Appointment Time</th>
                            <th>Appointment Type</th>
                            <th>Action</th>
                            </thead>

                        </table>
                    </form>
                </div>
            </div>

        </div>
        <div class="modal-footer">
            <div class="btn-group btn-group-justified" role="group" aria-label="group button">
            </div>
            </form>
        </div>
    </div>
</div>
<script src="libraries/lib/js/main/appointment.js" type="text/javascript"></script>