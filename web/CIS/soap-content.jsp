<%-- 
    Document   : soap-content
    Created on : Mar 7, 2017, 12:47:02 PM
    Author     : Mizi K
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- tab content -->
<div class="tab-content">
    <!-- content -->
    <div class="tab-pane active fade in" id="tab_default_1">
        <ul class="soap-content nav">
            <%
                if (myCIS.hasMenuAccess("CIS_01.1.1")) {
            %>
            <li><a data-toggle="modal" data-target="#CIS01000001" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i> Complaints</a></li>
                <%
                    }
                    if (myCIS.hasMenuAccess("CIS_01.1.2")) {
                %>
            <li><a data-toggle="modal" data-target="#CIS01000002" href=""  class="soap-select"><i class="fa fa-history  fa-li"></i> History of Present Illness</a></li>
                <%
                    }
                    if (myCIS.hasMenuAccess("CIS_01.1.3")) {
                %>
            <li><a data-toggle="modal" data-target="#CIS01000003" href=""  class="soap-select"><i class="fa fa-medkit  fa-li"></i> Past Medical History</a></li>
                <%
                    }
                    if (myCIS.hasMenuAccess("CIS_01.1.4")) {
                %>
            <li><a data-toggle="modal" data-target="#CIS01000004" href=""  class="soap-select"><i class="fa fa-group  fa-li"></i> Family Medical History</a></li>
                <%
                    }
                    if (myCIS.hasMenuAccess("CIS_01.1.5")) {
                %>
            <li><a data-toggle="modal" data-target="#CIS01000005" href=""  class="soap-select"><i class="fa fa-share-square  fa-li"></i> Social History</a></li>
                <%
                    }
                    if (myCIS.hasMenuAccess("CIS_01.1.6")) {
                %>
            <li><a data-toggle="modal" data-target="#CIS01000006" href=""  class="soap-select"><i class="fa fa-tint  fa-li"></i> Blood Group/G6PD</a></li>
                <%
                    }
                    if (myCIS.hasMenuAccess("CIS_01.1.7")) {
                %>
            <li><a data-toggle="modal" data-target="#CIS01000007" href=""  class="soap-select"><i class="fa fa-exclamation-circle  fa-li"></i> Allergy</a></li>
                <%
                    }
                    if (myCIS.hasMenuAccess("CIS_01.1.8")) {
                %>
            <li><a data-toggle="modal" data-target="#CIS01000008" href=""  class="soap-select"><i class="fa fa-male  fa-li"></i> Immunization</a></li>
                <%
                    }
                    if (myCIS.hasMenuAccess("CIS_01.1.9")) {
                %>
            <li><a data-toggle="modal" data-target="#CIS01000009" href="" class="soap-select" ><i class="fa fa-wheelchair  fa-li"></i> Disability</a></li>
                <%
                    }
                %>
        </ul>
    </div>
    <!-- content -->

    <!-- content -->
    <div class="tab-pane fade" id="tab_default_2">
        <ul id="menu-content" class="soap-content nav">
            <%
                if (myCIS.hasMenuAccess("CIS_01.2.1")) {
            %>
            <li data-toggle="collapse" data-target="#vital-tab" class="collapsed soap-select ">
                <a style="cursor: pointer;"><i class="fa fa-heart fa-li"></i> Vital Sign <span class="arrow"></span></a>
            </li>
            <%
                }

                if (myCIS.hasMenuAccess("CIS_01.2.1.1")) {
            %>
            <li><a data-toggle="modal" data-target="#CIS020001" href="" ><i class="flaticon flaticon-tool fa-li" style="display: inline"></i> Glasgow Coma Scale</a></li>
                <%
                    }
                    if (myCIS.hasMenuAccess("CIS_01.2.1.2")) {
                %>
            <li><a data-toggle="modal" data-target="#CIS020002" href="" ><i class="flaticon flaticon-file fa-li" style="display: inline"></i> Pediatric Glasgow Coma Scale</a></li>
                <%
                    }
                    if (myCIS.hasMenuAccess("CIS_01.2.1.8")) {
                %>
            <li><a data-toggle="modal" data-target="#CIS020007" href="" id="soapCtnPanScale"><i class="fa fa-line-chart fa-li" style="display: block"></i> Pain Scale</a></li>
                <%
                    }
                    if (myCIS.hasMenuAccess("CIS_01.2.1.9")) {
                %>
            <li><a data-toggle="modal" data-target="#CIS020013" href=""><i class="fa fa-line-chart fa-li" style="display: block"></i> Pupil</a></li>
                <%
                    }
                    if (myCIS.hasMenuAccess("CIS_01.2.1.10")) {
                %>
            <li><a data-toggle="modal" data-target="#CIS020014" href=""><i class="fa fa-line-chart fa-li" style="display: block"></i> Vision</a></li>
            <!--<li><a data-toggle="modal" data-target="#CIS020015" href=""><i class="fa fa-line-chart fa-li" style="display: block"></i> Height and Weight</a></li>-->
            <%
                }

                if (myCIS.hasMenuAccess("CIS_01.2.2")) {
            %>
            <li id="modalPE"><a data-toggle="modal" data-target="#CIS020009" href=""  class="soap-select" ><span class="fa fa-sticky-note fa-li"></span> Physical Exam</a></li>
                <%
                    }

                    if (myCIS.hasMenuAccess("CIS_01.2.3")) {
                %>
            <li><a data-toggle="modal" data-target="#CIS020010" href="" id="RISResult"> <i class="fa fa-bolt fa-li"></i> Radiology Result</a></li>
                <%
                    }

                    if (myCIS.hasMenuAccess("CIS_01.2.4")) {
                %>
            <li><a data-toggle="modal" data-target="#CIS020011" href=""  id="LISResult"> <i class="fa fa-thermometer-empty fa-li"></i> Laboratory Result</a></li>
                <%
                    }

                    if (myCIS.hasMenuAccess("CIS_01.2.5")) {
                %>
            <li><a data-toggle="modal" data-target="#CIS020012" href="" id="OPResult"> <i class="fa fa-eye fa-li"></i> Observation Procedure</a></li>
                <%
                    }

                    if (myCIS.hasMenuAccess("CIS_01.2.6")) {
                %>
            <li><a href="#ortho-notes" class="panelito ortho-notes"> <i class="fa fa-eye fa-li"></i> Orthopedic Notes</a></li>
                <%
                    }

                %>
        </ul>

        <div class="row">
            <ul class="sub-soap collapse fa-ul" id="vital-tab">
                <%                    if (myCIS.hasMenuAccess("CIS_01.2.1.3")) {
                %>
                <li><a data-toggle="modal" data-target="#CIS020003" href="" ><i class="flaticon flaticon-arrows fa-li" style="display: inline"></i> Blood Pressure</a></li>
                    <%
                        }
                        if (myCIS.hasMenuAccess("CIS_01.2.1.4")) {
                    %>
                <li><a data-toggle="modal" data-target="#CIS020004" href="" ><i class="flaticon flaticon-medical fa-li" style="display: inline"></i> Respiratory Rate</a></li>
                    <%
                        }
                        if (myCIS.hasMenuAccess("CIS_01.2.1.5")) {
                    %>
                <li><a data-toggle="modal" data-target="#CIS020005" href=""><i class="flaticon flaticon-science fa-li" style="display: block"></i> Oxygen Saturation</a></li>
                    <%
                        }
                        if (myCIS.hasMenuAccess("CIS_01.2.1.6")) {
                    %>
                <li><a data-toggle="modal" data-target="#CIS020006" href="" ><i class="fa fa-thermometer-half fa-li" style="display: block"></i> Body Temperature</a></li>
                    <%
                        }
                        if (myCIS.hasMenuAccess("CIS_01.2.1.7")) {
                    %>
                <li><a data-toggle="modal" data-target="#CIS020016" href=""><i class="fa fa-line-chart fa-li" style="display: block"></i>Blood Glucose</a></li>
                    <%
                        }

                        if (myCIS.hasMenuAccess("CIS_01.2.1.11")) {
                    %>
                <li><a data-toggle="modal" data-target="#CIS020008" href="" ><i class="fa fa-bars fa-li" style="display: block"></i> BMI</a></li>
                    <%
                        }
                    %>
            </ul>
        </div>    
    </div>
    <!-- content -->

    <!-- content -->
    <div class="tab-pane fade" id="tab_default_3">
        <ul class="soap-content nav">
            <%
                if (myCIS.hasMenuAccess("CIS_01.3.1")) {
            %>
            <li><a data-toggle="modal" data-target="#CIS030001" href="" class="soap-select"><i class="fa fa-stethoscope fa-li"></i> Diagnosis</a></li>
                <%
                    }
                    if (myCIS.hasMenuAccess("CIS_01.3.2")) {
                %>
            <li><a data-toggle="modal" data-target="#CIS030002" href="" class="soap-select"><i class="fa fa-tasks fa-li"></i> Progress Notes</a></li>
                <%
                    }
                    if (myCIS.hasMenuAccess("CIS_01.3.3")) {
                %>
            <li id="Problemlist"><a data-toggle="modal" data-target="#CIS030003" href="" class="soap-select" ><i class="fa fa-list-ul fa-li"></i> Problem List</a></li>
                <%
                    }
                    if (myCIS.hasMenuAccess("CIS_01.3.4")) {
                %>
            <li id="ActiveDrug"><a data-toggle="modal" data-target="#CIS030004" href="" class="soap-select" ><i class="fa fa-list-ul fa-li"></i> Active Drug</a></li>
                <%}
                %>
        </ul>
    </div>
    <!-- content -->

    <!-- content -->
    <div class="tab-pane fade" id="tab_default_4">
        <ul class="soap-content nav">
            <!--                      <li><a data-toggle="modal" data-target="#CIS040000" href="" class="soap-select "><i class="fa fa-bolt fa-li"></i>Radiology Request</a></li>
                                <li><a data-toggle="modal" data-target="#CIS040001" href="" class="soap-select"><i class="fa fa-thermometer-empty fa-li"></i> Laboratory Request</a></li>
                                <li><a data-toggle="modal" data-target="#CIS040002" href="" class="soap-select" onClick="searchHFCDetail('DTO')"> <i class="fa fa-medkit fa-li"></i> Drug Order</a></li>
                                <li><a data-toggle="modal" data-target="#CIS040003" href="" class="soap-select" ><i class="fa fa-file-text-o fa-li"></i> Monitoring</a></li>-->
            <%
                if (myCIS.hasMenuAccess("CIS_01.4.1")) {
            %>
            <li><a data-toggle="modal" data-target="#CIS040004" href="" class="soap-select"> <i class="fa fa-bar-chart fa-li"></i> Follow Up</a></li>
                <%
                    }
                    if (myCIS.hasMenuAccess("CIS_01.4.2")) {
                %>
            <li><a data-toggle="modal" data-target="#CIS040005" href="" class="soap-select hide"><i class="fa fa-user-md fa-li"></i> Second Opinion</a></li>
            <!--                   <li><a data-toggle="modal" data-target="#CIS040006" href="" class="soap-select" onClick="searchHFCDetail('POS')" ><i class="fa fa-list-ol fa-li"></i> Procedure</a></li>
                               <li><a data-toggle="modal" data-target="#CIS040007" href="" class="soap-select" onClick="searchHFCDetail('ADW')"><i class="fa fa-bed fa-li"></i> Admit To Ward</a></li>-->
            <%
                }
                if (myCIS.hasMenuAccess("CIS_01.4.3")) {
            %>
            <li><a data-toggle="modal" data-target="#CIS040008" href="" class="soap-select"><i class="fa fa-clock-o fa-li"></i> MC & Time Slip</a></li>
            <!--                    <li><a data-toggle="modal" data-target="#CIS040009" href="" class="soap-select"><i class="fa fa-clock-o fa-li"></i> Referral</a></li>
            -->  
            <%
                }
                if (myCIS.hasMenuAccess("CIS_01.4.4")) {
            %>
            <li><a data-toggle="modal" data-target="#CIS040010" href="" class="soap-select" id=""><i class="fa fa-clock-o fa-li"></i> Discharge Summary</a></li>
                <%
                    }
                %>
        </ul>
    </div>
    <!-- content -->


</div>
<script>
    $('#soapCtnPanScale').on('click', function () {
        $('#CIS020007 #updatePS').hide();
        $('#CIS020007 #actionPS #btnNIWps').hide();
        $('#CIS020007 #actionPS #acceptPSBtn').show();
    });
</script>