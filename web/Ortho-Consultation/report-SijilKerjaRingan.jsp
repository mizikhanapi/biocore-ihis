<%-- 
    Document   : report-Sijil Kerja Ringan
    Created on : Jun 21, 2017, 2:57:56 PM
    Author     : user
--%>

<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%--<%@page import="java.sql.Connection"%> 
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="main.RMIConnector"%>--%>

<%
    Conn conn = new Conn();
    
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String hfc_cd = "SELECT logo FROM adm_health_facility WHERE hfc_cd='" + hfc + "'";
    ArrayList<ArrayList<String>> mysqlhfc_cd = conn.getData(hfc_cd);

%>
<div class="modal fade" id="SijilKerjaRinganFormModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="overflow-y:scroll;">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h4 class="modal-title" id="myModalLabel">Sijil Kerja Ringan Form</h4>
            </div>
            <div class="modal-body">

                <div id="SijilKerjaRinganFormBody">

                    <div style="margin-top: 50px;">
                        <div style="height:120px;">
                            <div style="width: 80px; float: left; margin-right: 20px;"> 
                                <img style="width:80px;height:80px;" src="<%=mysqlhfc_cd.get(0).get(0)%>" alt=""/>
                                <!--<img style="width:80px;height:80px;" src="../Ortho-Consultation/asset/images/MalaysianHockeyFederationLogo.jpg" alt=""/>-->
                            
                            </div>
                            <div style="width: 40%; float: left;">
                                <strong>JABATAN ORTOPEDIK & TRAUMATOLOGI<br>
                                    HOSPITAL KUALA LUMPUR<br>
                                    JALAN PAHANG<br>
                                    50586 KUALA LUMPUR</strong>
                            </div>
                            <div style="width:30%; margin-top: 20px; float: right;">
                                <p>TEL: 30-2615555 Samb. 6546<br>
                                    FAX: 03-26927281<br>
                                    WEBSITE: www.hkl.gov.my</p> 
                                <strong>HKL/BPK/OTO/05</strong>
                            </div>
                        </div>
                        <h2 style="clear: both; text-align: center; margin: 40px 0 15px 0;"><u>SIJIL KERJA RINGAN</u></h2>
                        <div style="margin: 30px 15% 0 20%; line-height: 30px;">
                            <p style="word-spacing: 10px;">Saya mengesahkan Encik / Puan / Cik <strong id="SKRF-patientName"></strong> Dari
                                Jabatan <strong id="SKRF-hfcName"></strong> didapati mengalami sakit <strong id="SKRF-diagnosis"></strong> Tahu/Puan
                                dinasihakan melakukan tugas-tugas tingan seperti jangan mengangkat barang-
                                barang berat / berdiri dan berjalan terlalu lama / naik tangga dan turun
                                tangga atau <strong id="SKRF-drComment"></strong> dari<br><br>
                                <strong id="SKRF-startDate"></strong> hingga <strong id="SKRF-endDate"></strong><br><br>
                                sehingga rawatan selanjutnya.</p>

                            <p style="white-space:pre; margin-top: 30px;">Tarikh: <strong id="SKRF-currDate"></strong>                                                                           ................................................
                                (Pakar/Mo)</p>
                        </div>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="printSijilKerjaRinganForm" role="button">Print</button>
                    </div>
                    <div class="btn-group btn-delete hidden" role="group">
                        <button type="button" id="delImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Clear</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="saveImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
