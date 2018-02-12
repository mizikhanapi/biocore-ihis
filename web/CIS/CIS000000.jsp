<%@page import="java.util.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="Config.Config"%>
<%@page import="main.RMIConnector"%>


<%@include file="../Entrance/validateSession.jsp" %>
<%@include file="validateModuleAccess.jsp" %>



<%    Config.getBase_url(request);
    Config.getFile_url(session);
    Conn Conn = new Conn();

    String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String hfcName = session.getAttribute("HFC_NAME").toString();
    String user_id = session.getAttribute("USER_ID").toString();
    String username = session.getAttribute("USER_NAME").toString();
    String discipline = session.getAttribute("DISCIPLINE_CODE").toString();
    String subdicipline = session.getAttribute("SUB_DISCIPLINE_CODE").toString();
    String cisSystemParam = session.getAttribute("CIS_PARAM").toString();


%>
<!DOCTYPE html>
<!-- saved from url=(0044)https://getbootstrap.com/examples/dashboard/ -->
<html lang="en">
    <head>
        <title>iHIS | CIS</title>

        <!-- header -->
        <%@ include file="libraries/header.jsp" %> 
        <%@ include file="../assets/header.html" %> 
        <link href="../assets/css/toggleButton.css" rel="stylesheet" type="text/css"/>
        <!-- header -->
        <style>
            .modal-dialog-gra{
    overflow-y: initial !important
}
    .modal-body-gra{
    height: 800px;
    overflow-y: auto;
}
    .modal-body-pp{
    height: 600px;
    overflow-y: auto;
}
        </style>
        <script type="text/javascript">
            
            window.location.hash = "no-back-button";
            window.location.hash = "Again-No-back-button";//again because google chrome don't insert first hash into history
            window.onhashchange = function () {
                window.location.hash = "no-back-button";
            };

            hfc_cd = '<%out.print(hfc_cd);%>';
            hfc_name = '<%out.print(hfcName);%>';
            doctor_id = '<%out.print(user_id);%>';
            doctor_name = '<%out.print(username);%>';
            discipline = '<%out.print(discipline);%>';
            subdis = '<%out.print(subdicipline);%>';
            cisParam = '<%out.print(cisSystemParam);%>';
            console.log(cisParam);
            $.ajax({
                url: "search/searchRRI.jsp",
                type: "post",
                data: {
                    discipline_cd: discipline,
                    subdis_cd: subdis
                },
                success: function (data) {

                    var dataA = data.trim().split("|");
                    disciplineName = dataA[0];
                    subdisName = dataA[1];

                },
                error: function (err) {
                    console.log(err);
                }
            });
            
            
        </script>
    </head>

    <body>
        <div class="loading"></div>

        <div class="container-fluid">
            <div class="row">

                <!-- menu side -->	
                <%@ include file="libraries/sideMenus.jsp" %> 
                <!--            <div w3-include-html="libraries/sideMenus.jsp"></div>-->
                <!-- menu side -->	

                <!-- main -->		
                <div class=" main" style="background: #f2f4f8;">
                    <!-- menu top -->
                    <%@ include file="libraries/topMenus.html" %> 
                    <!--    <div w3-include-html="libraries/topMenus.html"></div>-->
                    <!-- menu top -->
                    <div class="row" id="div_CIS_PATIENT_DASHBOARD">
                        <div class="col-md-12">
                            <div class="thumbnail">
                                <h4 style="margin: 0px; padding: 0px;">Patient Details </h4>
                                <hr class="pemisah"/>
                                
                                <table class="p-table" style="width: 100%; color: #999;" id="patient-detail-dashboard">
                                    <tr>
                                        <td>
                                            Name:
                                            <span class="p-label" id="pName">-</span>
                                        </td>
                                        <td>
                                            IC/ID No:
                                            <span class="p-label" id="pIC">-</span>
                                        </td>
                                        <td>
                                            BloodGroup/G6PD:
                                            <span class="p-label" id="pBloodType">-</span>
                                        </td>
                                        <td rowspan="2">
                                            <span class="p-label" id="gambarpesakitdisini"></span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Gender:
                                            <span class="p-label" id="pSex">-</span>
                                        </td>
                                        <td>
                                            ID Type:
                                            <span class="p-label" id="pIdType">-</span>
                                        </td>
                                        <td>
                                            Allergy:
                                            <span class="p-label" id="pAllergy">-</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Age:
                                            <span class="p-label" id="pAge">-</span>
                                        </td>
                                        <td>
                                            Race:
                                            <span class="p-label" id="pRace">-</span>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>

                    <div class="tab-content" style="padding: 0px;" id="tabContent">
                        <div class="tab-pane fade in active swapping-tab" id="generic-soap">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="thumbnail">

                                        <!-- Tab Menu -->
                                        <div class="tabbable-panel cis-tab">
                                            <div class="tabbable-line">
                                                <ul class="nav nav-tabs ">

                                                    <li class="active">
                                                        <a href="#tab_default_1" data-toggle="tab" aria-expanded="false">
                                                            <i class="fa fa-info-circle fa-lg"></i> Subjective </a>
                                                    </li>
                                                    <li class="">
                                                        <a href="#tab_default_2" data-toggle="tab" aria-expanded="false">
                                                            <i class="fa fa-check fa-lg"></i> Objective  </a>
                                                    </li>
                                                    <li >
                                                        <a href="#tab_default_3" data-toggle="tab" aria-expanded="true">
                                                            <i class="fa fa-th-list fa-lg"></i> Assesment </a>
                                                    </li>
                                                    <li>
                                                        <a href="#tab_default_4" data-toggle="tab" aria-expanded="true">
                                                            <i class="fa fa-list-alt fa-lg"></i> Plan </a>
                                                    </li>
                                                    <li>

