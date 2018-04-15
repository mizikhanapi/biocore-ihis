<%-- 
    Document   : user
    Created on : Apr 15, 2018, 11:11:19 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<form class="form-horizontal" role="form" id="regForm">
    <div class="form-group">

        <label for="regName" class="col-sm-3 control-label">
            Name:
        </label>
        <div class="col-sm-9">
            <input type="text" class="form-control" id="regName" maxlength="180" placeholder="Enter your full name" required autocomplete="name"/>
        </div>
    </div>
    <div class="form-group">

        <label for="regIC" class="col-sm-3 control-label">
            Identity Card/ Passport No:
        </label>
        <div class="col-sm-9">
            <input type="text" class="form-control code-input" id="regIC" maxlength="30" placeholder="Enter your identity card or passport number" required/>
        </div>
    </div>
    <div class="form-group">

        <label for="regDOB" class="col-sm-3 control-label">
            Date of Birth:
        </label>
        <div class="col-sm-9">
            <input type="text" class="form-control" id="regDOB" readonly placeholder="Click to pop-up calendar" required/>
        </div>
    </div>
    <div class="form-group">

        <label for="regSex" class="col-sm-3 control-label">
            Select Gender:
        </label>
        <div class="col-sm-9">
            <select class="form-control" id="regSex" required>
                <option value="001">Male</option>
                <option value="002">Female</option>
                <option value="003">Other</option>
            </select>
        </div>
    </div>
    <div class="form-group">

        <label for="regCountry" class="col-sm-3 control-label">
            Country of Origin:
        </label>
        <div class="col-sm-9">
            <input type="text" class="form-control" id="regCountry" placeholder="Type to search your country" autocomplete="off" required/>
            <div id="regCountryMatch" class="search-drop">
                <!--search result-->
            </div>
        </div>
    </div>
    <div class="form-group">

        <label for="regPhone" class="col-sm-3 control-label">
            Mobile Phone no:
        </label>
        <div class="col-sm-9">
            <input type="tel" class="form-control" id="regPhone" placeholder="Enter your mobile phone number" maxlength="30" required autocomplete="tel"/>
        </div>
    </div>
    <div class="form-group">

        <label for="regEmail" class="col-sm-3 control-label">
            Email:
        </label>
        <div class="col-sm-9">
            <input type="email" class="form-control" id="regEmail" placeholder="Enter your email address" maxlength="100" required autocomplete="email"/>
        </div>
    </div>
    <div class="form-group">

        <label for="regUserID" class="col-sm-3 control-label">
            User ID:
        </label>
        <div class="col-sm-9">
            <input type="text" class="form-control code-input" id="regUserID" placeholder="Enter your unique user ID" maxlength="30" required/>
        </div>
    </div>
    <div class="form-group">

        <label for="repPwd1" class="col-sm-3 control-label">
            Password:
        </label>
        <div class="col-sm-9">
            <input type="password" class="form-control" id="regPwd1" maxlength="50" placeholder="Enter your password" required autocomplete="new-password"/>
        </div>
    </div>
    <div class="form-group">

        <label for="repPwd2" class="col-sm-3 control-label">
            Retype Password:
        </label>
        <div class="col-sm-9">
            <input type="password" class="form-control" id="regPwd2" maxlength="50" placeholder="Confirm your password" required autocomplete="new-password"/>
        </div>
    </div>                                

</form>
