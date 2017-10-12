<%-- 
    Document   : register
    Created on : Mar 18, 2016, 2:46:31 PM
    Author     : asyraf
--%>

<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn Conn = new Conn();
    String ic = (String) session.getAttribute("ic");
    String val1 = (String) session.getAttribute("val1");
    String val2 = (String) session.getAttribute("val2");
    String val3 = (String) session.getAttribute("val3");
    String val4 = (String) session.getAttribute("val4");
    String username = (String) session.getAttribute("username");
    String name = (String) session.getAttribute("USER_NAME");

%>
<!DOCTYPE html>
<html>
    <title>Patient Page</title>
    <%@include file="header.jsp"%>
    <%@include file="assets/header.html"%>
    <link href="assets/css/login.css" rel="stylesheet">
    <body>

        <div class="container m-scene">
            <div class="card card-container" style="max-width: 365px; max-height: 400px;" >
                <!--                 <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
                <div class="profile-img-card">
                    <img src="assets/i-his.logo.svg" class="logo-login">
                </div>
                <div class="logo" style="font-size: 32px;">
                    Choose your HFC
                </div>
                <p id="profile-name" class="profile-name-card" style="font-weight: 400;">Please choose the hospital/clinic you are prefer</p>
                <form class="form-signin" role="form" method="post" >
                    <div class="form-group"> 
                        <select class="form-control" id="hfc_code1" name="hfc_name" placeholder="Select Hospital/Clinic" required>
                            <option disabled selected>Select Hospital/Clinic</option>
                            <%  
                                String sqlHFCCode = "select hfc_name,hfc_cd from adm_health_facility";
                                ArrayList<ArrayList<String>> dataHFCCode = Conn.getData(sqlHFCCode);

                                if (dataHFCCode.size() > 0) {
                                    for (int i = 0; i < dataHFCCode.size(); i++) {%>
                            <option value="<%=dataHFCCode.get(i).get(1)%>"><%=dataHFCCode.get(i).get(0)%></option>
                            <% }
                                }

                            %>
                        </select>
                    </div>
                        <div id="divDiscipline1">
                        </div>
                        <div id="subDiscipline1">
                        </div>
                        <button class="btn btn-lg btn-primary btn-block btn-signin" id="btnSelectHFC">Go to website</button>
                </form>
                        <a onclick="window.location.href = 'destroySession.jsp'" class="forgot-password" style="cursor: pointer; float: right;"><i class="fa fa-power-off"></i>&nbsp;&nbsp;&nbsp;Log Out</a>
            </div> <!--/card-container -->
        </div> <!--/container -->

        <script>
            $(function () {
                $('a[data-toggle="tab"]').on('shown.bs.tab', function () {
                    //save the latest tab; use cookies if you like 'em better:
                    localStorage.setItem('lastTab', $(this).attr('href'));
                });
                //go to the latest tab, if it exists:
                var lastTab = localStorage.getItem('lastTab');
                if (lastTab) {
                    $('a[href=' + lastTab + ']').tab('show');
                } else
                {
                    // Set the first tab if cookie do not exist
                    $('a[data-toggle="tab"]:first').tab('show');
                }
            });
            
            $(document).ready(function(){
                
                $("#hfc_code1").on('change',function(){
                    
                    $.ajax({
                      url:"search/getSelectDiscipline.jsp",
                      data:{
                          hfc_cd : $("#hfc_code1").val()
                      },
                      timeout:3000,
                      success:function(r){
                          console.log(r);
                          $("#divDiscipline1").html(r.trim());
                      }
                    })
                });
                
                $("#btnSelectHFC").click( function(e){
                    e.preventDefault();
                    var hfc_cd = $("#hfc_code1").val();
                    var hfc_name = $("#hfc_code1 option:selected").text();
                    var dis_cd = $("#dis_code").val();
                    var dis_name = $("#dis_code option:selected").text();
                    var subdis_cd = $("#subdis_code").val();
                    var subdis_name = $("#subdis_code option:selected").text();
                    
                    var data = {
                        hfc_cd:hfc_cd,
                        hfc_name:hfc_name,
                        dis_cd:dis_cd,
                        dis_name:dis_name,
                        subdis_cd:subdis_cd,
                        subdis_name:subdis_name
                    }
                    $.ajax({
                        url:"setSessionPatient.jsp",
                        timeout:3000,
                        data:data,
                        success:function(r){
                            if(r.trim() === "|SUCCESS|"){
                                location.href = "index.jsp"
                            }else{
                                alert("Choose the correct Health Facility");
                            }
                        }
                    })
                    console.log(data);
                });
                

                
            });
             $(document).on('change','#dis_code',function(){
                    $.ajax({
                        url:"search/getSelectSubdiscipline.jsp",
                        data:{
                             hfc_cd : $("#hfc_code1").val(),
                             dis_cd: $("#dis_code").val()
                        },
                        timeout:3000,
                        success:function(r){
                            console.log(r.trim())
                            $("#subDiscipline1").html(r.trim());
                        }
                    })
                });
                
               
            

        </script>

    </body>
</html>
