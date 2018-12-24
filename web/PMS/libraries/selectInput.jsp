<%-- 
    Document   : selectInput
    Created on : 20-Dec-2018, 14:49:35
    Author     : Shay
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="dBConn.Conn"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>

<%
            Conn conn = new Conn();
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date date = new Date();
            String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
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
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Search By</label>
                            <div class="col-md-4">
                                <select id="searchBy" name="searchBy" class="form-control" required="">
                                    <option selected="" disabled="" value="-"> Please select search by</option>
                                    <option value="id">ID Type</option>
                                    <option value="date">Date</option>
                                </select>
                            </div>
                        </div>
                        
                        <div class="form-group" id="divIDType">
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="selectbasic">ID Type</label>
                                <div class="col-md-4">
                                    <select id="idTypeApp" name="idTypeApp" class="form-control" required="">
                                        <option selected="" disabled="" value="-"> Please select ID Type</option>
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
                        </div>
                        <div class="form-group" id="divDate">
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="selectbasic">Date</label>
                                <div class="col-md-4">
                                    <select id="bydateSel" name="bydateSel" class="form-control" required="">
                                        <option selected=""  disabled="" value="-"> Please select Date</option>
                                        <option   value="today"> Today</option>
                                        <option   value="yesterday"> Yesterday</option>
                                        <option   value="7"> 7 Days</option>
                                        <option   value="30"> 30 days</option>
                                        <option   value="60"> 60 days</option>
                                        <option   value="custom"> Select Date</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group select-type" id="OM_selectDate" style="display: none;">
                                <label class="col-md-4 control-label" for="textinput">From</label>
                                <div class="col-md-2">
                                    <input type="text" id="OM_DateFrom" class="form-control input-md Datepicker" placeholder="DD/MM/YYYY" readonly>
                                </div>

                                <label class="col-md-1 control-label" for="textinput">To</label>
                                <div class="col-md-2">
                                    <input type="text" id="OM_DateTo" class="form-control input-md Datepicker" placeholder="DD/MM/YYYY" readonly>
                                </div>
                            </div>
                        </div>