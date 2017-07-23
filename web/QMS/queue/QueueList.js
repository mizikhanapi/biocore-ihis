/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



$(document).ready(function () {

    $('#listQueue').load('queue/QueueListController.jsp');


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

    $('#listQueue').on('click', '#btnQMS_ATQ_Assign', function (e) {
        e.preventDefault();
        $("#AssignToQueueModal").modal('show');
         var rowQueue = $(this).closest("tr");
         var PMI_NO = rowQueue.find("#tdQMS_ATQ_PMI_NO").html();
         var EPISODE_DATE = rowQueue.find("#tdQMS_ATQ_EPISODE_DATE").html();
         var PATIENT_NAME = rowQueue.find("#tdQMS_ATQ_PATIENT_NAME").html();
         var QUEUE_NAME = rowQueue.find("#tdQMS_ATQ_QUEUE_NAME").html();
         var QUEUE_NO = rowQueue.find("#tdQMS_ATQ_QUEUE_NO").html();
         var STATUS = rowQueue.find("#tdQMS_ATQ_STATUS").html();
         var PATIENT_CATEGORY = rowQueue.find("#tdQMS_ATQ_PATIENT_CATEGORY").html();
         
         var data = {
             pmiNo:PMI_NO,
             episodeDate:EPISODE_DATE
         }
         
         $("#tQMS_ATQ_Episode_Date").val(data.episodeDate);
         $("#tQMS_ATQ_PMI_NO").val(data.pmiNo);
         
         $("#textQMS_ATQ_PMI_NO").text(PMI_NO);
         $("#textQMS_ATQ_PATIENT_NAME").text(PATIENT_NAME);
         $("#textQMS_ATQ_CATEGORY").text(PATIENT_CATEGORY);
         $("#textQMS_ATQ_QUEUE_NO").text(QUEUE_NO);
         $("#textQMS_ATQ_QUEUE_NAME").text(QUEUE_NAME);
         $("#textQMS_ATQ_STATUS").text(STATUS);
         
         $.ajax({
             timeout:3000,
             url:"queue/GetQueueDetail.jsp",
             type:"POST",
             data:data,
             success:function(e){
                 console.log(e);
                 var detail = e.split("|");
                 $("#textQMS_ATQ_HFC_BEFORE").text(detail[0]);
                 $("#textQMS_ATQ_DISCIPLINE_BEFORE").text(detail[1]);
                 $("#textQMS_ATQ_SUBDISCIPLINE_BEFORE").text(detail[2]);
             }
         })
         
    });

});