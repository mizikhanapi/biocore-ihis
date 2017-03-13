<%@page import="dBConn.Conn"%>
<%@page import="Config.Config"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
    
   if ((session.getAttribute("Admin_IC") == null || session.getAttribute("Admin_IC").equals("")))
        {
            response.sendRedirect("../Adminlogin.jsp");
            
        }else {
            out.print(session.getAttribute("HFC").toString());
        }
    
        
     
    
    Conn conn = new Conn();
    
    //String Commonqueue = "select * from pms_queue_name where queue_type='CM' and hfc_cd='"+hfc+"'";
    //String Consultationqueue = "select * from pms_queue_name where queue_type='FY' and hfc_cd='"+hfc+"'";
    
    
    String Commonqueue = "select * from pms_queue_name where queue_type='CM' ";
    String Consultationqueue = "select * from pms_queue_name where queue_type='FY' ";
        
    
     ArrayList<ArrayList<String>> dataQueue2, dataQueue;
     
        dataQueue2 = conn.getData(Consultationqueue);
    
     
//    if (session.getAttribute("USER_IC") == null || session.getAttribute("USER_IC").equals(""))
//        {
//            response.sendRedirect("../login.jsp");
//            out.print(session.getAttribute("USER_IC"));
//            
//        }
//        else
//        {
//            String userIC = session.getAttribute("USER_IC").toString();
//            out.print(userIC);
//        }
         
    

        
//     String nationality = "SELECT * FROM adm_lookup_detail where master_reference_code = '0011'";
//     String gender = "SELECT * FROM adm_lookup_detail where master_reference_code = '0041'";
//     
//     
//     ArrayList<ArrayList<String>> dataNationality,dataGender;
//     
//     
//     dataNationality = conn.getData(nationality);
//     dataGender = conn.getData(gender);
     
//     if(dataGender.size() > 0)
//     {
//        out.print(dataGender.get(0).get(1) +"<br>");
//        out.print(dataGender.get(0).get(2));
//     }
//     else
//    {
//        out.print("Select NUll");
//    }
%>


<!DOCTYPE html>
<html>
<head>
  <title>Kiosk | Registration Page</title>

  
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    <script src="../Dashboard_files/jquery.min.js.download"></script>
        
    <div w3-include-html="../libraries/header.html"></div>
        <%@include file="../Header.jsp"%>
        
  
    <link href="../assets/css/login.css" rel="stylesheet">
     <link  rel="stylesheet" href="../css/style.css">
     
  
  
</head>

<body>
  
    
    <div class="container">
     <div class="" >
         <div class="card card-container" >
             <!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
             <div class="profile-img-card">
                 <i class="fa fa-user-md" aria-hidden="true" style="color: #666; font-size: 100px;"></i>
             </div>
             <h2 style="text-align: center;">iHIS</h2>
             <p id="profile-name" class="profile-name-card">Please Enter your Information To Sign Up</p>
             <form class="form-signin" action="dashboard.jsp">
                 <span id="reauth-email" class="reauth-email"></span>
                 
                 <input type="text" id="inputUserIC" class="form-control" placeholder="User IC" name="useric">
                 <input type="text" id="inputUserName" class="form-control" placeholder="User Name" name="username" >
                 
                
                 <div class="form-group">
                    <label class="control-label" for="selectbasic">Please Select Queue</label>
                    <!--<div class="col-md-8">-->
                          <br>      
                    <div class="btn-group" data-toggle="buttons">
                        <label class="btn active marglft" for="commonQueue">
                            <input type="radio" id ="commonQueue" name='queuetype' value="CM"><i class="fa fa-circle-o fa-2x"></i><i class="fa fa-dot-circle-o fa-2x "></i> <span>Consultation</span>
                        </label>
                        <label class="btn marglft" for="consultantQueue">
                            <input type="radio" id ="consultantQueue" name='queuetype' value="FY"><i class="fa fa-circle-o fa-2x"></i><i class="fa fa-dot-circle-o fa-2x "></i><span>Services</span>
                        </label>
                    </div>
                    <!--</div>-->

                </div>
                 <select  id="selectedQueue"  class="form-control select-full" >
                     <option value="null" selected="" disabled="">Please Select Queue</option>
                     
                        <%
                            String add = null, text=null;
                            for (int i = 0; i < dataQueue2.size(); i++) {
                                    if (dataQueue2.get(i).get(1) != ""|| dataQueue2.get(i).get(1) != null)
                                        {
                                            text = dataQueue2.get(i).get(1).substring(0, 4);
//                                            add = add + "-"+text;
//                                            out.print(add);
                                            if (!text.equalsIgnoreCase("Room"))
                                            {
                                                
                        %>
                            
                        <option value="<%=dataQueue2.get(i).get(1)%>"><%="(" + dataQueue2.get(i).get(0) + ") " + dataQueue2.get(i).get(1)%></option>
                        <%                  }
                                        } 
                            }
                        %>
                       
                 </select>
                        
             </form><!-- /form -->
    
             <div class="form-signin tac">
                    <div class="tac margin1 centerBtnDisplay">
                        <button id="registerSignup" class="btn btn-lg bttn btn_block">Register</button>
                    </div>
                    <div class="tac margin1 centerBtnDisplay">
                        <button id="cancelSignup" class="btn btn-lg bttn btn_block ">Cancel</button>
                    </div>
                </div>
             
             <a href="../destroySession.jsp" class="pull-right" style ="font-size:14px" type="submit">Log Out</a>
         </div>

        </div><!-- /card-container -->
    </div><!-- /container -->
	
       <div w3-include-html="../libraries/script.html"></div>

    <script src="http://www.w3schools.com/lib/w3data.js"></script>
 
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<!--Latest compiled JavaScript--> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="../assets/jquery.PrintArea.js"></script>

    <script src="../assets/js/bootbox.min.js"></script> 
    
      <script>
        w3IncludeHTML();
        
