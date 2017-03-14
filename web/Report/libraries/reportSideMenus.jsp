<%
    String gamba = "";
    String nama = "";
    String role = "";

    if (session.getAttribute("USER_NAME") != null) {

        gamba = session.getAttribute("PICTURE").toString();
        nama = session.getAttribute("USER_NAME").toString();
        role = session.getAttribute("ROLE_NAME").toString();
    }

%>

<div class="col-sm-3 col-md-2 sidebar"> 
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
        </div>
        <!-- SIDEBAR BUTTONS -->
        <div class="profile-userbuttons">
            <button type="button" class="btn btn-success btn-sm" onclick="window.location.href = '../Entrance/profile.jsp'">Manage Account</button>
        </div>
    </div>
    <hr/>
    <!-- profile Sidebar -->

    <ul class="nav nav-sidebar" id="menu-content" >
        <li><a href="mcReportMain.jsp"><i class="fa fa-print fa-lg" aria-hidden="true" ></i>Print MC </a></li>
        <li><a href="timeSlipMain.jsp"><i class="fa fa-clock-o fa-lg" aria-hidden="true" ></i>Time Slip</a></li>
        <li><a href="prescriptionSlipMain.jsp"><i class="fa fa-list-ul fa-lg" aria-hidden="true" ></i> Prescription Slip</a></li>
        <li><a href="dispensingSheetMain.jsp"><i class="fa fa-file-text fa-lg" aria-hidden="true" ></i> Dispensing Sheet</a></li>
        <li><a href="ICD10Main.jsp"><i class="fa fa-stethoscope fa-lg" aria-hidden="true" ></i>ICD 10</a></li>   
        <li><a href="fullReportMain.jsp"><i class="fa fa-bar-chart fa-lg" aria-hidden="true" ></i>Statistics</a></li>
        <li><a href="pmhMain.jsp"><i class="fa fa-medkit fa-lg" aria-hidden="true" ></i>Past Medical History</a></li>
        <li><a href="drugOrderList.jsp"><i class="fa fa-money fa-lg" aria-hidden="true" ></i>Total Drug Cost</a></li>
        <li><a href="laporanKosPerubatan.jsp"><i class="fa fa-file-text fa-lg" aria-hidden="true" ></i>Laporan Kos Perubatan</a></li>
        <li><a href="laporanKedatanganJumlahPesakitLuar.jsp"><i class="fa fa-file-text-o fa-lg" aria-hidden="true" ></i>Laporan Kedatangan Jumlah Pesakit Luar - Umur Jantina dan Kumpulan Kaum</a></li>
        <li><a href="senaraiPesakitLuar.jsp"><i class="fa fa-list fa-lg" aria-hidden="true" ></i>Outpatient List</a></li>
    </ul>  
    
</div>