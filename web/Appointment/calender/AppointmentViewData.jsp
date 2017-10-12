<%-- 
    Document   : AppointmentViewData
    Created on : Sep 2, 2017, 3:57:55 PM
    Author     : -D-
--%>
<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<!--Modal add Procedure-->
<%
    Conn Conn = new Conn();
    //String pmi_no = "9504050251851";
    //String episode_date = "2017-09-06 10:30:00.0";
        String pmi_no = request.getParameter("pmi_no");
    String episode_date = request.getParameter("appointment_date");
                                    //        0             1               2           3               4                 5           6               7                   8           9           10                    11                   12             13
    String appointment_detail_sql = "SELECT pa.pmi_no, pb.`PATIENT_NAME`, pa.hfc_cd, hf.hfc_name, pa.appointment_date, pa.userid, au.`USER_NAME`, pa.appointment_type, pa.status, pa.start_time, pb.`EMAIL_ADDRESS`,pb.`MOBILE_PHONE`,dis.discipline_name,sub.subdiscipline_name "
            + "FROM pms_appointment pa "
            + "INNER JOIN pms_patient_biodata pb ON pa.pmi_no = pb.`PMI_NO` "
            + "INNER JOIN adm_users au ON pa.userid = au.`USER_ID`  "
            + "INNER JOIN adm_health_facility hf ON pa.hfc_cd = hf.hfc_cd INNER JOIN adm_discipline dis ON pa.discipline = dis.discipline_cd INNER JOIN adm_subdiscipline sub ON sub.subdiscipline_cd = pa.subdiscipline  "
            + "WHERE pa.pmi_no = '" + pmi_no + "' AND pa.appointment_date = '" + episode_date + "' ";

    ArrayList<ArrayList<String>> appointment_detail_data = Conn.getData(appointment_detail_sql);

%>
<div class="tabbable-panel">
    <div class="tabbable-line">
        <!-- tab content -->
        <div class="tab-content">

            <div class="form-horizontal">


                <div class="row">
                    <div class="col-md-8">
                        <div class="form-group">
                            <label class="col-md-12" for="textinput">Name : </label>
                            <div class="col-md-12">
                                <h4><%out.print(appointment_detail_data.get(0).get(1));%></h4>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="col-md-12" for="textinput">PMI No : </label>
                            <div class="col-md-12">
                                <h4><%out.print(appointment_detail_data.get(0).get(0));%></h4>

                            </div>
                        </div>
                    </div>
                </div>
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <label class="col-md-12" for="textinput">Email : </label>
                                            <div class="col-md-12">
                                                <h4><%out.print(appointment_detail_data.get(0).get(10));%></h4>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="col-md-12" for="textinput">Phone No : </label>
                                            <div class="col-md-12">
                                                <h4><%out.print(appointment_detail_data.get(0).get(11));%></h4>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <div class="form-group">
                                                            <label class="col-md-12" for="textinput">Health Facility : </label>
                                                            <div class="col-md-12">
                                                                <h4><%out.print(appointment_detail_data.get(0).get(3));%></h4>

                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="form-group">
                                                            <label class="col-md-12" for="textinput">Discipline : </label>
                                                            <div class="col-md-12">
                                                                <h4><%out.print(appointment_detail_data.get(0).get(12));%></h4>

                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="form-group">
                                                            <label class="col-md-12" for="textinput">Subdiscipline : </label>
                                                            <div class="col-md-12">
                                                                <h4><%out.print(appointment_detail_data.get(0).get(13));%></h4>

                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="col-md-12" for="textinput">Doctor </label>
                            <div class="col-md-12">
                                <h4><%out.print(appointment_detail_data.get(0).get(6));%></h4>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="col-md-12" for="textinput">Appointment Date / Time : </label>
                            <div class="col-md-12">
                                <h4><%out.print(appointment_detail_data.get(0).get(4));%></h4>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="col-md-12" for="textinput">Appointment Type : </label>
                            <div class="col-md-12">
                                <h4><%out.print(appointment_detail_data.get(0).get(7));%></h4>

                            </div>
                        </div>
                    </div>
                                                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="col-md-12" for="textinput">Status : </label>
                            <div class="col-md-12">
                                <h4><%out.print(appointment_detail_data.get(0).get(8));%></h4>
                            </div>
                        </div>
                    </div>

                </div>
            </div>


            <!-- Tab 1 -->


            <!-- Tab 2 -->

        </div>
    </div>