<!--                                                        <i class="fa fa-list-alt fa-lg hide"></i><button id="btnCIS_TEST_BUTTON" class="">testbutton</button>-->
                                                    </li>


                                                </ul>
                                                <%@ include file="soap-content.jsp" %>

                                            </div>
                                        </div>
                                        <!-- Tab Menu -->
                                        <hr class="pemisah" />
                                        <h4 id="mainConsultBar">Consultation Notes</h4>
                                        <div id="divCIS_Consultation_PARENT">
                                        <div id="divCIS_Consultation_Table">
                                        <table class="table table-filter tblCIS_Consultation_Table " style="background: #fff; border: 1px solid #ccc; margin-left: -31px; margin-right: -31px; width: auto; max-width: inherit; " id="tblCIS_Consultation_Table" >

                                            <tbody id="CCNNotes"  class="S ConsultationNotes"></tbody>
                                            <tbody id="HPINotes"   class="S ConsultationNotes"> </tbody>
                                            <tbody id="PMHNotes"   class="S ConsultationNotes"></tbody>
                                            <tbody id="FMHNotes"   class="S ConsultationNotes"> </tbody>
                                            <tbody id="SOHNotes"   class="S ConsultationNotes"></tbody>
                                            <tbody id="BLDNotes"  class="S ConsultationNotes"> </tbody>
                                            <tbody id="ALGNotes"   class="S ConsultationNotes"></tbody>
                                            <tbody id="IMUNotes"   class="S ConsultationNotes"> </tbody>
                                            <tbody id="DABNotes"   class="S ConsultationNotes"> </tbody>

                                            <tbody id="GCSNotes"   class="O ConsultationNotes"> </tbody>
                                            <tbody id="PGCSNotes"   class="O ConsultationNotes"> </tbody>
                                            <tbody id="BPNotes"   class="O ConsultationNotes"> </tbody>
                                            <tbody id="RRNotes"   class="O ConsultationNotes"> </tbody>
                                            <tbody id="OSATNotes"   class="O ConsultationNotes"> </tbody>
                                            <tbody id="PSCNotes"   class="O ConsultationNotes"> </tbody>
                                            <tbody id="BTEMPNotes"   class="O ConsultationNotes"> </tbody>
                                            <tbody id="OTRNotes"   class="O ConsultationNotes"> </tbody>
                                            <tbody id="PupilNotes"   class="O ConsultationNotes"> </tbody>
                                            <tbody id="PEMNotes"   class="O ConsultationNotes"> </tbody>
                                            <tbody id="BLOODGLUCOSENotes"   class="O ConsultationNotes"> </tbody>

                                            <tbody id="DGSNotes"   class="A ConsultationNotes"> </tbody>
                                            <tbody id="PNTNotes"   class="A ConsultationNotes"> </tbody>

                                            <tbody id="DTONotes"   class="P ConsultationNotes"> </tbody>
                                            <tbody id="SOPNotes"   class="P ConsultationNotes"> </tbody>
                                            <tbody id="POSNotes"   class="P ConsultationNotes"> </tbody>
                                            <tbody id="MCTSNotes"   class="P ConsultationNotes"> </tbody>
                                            <tbody id="ROSNotes"   class="P ConsultationNotes"> </tbody>
                                            <tbody id="LOSNotes"   class="P ConsultationNotes"> </tbody>
                                            <tbody id="FLUNotes"   class="P ConsultationNotes"> </tbody>
                                            <tbody id="PRINotes"   class="P ConsultationNotes"> </tbody>
                                            <tbody id="MONNotes"   class="P ConsultationNotes"> </tbody>
                                            <tbody id="ADWNotes"   class="P ConsultationNotes"> </tbody>
                                            <tbody id="DCGNotes"   class="P ConsultationNotes"> </tbody>
                                            <tbody id="DCGDTONotes"   class="P ConsultationNotes"> </tbody>
                                        </table>
                                        </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="none swapping-tab" id="order-entry">
                            <jsp:include page="order/orderEntry.jsp"/> 
                        </div>
                        <div class="none swapping-tab" id="orthopedic-con" style="display: none;">
                            <jsp:include page="../Ortho-Consultation/orthopedic.jsp"/>
                        </div>

