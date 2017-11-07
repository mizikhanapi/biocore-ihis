<%-- 
    Document   : manageBillGenerateBillDetailUnpaidPaidModal
    Created on : Oct 26, 2017, 11:26:38 AM
    Author     : Shammugam
--%>

<div class="modal" id="addItemList" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <ul id="tabs" class="nav nav-tabs col-md-12 custom-bullet">
                    <li class="active"><a data-toggle="tab" href="#tabMiscItem">Miscellaneous Item</a></li>
                    <li><a data-toggle="tab" href="#tabDrugsItem">Drugs Item</a></li>
                </ul>
            </div>
            <div class="modal-body scrollable-modal-body">
                <div class="sd-tabs sd-tab-interaction">
                    <div class="row">
                        <div class="tab-content col-md-12">
                            <div id="tabMiscItem" class="tab-pane active">
                                <!-- Misc Item -->
                                <div id="custom-search-input" style="margin-top: 10px;">
                                    <div class="form-group ">
                                        <label class="col-md-4 control-label" for="textinput">Enter Item Name to Filter</label>
                                        <div class="col-md-4">
                                            <input id="searchMiscItem" type="text" class=" search-query form-control" placeholder="Item Name" onkeyup="searchMiscItem()"/>
                                        </div>
                                    </div>
                                </div>
                                <div id="miscItem" ></div>
                            </div>

                            <div id="tabDrugsItem" class="tab-pane">
                                <!-- Drugs Item -->
                                <div id="custom-search-input" style="margin-top: 10px;">
                                    <div class="form-group ">
                                        <label class="col-md-4 control-label" for="textinput">Enter Item Name to Filter</label>
                                        <div class="col-md-4">
                                            <input id="searchDrugsItem" type="text" class=" search-query form-control" placeholder="Item Name" onkeyup="searchDrugsItem()"/>
                                        </div>
                                    </div>
                                </div>
                                <div id="drugsItem" ></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button id="addMiscItem" type="button" class="btn btn-success" data-dismiss="modal">Add Item</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="addQuantityModal" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Quantity to Add</h4>
            </div>

            <div class="modal-body">
                <label class="col-lg-4">Quantity</label>
                <div class="col-lg-8" style="margin-bottom: 10px">
                    <input type="text" class="form-control" id="quantity" value="" style="text-align: center;">
                </div>
            </div>
            <div class="modal-footer">
                <button id="addDrugsItem" type="button" class="btn btn-success" data-dismiss="modal">Ok</button>
            </div>
        </div>
    </div>
</div>

<script>




    function searchDrugsItem() {
        // Declare variables
        var input, filter, table, tr, td, i;
        input = document.getElementById("searchDrugsItem");
        filter = input.value.toUpperCase();
        table = document.getElementById("drugsItem");
        tr = table.getElementsByTagName("tr");

        // Loop through all table rows, and hide those who don't match the search query
        for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[1];
            if (td) {
                if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
    }


    function searchMiscItem() {
        // Declare variables
        var input, filter, table, tr, td, i;
        input = document.getElementById("searchMiscItem");
        filter = input.value.toUpperCase();
        table = document.getElementById("miscItem");
        tr = table.getElementsByTagName("tr");

        // Loop through all table rows, and hide those who don't match the search query
        for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[1];
            if (td) {
                if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
    }


    $('#openItemList').click(function () {
        $('#miscItem').load('manageBillGenerateBillDetailUnpaidPaidMiscList.jsp');
        $('#drugsItem').load('manageBillGenerateBillDetailUnpaidPaidDrugList.jsp');
    });




</script>