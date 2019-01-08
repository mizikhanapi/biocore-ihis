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
        //                     0     1              2               3            4           5        6                                  7            8
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
    <a id="MLT_btnUpdate" data-toggle="modal" data-target="#detail" style="cursor: pointer"><i data-toggle="tooltip" data-placement="left" title="Update Content" class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
    &nbsp;&nbsp;&nbsp;
    <a id="deleteButton_" class="testing" style="cursor: pointer"><i data-toggle="tooltip" data-placement="right" title="Delete Content" class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;" ></i></a>
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
        $('#btnUpdate').show();
        $('#btnAdd').hide();

        //get the row value
        var row = $(this).closest("tr");
        var rowData = row.find("#MLT_hidden").val();
        var arrayData = rowData.split("|");
        
        //assign into seprated val
        var contentId = arrayData[0];
        var tajuk = arrayData[4];
        var isi = arrayData[5];
        var tarikh = arrayData[6];
        var gambo = arrayData[8];
        gambarURI2 = gambo;
        
        //set value in input on the top
        
        $('#tajuk').val(tajuk);
        $('#contentId').val(contentId);
        $('#isi').val(isi);
        $('#tarikh').val(tarikh);
        $('#dym2').html('<img id="myImage2" class="img-responsive" width="300" height="300" src="'+gambo+'" />');

    });

    $("#btnUpdate").off('click').on('click', function (e) {

        e.preventDefault();
                var idContent = $('#contentId').val();
                var img = gambarURI2;
                var title = $('#tajuk').val();
                var content =$('#isi').val();
                var date = $('#tarikh').val();

                if(title===""){
                    bootbox.alert({title:"information",
                    message:"Please ensure title is not empty"});
                }else if(content===""){
                    bootbox.alert({title:"information",
                    message:"Please ensure content is not empty"});
                }else if(date===""){
                    bootbox.alert({title:"information",
                    message:"Please ensure date is not empty"});
                }else{
                    var datas = {
                      title : title,
                      content : content,
                      date : date,
                      img : img,
                      contentId : idContent
                    };
                    $('.modal-body #lllloading').html("<div class='loading'></div>");
                    $.ajax({
                       type:"post",
                       data:datas,
                       url:"controller/addContent.jsp",
                       success:function(databack){
                           console.log(databack);
                           $('.modal-body #lllloading').html("");
                           if(databack.trim()==="success"){
                               bootbox.alert({
                                  title:"Information",
                                  message:"Content successfully updated"
                               });
                               $("#masterTable").load("QCS_table.jsp");
                           }else{
                               bootbox.alert({
                                  title:"Information",
                                  message:"Content Failed to update"
                               });
                           }
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
        var idContent = arrayData[0];
        console.log(arrayData);

        bootbox.confirm('Are you sure want to delete?', function (conf) {

            if (conf) {

                var data = {
                    idContent : idContent
                };

                $.ajax({
                    url: "controller/contentDelete.jsp",
                    type: "post",
                    data: data,
                    timeout: 60000, // 10 seconds
                    success: function (datas) {

                        if (datas.trim() === 'success') {
                             $("#masterTable").load("QCS_table.jsp");
                            bootbox.alert({
                                title: "Information",
                                message: "Deleting Content Success"
                            });

                        } else if (datas.trim() === 'fail') {
                            bootbox.alert({
                                title: "Information",
                                message: "Deleting Content Failed"
                            });

                        } else {
                            bootbox.alert(datas.trim());
                        }

                    },
                    error: function (err) {
                        bootbox.alert("Error, Deletion failed");
                    }

                });

            }

        });


    });
</script>  





<script type="text/javascript" charset="utf-8">
    $(document).ready(function () {
        $('#THE_masterTable').DataTable();
    });
</script>
<script>
    $(function () {
        $('[data-toggle="tooltip"]').tooltip();
      }); 
</script>