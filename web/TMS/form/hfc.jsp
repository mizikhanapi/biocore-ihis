<%-- 
    Document   : hfc
    Created on : Apr 15, 2018, 3:28:38 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<form id="HFM_form" class="form-horizontal">
    <div class="row">
        <div class="col-md-12">
            <!-- Text input-->
            <div class="form-group" >
                <label class="col-md-2 control-label" for="textinput">Health Facility Name*</label>
                <div class="col-md-8">
                    <input type="text"  class="form-control" id="HFM_hfcName" placeholder="Insert health facility name" maxlength="100" required> 
                </div>
            </div>

            <!-- Text input-->
            <div class="form-group" >
                <label class="col-md-2 control-label" for="textinput">Health Facility Code*</label>
                <div class="col-md-8">
                    <input type="text"  class="form-control code-input" id="HFM_hfcCode" placeholder="Insert Health Facility Code" maxlength="30" required>   
                </div>
            </div>

            <!-- Text input-->
            <div class="form-group" >
                <label class="col-md-2 control-label" for="textinput">Address-1*</label>
                <div class="col-md-10">
                    <input type="text"  class="form-control" id="HFM_address1" placeholder="Insert Address" maxlength="40" required>   
                </div>
            </div>

            <!-- Text input-->
            <div class="form-group" >
                <label class="col-md-2 control-label" for="textinput">Address-2</label>
                <div class="col-md-10">
                    <input type="text"  class="form-control" id="HFM_address2" placeholder="Insert Address (Optional)" maxlength="40">   
                </div>
            </div>

            <!-- Text input-->
            <div class="form-group" >
                <label class="col-md-2 control-label" for="textinput">Address-3</label>
                <div class="col-md-10">
                    <input type="text"  class="form-control" id="HFM_address3" placeholder="Insert Address (Optional)" maxlength="40">   
                </div>
            </div> 

        </div>

        <!--pembahagi form menjadi dua horizontal-->

        <div class="col-md-6">

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">State*</label>
                <div class="col-md-8">
                    <select class="form-control"  id="HFM_state" required>
                        <option  value="0" >Select the state</option>                        
                    </select>
                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">District*</label>
                <div class="col-md-8" id="selectDistrict">
                    <select class="form-control"  id="HFM_district" required>
                        <option  value="0" >-- Select the district --</option>

                    </select>
                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Town*</label>
                <div class="col-md-8">
                    <select class="form-control"  id="HFM_town" required>
                        <option  value="0" >-- Select the town --</option>

                    </select>
                </div>
            </div> 

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Postcode*</label>
                <div class="col-md-8">
                    <input id="HFM_postcode" maxlength="30"  type="text" placeholder="search postcode" class="form-control input-md" autocomplete="off" required>
                    <div id="HFM_postcodeMatch">
                        <!--for list of postcode-->
                    </div>
                </div>
            </div>  


            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Tel No</label>
                <div class="col-md-8">
                    <input id="HFM_telNo" maxlength="30"  type="text" placeholder="Telephone Number" class="form-control input-md">
                </div>
            </div> 


            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Fax No</label>
                <div class="col-md-8">
                    <input id="HFM_faxNo" maxlength="30"  type="text" placeholder="Fax no" class="form-control input-md">
                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Email</label>
                <div class="col-md-8">
                    <input id="HFM_email" maxlength="100"  type="email" placeholder="email@example.com" class="form-control input-md">
                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Director Name</label>
                <div class="col-md-8">
                    <input id="HFM_director" maxlength="100"  type="text" placeholder="Director Name" class="form-control input-md">
                </div>
            </div>

            <!-- Text input-->
            <div class="form-group" id="HFM_statusDiv">
                <label class="col-md-4 control-label" for="textinput">Status*</label>
                <div class="col-md-8">
                    <select class="form-control"  id="HFM_status">
                        <option  value="0" >Active</option>
                        <option  value="1" >Inactive</option>
                    </select>
                </div>
            </div>


        </div>

        <!--pembahagi form menjadi dua vertical-->

        <div class="col-md-6">

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">IP No</label>
                <div class="col-md-8">
                    <input id="HFM_IP" maxlength="30"  type="text" placeholder="Insert Health Facility IP No (Optional)" class="form-control input-md">
                </div>
            </div> 


            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Server</label>
                <div class="col-md-8">
                    <input id="HFM_server" maxlength="30"  type="text" placeholder="Health Facility Server (Optional)" class="form-control input-md">
                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Contact Person</label>
                <div class="col-md-8">
                    <input id="HFM_contactPerson" maxlength="30"  type="text" placeholder="Insert Contact Person (Optional)" class="form-control input-md">
                </div>
            </div> 


            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Tenant*</label>
                <div class="col-md-8">
                    <input id="HFM_tenant" maxlength="30"  type="text" placeholder="Select Tenant" class="form-control input-md">
                </div>
            </div>


            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Category</label>
                <div class="col-md-8">
                    <input id="HFM_category" maxlength="30"  type="text" placeholder="Insert Health Facility Category (Optional)" class="form-control input-md">
                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Type</label>
                <div class="col-md-8">
                    <input id="HFM_type" maxlength="30"  type="text" placeholder="Insert Health Facility Type (Optional)" class="form-control input-md">
                </div>
            </div>


            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Subtype</label>
                <div class="col-md-8">
                    <input id="HFM_subtype" maxlength="30"  type="text" placeholder="Insert Health Facility Subtype (Optional)" class="form-control input-md">
                </div>
            </div>

            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Established Date</label>
                <div class="col-md-8">
                    <input id="HFM_establishedDate" maxlength="30"  type="text" placeholder="Enter Established date (dd/mm/yyyy)" class="form-control input-md">
                </div>
            </div>


        </div>

        <div class="col-md-12">
            <!-- Text input-->
            <div class="form-group logo_div" >
                <label class="col-md-2 control-label" for="textinput">Logo</label>
                <div class="col-md-8">
                    <input class="form-control" id="inputFileToLoad" type="file" accept=".jpg, .png, .gif" >
                </div>
            </div>
            <!-- Text input-->
            <div class="form-group logo_div">

                <div style="width: 50%; margin: 0 auto">
                    <div id="dym">



                    </div>

                </div>
            </div>
        </div>



    </div>

</form>
