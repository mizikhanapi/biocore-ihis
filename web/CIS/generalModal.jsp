<%-- 
    Document   : generalModal
    Created on : Dec 20, 2018, 5:31:59 AM
    Author     : user
--%>

<!-- Modal -->
<div class="modal fade" id="ShowAndGetPatientAlergyModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel1" aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span><i class="fa fa-times fa-lg"></i></span></button>
                <h3 class="modal-title" id="lineModalLabel">Allergy List</h3>
            </div>
            <div class="modal-body">
                <!-- content goes here -->
                <div id="ShowAndGetPatientAlergyModalTableDIV">

                </div>
                <!-- content goes here -->
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>


    $('#div_CIS_PATIENT_DASHBOARD #ShowAndGetPatientAlergy').off('click').on('click', function (e) {
        e.preventDefault();

        var patientName = $('#pName').text();
        var pmino = $('#pPMINo').text().trim();

        if (patientName === "-") {
            bootbox.alert("You need to select the patient first.");
        } else {

            $('<div class="loading">Loading</div>').appendTo('body');

            var data = {
                pmino: pmino
            };

            $.ajax({
                url: "patientOrderListAllergyTable.jsp",
                type: "post",
                data: data,
                timeout: 3000,
                success: function (returnTableHTML) {

                    $('#ShowAndGetPatientAlergyModalTableDIV').html(returnTableHTML);
                    $('#patientAllergyListTable').DataTable();
                    $("#ShowAndGetPatientAlergyModal").modal('show');
                    $('.loading').hide();


                }
            });
        }

    });



</script>