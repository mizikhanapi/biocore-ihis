<%@page import="java.text.DateFormat"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Config.Config"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%--<%@ page session="true" %>--%>

<%@include file="../Entrance/validateSession.jsp" %>
<%@include file="validateModuleAccess.jsp" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <!--<link rel="stylesheet" href="libraries/lib/css/loading.css">-->
        <link rel="stylesheet" href="../assets/css/mystyles.css">
        <link href="libraries/lib/datepicker/jquery-ui.css" rel="stylesheet">
        
        <script src="libraries/lib/js/jquery.min.js"></script>
        <script src="libraries/lib/js/bootstrap.min.js"></script>
<!--        <script src="libraries/lib/datepicker/jquery-ui.js"></script>-->
        <script src="../assets/js/jquery-ui.js" type="text/javascript"></script>
        <script src="libraries/lib/js/form-validator.min.js"></script>    
        <script src="libraries/lib/js/bootbox.min.js"></script>
        <script src="libraries/lib/js/search/searchPatient.js?v1" type="text/javascript"></script>
        <script src="../assets/js/modernizr.js" type="text/javascript"></script>
        <script src="../assets/js/webcam.js" type="text/javascript"></script>
        <script>
            $.fn.modal.Constructor.prototype.enforceFocus = function () {};
        </script>
        <%@include file = "../assets/header.html" %>

        <!-- header -->

    </head>

    <body>
        <div class="loading"></div>
        <%        Config.getFile_url(session);
            Config.getBase_url(request);
            Conn conn = new Conn();

        %>
        <!-- menu top -->

        <!-- menu top -->

        <div class="container-fluid">
            <div class="row"> 
                <!-- menu side -->
                <div><%@include file = "libraries/sideMenus.jsp" %></div>
                <!-- menu side --> 

                <!-- main -->
                <div class="main" style="background: #f2f4f8;" >
                    <div><%@include file = "libraries/topMenus.html" %></div>
                    <div class="row" >
                        <div class="col-md-12" ></div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="thumbnail">
                                <!-- Tab Menu -->

                                <div class="tabbable-panel">
                                    <div class="tabbable-line" id="navDiv">
                                        <ul class="nav nav-tabs" id="ulTabs">
                                            <li class="active"> <a href="#tab_default_1" data-toggle="tab" >Outpatient Registration </a> </li>
                                            <li> <a href="#tab_default_2" data-toggle="tab"> Patient Master Index </a> </li>
                                            <li> <a href="#tab_default_3" data-toggle="tab"> Employment </a> </li>
                                            <li> <a href="#tab_default_4" data-toggle="tab"> Next of Kin </a> </li>
                                            <li> <a href="#tab_default_5" data-toggle="tab"> Family </a> </li>
                                            <li> <a href="#tab_default_6" data-toggle="tab"> Medical Insurance </a> </li>
                                        </ul>
                                    </div>

                                    <!-- tab content -->
                                    <div class="tab-content">
                                        <!--
                                            search and registation tab
                                        -->
                                        <div class="tab-pane active" id="tab_default_1">
                                            <div id="registration"><%@include file = "registrationV2.jsp" %></div>
                                        </div>

                                        <!--
                                            PMI master index  tab
                                        -->
                                        <div class="tab-pane" id="tab_default_2">
                                            <div id="patientMasterIndex"><%@include file = "patient-master-indexV2.jsp" %></div>
                                        </div>

                                        <!--
                                            Employment tab
                                        -->
                                        <div class="tab-pane" id="tab_default_3">
                                            <div id="employment"><%@include file = "EmploymentV2.jsp" %></div>
                                        </div>

                                        <!--
                                            next of kin tab
                                        -->
                                        <div class="tab-pane" id="tab_default_4">
                                            <div id="nextOfKin"><%@include file = "kinV2.jsp" %></div>
                                        </div>

                                        <!--
                                            list of family tab tab
                                        -->
                                        <div class="tab-pane" id="tab_default_5">
                                            <div id="family"><%@include file = "familyV2.jsp" %></div>
                                        </div>

                                        <!--
                                            medical insurance tab
                                        -->
                                        <div class="tab-pane" id="tab_default_6">
                                            <div id="medical"><%@include file = "medical-insuranceV2.jsp" %></div>
                                        </div>



                                    </div>
                                </div>

                                <!-- Tab Menu --> 
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- main --> 

        </div>
        
        
        <div id="modalSaya2"><%@include file = "QueueModal.jsp" %></div>
        <div id="modalQueueNumberSaya"<%@include file = "queueNumberModal.jsp" %></div>
