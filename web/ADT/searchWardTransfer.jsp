<%-- 
  Document   : searchPatient
  Created on : Feb 6, 2017, 2:53:34 PM
  Author     : shay
--%>

<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="thumbnail">

    <form class="form-horizontal" name="wardForm" id="wardForm">
        <!-- Select Basic -->
        <div class="form-group">
            <label class="col-md-4 control-label" for="selectbasic">Ward Name</label>
            <div class="col-md-4">
                <select id="idWard" name="idWard" class="form-control" required="">
                    <option selected="" disabled="" value="-"> Please select Ward Name</option>

                    <%
                                             Conn conn = new Conn();
   String wname1 = "SELECT  ward_name FROM wis_ward_name";
                                            ArrayList<ArrayList<String>> dataWname25 = conn.getData(wname1);

                                            int size4 = dataWname25.size();

                                            for (int i = 0; i < size4; i++) {
                                        %>
                                        <option value="<%= dataWname25.get(i).get(0)%>"><%= dataWname25.get(i).get(0)%> </option>
                                        <%
                                            }
                                        %>
                </select>
            </div>
            <button class="btn btn-primary" type="button" id="search_ward" name="searchWard"><i class="fa fa-search fa-lg"></i>&nbsp; Search</button>

        </div>


    </form>
</div>
                
    
<script src="old/assets/js/WardMain.js" type="text/javascript"></script>
<script src="old/assets/js/onKeyPress.js" type="text/javascript"></script>
<script>
    //validate max length of input
    $('#idWard').on('change', function (e) {
        var id = $('#idWard').val();
        console.log(id);
      
    });
    //seaching patient function   
    function searchWard() {

        var opt = $('#idWard option[disabled]:selected').val();
        $('#wardForm')[0].reset();
//        $('#formPMI')[0].reset();
//        $('#kinform')[0].reset();
//        $('#empform')[0].reset();
//        $('#famForm')[0].reset();
//        $('#formMed')[0].reset();
//        $("table tbody").remove();

        //check if the input text or the select box is empty.

      
            //if the select box is choosen and the input in key-in.

            //show loading icon
            $body.addClass("loading");

            //get value from text box and select box
            var idWard = $('#idWard').find(":selected").val();

            //run the MAIN ajax function
            $.ajax({
                async: true,
                type: "POST",
                url: "resultWard.jsp",
                data: {'idWard': idWard},
                timeout: 10000,
                success: function (list) {
                    //remove the loading 
                    $body.removeClass("loading");
                    console.log(list);
                    //show console the returned data


                    //split the data into an array
                    var array_data = String(list).split("|");

                    //function when the value that returned either empty/null or has value.
                    //customize this part only
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////           
                    Main(array_data);

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////                    
                },
                error: function (xhr, status, error) {
                    var err = eval("(" + xhr.responseText + ")");
                    bootbox.alert(err.Message);
                }
            });
        

    }
    ;

    //event on click search button
    $('#searchWard').on('click', function () {
        //console.log("lalu sini");
        searchWard();
        //console.log(" sudah lalu sini");
    });

 

    //event on click clear buton
    $('#clearSearch').click(function () {
        $('#myForm2')[0].reset();
        $("table tbody").remove();
    });
</script>