<%-- 
    Document   : responsibility_main
    Created on : Feb 28, 2017, 6:42:15 PM
    Author     : user
--%>

<!-- Add Part Start -->
<!-- Add Button Start -->
<h4 style="padding-top: 30px;padding-bottom: 35px; font-weight: bold">
    ASSIGN PAGE TO ROLE
    <span class="pull-right">
        <button id="RESM_btnModal" class="btn btn-success" data-status="pagado" data-toggle="modal" data-id="1" data-target="#RESM_detail" style=" padding-right: 10px;padding-left: 10px;color: white;"><a data-toggle="tooltip" data-placement="top" title="Add Items" id="test"><i class=" fa fa-plus" style=" padding-right: 10px;padding-left: 10px;color: white;"></i></a>Assign Responsibility</button>
    </span>
</h4>
<!-- Add Button End -->


<!-- Add Modal Start -->
<div class="modal fade" id="RESM_detail" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 50%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" style="color: red"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title text-center" id="lineModalLabel">Page Responsibilities:</h3>

            </div>
            <div class="modal-body">

                <form style="width: 100%; margin: 0 auto;" id="RESM_form">
                    <div class="form-group">
                        <select class="form-control" id="RESM_selectRole">
                            <option value="">--Select Role--</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <select class="form-control" id="RESM_selectPage" multiple="multiple">


                        </select>
                    </div>
                    <div class="form-group">
                        <select class="form-control" id="RESM_selectStatus">
                            <option value="">--Select Status--</option>
                            <option value="0">Active</option>
                            <option value="1">Inactive</option>

                        </select>
                    </div>



                </form>
                <!-- content goes here -->
            </div>
            <div class="modal-footer" >
                <button class="btn btn-primary btn-block" type="button" id="RESM_btnAssign"><i class=" fa fa-check"></i> Assign</button>
            </div>
        </div>
    </div>
</div>
<!-- Add Modal End -->                         
<!-- Add Part End -->


<script>



    $(document).ready(function () {

        function RESM_reset() {
            document.getElementById("RESM_form").reset();


        }

        $('#RESM_btnModal').on('click', function () {
            RESM_reset();
            createRoleList();
            createPageList();
        });



        $('#RESM_btnAssign').on('click', function () {

            var arraySelect = [];
            $("#RESM_selectPage option:selected").each(function () {
                arraySelect.push($(this));

            });


            var systemCode = arraySelect.map(function (elem) {
                return elem.data('system');
            }).join("|");


            var moduleCode = arraySelect.map(function (elem) {
                return elem.data('module');
            }).join("|");

            var pageCode = arraySelect.map(function (elem) {
                return elem.val();
            }).join("|");

            var roleCode = $('#RESM_selectRole').val();
            var status = $('#RESM_selectStatus').val();

            console.log(systemCode);
            console.log(moduleCode);
            console.log(pageCode);

            if (roleCode === "") {
                bootbox.alert("Select the role");


            } else if (pageCode === "") {
                bootbox.alert("Select the page");


            } else if (status !== "1" && status !== "0") {
                bootbox.alert("Select Any Status");

            } else {

                var data = {
                    roleCode: roleCode,
                    system: systemCode,
                    module: moduleCode,
                    page: pageCode,
                    status: status
                };
                $('<div class="loading">Loading</div>').appendTo('#RESM_detail');


                $.ajax({
                    url: "responsibility_edit.jsp",
                    type: "post",
                    data: data,
                    timeout: 10000,
                    success: function (datas) {

                        if (datas.trim() === 'Done') {

                            $('#responsibilityTable').load('responsibility_table.jsp');
                            $('#RESM_detail').modal('hide');
                            //alert("Insertion Success");
                            bootbox.alert({
                                message: "Pages are assigned to a role",
                                title: "Process Result",
                                backdrop: true
                            });
                            RESM_reset();

                        } else if (datas.trim() === 'Failed') {

                            bootbox.alert("Insertion failed!");
                            //$('#RESM_detail').modal('hide');
                            RESM_reset();

                        } else {
                            bootbox.alert(datas.trim());
                            $('#RESM_selectPage').val("");

                        }

                    },
                    error: function (err) {
                        console.log("Ajax Is Not Success");
                    },
                    complete: function (jqXHR, textStatus) {
                        $('.loading').hide();
                    }

                });
            }

        });

        function createRoleList() {

            var data = {process: "role"};

            $.ajax({
                type: 'POST',
                url: "RESM_result.jsp",
                data: data,
                success: function (data) {

                    $('#RESM_selectRole').html(data);

                },
                error: function (jqXHR, textStatus, errorThrown) {

                }


            });
        }

        function  createPageList() {

            var data = {process: "page"};

            $('#RESM_selectPage').multiSelect('destroy');
            $('<div class="loading">Loading</div>').appendTo('#RESM_detail');
            $.ajax({
                data: data,
                type: 'POST',
                url: "RESM_result.jsp",
                success: function (data, textStatus, jqXHR) {

                    $('#RESM_selectPage').html(data);
                    $('#RESM_selectPage').multiSelect({
                        selectableHeader: "<div style='display:block; color:white; background-color:#2196f3'>Available pages</div>",
                        selectionHeader: "<div style='display:block; color:white; background-color:#2196f3'>Assigned pages</div>",
                        keepOrder: true
                    });

                },
                error: function (jqXHR, textStatus, errorThrown) {
                    bootbox.alert("Opps! " + errorThrown);
                },
                complete: function (jqXHR, textStatus) {
                    $('.loading').hide();
                }
            });
        }


    });



</script>


