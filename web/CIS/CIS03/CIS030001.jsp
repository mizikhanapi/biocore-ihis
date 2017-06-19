<%-- 
    Document   : CIS030001
    Created on : Feb 18, 2017, 3:09:35 PM
    Author     : -D-
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>


<div class="modal fade" id="CIS030001" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                        <h3 class="modal-title" id="lineModalLabel">Diagnosis Form</h3>
                    </div>
                    <div class="modal-body">
                        <!-- content goes here -->
                        
                        <div class="form-group">
                            <div class="form-group">
                                <input class="form-control input-lg" type="text" name="problem"  id="searchDiag" placeholder="Search..." tabindex="4">
                                <div id="matchDiag"></div>
                            </div>   
                        </div>
<!--                         <input class="form-control input-lg" type="text" name="tCIS_DiagnosisSearch"  id="tCIS_DiagnosisSearch" placeholder="tCIS_DiagnosisSearch" tabindex="4">-->
                        <input type='text' id="diagnosisSearch" placeholder='diagnosis Local' class='flexdatalist' data-min-length='1' name='country_name_suggestion'>
                        <input type='text' id="diagnosisSearchAjax" placeholder='diagnosis Ajax' class='flexdatalist' data-min-length='1' name='country_name_suggestion'>
                        <div id="diagnosisSearchAjaxLoading"></div>
                        
                        
<!--                        <input type='text' placeholder='DataListDiagnosis' id="DataListSearch" class='flexdatalist' data-min-length='1' list='DataListDiagnosis' name='DataListDiagnosis'>
                        <datalist id="DataListDiagnosis">
                            <option value="PHP">PHP</option>
                        </datalist>-->
                        

