<%@page import="java.util.ArrayList"%>


<%

//    String DR = "002";
//    
// String role1 = "SELECT  b.USER_ID, b.USER_NAME,a.USER_ID, a.ROLE_CODE, a.HEALTH_FACILITY_CODE, a.DISCIPLINE_CODE FROM adm_user_access_role a LEFT JOIN adm_users b ON a.USER_ID = b.USER_ID where  a.ROLE_CODE = "+DR+" AND a.HEALTH_FACILITY_CODE="+hfc+";";
// String hfc1 = "SELECT  hfc_name, hfc_cd FROM adm_health_facility where  hfc_cd ="+hfc+";";
//
//    
//    ArrayList<ArrayList<String>> dataRole, dataHFC1;
//
//    dataRole = conn.getData(role1);
//    dataHFC1 = conn.getData(hfc1);
    String EliSrc = request.getParameter("EliSrc");
    String EliSource = request.getParameter("EliSource");


%>
<input type="hidden" value="<%=hfc%>" id="Rhfc">
<input type="hidden" value="<%=pageNow%>" id="pageNow">
<input type="hidden" value="<%=EliSrc%>" id="pageNow">
<input type="hidden" value="<%=EliSource%>" id="pageNow">


<div class="row">


    <div class="col-md-6">
        <!-- Select Basic -->
        <!-- Select Basic -->
        <div class="form-group">
            <label class="col-md-4 control-label" for="selectbasic">Discipline *</label>
            <div class="col-md-6">
                <input id="DisWard" name="Dis" placeholder="Insert Discipline Code" maxlength="30" type="text"  class="form-control input-md">
                <input type="hidden" id="dis_cd">
                <div id="disListWard" class="search-drop"></div>
            </div>

        </div>

        <!-- Select Basic -->
        <div class="form-group">
            <label class="col-md-4 control-label" for="selectbasic">Ward Type</label>
            <div class="col-md-6" id="wardTypeList">
                <select id="WardType" name="WardType" class="form-control" disabled="">

                </select>
            </div>
        </div>

        <!-- Select Basic -->
        <div class="form-group">
            <label class="col-md-4 control-label" for="selectbasic">Ward Name</label>
            <div class="col-md-6" id="wardNameDropdown">
                <select id="wname" name="selectbasic" class="form-control" disabled="">


                </select>
            </div>

        </div>
        <div class="form-group">
            <label class="col-md-4 control-label" for="selectbasic"></label>
            <div class="col-md-6" >                
                <button class="btn btn-info" type="button" id="searchBed" name="searchBed"><i class="fa fa-search"></i>&nbsp; Search Bed</button>
            </div>
        </div>
    </div>



    <div class="col-md-6">  
        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="textinput">Deposit (RM)</label>
            <div class="col-md-6" id="depositResult">
                <!--                <input id="Deposit" name="textinput" type="text" placeholder="RM :" class="form-control input-md">-->
            </div>
        </div>


        <!-- Select Basic -->
        <div class="form-group">
            <label class="col-md-4 control-label" for="selectbasic">Bed ID</label>
            <div class="col-md-6">
                <input id="BedIDReg" disabled="" name="textinput" type="text" placeholder="Bed ID" readonly class="form-control input-md">
                </br>
            </div>
        </div>






    </div>
</div>