//        $(document).ready( function () {
//              $('#select-0').hide();
//              $('#select-1').hide();
//            
            //event when radio button is change
//            $('input:radio[name="radios"]').change(
//            function () {
//                if ($('#radios-0').is(':checked')) {
//                    $('#select-0').show();
//                    $('#select-1').hide();
//                } else if ($('#radios-1').is(':checked')) {
//                    $('#select-1').show();
//                    $('#select-0').hide();;
//                }
//            });

            $('#selectedQueue').hide();
            
            var $body = $('body');
            var yyyyMMddHHmmss;
            var HHmmss;
            var yyyyMMdd;
            var ddMMyyyy;
            var timeStamp;
            var pmi_no;
            var user_id;
            var user_name;
            
            //function to get date 
    function getDateNow() {
        //yyyy-MM-dd HH:mm:ss
        var nowDate = new Date();
        timeStamp = nowDate;
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
        yyyyMMddHHmmss = year + "-" + ZeroMonth + "-" + ZeroDay + " " + hours + ":" + ZeroMinutes + ":" + ZeroSeconds;
        HHmmss = hours + ":" + ZeroMinutes + ":" + ZeroSeconds;
        yyyyMMdd = year + "-" + ZeroMonth + "-" + ZeroDay;
        ddMMyyyy = ZeroDay + "-" + ZeroMonth + "-" + year;
    }
            
            
        
//        //event when radio button is change
//    $('input:radio[name="queuetype"]').on("change",
//            function () {
//                console.log("click");
//                if ($('#commonQueue').is(':checked')) {
//                    $('#selectedQueue').hide();
//                } else if ($('#consultantQueue').is(':checked')) {
//                    $('#selectedQueue').show();
//                } 
//            });
          
//            
//             //event when radio button is change
//        $('#commonQueue').on("click",
//            function () {
//                console.log("click 1");
//                    $('#selectedQueue').hide();
//                
//            });
//            
        //event when radio button1 is change
        document.getElementById("commonQueue").onchange = function() {changes();};
       
            function changes() {
                console.log("click 2");
                    $('#selectedQueue').hide();
                $("#selectedQueue").val("null");
            };
            
             //event when radio button2 is change
        document.getElementById("consultantQueue").onchange = function() {changes1();};
       
            function changes1() {
                console.log("click 1");
                    $('#selectedQueue').show();
                
            };
            
            //event when radio button1 is change
        document.getElementById("inputUserIC").onchange = function() {TextFiledchanges();};
            
            function TextFiledchanges() {
                getDateNow();
                bootbox.alert(yyyyMMddHHmmss +" "+HHmmss+" "+yyyyMMdd+" "+ddMMyyyy);
                console.log("Changed");
                   
                   var userIC;
                   userIC = $("#inputUserIC").val();
                   
                   var data = {
                       userIC:userIC
                   };
                   if(userIC === "")
                   {
                       bootbox.alert("please Fill in the user IC");
                   }
                   else
                   {
                       console.log("before ajax");
                       $.ajax({
                           type:"POST",
                           url: "../Controller/searchUser.jsp",
                           data: data,
                           timeout: 10000,
                           success: function (data){
                               console.log("in sucess");
                               if(data.trim() === "NOT FOUND")
                               {
                                   bootbox.alert("NOT FOUND");
                               }
                               else
                               {
                                   console.log(data.trim());
                                   var splitData = String(data.trim()).split("|");
                                    console.log(splitData);
                                    
                                    pmi_no = splitData[0];
                                    user_name = splitData[2];
                                    user_id = splitData[7];
                                   $("#inputUserName").val(user_name);
                                   console.log(pmi_no +" " +user_name+" "+user_id);
                               }
                           },
                           error: function (err){
                               console.log(err);
                           }
                       });
                   }
            };
            
            
