<%
    String gamba = "";
    String nama = "";
    String role = "";
    String hfcName = "";

    if (session.getAttribute("USER_NAME") != null) {

        gamba = session.getAttribute("PICTURE").toString();
        nama = session.getAttribute("USER_NAME").toString();
        role = session.getAttribute("ROLE_NAME").toString();
        hfcName = session.getAttribute("HFC_NAME").toString();
    }

%>
<div class="col-sm-3 col-md-2 sidebar" id="style-3">
    <!-- logo -->
    <div class="logo">
        Welcome to <span>iHIS</span>
    </div>
    <!-- logo -->

    <!-- profile Sidebar -->
    <div class="profile">
        <div class="profile-userpic">
            <img src="<%= gamba%>" class="img-responsive" alt="profile pic">
        </div>
        <!-- SIDEBAR USER TITLE -->
        <div class="profile-usertitle">
            <div class="profile-usertitle-name">
                <%=nama%>
            </div>
            <div class="profile-usertitle-job">
                <%= role%>
            </div>
            @
            <div class="profile-usertitle-job">
                <%= hfcName%>
            </div>
        </div>
        <!-- SIDEBAR BUTTONS -->
        <div class="profile-userbuttons">
            <button type="button" class="btn btn-success btn-sm" onclick="window.location.href = '../Entrance/profile.jsp'">Manage Account</button>
        </div>
    </div>
    <hr/>
    <!-- profile Sidebar -->
    <ul class="nav nav-sidebar" id="menu-content" >
        <li><a href="MainMenu.jsp"><i class="fa fa-home fa-lg" aria-hidden="true" ></i>Dashboard</a></li>
        <li><a href="UTeMAttendanceListReport.jsp"><i class="fa fa-file-text fa-lg" aria-hidden="true" ></i>Patient Attendance List</a></li>
        <li><a href="UTeMMedicalCertificateReport.jsp"><i class="fa fa-file-text fa-lg" aria-hidden="true" ></i>Medical Certificate List</a></li>
        <li><a href="UTeMTypeOfPatientListReport.jsp"><i class="fa fa-file-text fa-lg" aria-hidden="true" ></i>Type Of Patient List</a></li>
        <li><a href="mcMain2.jsp"><i class="fa fa-file-text fa-lg" aria-hidden="true" ></i>Reprint MC</a></li>
        <li><a href="medicalReportMain.jsp"><i class="fa fa-file-text fa-lg" aria-hidden="true" ></i>Reprint Medical Report</a></li>   
        <li><a href="tsMain.jsp"><i class="fa fa-file-text fa-lg" aria-hidden="true" ></i>Reprint Time Slip</a></li>
        <li><a href="ConsultationListReport.jsp"><i class="fa fa-file-text fa-lg" aria-hidden="true" ></i>Consultation List</a></li>
        <li><a href="DiagnosisList.jsp"><i class="fa fa-file-text fa-lg" aria-hidden="true" ></i>Diagnosis List</a></li>
        <li  data-toggle="collapse" data-target="#WaitingReport" class="collapsed active">
            <a href="#"><i class="fa fa-file-text fa-lg"></i> Waiting Time (KPI Report) <span class="arrow"></span></a>
        </li>
        <ul class="sub-menu collapse" id="WaitingReport">
            <li><a data-toggle="modal" data-target="#" href="WaitingTime.jsp">Overall Process</a></li>
            <li><a data-toggle="modal" data-target="#" href="WaitingTimeRegisterConsult.jsp">Registration -> Consultation</a></li>
            <li><a data-toggle="modal" data-target="#" href="WaitingTimeConsultPharmacy.jsp">Consultation -> Pharmacy</a></li>
            <li><a data-toggle="modal" data-target="#" href="WaitingTimeConsultLaboratory.jsp">Consultation -> Laboratory</a></li>
            <li><a data-toggle="modal" data-target="#" href="WaitingTimeConsultProcedure.jsp">Consultation -> Procedure</a></li>
            <li><a data-toggle="modal" data-target="#" href="WaitingTimeConsultRadiology.jsp">Consultation -> Radiology</a></li>
            <li><a data-toggle="modal" data-target="#" href="WaitingTimePharmacyDispense.jsp">Pharmacy -> Dispense</a></li>
        </ul> 
        <li><a href="ICD10Main.jsp"><i class="fa fa-file-text fa-lg" aria-hidden="true" ></i>ICD10</a></li>
        <li><a href="laporanKosPerubatan.jsp"><i class="fa fa-file-text fa-lg" aria-hidden="true" ></i>Report Health Cost </a></li>
        <li><a href="drugOrderList.jsp"><i class="fa fa-file-text fa-lg" aria-hidden="true" ></i>Total Drug Cost</a></li>
    </ul>  
    <!--    <ul class="nav nav-sidebar" id="menu-content" >
            <li><a href="mcMain2.jsp"><i class="fa fa-print fa-lg" aria-hidden="true" ></i>Print MC </a></li>
            <li><a href="timeSlipMain2.jsp"><i class="fa fa-clock-o fa-lg" aria-hidden="true" ></i>Time Slip</a></li>
            <li><a href="psMain.jsp"><i class="fa fa-list-ul fa-lg" aria-hidden="true" ></i> Prescription Slip</a></li>
            <li><a href="dsMain.jsp"><i class="fa fa-file-text fa-lg" aria-hidden="true" ></i> Dispensing Sheet</a></li>
            <li><a href="ICD10Main.jsp"><i class="fa fa-stethoscope fa-lg" aria-hidden="true" ></i>ICD 10</a></li>   
            <li><a href="line.jsp"><i class="fa fa-bar-chart fa-lg" aria-hidden="true" ></i>CHART</a></li>
            <li><a href="drugOrderList.jsp"><i class="fa fa-money fa-lg" aria-hidden="true" ></i>Total Drug Cost</a></li>
            <li><a href="laporanKosPerubatan.jsp"><i class="fa fa-file-text fa-lg" aria-hidden="true" ></i>Report Health Cost</a></li>
            <li><a href="dataAnalysisMain.jsp"><i class="fa fa-file-text-o fa-lg" aria-hidden="true" ></i>Data Analysis</a></li>
        </ul>  
    -->
</div>