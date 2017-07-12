<%-- 
    Document   : report-PhysiotherapyReferral
    Created on : Jun 23, 2017, 9:34:41 AM
    Author     : user
--%>


<div class="modal fade" id="PhysoitherpyReferralFormModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg" style="width:80%;" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h4 class="modal-title" id="myModalLabel">Physiotherapy Referral Form</h4>
            </div>
            <div class="modal-body">

                <div id="PhysoitherpyReferralFormBody">
                    <div style="float: right; ">
                        <p style="margin-bottom: 0px">HKL / FJ / PK-01-01</p>
                    </div>
                    <h3 style="text-align: center; clear: right">HOSPITAL KUALA LUMPUR<br>
                        PHYSIOTHERAPY REFERRAL FORM</h3>

                    <div style="height:100px;">
                        <div class="" style="width: 40%; float: left;">
                            <p><strong  style="white-space:pre">Name   : <strong id="PRF-patientName"></strong></strong></p>
                            <p><strong  style="white-space:pre">Age      : <strong id="PRF-age"></strong></strong></strong></p>
                            <p><strong  style="white-space:pre">Sex      : <strong id="PRF-sex"></strong></strong></strong></p>
                        </div>
                        <div class="" style="width: 40%; float: right;">
                            <p><strong  style="white-space:pre">R / N        :           </strong></p>
                            <p><strong style="white-space:pre">Clinic / Department   : <strong id="PRF-hfc"></strong></strong></strong></p>
                            <p><strong  style="white-space:pre">Referring Doctor      : <strong id="PRF-doctor"></strong></strong></strong></p>
                        </div>
                    </div>
                    <div>
                        <table style="width:100%; height:280px; border: 1px solid black;">
                            <tr >
                                <td valign="top" style="padding: 10px; width:45%; border: 0.5px solid black; border-bottom-color: white;"><strong>Diagnosis :</strong></td>
                                <td valign="top" style="padding: 10px; width:45%; border: 0.5px solid black; border-bottom-color: white; border-left-color: white;"><strong>Investigation :</strong></td>
                            </tr>
                            <tr >
                                <td valign="top" style="padding: 10px; width:45%; border: 0.5px solid black;  border-top-color: white;"><strong>Doctor's Management :</strong></td>
                                <td valign="top" style="padding: 10px; width:45%; border: 0.5px solid black;  border-top-color: white; border-left-color: white;"><strong>Remark / Contraindications :</strong></td>
                            </tr>
                        </table>
                    </div>
                    <div style="margin-top: 15px;">
                        <p><strong style="float: left;">Doctor's Signature & Stamp :<br><br> 
                                ........................................................</strong></p><br><br>
                                <p><strong style="float: right;">Date: <strong id="PRF-currDate"></strong></strong></p>
                        <p style="clear: both; margin-top: 35px;"><strong><u>Reminder / peringatan:</u><br>
                                Patients who are referred for physiotherapy must obtain the data for their first appointment within 2 weeks from the date of referral.<br>
                                Pesakit yang telag dirujuk mesti mendapatikan tarikh temujanji pertame dalam tempoh 2 minggu dari tarikh rujukan doktor.</strong></p>
                        <p style="float: right; margin-top: 5px;"> <strong>Physio Dept, HKL 2001 . Revision no.2:2001</strong></p>
                        <div style="clear: right;"></div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button  type="button" class="btn btn-success btn-block btn-lg" id="printPhysoitherpyReferralForm" role="button">Print</button>
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