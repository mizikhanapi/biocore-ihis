<%-- 
    Document   : report_lookup_main
    Created on : Aug 14, 2017, 6:56:23 PM
    Author     : Ardhi Surya; rdsurya147@gmail.com; insta: @rdcfc
--%>

<h4>Lookup List Report</h4>
<!-- tab content -->
<div class=" form-horizontal" align="center">


    <!-- Select Basic -->
    

    <!-- Text input-->
    
    
    <div class="text-center">
        <button class="btn btn-primary" type="button" id="LKP_btnRefresh" ><i class="fa fa-refresh"></i>&nbsp; Refresh</button>

        <!--<button id="clearSearch" name="clearSearch" type="button" class="btn btn-default"><i class="fa fa-times"></i>&nbsp; Clear</button>-->
    </div>

    
</div>



<script type="text/javascript">
    
   $(function(){
       loadLookupMaster();
   });
    
    //... refresh result on btn click
    $('#LKP_btnRefresh').on('click', function(){
       loadLookupMaster();              
               
    });
    
    function loadLookupMaster(){
        createScreenLoading();
        
        $.ajax({
            type: 'GET',
            url: "report_control/getLookupMaster.jsp",
            timeout: 60000,
            success: function (data, textStatus, jqXHR) {
                        $('#LookupTable').html(data);
                    },
            error: function (jqXHR, textStatus, errorThrown) {
                        bootbox.alert("Oopps! "+errorThrown);
                    },
            complete: function (jqXHR, textStatus ) {
                        destroyScreenLoading();
                }        
                    
        });
        
        
        

    }
    
</script>
