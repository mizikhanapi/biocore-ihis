<%-- 
    Document   : modal
    Created on : Jul 20, 2017, 3:11:33 PM
    Author     : Ardhi Surya Ibrahim; rdsurya147@gmail.com; insta:@rdcfc
--%>

<div class="modal fade" id="CAT_modal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="CAT_modal_title"></h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal" id="CAT_addForm" autocomplete="off">

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Category Code*</label>
                        <div class="col-md-8">
                            <input id="CAT_Code"  type="text" placeholder="Insert category code" class="form-control input-md" maxlength="30">

                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Category Name*</label>
                        <div class="col-md-8">
                            <input id="CAT_Name"  type="text" placeholder="Insert category name" class="form-control input-md" maxlength="230">

                        </div>
                    </div>


                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Status*</label>
                        <div class="col-md-8">
                            <select class="form-control"  id="CAT_status">
                                <option  value="0" >Active</option>
                                <option  value="1" >Inactive</option>
                            </select>
                        </div>
                    </div>


                </form>
                <!-- content goes here -->
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group" id="div_CAT_btnAdd">
                        <button type="button" class="btn btn-success btn-block btn-lg" role="button" id="CAT_btnAdd">Add Category</button>
                    </div>
                    <div class="btn-group btn-delete" role="group" id="div_CAT_btnUpdate">
                        <button type="button" class="btn btn-success btn-block btn-lg" role="button" id="CAT_btnUpdate">Update Category</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
