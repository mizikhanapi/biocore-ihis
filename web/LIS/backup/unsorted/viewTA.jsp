<%@page import="dBConn.Conn"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Config.connect"%>
<%@page import="java.util.ArrayList"%>
    <table id="MTC"  class="table table-striped table-bordered" cellspacing="0" width="100%">
        <%
            String item_cd = (String) session.getAttribute("item_cd");
            String item_name = (String) session.getAttribute("item_name");
            String pmi1 = (String) session.getAttribute("pmi1");
            String order_no = (String) session.getAttribute("order_no");
            
            //out.println(pmi1);
            Conn conn = new Conn();

            String query4 = "SELECT id_result,result,remark,test_date,test_time,Verification,performBy,picture FROM lis_result WHERE item_cd='" + item_cd + "' AND pmi_no = '"+pmi1+"' AND order_no = '"+order_no+"'";
            ArrayList<ArrayList<String>> q4 = conn.getData(query4);
        %>
        <thead>
            <tr>

                <th class="col-sm-1">Result</th>
                <th class="col-sm-1">Remark</th>
                <th class="col-sm-1">Test Date</th>
                <th class="col-sm-1">Test Time</th>
                <th class="col-sm-1">Verification</th>
                <th class="col-sm-1">Test Performed By</th>
                <th class="col-sm-1">Edit</th>
                <th class="col-sm-1">Delete</th>

            </tr>
        </thead>
        <tbody>
            <%if (q4.size() > 0) {
                    for (int i = 0; i < q4.size(); i++) {%> 
            <tr>    
                <td><%=q4.get(i).get(1)%></td>
                <td><%=q4.get(i).get(2)%></td>
                <td><%=q4.get(i).get(3)%></td>
                <td><%=q4.get(i).get(4)%></td>
                <td><%=q4.get(i).get(5)%></td>
                <td><%=q4.get(i).get(6)%></td>
                <td>
                    <a data-toggle="modal" data-target="#TestCategory<%=i%>"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>

                    <div class="modal fade" id="TestCategory<%=i%>" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
                        <div class="modal-dialog" style="width: 950px !important; ">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                                    <h3 class="modal-title" id="lineModalLabel">Edit  Test Result</h3>

                                </div>
                                <div class="modal-body">

                                    <!-- content goes here -->

                                    <div class="row">
                                        <div class="col-md-6">
                                            <!-- Text input-->
                                            <div class="form-group">
                                                <label class="col-md-4 control-label" for="textinput">Test Name</label>
                                                <div class="col-md-8">
                                                    <input type="text" name="testCat" id="testName<%=i%>" class="form-control" value="<%=item_name%>" disabled="disabled"/>
                                                </div>
                                            </div>

                                            <!-- Text input-->
                                            <div class="form-group">
                                                <label class="col-md-4 control-label" for="textinput">Result</label>
                                                <div class="col-md-8">
                                                    <input type="text" name="testCatName" id="testCatName" class="form-control" style="display: none;"/>
                                                    <textarea name="career[message]" class="form-control" id="Result<%=i%>" placeholder="Write your result" required="required" ><%=q4.get(i).get(1)%></textarea>
                                                </div>
                                            </div>

                                            <!-- Text input-->
                                            <div class="form-group">
                                                <label class="col-md-4 control-label" for="textinput">Remark</label>
                                                <div class="col-md-8">
                                                    <input type="text" name="testCatName" id="testCatName" class="form-control" style="display: none;"/>
                                                    <textarea name="career[message]" class="form-control" id="Remark<%=i%>" placeholder="Write your Remark" required="required" ><%=q4.get(i).get(2)%></textarea>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="col-md-4 control-label" for="textinput">Test Date</label>
                                                <div class="col-md-8">
                                                    <input id="testDate<%=i%>" name="textinput" type="text" class="form-control input-md" required="required" value="<%=q4.get(i).get(3)%>">
                                                    <script>

                                                        $(function () {
                                                            $("#testDate<%=i%>").datepicker({
                                                                yearRange: '1999:c+1',
                                                                changeMonth: true,
                                                                changeYear: true,
                                                                minDate: new Date(1999, 10 - 1, 25),
                                                                maxDate: '+30Y',
                                                            });
                                                        });
                                                    </script>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="col-md-4 control-label" for="textinput">Test Time</label>
                                                <div class="col-md-8">
                                                    <input id="testTime<%=i%>" name="textinput" type="time" class="form-control input-md" required="required" value="<%=q4.get(i).get(4)%>">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="col-md-4 control-label" for="textinput">Test Perform By</label>
                                                <div class="col-md-8">
                                                    <input type="text" name="performBy" id="performBy<%=i%>" class="form-control" value="<%=q4.get(i).get(6)%>"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <label class="col-md-4 control-label" for="textinput">Upload Result</label>
                                            <div class="col-md-8">
                                                <input class="form-control" id="inputFileToLoad<%=i%>" type="file" accept=".jpg, .png, .gif" value="">
                                            </div>

                                        </div>
                                        <hr/>
                                        <div class="row">
                                            <div class="col-md-12" style="width: 100%; margin: 0 auto">
                                                <div id="dym<%=i%>" style="text-align: center;">
                                                    <img src="<%=q4.get(i).get(7)%>" >
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- content goes here -->
                                </div>
                                <input type="text" name="idresult<%=i%>" id="idresult<%=i%>" value="<%=q4.get(i).get(0)%>" style="display:none;"/>
                                <div class="modal-footer">
                                    <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                                        <div class="btn-group" role="group">
                                            <button type="button" class="btn btn-success btn-block btn-lg" role="button" id="btn_saveChange<%=i%>">Save Change</button>
                                           
                                        </div>
                                        <div class="btn-group" role="group">
                                            <button type="reset" id="btnReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button" >Cancel</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </td>
                <td>
                    <a id="btnDelete<%=i%>" class="testing"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;" ></i></a>
                    <script type="text/javascript" charset="utf-8">
                        $(document).ready(function () {
                            $("#btnDelete<%=i%>").click(function () {
                                
                                var idResult = $("#idresult<%=i%>").val();

                                var conf = confirm('Are you sure want to delete?');
                                if (conf) {
                                    $.ajax({
                                        url: "tAssignDelete.jsp",
                                        type: "post",
                                        data: {
                                            idResult: idResult
                                        },
                                        timeout: 10000, // 10 seconds
                                        success: function (data) {
                                            var d = data.split("|");
                                            if (d[1] == '1') {
                                                $("#viewTA").load("viewTA.jsp");
                                                alert("Result delete successfully");
                                            } else {
                                                alert("Delete failed!");
                                            }
                                        },
                                        error: function (err) {
                                            alert("Error! Deletion failed!!");
                                        }
                                    });
                                }
                            });

                            $('#inputFileToLoad<%=i%>').checkFileType({
                                allowedExtensions: ['jpg', 'jpeg', 'png', 'gif'],
                                success: function () {
                                    loadImageFileAsURL();
                                },
                                error: function () {
                                    bootbox.alert('Incompatible file type');
                                    $('#inputFileToLoad<%=i%>').val("");
                                    $('#dym<%=i%>').html("");
                                    newgambarURI = "";
                                }
                            });
                            
                            function loadImageFileAsURL()
                            {

                                var iSize = 0;

                                iSize = ($("#inputFileToLoad<%=i%>")[0].files[0].size / 1024);
                                
                                var sizeSmall = false;

                                if (iSize / 1024 > 1) {
                                    sizeSmall = false;

                                } else {

                                    iSize = (Math.round(iSize * 100) / 100);

                                    sizeSmall = iSize <= 20000;

                                }
                                if (sizeSmall) {
                                    document.getElementById("dym<%=i%>").innerHTML = '<div class="loader"></div>';
                                    var filesSelected = document.getElementById("inputFileToLoad<%=i%>").files;
                                    if (filesSelected.length > 0)
                                    {
                                        var fileToLoad = filesSelected[0];

                                        var fileReader = new FileReader();

                                        fileReader.onload = function (fileLoadedEvent)
                                        {

                                            newgambarURI = fileLoadedEvent.target.result;


                                            document.getElementById("dym<%=i%>").innerHTML = '<img id="myImage<%=i%>">';

                                            document.getElementById("myImage<%=i%>").src = newgambarURI;
                                        };

                                        fileReader.readAsDataURL(fileToLoad);
                                    }

                                } else {

                                    bootbox.alert("File size must not exceed 40kb");
                                    $('#inputFileToLoad<%=i%>').val("");
                                    newgambarURI = "";
                                    $('#dym<%=i%>').html("");
                                }


                            }
                            //                $('#btnChangePic').on('click', function () {
                            //
                            //                    if (gambarURI === "") {
                            //                        bootbox.alert("Choose a picture");
                            //                        return;
                            //                    }
                            //
                            //                    var data = {pic: gambarURI};
                            //
                            //                    $.ajax({
                            //                        type: 'POST',
                            //                        url: "changePicture_process.jsp",
                            //                        data: data,
                            //                        success: function (data, textStatus, jqXHR) {
                            //                            if (data.trim() === 'success') {
                            //                                bootbox.alert("Picture is changed");
                            //                                $('#proPic').attr("src", gambarURI);
                            //                                $('#dym').html("");
                            //                                $('#inputFileToLoad').val("");
                            //                                gambarURI = "";
                            //                            } else {
                            //                                bootbox.alert("Fail");
                            //                            }
                            //                        }
                            //                    });
                            //
                            //                });

                            $("#btn_saveChange<%=i%>").click(function () {
                                var Result = $("#Result<%=i%>").val();
                                var Remark = $("#Remark<%=i%>").val();
                                var testDate = $("#testDate<%=i%>").val();
                                var testTime = $("#testTime<%=i%>").val();
                                var performBy = $("#performBy<%=i%>").val();
                                var idResult = $("#idresult<%=i%>").val();
                                
                                //alert(idResult+" "+Result+" "+Remark+" "+testDate+" "+testTime+" "+performBy);
                                $.ajax({
                                    url: "tAssignUpdate.jsp",
                                    type: "post",
                                    data: {
                                        pic:newgambarURI,
                                        idResult: idResult,
                                        Result: Result,
                                        Remark: Remark,
                                        testDate: testDate,
                                        testTime: testTime,
                                        performBy: performBy

                                    },
                                    timeout: 10000,
                                    success: function (data) {
                                        $("#viewTA").load("viewTA.jsp");
                                        $(".modal-backdrop").hide();
                                        $('#inputFileToLoad<%=i%>').val("");
                                        newgambarURI = "";
                                        alert("Result successfully updated");

                                    },
                                    error: function (err) {
                                        alert("Error update!");
                                    }
                                });
                            });

                        });
                    </script>  

                </td>

                <%
                        }
                    }
                %>
            </tr>

        </tbody>
    </table>
