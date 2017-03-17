<%-- 
    Document   : FullReport
    Created on : Feb 19, 2017, 12:49:19 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        -->        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="/resourcesdemos/style.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>



        <title> Full report </title>
    </head>
    <body>
        <div class="container">
            <div class="row">      
                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="background: #ffffff ;">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="thumbnail">

                                <h2 style="text-align: center"> Full Report </h2>
                                </br>

                                <div class="form-group">
                                    <label style="text-align: center" class="col-md-6 control-label" for="textinput">ID Type:</label>


                                    <div class="form-group">
                                        <div class="col-md-6">
                                            <select class="form-control" name="frType" id="frType">
                                                <option value="0" id="0" >Type of Symptom</option>
                                                <option value="allergy" id="allergy" >Allergy</option>
                                                <option value="complaint" id="complaint" >Complaint</option>
                                                <option value="diagnosis" id="diagnosis">Diagnosis</option>
                                                <option value="medication" id="medication">Medication</option>
                                                <option value="disability" id="disability">Disablity</option>
                                                <option value="immunization" id="immunization">Immunization</option>
                                                <option value="pastmedicalhistory" id="pastmedicalhistory">Past Medical History</option>
                                                <option value="socialhistory" id="socialhistory">Social History</option>
                                                <option value="familyhistory" id="familyhistory">Family History</option>

                                            </select>
                                        </div>
                                    </div>
                                </div>
                                </br></br></br>

                                <div class="form-group">
                                    <label style="text-align: center" class="col-md-6 control-label" for="textinput">Start Date</label>
                                    <div class="col-md-6">
                                        <input id="startDate" name="startDate" type="text" class="form-control datepicker" placeholder="" readonly>
                                    </div>
                                </div>

                                </br></br>
                                <div class="form-group">
                                    <label style="text-align: center" class="col-md-6 control-label" for="textinput">To</label>
                                    <div class="col-md-6">
                                        <input id="endDate" name="endDate" type="text" class="form-control datepicker" placeholder="" readonly>
                                    </div>
                                </div>

                                </br></br>

                                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                                    <div class="btn-group" role="group">
                                        <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="printFullReport">Generate Report</button>
                                    </div>
                                    <div class="btn-group" role="group">
                                        <button type="reset" id="PrintReset" class="btn btn-default btn-block btn-lg"  role="button" >Cancel</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

    </body>
</html>

<script>

    $(document).ready(function () {

        $("#startDate").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'yy-mm-dd',
        });
        $("#endDate").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'yy-mm-dd',
        });

        $('#printFullReport').on('click', function () {

            var startDate = document.getElementById("startDate").value;
            var endDate = document.getElementById("endDate").value;
            var frType = document.getElementById("frType").value;

            if (frType === "diagnosis") {

                window.open("fullReportDiagnosisReport.jsp?startDate=" + startDate + "&endDate=" + endDate);

            } else if (frType === "allergy") {
                window.open("fullReportAllergyReport.jsp?startDate=" + startDate + "&endDate=" + endDate);

            }else if (frType === "familyhistory") {
                window.open("fullReportFamilyHistoryReport.jsp?startDate=" + startDate + "&endDate=" + endDate);
            }else if (frType === "pastmedicalhistory") {
                window.open("fullReportPastMedicalHistoryReport.jsp?startDate=" + startDate + "&endDate=" + endDate);
            }else if (frType === "complaint") {
                window.open("fullReportComplaintReport.jsp?startDate=" + startDate + "&endDate=" + endDate);
            }

        });
    });
</script>



