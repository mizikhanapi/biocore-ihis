<%-- 
    Document   : searchPatient
    Created on : Feb 6, 2017, 2:53:34 PM
    Author     : shay
--%>

<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

        //Conn conn = new Conn();

     String idTYpe11 = "select * from adm_lookup_detail where master_reference_code = '0012' and hfc_cd='"+hfc+"' ";
    ArrayList<ArrayList<String>> dataIdType12;
    dataIdType12 = conn.getData(idTYpe11);
    String dataSystemStatus155 = session.getAttribute("SYSTEMSTAT").toString();
%>
<div class="thumbnail">
    <form class="form-horizontal" name="myForm" id="myForm">
        <!-- Select Basic -->
        <div class="form-group">
            <label class="col-md-4 control-label" for="selectbasic">ID Type</label>
            <div class="col-md-4">
                <select id="idType" name="idType" class="form-control" required="">
                    <option selected="" disabled="" value="-"> Please select ID type</option>
               
                    <%                                if (dataSystemStatus155.equals("0")) {

                        } else if (dataSystemStatus155.equals("1")) {
                            for (int i = 0; i < dataIdType12.size(); i++) {%>
                    <option value="<%=dataIdType12.get(i).get(1)%>"><%=dataIdType12.get(i).get(2)%></option>
                    <%  }
                        }

                    %>
                </select>
            </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="textinput">IC No. / ID No.</label>
            <div class="col-md-4">
                <input type="text" class="form-control input-md" id="idInput" name="idInput" placeholder="ID" maxlength="0"/>
            </div>
            <button class="btn btn-primary" type="button" id="searchPatientOccu" name="searchPatientOccu"><i class="fa fa-search fa-lg"></i>&nbsp; Search</button>

        </div>

    </form>
</div>

<script>
        
        function searchPatientInWard(){
            var idType = $('#idType').val();
            var idInput = $('#idInput').val();
            var methodSearch = "1";
            
            $.ajax({
               type:"post",
               url:"resultWard.jsp",
               data:{idType:idType,idInput:idInput,methodSearch:methodSearch},
               timeout:10000,
               success:function(databack){
                   
                   $("#WardOccuTable").html(databack);
               },error:function(){
                   
               }
            });
        }
        
        $('#searchPatientOccu').on('click',function(){
            searchPatientInWard();
        });
        //validate max length of input
        $('#idType').on('change', function (e) {
            var id = $('#idType').val();
            console.log(id);
            if (id === "pmino") {
                $('#idInput').attr('maxlength', '13');
                $('#idInput').on('keydown', function (evt) {
                    isNumberKey(evt);
                });
            } else if (id === "icnew") {
                $('#idInput').attr('maxlength', '12');
                $('#idInput').keypress(function (evt) {
                    isNumberKey(evt);
                });
            } else if (id === "icold") {
                $('#idInput').attr('maxlength', '8');
            } else if (id === "004") {
                $('#idInput').attr('maxlength', '10');
            } else if (id === "005") {
                $('#idInput').attr('maxlength', '10');
            }
        });

        //event when press ENTER after inserting the ID
        $("#idInput").on("keydown", function (e) {
            var code = e.keyCode;

            if (code === 13) {
                e.preventDefault();
                searchPatientInWard();

            }
        });

        //event on click clear buton
        $('#clearSearch').click(function () {
            document.getElementById("ward").value = "";
            document.getElementById("bed").value = "";
            document.getElementById("pname").value = "";
            document.getElementById("pidno").value = "";
            document.getElementById("spn").value = "";
//        $('#myForm2')[0].reset();
            $("table tbody").remove();
        });
</script>