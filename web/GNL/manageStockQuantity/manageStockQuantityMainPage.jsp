<%-- 
    Document   : manageStockQuantityMainPage
    Created on : Dec 13, 2017, 4:17:23 PM
    Author     : Shammugam
--%>
<!-- menu top -->
<div class="row">
    <div class="col-md-12">
        <div  class="thumbnail">


            <!-- Tab Menu -->
            <div class="tabbable-panel">
                <div class="tabbable-line">
                    <ul class="nav nav-tabs ">
                        <li class="active">
                            <a href="#tab_default_1" data-toggle="tab">
                                LIST OF INVOICE</a>
                        </li>
                        <li>
                            <a href="#tab_default_2" data-toggle="tab">
                                NEW INVOICE ORDER </a>
                        </li>
                    </ul>

                    <!-- tab content -->
                    <div class="tab-content">

                        <div class="tab-pane active" id="tab_default_1">

                            <div id="invoiceContentMaster">
                            </div>

                        </div>

                        <div class="tab-pane" id="tab_default_2">

                            <div id="invoiceContentAddMaster">
                            </div>

                            <hr class="pemisah" />

                            <div id="invoiceContentAddDetail">
                            </div>

                        </div>

                        <%@include file="manageStockQuantityModal.jsp" %>

                    </div>
                </div>
            </div>
            <!-- Tab Menu -->


        </div>
    </div>
</div>


<script>

    // $('<div class="loading">Loading</div>').appendTo('body');

    $(document).ready(function () {

        var data = {
            moduleCode: $("#mainModuleCodeForGeberalPagesUsage").val()
        };

        $.ajax({
            type: "POST",
            url: "../GNL/manageStockQuantity/manageStockQuantityMasterTable.jsp", // call the jsp file ajax/auto-autocomplete.php
            data: data, // 
            timeout: 3000,
            success: function (dataBack) { // If success

                $("#invoiceContentMaster").html(dataBack);
                $("#invoiceContentAddMaster").load("../GNL/manageStockQuantity/manageStockQuantityBasicInfo.jsp");
                $("#invoiceContentAddDetail").load("../GNL/manageStockQuantity/manageStockQuantityInvoiceTable.jsp");


            },
            error: function () { // if error

            }
        });

    });

</script>