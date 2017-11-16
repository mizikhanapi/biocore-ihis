<%-- 
    Document   : listEmp
    Created on : Jan 20, 2017, 4:54:38 PM
    Author     : shay
--%>

<%@page import="ADM_helper.LookupHelper"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Conn conn = new Conn();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String now = sdf.format(new Date());
     
    //amik kt session
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String order = "T12111";
    LookupHelper lh = new LookupHelper(hfc);

    //                      0       1                  2            3          4        5           6               7           8           9           10          
    String q = "select m.pmi_no,p.PATIENT_NAME,d.episode_date,d.ward_id,m.order_no,u.USER_NAME,m.order_status, d.order_no, m.order_by ,u.USER_ID, p.OLD_IC_NO, "
            //      11          12          13      14              15                  16          17      18              19                       20
            + "p.NEW_IC_NO, p.ID_TYPE, p.ID_NO, d.admission_reason,d.ward_class_code,d.ward_id, d.bed_id, d.order_status, m.ordering_hfc_cd " //ordering hfc_name
            + "from wis_order_master m "
            + "left join wis_order_detail d on d.order_no = m.order_no AND d.order_status=m.order_status "
            + "left join  adm_users u on  u.`USER_ID`= m.order_by "
            + "left join pms_patient_biodata p on m.pmi_no = p.`PMI_NO` "
            + "where m.txn_type = '" + order + "'  AND m.order_status ='0' and m.hfc_cd = '" + hfc + "'; ";

    ArrayList<ArrayList<String>> dataQueue, dataQ;
    //dataQueue = conn.getData(sql2);
    dataQ = conn.getData(q);

    //out.print(dataQueue);
%>
<div id="QueueTable">
    <table class="table table-filter table-striped" style="background: #fff; border: 1px solid #ccc; " id="ADTQueue">
        <thead>
        <th>PMI no. </th>
        <th>Name </th>
        <th>Episode Date/Time </th>

        <th>Order no.</th>

        <th>Doctor </th>

        <th>Action </th>

        </thead>
        <tbody>
            <%
                for (int i = 0; i < dataQ.size(); i++) {
                    String leHfc_name = lh.getHFCName(dataQ.get(i).get(19));
                    dataQ.get(i).add(leHfc_name);
            %>


            <tr id="moveToInpatientRegistration" style="text-align: left;">

        <input id="dataQueuehidden" type="hidden" value="<%=String.join("|", dataQ.get(i))%>">


        <input type="hidden" value="<%=hfc%>" id="Rhfc">


        <td id="pmiNumber"><%=dataQ.get(i).get(0)%></td>
        <td><%=dataQ.get(i).get(1)%></td>
        <td id="epiDate"><%=dataQ.get(i).get(2)%></td>

        <td><%=dataQ.get(i).get(4)%></td>

        <td><%=dataQ.get(i).get(5)%></td>

        <td data-dismiss="modal">
            <!-- Update Part Start -->
            <a id="addQueue" class="btn btn-success">Add</a>
            <!-- Update Part End -->
            <button class="btn btn-danger" id="delQueue" role="button">Delete</button></td>
        </tr>    
        <%    }
        %>

        </tbody>
    </table>
</div>
<script>
    $("#QueueTable").off('click', "#ADTQueue #moveToInpatientRegistration").on('click', "#ADTQueue #moveToInpatientRegistration", function (e) {
        // $('#patientOrderListContent').off('click', '#patientOrderListTable #moveToOrderDetailsTButton').on('click', '#patientOrderListTable #moveToOrderDetailsTButton', function (e) {
        e.preventDefault();

        //get the row value
        var row = $(this).closest("tr");
        var rowData = row.find("#dataQueuehidden").val();
        var arrayData = rowData.split("|");
        //console.log("hai");
        // $('.nav-tabs a[href="#tab_default_2"]').tab('show');

        var pmino = arrayData[0];
        var poic = arrayData[10];
        var pit = arrayData[12];
        var pname = arrayData[1];
        var pnic = arrayData[11];
        var pino = arrayData[13];
        var AdmissionReason = arrayData[14];
        var WardType = arrayData[15];
        var wname = arrayData[16];
        var BedIDReg = arrayData[17];
        var orderNo = arrayData[4];
        var hfc_name = arrayData[20];
        var hfc_cd = arrayData[19];
        var dr_id = arrayData[8];
        var dr_name = arrayData[5];

        var orderS = "YesOrder";


        $("#OrderStatus").val(orderS);



        $("#orderNo").val(orderNo);

        $("#pmino").val(pmino);
        $("#poic").val(poic);
        $("#pit").val(pit);
        $("#pname").val(pname);
        $("#pnic").val(pnic);
        $("#pino").val(pino);
        $("#AdmissionReason").val(AdmissionReason);
        $("#WardType").val(WardType);
        $("#wname").val(wname);
        $("#BedIDReg").val(BedIDReg);
        $("#HFCFROM").val(hfc_cd+" | "+hfc_name);
        $("#HF_cd").val(hfc_cd);
        $("#HFCBY").val(dr_id+" | "+dr_name);
        $("#HB_cd").val(dr_id);

        var arrayData = $('#DisWard').val().split("|");
        var discode = arrayData[0];
        $('#dis_cd').val(discode);

//        var Dis = $('#Dis').val();
//        var array_dis = Dis.split("|");
//        var Dis = array_dis[0];




        $('#QueueTable').modal('hide');
        $(".modal-backdrop").hide();

    });
    $('#QueueTable').on('click', '#ADTQueue #delQueue', function (e) {

        e.preventDefault();
        var row = $(this).closest("tr");
        var rowData = row.find("#dataQueuehidden").val();
        var arrayData = rowData.split("|");
        console.log(arrayData);
        //assign into seprated val
        var order = arrayData[4];

        bootbox.confirm({
            message: "Are you sure want to delete the patient from the queue?",
            title: "Delete Item?",
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

                if (result === true) {

                    var data = {
                        order: order
                    };
                    $.ajax({
                        type: "post",
                        url: "deleteADTQueue.jsp",
                        data: data,
                        timeout: 10000,
                        success: function (datas) {
                            console.log(datas);
                            if ($.trim(datas) === "success") {
                                bootbox.alert("Succeed deleting patient in queue.");
                            } else if ($.trim(datas) === "fail") {
                                bootbox.alert("Failed deleting patient in queue.");
                            }
                            else{
                                bootbox.alert(datas);
                            }

                        }, error: function (err) {
                            alert("Error! Deletion Ajax failed!!");
                        }

                    });
                } else {
                    console.log("Process Is Canceled");
                }
            }
        });
    });
</script>