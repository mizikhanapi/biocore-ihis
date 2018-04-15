<%-- 
    Document   : tenant_main
    Created on : Apr 16, 2018, 4:14:16 AM
    Author     : user
--%>
<%@page import="ADM_helper.LookupHelper"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="ADM_helper.MySessionKey"%>
<%
    String tnt_cd = (String) session.getAttribute(MySessionKey.TENANT_CD);

    //                        0       1          2        3          4        5        6             7       8           9          10     11
    String query = "SELECT tnt_cd, tnt_name, address1, address2, address3, town_cd, district_cd, state_cd, postcode, telephone_no, fax_no, email "
            + "FROM adm_tenant WHERE tnt_cd='" + tnt_cd + "';";
    Conn con = new Conn();
    ArrayList<ArrayList<String>> arrData = con.getData(query);
    String longData = "||||||||||||";
    if (arrData.size() > 0) {
        LookupHelper lh = new LookupHelper("99_iHIS_99");
        String pos = lh.getLookupDetailDescription("0079", arrData.get(0).get(8));
        ArrayList<String> tempArr = arrData.get(0);
        tempArr.add(pos);
        longData = String.join("|", tempArr);
    }
%>
<input type="hidden" id="tnt_hidden" value="<%=longData%>"/>
<div style="width: 70%; margin: auto; background: #f2f4f8;">
    <form class="form-horizontal" role="form" id="regForm">
        <div class="form-group">

            <label for="regCode" class="col-sm-3 control-label">
                Code*:
            </label>
            <div class="col-sm-9">
                <input type="text" class="form-control code-input" id="regCode" maxlength="30" placeholder="Enter the tenant uniqe code" required readonly/>
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
    <div class="form-group">
        <div class="col-sm-offset-4 col-sm-4">

            <button class="btn btn-success" id="btnSave">
                <i class="fa fa-floppy-o" aria-hidden="true"></i> Save
            </button>
        </div>
    </div>
</div>