<!--                        <div class="none" id="orthopedic-nur">
                            <%--<jsp:include page="../Ortho-Nursing/Nursing.jsp"/>--%>
                        </div> -->

                        <div class="none swapping-tab" id="orthopedic-niw">
                            <jsp:include page="../Ortho-NursingInWard/NursingInWard.jsp"/>
                        </div> 

                        <div class="none swapping-tab" id="orthopedic-ot">
                            <jsp:include page="../Ortho-operationTheater/OperationTheater.jsp"/>
                        </div> 

                        <div class="none swapping-tab" id="ong">
                            <jsp:include page="ong.jsp"/>
                        </div>
                        
                        <div class="none swapping-tab" id="ong-ward">
                            <jsp:include page="ong_ward.jsp"/>
                        </div> 

                        <div class="none swapping-tab" id="CIS-analyseTab">
                            <jsp:include page="analyse/analyse.jsp"/>
                        </div> 


                    </div>
                </div>
                <!-- main -->		

            </div>
        </div>

        <div class="material-button-anim toggle-draggable">
            <button class="material-button option1 order-ety" type="button" data-toggle="tooltip" data-placement="top" title="Physician Order Entry">
                <a href="#order-entry" class="panelito order-ety" style="color: #fff;"><span class="fa fa-medkit"></span></a>
            </button>
        </div>

        <%@ include file="queue/QueueModal.jsp" %> 
        <%@ include file="search/SearchModal.jsp" %>
        <%@ include file="setting/settingModal.jsp" %>
        
       
         
         
         <%@ include file="CIS02/CIS020001.jsp" %> 
   
        <%@ include file="CIS02/CIS020002.jsp" %> 
        <%@ include file="CIS02/CIS020003.jsp" %> 
        <%@ include file="CIS02/CIS020004.jsp" %> 
        <%@ include file="CIS02/CIS020005.jsp" %> 
        <%@ include file="CIS02/CIS020006.jsp" %> 
        <%@ include file="CIS02/CIS020007.jsp" %> 
        <%@ include file="CIS02/CIS020008.jsp" %> 
        <%@ include file="CIS02/CIS020009.jsp" %> 
        <%@ include file="CIS02/CIS020010.jsp" %> 
        <%@ include file="CIS02/CIS020011.jsp" %> 
        <%@ include file="CIS02/CIS020012.jsp" %> 
        
        <%@ include file="CIS03/CIS0103.jsp" %> 

        <%@ include file="CIS04/CIS0104.jsp" %> 
        <%@ include file="discharge/dischargeSummaryModal.jsp" %> 
        
        <jsp:include page="CIS02/CIS020014.jsp"/>
        <jsp:include page="CIS02/CIS020013.jsp"/>
        <jsp:include page="CIS02/CIS020016.jsp"/>
        <jsp:include page="CIS02/CIS020015.jsp"/>
        

        <script src="../assets/js/toggleButton.js" type="text/javascript"></script>
        <script src="../assets/js/swapping-tab.js?v1" type="text/javascript"></script>
        <script>

            (function ($) {
                var dropdown = $('.dropdown');

                // Add slidedown animation to dropdown
                dropdown.on('show.bs.dropdown', function (e) {
                    $(this).find('.dropdown-menu').first().stop(true, true).slideDown();
                });

                // Add slideup animation to dropdown
                dropdown.on('hide.bs.dropdown', function (e) {
                    $(this).find('.dropdown-menu').first().stop(true, true).slideUp();
                });
            })(jQuery);
            
            $(function(){
                $('.BP-class').attr({
                    min:"0",
                    max:"300",
                    step:"1"
                });
                
                $('.rr-rate-input').attr({
                    min:"0",
                    max:"300",
                    step:"1"
                });
                
                $('.num-3-1').attr({
                    min:"0",
                    max:"99.9",
                    step:"0.1"
                });
            });
            
