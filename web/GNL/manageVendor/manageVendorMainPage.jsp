<%-- 
    Document   : manageVendorMainPage
    Created on : Dec 15, 2017, 9:03:36 AM
    Author     : Shammugam
--%>

<!-- menu top -->
<div class="row">
    <div class="col-md-12" style="height: 100%;">
        <div class="thumbnail">

            <h3 style="margin: 0px;">Manage Vendor</h3>
            <hr class="pemisah" />

            <div id="contentSup">
                <div id="contentVendorMain">
                </div>
                <div id="contentVendorTable">
                </div>
                <%@include file="vendorModal.jsp" %>
            </div>

        </div>
    </div>
</div>


<script>

    $('<div class="loading">Loading</div>').appendTo('body');

    $(document).ready(function () {

        // Load Supplier Data
        $("#contentVendorMain").load("../GNL/manageVendor/vendorMain.jsp");
        $("#contentVendorTable").load("../GNL/manageVendor/vendorTable.jsp");


    });

</script>
