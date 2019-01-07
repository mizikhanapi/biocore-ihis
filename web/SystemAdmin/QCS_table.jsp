<%-- 
    Document   : QCS_table
    Created on : 07-Jan-2019, 18:32:36
    Author     : Shay
--%>

<%@page import="ADM_helper.MySession"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn conn = new Conn();
    String LT_user = session.getAttribute("USER_ID").toString();
    String LT_hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis_cd = (String) session.getAttribute("DISCIPLINE_CODE");
    String sub_dis = (String) session.getAttribute("SUB_DISCIPLINE_CODE");
    
    MySession LT_mys = new MySession(LT_user, LT_hfc);
   
%>
<table  id="THE_masterTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <th>Content Id</th>
    <th>Content Title</th>
    <th>Content Text</th>
    <th>Date</th>
    <th>Image</th>
    <th>Modified by</th>
    <th>Action</th>
    
</thead>
<tbody>

    <%
        //                     0     1              2               3            4           5        6       7            8
        String sql = " SELECT id,cs_hfc_cd,cs_sub_discipline,cs_episode_date,cs_title,cs_content,date_format(cs_date,'%d/%m/%Y'),cs_modified_by,cs_img FROM qcs_calling_system_content WHERE cs_hfc_cd = '"+LT_hfc+"' and cs_discipline = '"+dis_cd+"'";
        ArrayList<ArrayList<String>> dataMaster = conn.getData(sql);

        int size = dataMaster.size();
        
        
    for (int i = 0; i < size; i++) {
    %>

    <tr>
<input id="MLT_hidden" type="hidden" value="<%=String.join("|", dataMaster.get(i))%>">
<td><%= dataMaster.get(i).get(0)%></td>
<td><%= dataMaster.get(i).get(4)%></td>
<td><%= dataMaster.get(i).get(5)%></td>
<td><%= dataMaster.get(i).get(6)%></td>
<td><img src="<%= dataMaster.get(i).get(8)%>" style="width: 70px;height: 70px"></td>
<td><%= dataMaster.get(i).get(7)%></td>
<td style="width: 5% ">
    <a id="MLT_btnUpdate" data-toggle="modal" data-target="#detail2_" style="cursor: pointer"><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
    &nbsp;&nbsp;&nbsp;
    <a id="deleteButton_" class="testing" style="cursor: pointer"><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;" ></i></a>
</td>
</tr>
<%
    }
%>
</tbody>
</table>    

<!-- Modal Update -->
<script>
    $(function () {
        $('[data-toggle="tooltip"]').tooltip();
      }); 
</script>

<script type="text/javascript" charset="utf-8">

    $('#masterTable').off('click', '#THE_masterTable #MLT_btnUpdate').on('click', '#THE_masterTable #MLT_btnUpdate', function (e) {
        e.preventDefault();

        //go to the top
//        $('html,body').animate({
//            scrollTop: $("#maintainFam").offset().top
//        }, 500);

        //get the row value
        var row = $(this).closest("tr");
        var rowData = row.find("#MLT_hidden").val();
        var arrayData = rowData.split("|");
        //assign into seprated val
        var masterCode = arrayData[0], masterDesc = arrayData[1], status = arrayData[2], masterSource = arrayData[3];
        //set value in input on the top
        $('#masterCode_').val(masterCode);
        $('#masterDesc_').val(masterDesc);
        $('#masterSource_').val(masterSource);

        if (status === '1')
            $('#status_').val(1);
        else
            $('#status_').val(0);



        console.log(arrayData);
    });

    $("#MLT_btn_update_").off('click').on('click', function (e) {

        e.preventDefault();
        //console.log("entering Update");
        var masterCode = $("#masterCode_").val();
        var masterDesc = $("#masterDesc_").val();
        var masterSource = $("#masterSource_").val();
        var status = $("#status_").val();

        if (masterCode === "" || masterCode === null) {
            bootbox.alert("Fill in the master code");
        } else if (masterDesc === "" || masterDesc === null) {
            bootbox.alert("Fill in the master name");
        } else if (status !== '1' && status !== '0') {
            bootbox.alert("Select the status");
        } else {
            
            masterDesc = masterDesc.replace(/'/g, "\\\'").replace(/"/g, "\\\"");
            masterSource = masterSource.replace(/'/g, "\\\'").replace(/"/g, "\\\"");
            var data = {
                masterCode: masterCode,
                masterDesc: masterDesc,
                masterSource: masterSource,
                status: status
            };

            //console.log("entering Ajax");
            $.ajax({
                url: "master_lookup_update.jsp",
                type: "post",
                data: data,
                timeout: 60000, // 60 seconds
                success: function (datas) {

                    if (datas.trim() === 'Success') {
                        $('#masterTable').load('master_lookup_table_1.jsp');
                        $(".modal-backdrop").hide();
                        bootbox.alert("Lookup master is updated");
                    } else if (datas.trim() === 'Failed') {
                        bootbox.alert("Update failed!");
                    }

                },
                error: function (err) {
                    bootbox.alert("Error! Deletion failed!!");
                }

            });
        }


    });


    $('#masterTable').off('click', '#THE_masterTable #deleteButton_').on('click', '#THE_masterTable #deleteButton_', function (e) {

        e.preventDefault();

        var row = $(this).closest("tr");
        var rowData = row.find("#MLT_hidden").val();
        var arrayData = rowData.split("|");
        //assign into seprated val
        var masterCode = arrayData[0];
        console.log(arrayData);

        bootbox.confirm('Are you sure want to delete? ' + masterCode, function (conf) {

            if (conf) {

                var data = {
                    masterCode: masterCode
                };

                $.ajax({
                    url: "master_lookup_delete.jsp",
                    type: "post",
                    data: data,
                    timeout: 60000, // 10 seconds
                    success: function (datas) {

                        if (datas.trim() === 'Success') {
                            $('#masterTable').load('master_lookup_table_1.jsp');
                            bootbox.alert("A master lookup code is deleted");

                        } else if (datas.trim() === 'Failed') {
                            bootbox.alert("Delete failed");

                        } else {
                            bootbox.alert(datas.trim());
                        }

                    },
                    error: function (err) {
                        alert("Error, Deletion failed");
                    }

                });

            }

        });


    });


    $('#masterTable').off('click', '#THE_masterTable #MLT_btnViewDetail').on('click', '#THE_masterTable #MLT_btnViewDetail', function (e) {
        e.preventDefault();


        var row = $(this).closest("tr");
        var rowData = row.find("#MLT_hidden").val();
        var arrayData = rowData.split("|");
        //assign into seprated val
        var masterCode = arrayData[0];
        var masterName = arrayData[1];

        var data = {masterCode: masterCode};
        $('#THE_detailTable').DataTable().destroy();
        
        $('#DLT_detailOf').text("Details of "+masterName);
        $('#DLT_hidden_id_name').val(masterCode +" | "+masterName);
        $('.nav-tabs a[href="#tab_default_2"]').tab('show');
        $('#detailTable_body').html('<div class="loader"></div>');

        $.ajax({
            type: 'POST',
            url: "detail_lookup_table_loader.jsp",
            timeout: 60000,
            data: data,
            success: function (data) {
                $('#detailTable_body').html(data);
               
                
            }
        });

    });


</script>  





<script type="text/javascript" charset="utf-8">
    $(document).ready(function () {
        $('#THE_masterTable').DataTable();
    });
</script>