<!--                        <div id="diagnosisDataList">

                        </div>-->

                        

                        
                       <div class="form-group">
                            <div class="form-group">
                                

                            </div>   
                           

                        </div>
                        <div id="divDiag">
                            
                        </div>
                          <div class="form-group">
                              <input type="hidden" name="DGS" id="dgsCode" class="form-control input-lg"  tabindex="4">
                            <input type="hidden" name="DGS" id="codeDGS" class="form-control input-lg" value="DGS" tabindex="4">
                        </div>
                        <div class="form-group">
                            <select name="mild" id="TypeDGS" class="form-control input-lg">
                                <option value="1" selected="" disabled="">Type</option>
                                <option value="Final">Final</option>
                                <option value="Provision">Provision</option>
                            </select>
                        </div>

                        <div class="form-group">
                             <input class="form-control input-lg" type="text" name="date4" id="dateDGS" placeholder="Diagnosis Date">
                        </div>



                        <div class="row">
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <select name="mild" id="SeverityDGS" class="form-control input-lg">
                                        <option value="1" selected="" disabled="">Severity [Select]</option>
                                        <option value="Mild">Mild</option>
                                        <option value="Normal">Normal</option>
                                        <option value="Acute">Acute</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <select name="site" id="SiteDGS" class="form-control input-lg">
                                        <option value="1" selected="" disabled="">Site [Select]</option>
                                        <option value="Right">Right</option>
                                        <option value="Left">Left</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <select name="site" id="LateralityDGS" class="form-control input-lg">
                                <option value="1" selected="" disabled="">Laterality [Select]</option>
                                <option value="Right">Right</option>
                                <option value="Left">Left</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <textarea type="text" name="display_name" id="commentDGS" class="form-control input-lg" placeholder="comment.." tabindex="3"></textarea>
                        </div>
                    </div>     
                    <div class="modal-footer">
                        <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                            <div class="btn-group" role="group">
                                <button type="button" class="btn btn-success btn-block btn-lg" id="acceptBtnDGS" role="button">Accept</button>
                            </div>
                            <div class="btn-group btn-delete hidden" role="group">
                                <button type="button" id="delImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal"  role="button">Clear</button>
                            </div>
                            <div class="btn-group" role="group">
                                <button type="button" id="saveImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--End ADD Diagnosis-->

    <div class="modal fade" id="update_CIS030001" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                        <h3 class="modal-title" id="lineModalLabel">Diagnosis Form</h3>
                    </div>
                    <div class="modal-body">
                        <!-- content goes here -->
                        
                        <div class="form-group">
                            <div class="form-group">
                                <input class="form-control input-lg" type="text" name="problem"  id="update_searchDiag" placeholder="Search..." tabindex="4">
                                <div id="update_matchDiag"></div>
                            </div>   
                        </div>
                          <div class="form-group">
                              <input type="hidden" name="DGS" id="update_dgsCode" class="form-control input-lg"  tabindex="4">
                            <input type="text" name="DGS" id="jsonIdDGS" class="form-control input-lg" tabindex="4">
                        </div>
                        <div class="form-group">
                            <select name="mild" id="update_TypeDGS" class="form-control input-lg">
                                <option value="1" selected="" disabled="">Type</option>
                                <option value="Final">Final</option>
                                <option value="Provision">Provision</option>
                            </select>
                        </div>

                        <div class="form-group">
                             <input class="form-control input-lg" type="text" name="date4" id="update_dateDGS" placeholder="Diagnosis Date">
                        </div>



                        <div class="row">
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <select name="mild" id="update_SeverityDGS" class="form-control input-lg">
                                        <option value="1" selected="" disabled="">Severity [Select]</option>
                                        <option value="Mild">Mild</option>
                                        <option value="Normal">Normal</option>
                                        <option value="Acute">Acute</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <select name="site" id="update_SiteDGS" class="form-control input-lg">
                                        <option value="1" selected="" disabled="">Site [Select]</option>
                                        <option value="Right">Right</option>
                                        <option value="Left">Left</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <select name="site" id="update_LateralityDGS" class="form-control input-lg">
                                <option value="1" selected="" disabled="">Laterality [Select]</option>
                                <option value="Right">Right</option>
                                <option value="Left">Left</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <textarea type="text" name="display_name" id="update_commentDGS" class="form-control input-lg" placeholder="comment.." tabindex="3"></textarea>
                        </div>
                    </div>     
                    <div class="modal-footer">
                        <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                            <div class="btn-group" role="group">
                                <button type="button" class="btn btn-success btn-block btn-lg" id="updateBtnDGS" role="button">Accept</button>
                            </div>
                            <div class="btn-group btn-delete hidden" role="group">
                                <button type="button" id="delImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal"  role="button">Clear</button>
                            </div>
                            <div class="btn-group" role="group">
                                <button type="button" id="saveImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--End ADD Diagnosis-->
        <!--End Update Diagnosis-->
        
        <script type="text/javascript">
            var arrayDGSData = JSON.parse(localStorage.dgsData);
            var arrayDGSDataAjax = [];
            //var arrayDGSData = [];
            console.log(arrayDGSData);
            var inputdgsSearch = $('#ajax').val();
              $('#diagnosisSearch').flexdatalist({
                    minLength: 3,
                    searchIn: 'name',
                    data:arrayDGSData,
                    cache:true
              });
  
              $(document).ready(function(){
                  
                searching("diagnosisSearchAjax","diagnosisSearchAjaxLoading","search/resultDGS_5.jsp");
                  
//              $('#diagnosisSearchAjax').flexdatalist({
//                    minLength: 2,
//                    searchIn: 'name',
//                    //data:arrayDGSDataAjax,
//                    url:"search/resultDGS_5.jsp",
//                    cache:true
//              });
//                  
//                $("#diagnosisSearchAjax").on('before:flexdatalist.data',function(response){
//                    $('#diagnosisSearchAjaxLoading').html('<img src="img/LoaderIcon.gif" />');
//                });
//                $("#diagnosisSearchAjax").on('after:flexdatalist.data',function(response){
//                    $('#diagnosisSearchAjaxLoading').html('');
//                });
                
                
                
                //function searching Diagnosis Ajax
                function searching(fieldId,loadingDivId,urlData){
                    $('#'+fieldId).flexdatalist({
                        minLength: 2,
                        searchIn: 'name',
                        //data:arrayDGSDataAjax,
                        url:urlData,
                        cache:true
                     });

                    $("#"+fieldId).on('before:flexdatalist.data',function(response){
                        $('#'+loadingDivId).html('<img src="img/LoaderIcon.gif" />');
                    });
                    $("#"+fieldId).on('after:flexdatalist.data',function(response){
                        $('#'+loadingDivId).html('');
                    });
                }
                
              })


            </script>
         