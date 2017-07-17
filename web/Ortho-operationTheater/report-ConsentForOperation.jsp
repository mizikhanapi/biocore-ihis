
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@include file="../assets/header.html" %>--%>


<%
    String hospitalName, patientName, operationName, surgentName,doctorName;
    String nextOfKinName, nextOfKinIC, relWithPatient, relWithNext;
    //       if (session.getAttribute("USER_NAME") != null) {

    hospitalName = session.getAttribute("HFC_NAME").toString();
    doctorName = session.getAttribute("USER_NAME").toString();
    //       }
    nextOfKinName = request.getParameter("name");
    nextOfKinIC = request.getParameter("ic");
    relWithPatient = request.getParameter("relWithPatient");
    relWithNext = request.getParameter("relWithNext");
    patientName = request.getParameter("patientName");

%>

<div class="modal fade" id="opreationConsentForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="overflow-y:scroll;">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h4 class="modal-title" id="myModalLabel">Report - Consent for Operation</h4>
            </div>
            <div class="modal-body">
                <div id="consentOperation">


                    <div style=" float: right; margin: 20px 20px 20px 0 ;">
                        <p>(medl. 393 )</p>
                    </div>
                    <div class="" style="clear:right; margin-bottom: 30px;">
                        <h3 style="text-align: center">CONSENT FOR OPERATION</h3>
                    </div>
                    <div class="" style="font-size: 18px;">

                        <div class="">
                            <p><strong><%=hospitalName%></strong> Hospital
                                I,<strong><%=relWithPatient%></strong> of <strong><%=patientName%></strong>  hereby consent
                                *to undergo the operation of <strong>....................................................................................</strong>
                                *the submission of my child/ward <strong><%=relWithNext%></strong> to undergo
                                the operation of <strong>.........................................................................................</strong>
                                the name and the purpose of which have been explained to by Dr. <strong><%=doctorName%></strong></p>
                            <p>I also consent to such further or alternative operative measurement as may be found necessary during 
                                the course of the abovementioned operation and to the administration of general, local or other
                                anaesthetic for any of these purposes.</p>
                            <br>
                            <p>&nbsp;&nbsp;&nbsp;No assurance has been given to me that operation will be preformed by any particular
                                practitioner or that the anaesthetic care will carried out by any particular practitioner</p>

                            <br><br>
                        </div>
                    </div>  
                    <div style="height:150px">

                        <div style="float: left;  width: 30%;">
                            <p><i>Date <strong name="date"></strong></i></p>
                        </div>
                        <div style="float: right; width: 50%; text-align: center">
                            <p> <i>Singed ...............................................................</i><br>
                                <span style="margin-left: 40px">(Patient/Parent/Guardian)</span></p>
                            <p>Relationship <strong><%=relWithPatient%></strong></p>
                            <p>I.C No. <strong><%=nextOfKinIC%></strong></p>
                        </div>
                    </div>
                    <div class="">
                        <div>
                            <p>&nbsp;&nbsp;&nbsp;<strong>Note:</strong> if any other person gives his/her consent relationship with the patient 
                                should gives below his signature.</p>
                            <br>
                            <p style="white-space:pre">&nbsp;&nbsp;&nbsp;I   conform   that   I   have   explained   the   nature   and   purpose   of   this   operation   to   the   patient/parent/guardian*.</p>
                        </div>
                    </div>
                    <div style="height:60px; margin-top: 40px;">

                        <div style="float: left; width: 30%;">
                            <p><i>Date <strong name="date"></strong></i></p>
                        </div>
                        <div style="float: right; width: 50%; text-align: center">
                            <p> <i>Singed ...............................................................</i><br>
                                <span style="margin-left: 40px">(Medical/Dental Practitioner)</span></p>
                        </div>
                    </div>
                    <div>
                        <p>&nbsp;&nbsp;&nbsp; Any deletions or amendments to the form are to be made before the explanation is given and the form submitted for signature.</p>
                    </div>
                    <div>
                        <hr  style= "border-width: 1px; border-color:#000; margin: 30px 0 0 0 ;">
                        <p style="text-align: center">*Delete as appropriate</p>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="printConsentOperationForm" role="button">Print</button>
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


<script>
    var ddMMyyyyHHmmss, HHmmss, ddMMyyyy, timeStamp;

    function getDateNow() {
        //yyyy-MM-dd HH:mm:ss
        var nowDate = new Date();
        timeStamp = nowDate;
        var ZeroMinutes, ZeroSeconds, ZeroDay, ZeroMonth;
        //months
        var month = (nowDate.getMonth() + 1);
        if (month < 10) {
            ZeroMonth = "0" + month;
        } else {
            ZeroMonth = month;
        }
        //days
        var day = (nowDate.getDate());
        if (day < 10) {
            ZeroDay = "0" + day;
        } else {
            ZeroDay = day;
        }
        //years
        var year = (nowDate.getFullYear());
        //hours
        var hours = nowDate.getHours();
        //minutes
        var minutes = nowDate.getMinutes();
        if (minutes < 10) {
            ZeroMinutes = "0" + minutes;
        } else {
            ZeroMinutes = minutes;
        }
        //seconds
        var seconds = nowDate.getSeconds();
        if (seconds < 10) {
            ZeroSeconds = "0" + seconds;
        } else {
            ZeroSeconds = seconds;
        }
        //complete day
        ddMMyyyyHHmmss = ZeroDay + "/" + ZeroMonth + "/" + year + " " + hours + ":" + ZeroMinutes + ":" + ZeroSeconds;
        HHmmss = hours + ":" + ZeroMinutes + ":" + ZeroSeconds;
        ddMMyyyy = ZeroDay + "/" + ZeroMonth + "/" + year;
    };
    getDateNow();
    console.log(ddMMyyyy);
    $("[name='date']").html(ddMMyyyy);

    $('#printConsentOperationForm').click(function () {
        var divID = 'consentOperation';
        printReport(divID);
    });

</script>