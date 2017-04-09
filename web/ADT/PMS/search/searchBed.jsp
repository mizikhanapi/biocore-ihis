
<input type="hidden" value="<%=hfc%>" id="Rhfc">

<div class="row">
    <div class="col-md-6">
        <!-- Select Basic -->
        <!-- Select Basic -->
        <div class="form-group">
            <label class="col-md-4 control-label" for="selectbasic">Discipline *</label>
            <div class="col-md-6">
                <input id="Dis" name="Dis" placeholder="Insert Discipline Code" maxlength="30" type="text"  class="form-control input-md">
                <div id="disList" class="search-drop"></div>
            </div>

        </div>


        <!-- Select Basic -->
        <div class="form-group">
            <label class="col-md-4 control-label" for="selectbasic">Ward Name</label>
            <div class="col-md-4">
                <select id="wname" name="selectbasic" class="form-control">
                    <option value="-">-</option>
                    <option value="null" selected="" disabled="">Select Ward Name</option>

                    <%
                        String wname = "select ward_name from wis_ward_name";
                        ArrayList<ArrayList<String>> dataWardName = conn.getData(wname);

                        int size1 = dataWardName.size();

                        for (int i = 0; i < size1; i++) {
                    %>
                    <option value="<%= dataWardName.get(i).get(0)%>"><%= dataWardName.get(i).get(0)%> </option>
                    <%
                        }
                    %>
                </select>
            </div> 
        </div>



        <!-- Select Basic -->
        <div class="form-group">
            <label class="col-md-4 control-label" for="selectbasic">Ward Type</label>
            <div class="col-md-4">
                <select id="WardType" name="WardType" class="form-control">
                    <option value="1" selected="" disabled="">Select Ward Type</option>

                    <%
                        String wtype = "select ward_class_code from wis_ward_name";
                        ArrayList<ArrayList<String>> dataWardType = conn.getData(wtype);

                        int size2 = dataWardType.size();

                        for (int i = 0; i < size2; i++) {
                    %>
                    <option value="<%= dataWardType.get(i).get(0)%>"><%= dataWardType.get(i).get(0)%> </option>
                    <%
                        }
                    %>


                </select>
                <button class="btn btn-primary" type="button" id="searchBed" name="searchBed"><i class="fa fa-search"></i>&nbsp; Search Bed</button>

            </div>
        </div>




    </div>



    <div class="col-md-6">  
        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="textinput">Deposit (RM)</label>
            <div class="col-md-4">
                <input id="Deposit" name="textinput" type="text" placeholder="RM :" class="form-control input-md">
            </div>
        </div>


        <!-- Select Basic -->
        <div class="form-group">
            <label class="col-md-4 control-label" for="selectbasic">Bed ID</label>
            <div class="col-md-4">
                <input id="BedIDReg" name="textinput" type="text" placeholder="Bed ID" readonly class="form-control input-md">
                </br>



            </div>
        </div>

    </div>
</div>


<script>

    $(document).ready(function () {

        $("#Dis").on('keyup', function () { // everytime keyup event
            var input = $(this).val(); // We take the input value
            var hfc = $("#Rhfc").val();
            var createdBy = $("#Rid").val();
            var dis = $("#Rdis").val();
            var sub = $("#Rsub").val();

            if (input.length >= 1) { // Minimum characters = 2 (you can change)
                $('#disList').html('<img src="libraries/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
                var dataFields = {input: input, hfc:hfc, dis: dis, sub : sub}; // We pass input argument in Ajax
                $.ajax({
                    type: "POST",
                    url: "PMS/search/searchDiscipline_1.jsp", // call the php file ajax/tuto-autocomplete.php
                    data: dataFields, // Send dataFields var
                    timeout: 3000,
                    success: function (dataBack) { // If success
                        $('#disList').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                        $('#matchListDis li').on('click', function () { // When click on an element in the list
                            //$('#masterCode2').text($(this).text()); // Update the field with the new element
                            $('#Dis').val($(this).text());
                            $('#disList').text(''); // Clear the <div id="match"></div>
                            var arrayData = $('#Dis').val().split("|");
                            //console.log(arrayData);
                            //console.log(arrayData[0].trim());
                            //console.log(arrayData[1].trim());
                        });
                    },
                    error: function () { // if error
                        $('#disList').text('Problem!');
                    }
                });
            } else {
                $('#disList').text(''); // If less than 2 characters, clear the <div id="match"></div>
            }

        });
    });


</script> 