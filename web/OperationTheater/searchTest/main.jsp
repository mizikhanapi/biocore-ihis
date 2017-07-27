<%-- 
    Document   : main
    Created on : Jul 20, 2017, 3:04:44 PM
    Author     : Ardhi Surya Ibrahim; rdsurya147@gmail.com; insta:@rdcfc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Add Button Start -->
<h4 style="padding-top: 30px;padding-bottom: 35px; font-weight: bold">
    PROCEDURE MANAGEMENT
    <span class="pull-right" id="PRO_span_buttons" >
        <button id="PRO_btnAddModal" class="btn btn-success" style=" padding-right: 10px;padding-left: 10px;color: white;" title="Add item">
            <a>
                <i class=" fa fa-plus" style=" padding-right: 10px;padding-left: 10px;color: white;"></i>
            </a>ADD Procedure
        </button>
        <button id="PRO_btnCloneModal" class="btn btn-primary" style=" padding-right: 10px;padding-left: 10px;color: white;" title="Clone item">
            <a>
                <i class=" fa fa-copy" style=" padding-right: 10px;padding-left: 10px;color: white;"></i>
            </a>CLONE Procedure
        </button>
    </span>
</h4>
<!-- Add Button End -->

<!--hidden leaf village-->
<input type="hidden" id="PRO_hidden_name">
<input type="hidden" id="PRO_hidden_code">

<h4 id="PRO_h3_name">Please select a category first.</h4>

<!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Search</label>
                        <div class="col-md-8">
                            <input id="PRO_search" class="form-control input-lg flexdatalist" type="text" name="problem"  placeholder="Search Surgical Category..." 
                                   data-search-by-word="true"
                                   data-selection-required="true"
                                   data-visible-properties="['name', 'value']">
                            <div id="PRO_seachLoad"></div>
                        </div>
                       
                    </div>

<div class="input-group">
   <input type="text" class="form-control">
   <span class="input-group-btn">
       <button class="btn btn-default" type="button" style="display: none">Go!</button>
   </span>
</div>

<!--modal-->

<!--modal-->

<script type="text/javascript">
    
    $('#PRO_search').flexdatalist({
        minLength: 1,
        searchIn: ['name', 'value'],
        searchDelay: 2000,
        selectionRequired: true,
        url: "searchTest/ResultPOSSurgicalSearch.jsp?cat_cd=005",
        visibleProperties: ['name', 'value'],
        cache: true,
        valueProperty: 'value',
        params: {
            timeout: 3000,
            success: function (result) {
                console.log(result);
                if (result == null) {
                    $('#PRO_seachLoad').html('No Record');
                }
            }
        }
    });
    
    $("#PRO_search").on('before:flexdatalist.data', function (response) {
        $('#PRO_seachLoad').html('<img src="img/LoaderIcon.gif" />');
    });
    $("#PRO_search").on('after:flexdatalist.data', function (response) {
        $('#PRO_seachLoad').html('');
    });
    $("#PRO_search").on('select:flexdatalist', function (response) {
        $('#PRO_seachLoad').html($(this).val());
    });
    
    $('#PRO_btnAddModal').on('click', function(){
        var value = $('#PRO_search').val();
        
        console.log(value);
    });
        
</script>
