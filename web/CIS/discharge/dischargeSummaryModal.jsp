<%-- 
    Document   : CIS020001
    Created on : Jan 31, 2017, 9:55:20 AM
    Author     : -D-
--%>

<%
    

%>
    <!-- Modal -->
    <div class="modal fade" id="mCIS_Discharge_Summary" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg"  id="mainModal">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                    <h3 class="modal-title" id="lineModalLabel">Discharge Summary</h3>
                </div>
                <div class="modal-body">
                    <div id="divCIS_Discharge_Summary" style="overflow:scroll; height:400px;">
                    </div>



                </div>
                
                <div class="modal-footer" id="actionGSC">
                    <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                        <div class="btn-group" role="group">
                            <a class="btn btn-success btn-block btn-lg gcsAccept " id="btnCIS_Discharge_Summary" >Discharge</a>
                        </div>
                      
                        <div class="btn-group" role="group">
                            <button type="button" id="btnCIS_Discharge_Cancel" class="btn btn-default btn-block btn-lg"  role="button">Close</button>
                        </div>
                    </div>
                    </form>
                </div>
            </div>
        </div>
        
    </div>
    

    
    <script type='text/javascript'>

        $(document).ready(function(){
            $('#btnCIS_Discharge_Cancel').click(function(){
                $('#tblCIS_Consultation_Table').html($('#divCIS_Discharge_Summary').html());
                $('#mCIS_Discharge_Summary').modal("hide");

            });
            

           
        });
        
        
        </script>