<%--<%@page import="dBConn.Conn"%>--%>
<%--<%@page import="java.util.ArrayList"%>--%>
<%--<%@page import="Config.connect"%>--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<div class="row">
    <div class="col-md-12">

        <div id="ModalKin"><%@include file = "KinModal.jsp" %></div>
            <h4>List of Next of Kin
                <button id="addKINmodal" name="addKINmodal" class="btn btn-success pull-right" data-toggle="modal" data-target="#KINModal"><i class="fa fa-plus"></i>&nbsp; Add Next Of Kin Information</button></h4>
            </h4>
            <br/>
            <div id="tableListKin" class="form-group">
                <table class="table table-striped table-bordered" style="background: #fff; border: 1px solid #ccc; " id="listKIN">
                    <thead>
                    <th>Name</th>
                    <th>IC/ID No.</th>
                    <th>Date Of Birth</th>
                    <th>Relationship</th>
                    <th>Occupation</th>                    
                    <th>Update</th>
                    <th>Delete</th>
                    </thead>

                </table>
            </div>
    </div>
</div>
<script>
    //$('#ModalKin').load('KinModal.jsp');

</script>