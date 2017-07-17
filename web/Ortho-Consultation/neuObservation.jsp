<%-- 
    Document   : neurosurgical
    Created on : Apr 18, 2017, 12:20:37 PM
    Author     : user
--%>

<div class="row">
    <div class="col-md-8">
        <h4>Consultation Notes</h4>
    </div>

    <div class="col-md-4" style="padding-top: 20px">
        <label class="col-sm-6 control-label text-right" for="formGroupInputLarge">View history assessment:</label>
        <div class="col-sm-6" style="padding-right: 0px;">
            <select class="form-control" id="date_history1">
                <option value="View by">View by</option>
                <option value="Today">Today</option>
                <option value="Yesterday">Yesterday</option>
                <option value="Days_7">7 Days</option>
                <option value="Days_30">30 Days</option>
                <option value="Days_60">60 Days</option>
                <option value="Select_date">Select date</option>
            </select>
        </div>
    </div>
    <div class="col-md-6 col-md-offset-6 text-right margin-bottom-30px" id="date_FromTo1">
        <div class="col-sm-12 form-inline" style="padding-right: 0px;">
            <div class="form-group">
                <label for="exampleInputName2">Start</label>
                <input type="text" class="form-control" id="exampleInputName2" placeholder="14/06/2017" style="margin-bottom: 0px !important;">
            </div>
            <div class="form-group">
                <label for="exampleInputEmail2">to</label>
                <input type="email" class="form-control" id="exampleInputEmail2" placeholder="15/06/2017" style="margin-bottom: 0px !important;">
            </div>
            <button type="submit" class="btn btn-default"><i class="fa fa-search fa-lg"></i></button>
        </div>
    </div>
</div>
<div id="getNeuObservation">

</div>
<script>
    $(document).ready(function () {

        $("#getNeuObservation").load("../Ortho-Consultation/table/t_observation.jsp");

        $('#date_history1').on('change', function () {
            if (this.value == 'Today')
            {
                $("#date_FromTo1").hide();
                var Today = "Today";
                $.ajax({
                    url: "../Ortho-Consultation/table/t_observation.jsp",
                    type: "post",
                    data: {time_history: Today
                    },
                    timeout: 10000,
                    success: function (returnObservation) {
                        $('#getNeuObservation').html(returnObservation);
                        console.log(returnObservation);
                        $('#getNeuObservation').trigger('contentchanged');
                    },
                    error: function (err) {
                        alert("Error update!");
                    }
                });
                //alert("today");
            }else if (this.value == 'View by')
            {
                $("#date_FromTo1").hide();
                var Yesterday = "Viewby";
                $.ajax({
                    url: "../Ortho-Consultation/table/t_observation.jsp",
                    type: "post",
                    data: {time_history: Yesterday
                    },
                    timeout: 10000,
                    success: function (returnObservation) {
                        $('#getNeuObservation').html(returnObservation);
                        console.log(returnObservation);
                        $('#getNeuObservation').trigger('contentchanged');
                    },
                    error: function (err) {
                        alert("Error update!");
                    }
                });
                //alert("Yesterday");
            }else if (this.value == 'Yesterday')
            {
                $("#date_FromTo1").hide();
                var Yesterday = "Yesterday";
                $.ajax({
                    url: "../Ortho-Consultation/table/t_observation.jsp",
                    type: "post",
                    data: {time_history: Yesterday
                    },
                    timeout: 10000,
                    success: function (returnObservation) {
                        $('#getNeuObservation').html(returnObservation);
                        console.log(returnObservation);
                        $('#getNeuObservation').trigger('contentchanged');
                    },
                    error: function (err) {
                        alert("Error update!");
                    }
                });
                //alert("Yesterday");
            } else if (this.value == 'Days_7')
            {
                $("#date_FromTo1").hide();
                var Days = "7 Days";
                $.ajax({
                    url: "../Ortho-Consultation/table/t_observation.jsp",
                    type: "post",
                    data: {time_history: Days
                    },
                    timeout: 10000,
                    success: function (returnObservation) {
                        $('#getNeuObservation').html(returnObservation);
                        console.log(returnObservation);
                        $('#getNeuObservation').trigger('contentchanged');
                    },
                    error: function (err) {
                        alert("Error update!");
                    }
                });

            } else if (this.value == 'Days_30')
            {
                $("#date_FromTo1").hide();
                var Days = "30 Days";
                $.ajax({
                    url: "../Ortho-Consultation/table/t_observation.jsp",
                    type: "post",
                    data: {time_history: Days
                    },
                    timeout: 10000,
                    success: function (returnObservation) {
                        $('#getNeuObservation').html(returnObservation);
                        console.log(returnObservation);
                        $('#getNeuObservation').trigger('contentchanged');
                    },
                    error: function (err) {
                        alert("Error update!");
                    }
                });
            } else if (this.value == 'Days_60')
            {
                $("#date_FromTo1").hide();
                var Days = "60 Days";
                $.ajax({
                    url: "../Ortho-Consultation/table/t_observation.jsp",
                    type: "post",
                    data: {time_history: Days
                    },
                    timeout: 10000,
                    success: function (returnObservation) {
                        $('#getNeuObservation').html(returnObservation);
                        console.log(returnObservation);
                        $('#getNeuObservation').trigger('contentchanged');
                    },
                    error: function (err) {
                        alert("Error update!");
                    }
                });
            } else if (this.value == 'Select_date')
            {
                $("#date_FromTo1").show();
            }
        });
    });
</script>