
<%@page import="javafx.scene.input.DataFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.ArrayList"%>

<div class="modal fade" id="bloodTransfusionConsentForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content modal-lg">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h4 class="modal-title" id="myModalLabel">Blood Transfusion Consent Form</h4>
            </div>
            <div class="modal-body">
                <div id="bloodTransfusionForm">

                    <div style=" float: right; margin: 20px 20px 20px 0 ;">
                        <p>Lampiran 7b</p>
                        <p>PDN 1/2005</p>
                    </div>
                    <div class="" style="clear:right;">
                        <h4 style="text-align: center"><u>CONSENT FORM FOR BLOOD OR BLOOD COMPONENT TRANSFUSION</u></h4>
                    </div>
                    <div style="height:140px;">
                        <div class="" style="width: 34%; float: right;">
                            <P  style="white-space:pre">Date        :   <strong id="BTCF-currDate"></strong></p>
                            <p  style="white-space:pre">Age         :   <strong id="BTCF-age"></strong></p>
                            <p  style="white-space:pre">Sex         :   <strong id="BTCF-sex"></strong></p>
                        </div>
                        <div class="" style="width: 60%; float: left; margin-top: 30px;">
                            <P  style="white-space:pre">Patient's Name        :   <strong id="BTCF-patientName"></strong></p>
                            <p  style="white-space:pre">Identity Card No      :   <strong id="BTCF-IC"></strong></p>
                            <p  style="white-space:pre">Address                   :   <strong id="BTCF-address"></strong></p>
                        </div>  
                    </div>
                    <div class="" >
                        <P  style="white-space:pre">Attention Medical Practitioner          : Dr.<strong><%%></strong></p>
                        <p  style="white-space:pre">Identity Card No   :   <strong><%%></strong></p>
                    </div>
                    <div class="" style="margin-top: 25px;">
                        <P>I, the above named/parent/guardian/spouse/next of kin of the above named*, have been<br>
                            informed of  the need for blood transfusion of the patient. The attending medical<br>
                            practitioner has explained to me the risk and benefits involved in the transfusion<br>
                            as well as answer all my inquires satisfactorily. I understand the that despite testing<br>
                            and screening on the blood/blood component for HIV, Hepatitis B,<br>
                            Hepatitis C and Syphilis, there are still risk of developing the disease, I also<br>
                            understand that unavoidable complication of transfusion may also occur.</p>

                        <p style="margin-top: 20px;">I fully understood the above and hereby agree to the blood/blood component transfusion.</p>
                    </div>

                    <div style="height: 100px;margin-top: 40px;">
                        <div>
                            <p style="float: left; width: 30%; text-align: center;">.....................................................<br>
                                Signature of the patient/parent/<br>
                                Guardian/spouse/next of kin*</p>
                        </div>
                        <div>
                            <p style="float: right; width: 30%; text-align: center;">.....................................................<br>
                                Signature of Attending<br>
                                Medical Practitioner</p>
                        </div>
                    </div>  
                    <div>
                        <P  style="white-space:pre">Name of patient/parent/guardian/spouse/next of kin**        :           </p>
                        <P  style="white-space:pre">Identity Card No                                                                  :           </p>
                    </div>
                    <div style="margin-top: 40px;">
                        <p>I was present while the above matter was explained to the patient/parent/<br>
                            guardian/spouse/next of kin* whose signature appear above.<br>
                            In my opinion, the person referred to has understood the contents of<br>
                            this form and agreed to the transfusion willingly.</p>
                    </div>
                    <div style="margin-top: 30px;">
                        <p >.....................................................</p>
                        <p>Signature of witness<br>
                            Name of witness    :<br>
                            Identity Card No.  :</p>
                    </div>
                    <div style="margin-top: 40px;">
                        <p>* delete appropriately<br>
                            ** if necessary</p>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="printBloodTransfusionForm" role="button">Print</button>
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

