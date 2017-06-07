<%-- 
    Document   : setting_CIS
    Created on : Jun 7, 2017, 2:34:02 PM
    Author     : user
--%>

<h4 class="text-left">Before discharge:</h4>
<form class="form-horizontal" autocomplete="off" style="width: 50%; margin: 0 auto" id="CIS_form">

    <!-- Text input-->
    <div class="form-group">
        <p>
            <input type="checkbox" id="CCN">
            <label  for="CCN">Required to complete the Chief Complain before discharge</label>
        </p>
       
        <p>
            <input type="checkbox" id="DGS">
            <label  for="DGS">Required to complete the Diagnosis before discharge</label>
        </p>
        
        <p>
            <input type="checkbox" id="DCG">
            <label  for="CCN">Required to complete the Discharge Summary before discharge</label>
        </p>
    </div>

   


</form>
<div class="col-md-8">
    <br/>
    <div class="text-center">
        <button id="CIS_btnChange" name="button1id" class="btn btn-success"><i class="fa fa-floppy-o fa-lg"></i>&nbsp; Save</button>
        <!--<button id="btnClear" name="button2id" class="btn btn-default"><i class="fa fa-ban fa-lg"></i>&nbsp; Clear</button>-->
    </div>
</div>
