<%-- 
    Document   : searchTCMain
    Created on : Oct 30, 2018, 12:38:44 AM
    Author     : Shammugam
--%>

<div class="row">
    <div class="col-md-12">

        <div class="thumbnail">

            <!-- Tab Menu -->
            <div class="tabbable-panel cis-tab">
                <div class="tabbable-line">
                    <ul class="nav nav-tabs ">
                        <li class="active">
                            <a data-toggle="tab" aria-expanded="false">
                                <i class="fa fa-info-circle fa-lg"></i> Print Time Slip Patient </a>
                        </li>
                        <li class="pull-right">
                            <a href="#generic-soap" class="panelito general-exam" id="backtodashboardhahahahadem">
                                <i class="fa fa-chevron-left"></i> Back to General Examination </a>
                        </li>

                    </ul>

                    <div class="tab-content">
                        <div class="tab-pane active fade in" id="PrintTC_tab">
                        </div>
                    </div>

                </div>
            </div>

            <!-- Tab Menu -->
        </div>
    </div>
</div>


<script>
    $(document).ready(function () {
        $("#PrintTC_tab").load("mcandtc/searchTs.jsp");
    });
</script>