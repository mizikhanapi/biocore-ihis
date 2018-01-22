<%-- 
    Document   : ong (UI)
    Created on : May 15, 2017, 10:28:19 AM
    Author     : Mizi K
--%>
<div class="row">
    <div class="col-md-12">

        <div class="thumbnail">

            <!-- Tab Menu -->
            <div class="tabbable-panel cis-tab">
                <div class="tabbable-line">
                    <ul class="nav nav-tabs ">
                        <li class="active">
                            <a href="#ONG_1" data-toggle="tab" aria-expanded="false" id="tabPI">
                                <i class="fa fa-info-circle fa-lg"></i> Personal Details </a>
                        </li>
                        <li class="">
                            <a href="#ONG_2" data-toggle="tab" aria-expanded="false" id="tabBP">
                                <i class="fa fa-check fa-lg"></i> AnteNatal Record  </a>
                        </li>
                        <li >
                            <a href="#ONG_3" data-toggle="tab" aria-expanded="true" id="CIS_PN_TAB">
                                <i class="fa fa-th-list fa-lg"></i> Progress Notes </a>
                        </li>
                       
                    </ul>

                    <div class="tab-content">
                        <!-- content -->
                        <div class="tab-pane active fade in" id="ONG_1">
                            <ul class="soap-content nav">
                                <li><a data-toggle="modal" data-target="#ong-pDetails1" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i> Gravida</a></li>
                                <li><a data-toggle="modal" data-target="#ong-pDetails3" href=""  class="soap-select" id="btnnewpreviouspregnancy"><i class="fa fa-medkit  fa-li"></i> Previous Pregnancy</a></li>
                            </ul>
                            <hr class="pemisah" />
                            <%@include file="ong/personalDetails.jsp"%>
                        </div>
                        <!-- content -->

                        <!-- content -->
                        <div class="tab-pane fade" id="ONG_2">
                            <ul class="soap-content nav">
                                <li><a data-toggle="modal" data-target="#ong-anteNatal1" href="" class="soap-select" id="anteBPnew"><i class="fa fa-comments  fa-li"></i> Blood Profile</a></li>
                                <li><a data-toggle="modal" data-target="#ong-anteNatal2" href=""  class="soap-select" id="anteRecordNew"><i class="fa fa-history  fa-li"></i> Care Plan</a></li>
                            </ul>
                            <hr class="pemisah" />
                            <%@include file="ong/anteNatal.jsp"%>
                        </div>
                        <!-- content -->

                        <!-- content -->
                        <div class="tab-pane fade" id="ONG_3">
                            <ul class="soap-content nav">
                                <li><a data-toggle="modal" data-target="#ong-progressNotes1" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i> Add New Clinical Notes</a></li>
                            </ul>
                            <hr class="pemisah" />
                            <%@include file="ong/progressNotes.jsp"%>
                        </div>
                        <!-- content -->

                    </div>

                </div>
            </div>

            <!-- Tab Menu -->
        </div>
    </div>
</div>
<jsp:include page="specialistTemplate/ONG/personalDetail-modal.jsp" />
<jsp:include page="specialistTemplate/ONG/anteNatal-modal.jsp" />
<jsp:include page="specialistTemplate/ONG/progressNotes-modal.jsp" />
<%--<jsp:include page="specialistTemplate/ONG/frequentObservationsChart-modal.jsp" />
<jsp:include page="specialistTemplate/ONG/nurseryFeeding-modal.jsp" />--%>
<%--<jsp:include page="specialistTemplate/ONG/maternityUnit-modal.jsp" />--%>

<script>
    // function to convert date to another format from datepicker
    function convertDate(date) {
        var date = date.split('/');
        var newDate = date[2] + "-" + date[1] + "-" + date[0];
        return newDate;
    }
    function getGra() {
        var pmi_no = pmiNo;
        var hfc_cd1 = hfc_cd;
        var x = pmi_no + "|" + hfc_cd1;
        getPI(x);
        getPIpreg(x);
    }

    $('#tabPI').on('click', function () {
        getGra();
    });
    
    
//    $('#tabBP').on('click', function () {
//        var pmi_no = pmiNo;
//        var hfc_cd1 = hfc_cd;
//        var x = pmi_no + "|" + hfc_cd1;
//        getBP(x);
//        getAnteNatal(x);
//    });



    $('.decimalNumbersOnly').keyup(function () {
        if (this.value !== this.value.replace(/[^0-9\.]/g, '')) {
            this.value = this.value.replace(/[^0-9\.]/g, '');
        }
    });


    $('.singleNumbersOnly').keyup(function () {
        if (this.value !== this.value.replace(/[^0-9]/g, '')) {
            this.value = this.value.replace(/[^0-9]/g, '');
        }
    });

    $('#ONG_1').on('click', '#btnnewpreviouspregnancy', function () {
        $('#ong #ong-pDetails3 #btnPIpregUpdate').hide();
        $('#ong #ong-pDetails3 #btnPIpreg').show();
    });

    $('#ONG_2').on('click', '#anteBPnew', function () {
        $('#ong #ong-anteNatal1 #btnBPUpdateItem').hide();
        $('#ong #ong-anteNatal1 #btnBPAddItem').show();
    });

    $('#ONG_2').on('click', '#anteRecordNew', function () {
        $('#ong #ong-anteNatal2 #btnAnteUpdateItem').hide();
        $('#ong #ong-anteNatal2 #btnAnteAddItem').show();
        var pmi_no = pmiNo;
        var hfc_cd1 = hfc_cd;
        var x = pmi_no + "|" + hfc_cd1;
        console.log(x);
        getWeek(x);
    });

</script>

