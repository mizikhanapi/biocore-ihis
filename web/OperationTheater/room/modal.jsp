<%-- 
    Document   : modal
    Created on : Jul 22, 2017, 6:22:03 AM
    Author     : Ardhi Surya Ibrahim; rdsurya147@gmail.com; insta:@rdcfc
--%>

<div class="modal fade" id="ROOM_modal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="ROOM_modal_title"></h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal" id="ROOM_addForm" autocomplete="off">

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Room Number*</label>
                        <div class="col-md-8">
                            <input id="ROOM_Code" type="text" placeholder="Insert room number" class="form-control input-md" maxlength="25">

                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Room Name*</label>
                        <div class="col-md-8">
                            <input id="ROOM_Name"  type="text" placeholder="Insert room name" class="form-control input-md" maxlength="230">

                        </div>
                    </div>


                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Status*</label>
                        <div class="col-md-8">
                            <select class="form-control"  id="ROOM_status">
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
                    <div class="btn-group" role="group" id="div_ROOM_btnAdd">
                        <button type="button" class="btn btn-success btn-block btn-lg" role="button" id="ROOM_btnAdd">Add Room</button>
                    </div>
                    <div class="btn-group btn-delete" role="group" id="div_ROOM_btnUpdate">
                        <button type="button" class="btn btn-success btn-block btn-lg" role="button" id="ROOM_btnUpdate">Update Room</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