//            
//            
//            
//            
//             //event when radio button is change
//        $('input:radio[name="queuetype"]').on("change",
//            function () {
//                if ($('#commonQueue').is(':checked')) {
//                    $('#selectedQueue').hide();
//                }else if ($('#consultantQueue').is(':checked')) {
//                    $('#selectedQueue').show();
//                } 
//            });
//               
            
            
           $("#cancelSignup").on("click", function(){
               
               window.location = "../mainMenu.jsp";
                              
           });//on clcik submitSignup
           
           $("#registerSignup").click(function(){
               getDateNow();
                var useric, username, queuetype, selectedqueue;
                
                useric= $("#inputUserIC").val();
                username= $("#inputUserName").val();
        	queuetype = $("input[name='queuetype']:checked").val();
                selectedqueue= $("#selectedQueue").val();
                
                console.log(useric+" "+username+" "+queuetype+" "+selectedqueue);
                
                if(useric === "")
                {
                    bootbox.alert("Fill in the user IC");
                    $("#inputUserIC").focus();
                } else if (username === "") {
                    bootbox.alert("Fill in the user Name");
                    $("#inputUserName").focus();
                }else if (containsNumber(username)) {
                    bootbox.alert("UnValic Name, Contain Numbers");
                     $("#inputUserName").focus();
                } else {
                    
                    if(queuetype === "CM")
                    {
                        selectedqueue ="Normal Queue";
                    };
                    
                    var data = {
                        'userIC': useric,
                        'userName': username,
                        'queueType': queuetype,
                        'selectedQueue': selectedqueue,
                        'today': yyyyMMdd,
                        'now' : HHmmss,
                        'pmiNo': pmi_no,
                        'userID':user_id
                    };
                    
                    
                console.log(data);
                
                $.ajax({
                            type: "POST",
                            url: "../Controller/insertNewQueue.jsp",
                            data: data,
                            timeout: 10000,
                            success: function (data){
                                console.log(data.trim());
                                $("#inputUserIC").val("");
                                $("#inputUserName").val("");
                                $("#selectedQueue").val("null");
                            },
                            error: function (err) {
                                    console.log(err);
                            }
                        });
            
                    
                }
                
//                var mode = 'iframe'; //popup
//                var close = mode == "popup";
//                var options = { mode : mode, popClose : close};
//                $("div.printableArea").printArea( options );
               
//                var prtContent = document.getElementById("printableArea");
//                var WinPrint = window.open('', 'Queue', 'left=0,top=0,width=4.8cm,height=4.8cm,toolbar=0,scrollbars=0,status=0');
//                WinPrint.document.write(prtContent.innerHTML);
//                WinPrint.document.close();
//                WinPrint.focus();
//                WinPrint.print();
                //WinPrint.close();
//                
                
//            var printContents = document.getElementById(divName).innerHTML;
//            var originalContents = document.body.innerHTML;
//
//            document.body.innerHTML = printContents;
//
//            window.print(); 
//
//            document.body.innerHTML = originalContents;
        });
          
                 function containsNumber(any){    
                    var alpha = /^[a-zA-Z-,]+(\s{0,1}[a-zA-Z-, ])*$/; //for sentence allow space
                    //var re = /^[A-Za-z]+$/; for one word only don't allow space
                    if(alpha.test(any))//contain no number
                       return false;
                    else               //comtain number
                      return true;      
                 };
                
               
         
    
//    });
      </script>
   
    
    
</div>
</body>

</html>
