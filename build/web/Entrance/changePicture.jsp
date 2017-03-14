<%-- 
    Document   : changePicture
    Created on : Mar 10, 2017, 12:16:05 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
    .loader {
        border: 16px solid #f3f3f3;
        border-radius: 50%;
        border-top: 16px solid skyblue;
        border-bottom: 16px solid skyblue;
        width: 120px;
        height: 120px;
        -webkit-animation: spin 2s linear infinite;
        animation: spin 2s linear infinite;
    }

    @-webkit-keyframes spin {
        0% { -webkit-transform: rotate(0deg); }
        100% { -webkit-transform: rotate(360deg); }
    }

    @keyframes spin {
        0% { transform: rotate(0deg); }
        100% { transform: rotate(360deg); }
    }

    img {
        margin-left: auto;
        margin-right: auto;
        display: block;
    }
</style>
<h4 class="text-center">Profile Picture</h4>
<form class="form-horizontal" autocomplete="off" style="width: 50%; margin: 0 auto">

    <!-- Text input-->
    <div class="form-group">

        <div style="width: 50%; margin: 0 auto">
            <input class="form-control" id="inputFileToLoad" type="file" accept=".jpg, .png, .gif" >

        </div>
    </div>

    <!-- Text input-->
    <div class="form-group">

        <div style="width: 50%; margin: 0 auto">
            <div id="dym">



            </div>

        </div>
    </div>



</form>
<div class="col-md-12">
    <br/>
    <div class="text-center">
        <button id="btnChangePic" class="btn btn-success"><i class="fa fa-floppy-o fa-lg"></i>&nbsp; Change</button>
        <button id="btnClearPic" class="btn btn-default"><i class="fa fa-ban fa-lg"></i>&nbsp; Clear</button>
    </div>
</div>

<script type="text/javascript">

    (function ($) {
        $.fn.checkFileType = function (options) {
            var defaults = {
                allowedExtensions: [],
                success: function () {},
                error: function () {}
            };
            options = $.extend(defaults, options);

            return this.each(function () {

                $(this).on('change', function () {
                    var value = $(this).val(),
                            file = value.toLowerCase(),
                            extension = file.substring(file.lastIndexOf('.') + 1);

                    if ($.inArray(extension, options.allowedExtensions) === -1) {
                        options.error();
                        $(this).focus();
                    } else {
                        options.success();

                    }

                });

            });
        };

    })(jQuery);

    $('#inputFileToLoad').checkFileType({
        allowedExtensions: ['jpg', 'jpeg', 'png', 'gif'],
        success: function () {
            loadImageFileAsURL();
        },
        error: function () {
            bootbox.alert('Incompatible file type');
            $('#inputFileToLoad').val("");
            $('#dym').html("");
            gambarURI = "";
        }
    });


    var gambarURI = "";

    function loadImageFileAsURL()
    {

        var iSize = 0;

        iSize = ($("#inputFileToLoad")[0].files[0].size / 1024);

        var sizeSmall = false;

        if (iSize / 1024 > 1) {
            sizeSmall = false;

        } else {

            iSize = (Math.round(iSize * 100) / 100);

            sizeSmall = iSize <= 45;

        }







        if (sizeSmall) {
            document.getElementById("dym").innerHTML = '<div class="loader"></div>';
            var filesSelected = document.getElementById("inputFileToLoad").files;
            if (filesSelected.length > 0)
            {
                var fileToLoad = filesSelected[0];

                var fileReader = new FileReader();

                fileReader.onload = function (fileLoadedEvent)
                {

                    gambarURI = fileLoadedEvent.target.result;


                    document.getElementById("dym").innerHTML = '<img id="myImage">';

                    document.getElementById("myImage").src = gambarURI;
                };

                fileReader.readAsDataURL(fileToLoad);
            }

        } else {

            bootbox.alert("File size must not exceed 40kb");
            $('#inputFileToLoad').val("");
            gambarURI = "";
            $('#dym').html("");
        }


    }

    $('#btnChangePic').on('click', function () {

        if (gambarURI === "") {
            bootbox.alert("Choose a picture");
            return;
        }

        var data = {pic: gambarURI};

        $.ajax({
            type: 'POST',
            url: "changePicture_process.jsp",
            data: data,
            success: function (data, textStatus, jqXHR) {
                if (data.trim() === 'success') {
                    bootbox.alert("Picture is changed");
                    $('#proPic').attr("src", gambarURI);
                    $('#dym').html("");
                    $('#inputFileToLoad').val("");
                    gambarURI = "";
                } else {
                    bootbox.alert("Fail");
                }
            }
        });

    });

    $('#btnClearPic').on('click', function () {
        $('#dym').html("");
        $('#inputFileToLoad').val("");
        gambarURI = "";
    });

</script>
