<%-- 
    Document   : anteNatal
    Created on : Jun 14, 2017, 4:32:59 PM
    Author     : user
--%>

<div class="row">
    <div class="col-md-8">
        <h4>Consultation Notes</h4>
    </div>
    <div class="col-md-4" style="padding-top: 20px">
        <label class="col-sm-6 control-label text-right" for="formGroupInputLarge">View history assessment:</label>
        <div class="col-sm-6" style="padding-right: 0px;">
            <select class="form-control" id="selectCIS_ONG_PN_ViewBy">
                <option value="all" selected disabled>View by</option>
                <option value="all">All</option>
                <option value="0">Today</option>
                <option value="1">Yesterday</option>
                <option value="7">7 Days</option>
                <option value="30">30 Days</option>
                <option value="60">60 Days</option>
                <option value="x">Select date</option>
            </select>
        </div>
    </div>
    <div class="col-md-6 col-md-offset-6 text-right margin-bottom-30px" id="dateSelectionView">
        <div class="col-sm-12 form-inline" style="padding-right: 0px;">
            <div class="form-group">
                <label for="exampleInputName2">Start</label>
                <input type="text" class="form-control" id="dateCIS_PN_dateFrom" placeholder="14-06-2017" style="margin-bottom: 0px !important;">
            </div>
            <div class="form-group">
                <label for="exampleInputEmail2">to</label>
                <input type="text" class="form-control" id="dateCIS_PN_dateTo" placeholder="15-06-2017" style="margin-bottom: 0px !important;">
            </div>
            <button type="submit" class="btn btn-default" id="btn_search_ong_view_progress_note"><i class="fa fa-search fa-lg"></i></button>
        </div>
    </div>
</div>

<div id="listCISONGPN" class="clear-patient">

</div>





