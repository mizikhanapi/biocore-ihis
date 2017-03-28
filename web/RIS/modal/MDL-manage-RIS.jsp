<!-- Modal Detail -->
<div class="modal fade" id="detail" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Physical Exam System</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="" >
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Physical Exam Code">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Physical Exam Name">
                    </div>
                    <div class="form-group">
                        <select class="form-control">
                            <option>Status</option>
                            <option>Active</option>
                        </select>
                    </div>
                </form>
                <!-- content goes here -->
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="submit" class="btn btn-primary btn-block btn-lg" role="button">Update</button>
                    </div>
                    <div class="btn-group btn-delete hidden" role="group">
                        <button type="button" id="delImage" class="btn btn-danger btn-block btn-lg" data-dismiss="modal"  role="button">Clear</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="saveImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Modal -->