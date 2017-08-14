<%-- 
    Document   : CIS040003
    Created on : 21-Mar-2017, 10:49:39
    Author     : ahmed
--%>

<!--Modal ADD Monitoring-->
<div class="modal fade" id="CIS040003" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" >
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Monitoring Request</h3>
            </div>
            <div class="modal-body">
                <!-- content goes here -->
                <div class="form-group">
                    <input type="hidden" name="codeMON" id="codeMON" class="form-control input-lg"  tabindex="4">
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="col-md-6 control-label" for="textinput">Search Problem</label>
                            <div class="col-md-12">
                                <input class="form-control input-lg" type="text" name="problem"  id="tCISOEMONProblemName" placeholder="(Optional) Search Problem Name..." tabindex="4">
                                <input type="hidden" id="tCISOEMONProblemNameCode"/>
                                <div id="tCISOEMONProblemNameLoading" ></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-6" for="textinput">Search Request Category</label>
                            <div class="col-md-12">
                                <input class="form-control input-lg" type="text" name="searchMON"  id="searchMON" placeholder="Type to search..." tabindex="4">
                                <div id="searchMONLoading"></div>   
                            </div>
                        </div>  
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="col-md-6" for="textinput">Request Item</label>
                            <div class="col-md-12">
                                <input type="text" name="reqItem" id="reqItem" class="form-control input-lg" placeholder="Request Item" tabindex="4" readonly="">  
                                <input type="hidden" name="reqItem" id="reqItemCode" class="form-control input-lg" placeholder="Request Item" tabindex="4" readonly="">  
                            </div>
                        </div>  
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="col-md-6" for="textinput">Test To Be Perform</label>
                            <div class="col-md-12">
                                <input type="text" name="testMON" id="testMON" class="form-control input-lg" placeholder="Test To Be Perform" tabindex="4" readonly="">
                                <input type="hidden" name="testMON" id="testMONCode" class="form-control input-lg" placeholder="Test To Be Perform" tabindex="4" readonly=""> 
                            </div>
                        </div>  
                    </div>
                </div>

            </div>
            <div class="modal-header">
                <h3 class="modal-title" id="lineModalLabel">Service Provider</h3>
            </div>
            <div class="modal-body">    

                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="col-md-6" for="textinput">Search Health Facility</label>
                            <div class="col-md-12">
                                <input class="form-control input-lg" type="text" name="searchHFC_MON"  id="searchHFC_MON" placeholder="Search Health Facility"  tabindex="4">
                                <div id="searchHFC_MONLoading"></div>
                                <input class="form-control input-lg" type="hidden"  id="hfcOrderDetailMON" placeholder="">
                                <input class="form-control input-lg" type="hidden"  id="hfcProviderDetailMON" placeholder="">
                                <input class="form-control input-lg" type="hidden"  id="hfcIdMON">
                            </div>
                        </div>  
                    </div>
                </div>

                <input type="hidden" name="codeHFC_MON" id="MONHFC_cd" class="form-control input-lg" tabindex="4">
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="col-md-6" for="textinput">Search Discipline</label>
                            <div class="col-md-12">
                                <input type="hidden" name="codeHFC_MON" id="searchDIS_MONCode" class="form-control input-lg" tabindex="4">
                                <input class="form-control input-lg" type="text" name="searchDIS_MON"  id="searchDIS_MON" placeholder="Type to search..."  tabindex="4">
                                <div id="searchDIS_MONLoading"></div>
                            </div>
                        </div>  
                    </div>
                </div>
                <br/>
                <div class="text-right" role="group">
                    <button type="button" id="btnCIS_OE_MON_CANCEL" class="btn btn-info" role="button">Cancel</button>
                    <button type="button" id="btnCIS_OE_MON_UPDATE" class="btn btn-default" role="button">Update</button>
                    <button type="button" id="btnCIS_OE_MON_ADD" class="btn btn-primary" role="button">Add</button>
                </div>
                <hr/>


                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <td>M.Category</td>
                            <td>M.Item</td>
                            <td>Test to be Perform</td>
                            <td>Action</td>
                        </tr>
                    </thead>
                    <tbody id="tableOrderMON">

                    </tbody>
                </table>



            </div>     
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="btnCIS_OE_MON_SUBMIT" role="button">Submit Orders</button>
                    </div>
                    <div class="btn-group btn-delete hidden" role="group">
                        <button type="button" id="delImage" class="btn btn-danger btn-block btn-lg" data-dismiss="modal"  role="button">Clear</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="saveImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--End ADD Monitoring-->
<script src="jsFunction/CIS040003.js" type="text/javascript"></script>