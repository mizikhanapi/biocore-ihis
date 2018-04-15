<%-- 
    Document   : tenant
    Created on : Apr 15, 2018, 11:03:38 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<form class="form-horizontal" role="form" id="regForm">
    <div class="form-group">

        <label for="regCode" class="col-sm-3 control-label">
            Code*:
        </label>
        <div class="col-sm-9">
            <input type="text" class="form-control code-input" id="regCode" maxlength="30" placeholder="Enter the tenant uniqe code" required autocomplete="off"/>
        </div>
    </div>
    <div class="form-group">

        <label for="regName" class="col-sm-3 control-label">
            Name*:
        </label>
        <div class="col-sm-9">
            <input type="text" class="form-control" id="regName" placeholder="Enter the tenant name" required/>
        </div>
    </div>
    <div class="form-group">

        <label for="regAddress1" class="col-sm-3 control-label">
            Address 1*:
        </label>
        <div class="col-sm-9">
            <input type="text" class="form-control" id="regAddress1" maxlength="35" placeholder="Enter the address" required/>
        </div>
    </div>
    <div class="form-group">

        <label for="regAddress2" class="col-sm-3 control-label">
            Address 2:
        </label>
        <div class="col-sm-9">
            <input type="text" class="form-control" id="regAddress2" maxlength="35" placeholder="Enter the address" />
        </div>
    </div>

    <div class="form-group">

        <label for="regAddress3" class="col-sm-3 control-label">
            Address 3:
        </label>
        <div class="col-sm-9">
            <input type="text" class="form-control" id="regAddress3" maxlength="35" placeholder="Enter the address" />
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <div class="form-group">

                <label for="regState" class="col-sm-3 control-label">
                    Select State*:
                </label>
                <div class="col-sm-9">
                    <select class="form-control" id="regState" required>
                        <option value="0">-- Select State --</option>
                    </select>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="form-group">

                <label for="regDistrict" class="col-sm-3 control-label">
                    Select District*:
                </label>
                <div class="col-sm-9">
                    <select class="form-control" id="regDistrict" required>

                    </select>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <div class="form-group">

                <label for="regTown" class="col-sm-3 control-label">
                    Select Town*:
                </label>
                <div class="col-sm-9">
                    <select class="form-control" id="regTown" required>

                    </select>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="form-group">

                <label for="regPostcode" class="col-sm-3 control-label">
                    Postcode*:
                </label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="regPostcode" placeholder="Enter your tenant postcode" maxlength="30" required autocomplete="off"/>
                    <div id="regPostcodeMatch"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <div class="form-group">

                <label for="regPhone" class="col-sm-3 control-label">
                    Telephone no:
                </label>
                <div class="col-sm-9">
                    <input type="tel" class="form-control" id="regPhone" placeholder="Enter tenant telephone number" maxlength="30" autocomplete="tel"/>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group">

                <label for="regFax" class="col-sm-3 control-label">
                    Fax no:
                </label>
                <div class="col-sm-9">
                    <input type="tel" class="form-control" id="regFax" placeholder="Enter tenant fax number" maxlength="30" autocomplete="tel"/>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <div class="form-group">

                <label for="regEmail" class="col-sm-3 control-label">
                    Email:
                </label>
                <div class="col-sm-9">
                    <input type="email" class="form-control" id="regEmail" placeholder="Enter your email address" maxlength="100" autocomplete="email"/>
                </div>
            </div>
        </div>
    </div>

</form>