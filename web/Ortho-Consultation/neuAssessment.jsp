<%-- 
    Document   : neuAssessment
    Created on : Apr 18, 2017, 12:24:40 PM
    Author     : user
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<div class="row">
    <div class="col-md-8">
        <h4>Consultation Notes</h4>
    </div>
    <div class="col-md-4" style="padding-top: 20px">
        <label class="col-sm-6 control-label text-right" for="formGroupInputLarge">View history assessment:</label>
        <div class="col-sm-6" style="padding-right: 0px;">
            <select class="form-control" id="date_history">
                <option>View by</option>
                <option>Today</option>
                <option>Yesterday</option>
                <option>7 Days</option>
                <option>30 Days</option>
                <option>60 Days</option>
                <option>Select date</option>
            </select>
        </div>
    </div>
    <div class="col-md-6 col-md-offset-6 text-right margin-bottom-30px">
        <div class="col-sm-12 form-inline" style="padding-right: 0px; display: none;" id="date_FromTo">
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
<div id="getNeuAssessment">


</div>
<script>
    $(document).ready(function () {

        $("#getNeuAssessment").load("../Ortho-Consultation/table/t_assessment.jsp");
    });
    $('#date_history').on('change', function () {
        if (this.value == 'Today')
        {
            $("#date_FromTo").hide();
            
            alert("today");
        } else if (this.value == 'Yesterday')
        {
            $("#date_FromTo").hide();
            alert("Yesterday");
        } else if (this.value == '7 Days')
        {
            $("#date_FromTo").hide();
            alert("7 Days");
        }else if (this.value == '30 Days')
        {
            $("#date_FromTo").hide();
            alert("30 Days");
        }else if (this.value == '60 Days')
        {
            $("#date_FromTo").hide();
            alert("60 Days");
        }else if (this.value == 'Select date')
        {
            $("#date_FromTo").show();
        }
    });

</script>