<script>

    $(document).ready(function () {


        $("#DisWard").on('keyup', function () { // everytime keyup event
            var input = $(this).val(); // We take the input value
            var hfc = $("#Rhfc").val();
            var createdBy = $("#Rid").val();
            var dis = $("#Rdis").val();
            var sub = $("#Rsub").val();

            if (input.length >= 1) { // Minimum characters = 2 (you can change)
                $('#disListWard').html('<img src="libraries/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
                var dataFields = {input: input, hfc: hfc, dis: dis, sub: sub}; // We pass input argument in Ajax
                $.ajax({
                    type: "POST",
                    url: "PMS/search/searchDiscipline.jsp", // call the php file ajax/tuto-autocomplete.php
                    data: dataFields, // Send dataFields var
                    timeout: 3000,
                    success: function (dataBack) { // If success
                        $('#disListWard').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                        $('#matchListDis li').on('click', function () { // When click on an element in the list
                            //$('#masterCode2').text($(this).text()); // Update the field with the new element
                            $('#DisWard').val($(this).text());
                            $('#disListWard').text(''); // Clear the <div id="match"></div>
                            var arrayData = $('#DisWard').val().split("|");
                            var discode = arrayData[0];
                            $('#dis_cd').val(discode);
                            //console.log(arrayData);

                            $.ajax({
                                type: "post",
                                url: "PMS/controller/listWardType.jsp",
                                data: {'Dis': discode},
                                timeout: 10000,
                                success: function (list) {
                                    //remove the loading 
                                    //console.log(list);
                                    $('#wardTypeList').html(list);
                                },
                                error: function (xhr, status, error) {
                                    var err = eval("(" + xhr.responseText + ")");
                                    //bootbox.alert(err.Message);
                                }
                            });
                        });
                    },
                    error: function () { // if error
                        $('#disListWard').text('Problem!');
                    }
                });
            } else {
                $('#disListWard').text(''); // If less than 2 characters, clear the <div id="match"></div>
            }

        });



        //seaching bed function   
        function searchBed() {

            var DisO = $('#Dis').val();
            var wnameO = $('#wname').val();
            var WardTypeO = $('#WardType').val();

            var EliSource = $('#EliSource').val();
            var EliTy = $('#EliTy').val();




            //check if the input text or the select box is empty.

            if (DisO === "-") {

                bootbox.alert('Please select Discipline Code first');
            } else if (wnameO === "-") {

                bootbox.alert('Please select Ward Name first.');
            } else if (WardTypeO === "-") {

                bootbox.alert('Please select Ward Type first.');
            } else {
                //if the select box is choosen and the input in key-in.

                //show loading icon
                $body.addClass("loading");

                //get value from text box and select box
                //var Dis = $('#Dis').val();
                var Diso = $('#dis_cd').val();
                var Dis = Diso;
                var WardType = $('#WardType').val();
                var EliSource = $('#EliSource').val();
                var EliTy = $('#EliTy').val();




                var wnamecode = $('#wname').val();
                var array_dis = wnamecode.split("|");
                var wnamecode = array_dis[0];


                console.log(wnamecode);
            


                // console.log(Dis);
                // console.log(wname);
                // console.log(WardType);

                //run the MAIN ajax function
                $.ajax({
                    async: true,
                    type: "POST",
                    url: "PMS/controller/resultBed.jsp",
                    data: {'Dis': Dis, 'wnamecode': wnamecode, 'WardType': WardType},
                    timeout: 10000,
                    success: function (list) {
                        //remove the loading 
                        $body.removeClass("loading");
                        //console.log(list);
                        var pageNow = $('#pageNow').val();
                        if (pageNow === "PT") {
                            var Diso = $('#dis_cd').val();
                            var wname = $('#wname').val();
                            var WardType = $('#WardType').val();

                            $('#wardnew').val(wname);
                            $('#classnew').val(WardType);
                            //$('#ratenew').val();
                            $('#listbedPT').html(list);
                        } else if (pageNow === "IR") {
                            $('#bedtest').html(list);
                        }

                    },
                    error: function (xhr, status, error) {
                        var err = eval("(" + xhr.responseText + ")");
                        //bootbox.alert(err.Message);
                    }
                });
                $.ajax({
                    async: true,
                    type: "POST",
                    url: "PMS/controller/chargesDeposit.jsp",
                    data: {'Dis': Dis, 'wnamecode': wnamecode, 'WardType': WardType, 'EliSource': EliSource, 'EliTy': EliTy},
                    timeout: 10000,
                    success: function (list) {
                        // console.log(list);
                        $('#depositResult').html(list);

                    },
                    error: function (xhr, status, error) {
                        var err = eval("(" + xhr.responseText + ")");
                        //bootbox.alert(err.Message);
                    }
                });

            }

        }
        ;

        //event on click search button
        $('#searchBed').on('click', function (e) {
            e.preventDefault();
            searchBed();

        });


        //event on click clear buton
        $('#clearSearch').click(function () {

        });
    });

</script> 