<script>
    //init state list
    function setState(value) {
        $.ajax({
            type: 'POST',
            url: "control/getDetailFlexList.jsp",
            data: {
                master_cd: "0002",
                keyword: ""
            },
            dataType: 'json',
            timeout: 60000,
            success: function (data, textStatus, jqXHR) {
                data.forEach(function (item)
                {
                    if (item.value !== "00")
                        $('#regState').append("<option value='" + item.value + "'>" + item.name + "</option>");
                });
                if (value != null) {
                    $('#regState').val(value);
                    var arrData = $('#tnt_hidden').val().split("|");
                    setDistrict(arrData[6]);
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log("Oops! Can't load state: " + errorThrown);
            }
        });
    }

    destroyScreenLoading();
    //init felx-data-list
    function initFlexData(elemInputID, elemDivID, url, value, objData) {
        $('#' + elemInputID).val(value).flexdatalist({
            minLength: 1,
            searchIn: 'name',
            searchDelay: 1000,
            selectionRequired: true,
            url: url,
            visibleProperties: 'name',
            cache: false,
            valueProperty: 'value',
            searchContain: false,
            searchByWord: true,
            params: {
                master_cd: objData
            }
        });
        $('#' + elemInputID).on('before:flexdatalist.data', function (response) {
            $('#' + elemDivID).html('<img src="../assets/img/LoaderIcon.gif" />');
        });
        $('#' + elemInputID).on('after:flexdatalist.data', function (response) {
            $('#' + elemDivID).html('');
        });
    }



    $('#btnReset').on('click', function () {
        $('#regForm')[0].reset();
        $('#regPostcodeMatch').html('');
    });
    $('#regState').on('change', function () {
        setDistrict(null);
    });

    function setDistrict(value) {
        var code = $('#regState').val();
        $('#regTown').html('<option  value="0" >-- Select the town --</option>');
        if (code !== '0') {

            var dataFields = {code: code, process: "district"};
            $.ajax({
                type: "POST",
                url: "../SystemAdmin/HFM_result.jsp",
                data: dataFields,
                timeout: 5000,
                success: function (data) {
                    $('#regDistrict').html(data);
                    if (value != null) {
                        $('#regDistrict').val(value);
                        var arrData = $('#tnt_hidden').val().split("|");
                        setTown(arrData[5]);
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log("can't load district: " + errorThrown);
                }
            });
        } else {
            $('#regDistrict').html('<option  value="0" >-- Select the district --</option>');
        }
    }

    $('#regDistrict').on('change', function () {
        setTown(null);
    });

    function setTown(value) {

        var code = $('#regDistrict').val();
        if (code !== '0') {

            if (code === '00') {
                var front = $('#regState').val();
                code = front + '00';
            }

            var dataFields = {code: code, process: "town"};
            $.ajax({
                type: "POST",
                url: "../SystemAdmin/HFM_result.jsp",
                data: dataFields,
                timeout: 5000,
                success: function (data) {
                    $('#regTown').html(data);
                    if (value != null) {
                        $('#regTown').val(value);
                    }
                },
                error: function (err) {
                    console.log("Ajax error");
                }
            });
        } else {
            $('#regTown').html('<option  value="0" >-- Select the town --</option>');
        }

    }

    function validateMyForm() {
        if (!$('#regForm')[0].checkValidity()) {
            $('<input type="submit">').hide().appendTo('#regForm').click().remove();
            return false;
        }

        var state = $('#regState').val();
        if (state === "0") {
            bootbox.alert("Select the state!", function () {
                $('#regState').focus();
            });
            return false;
        }

        var district = $('#regDistrict').val();
        if (district === "0") {
            bootbox.alert("Select the district!", function () {
                $('#regDistrict').focus();
            });
            return false;
        }

        var town = $('#regTown').val();
        if (town === "0") {
            bootbox.alert("Select the town!", function () {
                $('#regTown').focus();
            });
            return false;
        }

        var pos = $('#regPostcode').val();
        if (pos == null || pos === "") {
            bootbox.alert("Select existing postcode!", function () {
                $('#regPostcode-flexdatalist').val("");
                $('#regPostcode-flexdatalist').focus();
            });
            return false;
        }

        var phone = $('#regPhone').val().trim();
        if (phone !== "" && !validatePhonenumber(phone)) {
            bootbox.alert("Invalid mobile phone number. Only numbers and +, - signs are allowed.", function () {
                $('#regPhone').val("");
                $('#regPhone').focus();
            });
            return false;
        }

        var fax = $('#regFax').val().trim();
        if (fax !== "" && !validatePhonenumber(fax)) {
            bootbox.alert("Invalid mobile fax number. Only numbers and +, - signs are allowed.", function () {
                $('#regFax').val("");
                $('#regFax').focus();
            });
            return false;
        }

        var email = $('#regEmail').val().trim();
        if (email !== "" && !ValidateEmail(email)) {
            bootbox.alert("Invalid email format!", function () {
                $('#regEmail').val("");
                $('#regEmail').focus();
            });
            return false;
        }

        return true;
    }


    $('#btnSave').on('click', function () {
        if (validateMyForm()) {
            createScreenLoading();
            var tenant_name = $('#regName').val().replace(/'/g, "\\\'").replace(/"/g, "\\\"");
            var add1 = $('#regAddress1').val().replace(/'/g, "\\\'").replace(/"/g, "\\\"");
            var add2 = $('#regAddress2').val().replace(/'/g, "\\\'").replace(/"/g, "\\\"");
            var add3 = $('#regAddress3').val().replace(/'/g, "\\\'").replace(/"/g, "\\\"");
            var town = $('#regTown').val();
            var district = $('#regDistrict').val();
            var state = $('#regState').val();
            var pos = $('#regPostcode').val();
            var phone = $('#regPhone').val();
            var fax = $('#regFax').val();
            var email = $('#regEmail').val();
            var input = {
                name: tenant_name,
                add1: add1,
                add2: add2,
                add3: add3,
                town: town,
                district: district,
                state: state,
                pos: pos,
                phone: phone,
                fax: fax,
                email: email
            };

            $.ajax({
                type: 'POST',
                data: input,
                timeout: 60000,
                url: "tenant_info/tenant_update.jsp",
                dataType: 'json',
                success: function (data, textStatus, jqXHR) {
                    bootbox.alert(data.msg, function () {
                        if (data.isValid) {
                            location.reload();
                        }
                    });

                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log("Oops! " + errorThrown);
                },
                complete: function (jqXHR, textStatus) {
                    destroyScreenLoading();
                }
            });
        }


    });

    function setAllData() {
        var arrData = $('#tnt_hidden').val().split("|");

        initFlexData("regPostcode", "regPostcodeMatch", "control/getDetailFlexList.jsp", arrData[8], "0079");
        $('#regPostcode-flexdatalist').val(arrData[12]);
        
        setState(arrData[7]);



        $('#regCode').val(arrData[0]);
        $('#regName').val(arrData[1]);
        $('#regAddress1').val(arrData[2]);
        $('#regAddress2').val(arrData[3]);
        $('#regAddress3').val(arrData[4]);
        $('#regPhone').val(arrData[9]);
        $('#regFax').val(arrData[10]);
        $('#regEmail').val(arrData[11]);
    }

    setAllData();

</script>
