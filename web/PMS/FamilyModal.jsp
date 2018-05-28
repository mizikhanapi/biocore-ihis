<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%--<%@page import="Config.connect"%>--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String relation71 = "select master_reference_code,detail_reference_code,description,priority_indicator,start_date,end_date,status,created_by,created_date from adm_lookup_detail where master_reference_code = '0007' AND hfc_cd = '" + hfc + "' and status ='0'  ";
    String occupation71 = "select master_reference_code,detail_reference_code,description,priority_indicator,start_date,end_date,status,created_by,created_date from adm_lookup_detail where master_reference_code = '0050' AND hfc_cd = '" + hfc + "' and status ='0'";
    ArrayList<ArrayList<String>> dataRelation71, dataOccu71;
    dataRelation71 = conn.getData(relation71);
    dataOccu71 = conn.getData(occupation71);

%>
<!-- Modal -->
<div class="modal fade" id="FamilyModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">X</span><span class="sr-only">Close</span></button>
            </div>
            <div class="modal-body" >

                <div id="maintainFam">
                    <h4>Family Information</h4>
                    <form class="form-horizontal" id="famForm">

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">PMI No.</label>
                            <div class="col-md-8">
                                <input id="FAMpmi" name="FAMpmi" type="text"  class="form-control input-md" readonly>
                                <input id="FAMseq" name="FAMseq" type="hidden"  class="form-control input-md">
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Family Relationship *</label>
                            <div class="col-md-8">
                                <select id="FAMrelay" name="FAMrelay" class="form-control">
                                    <option value="null" disabled="" selected="">Select Family Relationship</option>
                                    <option value="-">-</option>

                                    <%                                        for (int i = 0; i < dataRelation71.size(); i++) {%>
                                    <option value="<%=dataRelation71.get(i).get(1)%>"><%=dataRelation71.get(i).get(2)%></option>
                                    <%  }
                                    %>
                                </select>
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group" id="FAMidtype_div">
                            <label class="col-md-4 control-label" for="selectbasic">ID Type *</label>
                            <div class="col-md-8">
                                <select id="FAMidtype" class="form-control">
                                    <option value="null" selected="" disabled="">Select ID Type</option>
                                    <option value="-">-</option>

                                    <%
                                        for (int i = 0; i < dataIdType61.size(); i++) {%>
                                    <option value="<%=dataIdType61.get(i).get(2)%>"><%=dataIdType61.get(i).get(2)%></option>
                                    <%  }
                                    %>
                                </select>
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">IC / ID No. *</label>  
                            <div class="col-md-8">
                                <input id="FAMpmifam" name="FAMpmifam" type="text" placeholder="Search IC / ID No.."  class="form-control input-md" maxlength="12">
                                <div id="matcFampmifam" class="search-drop" style="max-height: 500px; overflow: auto; height: 100%"></div>
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Name *</label>  
                            <div class="col-md-8">
                                <input id="FAMname" name="FAMname" type="text"  class="form-control input-md" maxlength="80">

                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Occupation</label>
                            <div class="col-md-8">


                                <input id="FAMocc" name="textinput" type="text" placeholder="select occupation.." class="form-control input-md" autocomplete="off">
                                <input id="FAMoccCODE" name="PMIhstateCODE" type="hidden"  class="form-control input-md">
                                <div id="matcFAMocc" class="search-drop" style="max-height: 500px; overflow: auto; height: 100%"></div>
                            </div>
                        </div>

                    </form>

                </div>

            </div>
            <div class="modal-footer">
                <div class="text-center">
                    <button id="FAMsave" name="FAMsave" class="btn btn-primary" ><i class="fa fa-floppy-o fa-lg"></i>&nbsp; Save</button>
                    <button id="FAMclear" name="FAMclear" class="btn btn-default"><i class="fa fa-ban fa-lg"></i>&nbsp; Clear</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    
      
    $('#FAMsave').on('click', function (e) {
        e.preventDefault();
        $('#FamilyModal').css('overflow', 'auto');
        var pmino = $('#FAMpmi').val(),
                seq = $('#FAMseq').val(),
                relay = $('#FAMrelay').val(),
                fampnimo = $('#FAMpmifam').val(),
                name = $('#FAMname').val(),
                occu = $('#FAMoccCODE').val(),
                idType = $('#FAMidtype').val();

        if (relay === null) {
            bootbox.alert("Select family relationship!", function () {
                $('#FAMrelay').focus();
            });
            return;
        }

        if (idType == null) {
            bootbox.alert("Select ID type!", function () {
                $('#FAMidtype').focus();
            });
            return;
        }

        if (fampnimo === "") {
            bootbox.alert("Key in the IC / ID number!", function () {
                $('#FAMpmifam').focus();
            });
            return;
        }
        if (name === "") {
            bootbox.alert("Key in the name!", function () {
                $('#FAMname').focus();
            });
            return;
        }
        if (occu === "") {
            occu = "-";
        }

        var datas = {
            pmino: pmino,
            seq: seq,
            relay: relay,
            fampnimo: fampnimo,
            name: name,
            occu: occu
        };

        bootbox.confirm({
            message: "Are you sure want to save patient's Family Information?",
            buttons: {
                confirm: {
                    label: 'Yes',
                    className: 'btn-success'
                },
                cancel: {
                    label: 'No',
                    className: 'btn-danger'
                }
            },
            callback: function (result) {
//if true go to PMI page
                if (result === true) {
                    $('#FamilyModal').modal('hide');
                    $.ajax({
                        type: "post",
                        url: "controller/saveFamily.jsp",
                        data: datas,
                        timeout: 3000,
                        success: function (data) {
                            console.log(data);
                            if (data.trim() === "true") {
                                bootbox.alert("Patient's Family Information saved successfully");
                                $('#famForm')[0].reset();
                                $('input[id=FAMpmi]').val(pmino);

                                $.ajax({
                                    url: "controller/listFamily.jsp",
                                    type: "post",
                                    data: {'PMINO': pmino},
                                    timeout: 3000,
                                    success: function (returnhtml) {
                                        //console.log(returnhtml);
                                        $('#tableListFamily').html(returnhtml);
                                        //$('#FAMpmi').prop('readonly', false);

                                        $('#FAMpmifam').prop('readonly', false);
                                    }
                                });
                            } else {
                                bootbox.alert("Patient's Family Information  fail to save");
                            }

                        }, error: function () {

                        }

                    });
                }
            }
        });

    });

    //function to clear the form when click clear button
    $('#FAMclear').on('click', function (e) {
        e.preventDefault();
        var pmino = $('input[id=FAMpmi]').val();
        $('#famForm')[0].reset();
        $('input[id=FAMpmi]').val(pmino);
        $('#FAMseq').val("");
        //$('#FAMpmi').prop('readonly', false);

        $('#FAMpmifam').prop('readonly', false);

    });

</script>