//            $('#menu-content #LinkOngGeneral').on('click',function(){
//                console.log('xxx');
//                getGra();
//                $('#frequentObserbationTab').hide();
//                $('#nursingUseTab').hide();
//                $('#nurseryFeedingCharttab').hide();
//                $('#maternityUnitTab').hide();
//                $('#LabourSumaaryTab').hide();
//                $('#reportTab').hide();
//                
//                $('#ONG_4').removeClass("active");
//                $('#ONG_5').removeClass("active");
//                $('#ONG_6').removeClass("active");
//                $('#ONG_7').removeClass("active");
//                $('#ONG_8').removeClass("active");
//                $('#ONG_9').removeClass("active");
//                
//                $('#tabPI').show();
//                $('#tabBP').show();
//                $('#CIS_PN_TAB').show();
//                
//                $('#ONG_1').addClass("active in");
////                $('#ONG_2').removeClass("active");
////                $('#ONG_3').removeClass("active");
//                
//                
//            });
            
//            $('#menu-content #LinkOngCareWard').on('click',function(){
////                console.log('xxx');
////                getGra();
//                $('#frequentObserbationTab').show();
//                $('#nursingUseTab').show();
//                $('#nurseryFeedingCharttab').show();
//                $('#maternityUnitTab').show();
//                $('#LabourSumaaryTab').show();
//                $('#reportTab').show();
//                
////                $('#ONG_4').addClass("active");
////                $('#ONG_5').removeClass("active");
////                $('#ONG_6').removeClass("active");
////                $('#ONG_7').removeClass("active");
////                $('#ONG_8').removeClass("active");
////                $('#ONG_9').removeClass("active");
//                
//                $('#tabPI').hide();
//                $('#tabBP').hide();
//                $('#CIS_PN_TAB').hide();
//                
//                $('#ONG_1').removeClass("active");
//                $('#ONG_2').removeClass("active");
//                $('#ONG_3').removeClass("active");
//                $('#ONG_4').addClass("active in");
//                
//                
//            });
            
            function toggleChevron(e) {
                $(e.target)
                        .prev('.panel-heading')
                        .find("i.indicator")
                        .toggleClass('fa-chevron-right fa-chevron-down');
            }
            $('#accordion').on('hidden.bs.collapse', toggleChevron);
            $('#accordion').on('shown.bs.collapse', toggleChevron);
            
            var repeater;

            function doWork() {
                var d = new Date();

             console.log(d+" : "+statusNow);
             repeater = setTimeout(doWork, 100);
            }


            
            window.onbeforeunload = function () {
                if (reloadStat === "1") {
                    updateStatus(pmiNo, episodeDate, statusNow);
                    return "Sure U are?";
                } else {
                     return "Sure U are?";
                }
            }
        </script>
<jsp:include page="CIS01/CIS0101.jsp"/> 
    </body>
</html>