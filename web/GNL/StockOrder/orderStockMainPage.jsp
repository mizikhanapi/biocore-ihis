<%-- 
    Document   : orderStockMainPage
    Created on : Dec 13, 2017, 4:17:23 PM
    Author     : Shammugam
--%>
<!-- menu top -->
<div class="row">
    <div class="col-md-12">
        <div  class="thumbnail">


            <div id="orderStockContentAddMaster">
            </div>
            <div id="orderStockContentAddDetail">
            </div>

        </div>
    </div>
</div>


<script>

    $(document).ready(function () {

        // $('<div class="loading">Loading</div>').appendTo('body');
        $("#orderStockContentAddMaster").load("../GNL/StockOrder/orderStockBasicInfo.jsp");
        $("#orderStockContentAddDetail").load("../GNL/StockOrder/orderStockDetailTable.jsp");

    });

</script>