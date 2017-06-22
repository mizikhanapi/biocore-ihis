<%-- 
    Document   : chartObservation
    Created on : Jun 7, 2017, 5:34:35 PM
    Author     : Mizi K (UI)
--%>

<div class="row">
    <div class="col-md-8">
        <h4>Consultation Notes</h4>
    </div>
    <div class="col-md-4" style="padding-top: 20px">
        <label class="col-sm-6 control-label text-right" for="formGroupInputLarge">View history assessment:</label>
        <div class="col-sm-6" style="padding-right: 0px;">
            <select class="form-control" id="selectOBdate">
                <option selected="" disabled="">View by</option>
                <option value="Viewtoday">Today</option>
                <option value="Viewyesterday">Yesterday</option>
                <option value="View7day">7 Days</option>
                <option value="View30day">30 Days</option>
                <option value="View60day">60 Days</option>
                <option value="Viewcustomday">Select date</option>
            </select>
        </div>
    </div>
    <div class="col-md-6 col-md-offset-6 text-right margin-bottom-30px" id="customDateOB">
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
<table class="table table-bordered" id="tblNIW_observation_chart" width="100%">
    <thead>
        <th>Date</th>
        <th>Time</th>
        <th>B/P</th>
        <th>PR</th>
        <th>RR</th>
        <th>SpO2</th>
        <th>Pain Scale</th>
        <th style="width: 30%;">Notes</th>
        <th>Approval</th>
        <th>Action</th>
    </thead>
    <tbody>
        <tr>
        <td colspan="10" align="center"> Please choose view history assessment to view the data </td>
        <td hidden=""></td>
        <td hidden=""></td>
        <td hidden=""></td>
        <td hidden=""></td>
        <td hidden=""></td>
        <td hidden=""></td>
        <td hidden=""></td>
        <td hidden=""></td>
        <td hidden=""></td>
        </tr>
    </tbody>
<!--    <tr>
        <td>07/06/2017</td>
        <td>5:36 PM</td>
        <td>144</td>
        <td>43</td>
        <td>43</td>
        <td>35</td>
        <td>8</td>
        <td>Dia ni asik sakit je. mungkin perlu jagaan emosi.</td>
        <td>
            <button class="btn btn-success btn-block disabled"><i class="fa fa-check-square-o"></i> Approved</button>
        </td>
        <td>
            <a id="" data-toggle="modal" data-target="#edit"><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
            &nbsp;
            <a id="MW_delete" class="testing"><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a>

        </td>
    </tr>-->
</table>
<script>
    //datatable
    $(document).ready(function(){
       $('#tblNIW_observation_chart').dataTable(); 
    });
    
    //set the custom date default hidden
    $('#customDateOB').hide();
    
    //function view by date on change
    $('#selectOBdate').on('change',function(){
        var viewBy = $(this).val();
        var datas;
        if(viewBy==="Viewtoday"){
            $('#customDateOB').hide();
        }else if(viewBy==="Viewtoday"){
            $('#customDateOB').hide();
        }else if(viewBy==="Viewyesterday"){
            $('#customDateOB').hide();
        }else if(viewBy==="View7day"){
            $('#customDateOB').hide();
        }else if(viewBy==="View30day"){
            $('#customDateOB').hide();
        }else if(viewBy==="View60day"){
            $('#customDateOB').hide();
        }else if(viewBy==="Viewcustomday"){
            $('#customDateOB').show();
        }
        
        $.ajax({
           type:"post",
           url:"../Ortho-NursingInWard/controller/ObservationFunction.jsp",
           data:{datas : datas,methodName : "view"},
           timeout:10000,
           success:function(result){
               
           },
           error:function(err){
               bootbox.alert("something wrong,error: "+err);
           }
        });
    });
</script>
