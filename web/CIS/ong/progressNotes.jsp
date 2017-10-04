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
    <div class="col-md-6 col-md-offset-6 text-right margin-bottom-30px">
        <div class="col-sm-12 form-inline" style="padding-right: 0px;">
            <div class="form-group">
                <label for="exampleInputName2">Start</label>
                <input type="date" class="form-control" id="dateCIS_PN_dateFrom" placeholder="14-06-2017" style="margin-bottom: 0px !important;">
            </div>
            <div class="form-group">
                <label for="exampleInputEmail2">to</label>
                <input type="date" class="form-control" id="dateCIS_PN_dateTo" placeholder="15-06-2017" style="margin-bottom: 0px !important;">
            </div>
            <button type="submit" class="btn btn-default"><i class="fa fa-search fa-lg"></i></button>
        </div>
    </div>
</div>

<div id="listCISONGPN">
    
</div>





<script type="text/javascript">

$(document).ready(function(){
    
    $("#acceptONG_PROGRESS_NOTE").click(function(e){
        e.preventDefault();
        var note = $("#tCIS_ONG_PROGRESS_NOTE").val();
        var date = getDate();
        var doctorPN = doctor_name;
        
        var objPN = {
            note : note,
            date : date,
            doctor : doctorPN
        }
        addProgressNoteONG(objPN);
    });
    
    $("#selectCIS_ONG_PN_ViewBy").on('change',function(){
        var day = $(this).val();
        if(day === 'all'){
            loadAllProgressNote()
            
            
        }else{
            var from = $("#dateCIS_PN_dateFrom").val();
            var to = $("#dateCIS_PN_dateTo").val();
        }

    })
    

})
    
    function addProgressNoteONG(obj){
        var htmlNote = "<div class='panel panel-default'>\n\
                    <div class='panel-body'>\n\
                        <div class='row' >\n\
                        <div class='col-xs-12'>\n\
                            <div class='media'>\n\
                                <div class='media-left media-middle'>\n\
                                    <div class='ckbox'>\n\
                                        <input type='checkbox' id='checkbox0' name='CIS_consult_notes'>\n\
                                            <label for='checkbox0'></label>\n\
                                    </div>\n\
                                </div>\n\
                            <div class='media-body'> \n\
                                <dt class='media-heading'>"+obj.date+"</dt>\n\
                                    <p class='summary'>"+obj.note+"</p>\n\
                                    <dd>"+obj.doctor+"</dd>\n\
                            </div> \n\
                            <div style='position: absolute; bottom: 0px; right: 15px;''>\n\
                             <a style='vertical-align: middle;' href='#'><i class='fa fa-pencil-square-o fa-lg' aria-hidden='true' style=' color: #337ab7;'></i></a>\n\
                                &nbsp;&nbsp;&nbsp;\n\
                             <a href='#'><i class='fa fa-times fa-lg' aria-hidden='true' style='color: #d9534f;'></i></a>\n\
                                    </div>\n\
                                </div>\n\
                            </div>\n\
                        </div>\n\
                        </div>\n\
                        </div>";
        
        $("#listCISONGPN").append(htmlNote);

        console.log(htmlNote);
        
    }
    
    function loadAllProgressNote(){
        var view = $("#selectCIS_ONG_PN_ViewBy").val();
        var dataViewPN = {
            view:view,
            episodeDate:episodeDate,
            encounterDate:encounterDate
        };
        
        $.ajax({
            url:"specialistTemplate/ONG/PN_control/ProgressNoteRetrieve.jsp",
            timeout:3000,
            data:dataViewPN,
            method:"POST",
            success:function(e){
                $("#listCISONGPN").html(e.trim());
            }
        })
        
    }
</script>