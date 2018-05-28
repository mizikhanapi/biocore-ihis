<%-- 
    Document   : QueueList
    Created on : Jul 20, 2017, 11:11:43 AM
    Author     : -D-
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h4 class="" id="lineModalLabel" style="font-weight: bold;">Queue List</h4>

        <div class="" id="modalBodyQueue" style="overflow-x: auto;" >
            <!-- content goes here -->
            <form role="form" id="formQueueSaya" >
                <table class="table table-filter table-striped table-responsive table-bordered" style="background: #fff;" id="listQueue">
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
        <script type="text/javascript" src="queue/QueueList.js"></script>
    </body>
</html>
