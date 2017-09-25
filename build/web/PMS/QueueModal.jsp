
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="dBConn.Conn"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>

<!-- Modal -->
<div class="modal fade" id="queueModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true" style="z-index: 99999999;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Queue List</h3>
            </div>
            <div class="modal-body" >
                    <div class="row"id="modalBodyQueue" style="overflow-x: auto;" >
                        <!-- content goes here -->
                        <form role="form" id="formQueueSaya" >
                            <table class="table table-filter table-striped table-responsive" style="background: #fff;" id="listQueue">
                                <thead>
                                <th>PMI no. </th>
                                <th>Name </th>
                                <th>Episode Time </th>
                                <th class="hidden-xs">Queue Name </th>
                                <th>Queue no.</th>
                                <th class="hidden-xs">Doctor </th>
                                <th>Status</th>
                                <th>Action </th>

                                </thead>
                                
                            </table>
                        </form>
                    </div>

            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">

                </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    //w3IncludeHTML();


    $(document).ready(function () {

        //yyyy-MM-dd HH:mm:ss
        var nowDate = new Date();
        var ZeroMinutes, ZeroSeconds, ZeroDay, ZeroMonth;

        //months
        var month = (nowDate.getMonth() + 1);
        if (month < 10) {
            ZeroMonth = "0" + month;
        } else {
            ZeroMonth = month;
        }

        //days
        var day = (nowDate.getDate());
        if (day < 10) {
            ZeroDay = "0" + day;
        } else {
            ZeroDay = day;
        }

        //years
        var year = (nowDate.getFullYear());

        //hours
        var hours = nowDate.getHours();
        //minutes
        var minutes = nowDate.getMinutes();
        if (minutes < 10) {
            ZeroMinutes = "0" + minutes;
        } else {
            ZeroMinutes = minutes;
        }
        //seconds
        var seconds = nowDate.getSeconds();
        if (seconds < 10) {
            ZeroSeconds = "0" + seconds;
        } else {
            ZeroSeconds = seconds;
        }
        //complete day
        var yyyyMMddHHmmss = year + "-" + ZeroMonth + "-" + ZeroDay + " " + hours + ":" + ZeroMinutes + ":" + ZeroSeconds;
        var HHmmss = hours + ":" + ZeroMinutes + ":" + ZeroSeconds;
        var yyyyMMdd = year + "-" + ZeroMonth + "-" + ZeroDay;

    });
</script>