<script type="text/javascript">

    $(document).ready(function () {
        $("#actionFooterUpdate").hide();
        $("#dateSelectionView").hide();
        $("#updateONG_PROGRESS_NOTE").click(function (e) {
            var date_split = $("#tCIS_ONG_PROGRESS_NOTE_DATE").val();
            var date_array = date_split.split("|");
            var episodeDatePNUpdate = date_array[0];
            var encounterDatePNUpdate = date_array[1];
            var createdDatePNUpdate = date_array[2];
            var updateNote = $("#tCIS_ONG_PROGRESS_NOTE").val();
            var dataUpdatePN = {
                episodeDate: episodeDatePNUpdate,
                encounterDate: encounterDatePNUpdate,
                createdDate: createdDatePNUpdate,
                note: updateNote
            }

            updateProgressNote(dataUpdatePN);

            $("#actionFooterAdd").show();
            $("#actionFooterUpdate").hide();
        });

        $("#ong-progressNotes1").on('hide.bs.modal', function () {
            $("#tCIS_ONG_PROGRESS_NOTE_DATE").val('');
            $("#tCIS_ONG_PROGRESS_NOTE").val('');
            $("#actionFooterAdd").show();
            $("#actionFooterUpdate").hide();

        });
        
        $("#btn_search_ong_view_progress_note").click(function(){
            bootbox.alert("test");
                            var from = $("#dateCIS_PN_dateFrom").val();
                var to = $("#dateCIS_PN_dateTo").val();
                            var dataViewPN = {
                view: "x",
                episodeDate: episodeDate,
                encounterDate: encounterDate,
                from:from,
                to:to
            };
            loadAllProgressNote(dataViewPN);
        });

        $("#listCISONGPN").on('click', '.btn-ong-delete-PN', function () {

            var id = $(this).get(0).id;
            var PN_id_A = id.split("|");
            var pn_id_counter = PN_id_A[1];
            var episodeDatePNUpdate = $("#PN_ONG_episodeDate" + pn_id_counter).text();
            var encounterDatePNUpdate = $("#PN_ONG_encounterDate" + pn_id_counter).text();
            var createdDatePNUpdate = $("#PN_ONG_createdDate" + pn_id_counter).text();

            var deleteObjPN = {
                episodeDate: episodeDatePNUpdate,
                encounterDate: encounterDatePNUpdate,
                createdDate: createdDatePNUpdate
            }

            bootbox.confirm({
                message: "Do you want delete this progress note?",
                buttons: {
                    confirm: {
                        label: 'Yes',
                        className: 'btn-success'
                    },
                    cancel: {
                        label: 'No',
                        className: 'btn-danger'
                    }
                },
                callback: function (result) {
                   
                    if (result == true) {
                        deleteProgressNote(deleteObjPN);
                    } else {
                       
                    }
                }
            });
        })

        $("#listCISONGPN").on('click', ".btn-ong-update-PN", function () {
            $("#actionFooterUpdate").show();
            var id = $(this).get(0).id;
            var PN_id_A = id.split("|");
            var pn_id_counter = PN_id_A[1];
            var episodeDatePNUpdate = $("#PN_ONG_episodeDate" + pn_id_counter).text();
            var encounterDatePNUpdate = $("#PN_ONG_encounterDate" + pn_id_counter).text();
            var createdDatePNUpdate = $("#PN_ONG_createdDate" + pn_id_counter).text();
            var notePNUpdate = $("#PN_ONG_notes" + pn_id_counter).text();
            var datePNUpdate = episodeDatePNUpdate + "|" + encounterDatePNUpdate + "|" + createdDatePNUpdate;
            console.log(datePNUpdate);
            $("#tCIS_ONG_PROGRESS_NOTE_DATE").val(datePNUpdate);
            $("#tCIS_ONG_PROGRESS_NOTE").val(notePNUpdate);
            $("#ong-progressNotes1").modal('show');
            $("#actionFooterAdd").hide();
        })

        $("#CIS_PN_TAB").on('click', function (e) {

            var dataViewPN = {
                view: "episode",
                episodeDate: episodeDate,
                encounterDate: encounterDate
            };
            loadAllProgressNote(dataViewPN);
        })

        $("#acceptONG_PROGRESS_NOTE").click(function (e) {
            e.preventDefault();
            var note = $("#tCIS_ONG_PROGRESS_NOTE").val();
            var date = getDate();
            var doctorPN = doctor_name;

            var objPN = {
                note: note,
                episodeDate: episodeDate,
                encounterDate: encounterDate,
                doctor: doctorPN
            }

            addProgressNoteONG(objPN);
        });

        $("#selectCIS_ONG_PN_ViewBy").on('change', function () {
            var day = $(this).val();

            var view = $("#selectCIS_ONG_PN_ViewBy").val();
            var dataViewPN = {
                view: view,
                episodeDate: episodeDate,
                encounterDate: encounterDate
            };
            if (day === 'all') {
                $("#dateSelectionView").hide();
                loadAllProgressNote(dataViewPN)


            }else if(day === "0"){
                $("#dateSelectionView").hide();
                dataViewPN.view = day;
                loadAllProgressNote(dataViewPN);
                console.log(dataViewPN);
            }else if(day === "1" || day === "7" || day === "30" || day === "60"){
                $("#dateSelectionView").hide();
                dataViewPN.view = day;
                loadAllProgressNote(dataViewPN);
                console.log(dataViewPN);
            }else if(day = "x"){
                $("#dateSelectionView").show();
            }
            else {
                $("#dateSelectionView").hide();

            }

        });
        $("#dateCIS_PN_dateTo").prop('disabled', true);
        
        $("#dateCIS_PN_dateFrom").on('change',function(){
            
                $("#dateCIS_PN_dateTo").prop('disabled', false);
                    $("#dateCIS_PN_dateTo").datepicker({
                        changeMonth: true,
                        changeYear: true,
                        yearRange: "-100:+0",
                        dateFormat: "dd/mm/yy",
                        minDate: $(this).val()
                    });
            
        })
        
        $("#dateCIS_PN_dateFrom").datepicker({

            changeMonth: true,
            changeYear: true,
            yearRange: "-100:+0",
            dateFormat: "dd/mm/yy"
        });
    


    })

    function addProgressNoteONG(obj) {
   
        $.ajax({
            url: "specialistTemplate/ONG/PN_control/ProgressNoteAdd.jsp",
            method: "POST",
            timeout: 3000,
            data: obj,
            success: function (e) {
                if (e.trim() === "1") {
                    loadEpisodePN();
                    $("#ong-progressNotes1").modal('hide');
                    $("#tCIS_ONG_PROGRESS_NOTE").val('');
                } else {
                    bootbox.alert("error add new progress note");
                    bootbox.alert(e);
                }
            }
        });


    }

    function loadAllProgressNote(data) {
        $.ajax({
            url: "specialistTemplate/ONG/PN_control/ProgressNoteRetrieve.jsp",
            timeout: 3000,
            data: data,
            method: "POST",
            success: function (e) {
                $("#listCISONGPN").html(e.trim());
            }
        })

    }

    function loadEpisodePN() {
        var dataViewPN = {
            view: "episode",
            episodeDate: episodeDate,
            encounterDate: encounterDate
        };
        loadAllProgressNote(dataViewPN);
    }

    function updateProgressNote(obj) {
        $.ajax({
            url: "specialistTemplate/ONG/PN_control/ProgressNoteUpdate.jsp",
            method: "POST",
            timeout: 3000,
            data: obj,
            success: function (e) {
                if (e.trim() === "1") {
                    loadEpisodePN();
//                    $("#listCISONGPN").prepend(htmlNote);
                    $("#ong-progressNotes1").modal('hide');
                    $("#tCIS_ONG_PROGRESS_NOTE").val('');
                } else {
                    bootbox.alert("error add new progress note");
                    bootbox.alert(e);
                }
            }
        });
    }

    function deleteProgressNote(obj) {
        $.ajax({
            url: "specialistTemplate/ONG/PN_control/ProgressNoteDelete.jsp",
            method: "POST",
            timeout: 3000,
            data: obj,
            success: function (e) {
                if (e.trim() === "1") {
                    loadEpisodePN();
//                    $("#listCISONGPN").prepend(htmlNote);
                    //$("#ong-progressNotes1").modal('hide');
                    //$("#tCIS_ONG_PROGRESS_NOTE").val('');
                } else {
                    bootbox.alert("error add new progress note");
                    bootbox.alert(e);
                }
            }
        });
    }

</script>