<!--        <div id="modalReferralSaya"><% //include file  = "ReferralModal.jsp" %></div>-->
        <div id="modalSaya"><%@include file = "AppointmentModal.jsp" %></div>




        <!-- header -->

        <script>
            var pageClicked;
            $('#OM_DateFrom').datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: 'dd/mm/yy',
                yearRange: '1990:+0',
                maxDate: '+0d'
            });


            //--- initialise datepicker for to after changes on from ------------
            $('#OM_DateFrom').on('change', function () {

                $("#OM_DateTo").datepicker("destroy");
                $('#OM_DateTo').val('');

                var fromDate = $("#OM_DateFrom").datepicker("getDate");

                $('#OM_DateTo').datepicker({
                    changeMonth: true,
                    changeYear: true,
                    dateFormat: 'dd/mm/yy',
                    yearRange: '1990:+0',
                    minDate: fromDate,
                    maxDate: '+0d'
                });

            });

            function printReport2(divID1)
                {
                    var popupWin = window.open('', '_blank');
                    popupWin.document.open();
                    popupWin.document.write('<html><head><style type="text/css" media="print">@page{margin:0mm;}</style></head><body onload="window.print()">' + divID1 +'</body></html>');
                    popupWin.document.close();
                }
            $("#queueNumberModal #maintainQN #queueNumberPrint").on('click',function(){
                
                var div = $("#queueNumberModal #maintainQN #divQueueNo").html();
                console.log(div);
                printReport2(div);
            });


            $('a[data-toggle="tab"]').click(function (e) {
                // $('#tab_a').find('a').removeAttr('data-toggle');
                var target = $(e.target).attr("href");
                e.preventDefault();
                var areYouSure = confirm("The changes you made will be lost if you navigate away from this page. Please click 'Cancel' and save your changes, or click 'OK' to continue");
                if (areYouSure === true) {
                    $(this).tab('show');
                } else {
                    // do other stuff
                    return false;
                }
            });
            var $body = $('body');
        </script>
        <script src="libraries/lib/js/onKeyPress.js" type="text/javascript"></script>
        <script src="libraries/lib/js/main/registration.js" type="text/javascript"></script>
        <script src="libraries/lib/js/search/searchDisipline.js" type="text/javascript"></script>

        <script src="libraries/lib/js/main/patient_master_index.js?v1.3" type="text/javascript"></script>
        <script src="libraries/lib/js/main/OPMain.js?v1.1" type="text/javascript"></script>


        <script src="libraries/lib/js/main/nextOfKin.js?v1.2" type="text/javascript"></script>
        <script src="libraries/lib/js/search/searchCountry.js" type="text/javascript"></script>
        <script src="libraries/lib/js/search/searchState.js" type="text/javascript"></script>
        <script src="libraries/lib/js/search/searchPostcode.js" type="text/javascript"></script>
        <script src="libraries/lib/js/search/searchTown.js" type="text/javascript"></script>
        <script src="libraries/lib/js/search/searchDistrict.js" type="text/javascript"></script>
        <script src="libraries/lib/js/search/searchTitle.js" type="text/javascript"></script>
        <script src="libraries/lib/js/search/searchNationality.js" type="text/javascript"></script>
        <script src="libraries/lib/js/search/searchHFC.js" type="text/javascript"></script>
        <script src="libraries/lib/js/search/searchOccu.js" type="text/javascript"></script>
        <script src="libraries/lib/js/search/searchInsCom.js" type="text/javascript"></script>
        <script src="../assets/js/create_destroy_loading.js" type="text/javascript"></script>
        
        

    </body>
</html>