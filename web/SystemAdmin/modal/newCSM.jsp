<%-- 
    Document   : newCSM
    Created on : 07-Jan-2019, 16:33:41
    Author     : Shay
--%>

<h4 style="padding-top: 30px;padding-bottom: 35px; font-weight: bold">
    <span class="pull-right">
        <button id="MLM_btnAddNew" class="btn btn-primary" data-status="pagado" data-toggle="modal" data-id="1" data-target="#detail" style=" padding-right: 10px;padding-left: 10px;color: white;"><a data-toggle="tooltip" data-placement="top" title="Add Content" id="test"><i class=" fa fa-plus" style=" padding-right: 10px;padding-left: 10px;color: white;"></i></a>Add Content</button>
    </span>
</h4>
<!-- Add Button End -->


<!-- Add Modal Start -->
<div class="modal fade" id="detail" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Add New Content</h3>
            </div>
            <div class="modal-body">
                <div id="lllloading"></div>
                <form class="form-horizontal" id="addForm">
                    
                                    
                    <input type="hidden" id="contentId"/>
                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-3 control-label" for="textinput"> </label>
                                        <div class="col-md-6">
                                            <input id="tajuk" name="tajuk" type="text" placeholder="Title" class="form-control input-md" maxlength="100">
                                        </div>
                                    </div>

                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-3 control-label" for="textinput"> </label>
                                        <div class="col-md-6">
                                            <textarea id="isi" name="isi"  placeholder="Type your content here" class="form-control input-md"></textarea>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3 control-label" for="textinput"> </label>
                                        <div class="col-md-6">
                                            <input class="form-control" id="inputFileToLoad2" type="file" accept=".jpg, .png, .gif">
                                        </div>
                                        
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3 control-label" for="textinput"> </label>
                                        <div class="col-md-6">
                                            <div id="dym2">
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-3 control-label" for="textinput"></label>
                                        <div class="col-md-6">
                                            <input id="tarikh" name="tarikh" type="text" placeholder="dd/mm/yyyy" class="form-control input-md" maxlength="100" readonly="">
                                        </div>
                                    </div>
                                    
                                </form>
                <!-- content goes here -->
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="submit" class="btn btn-primary btn-block btn-lg" role="button" id="btnAdd">Add</button>
                        <button type="submit" class="btn btn-primary btn-block btn-lg" role="button" id="btnUpdate">Update</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="reset" id="btnReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button" >Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
                
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



$('#inputFileToLoad2').checkFileType({
    allowedExtensions: ['jpg', 'jpeg', 'png', 'mp4', 'mkv', 'pdf', 'docx'],
    success: function () {
        loadImageFileAsURL2();
    },
    error: function () {
        alert('Incompatible file type');
        $('#inputFileToLoad2').val("");
        $('#dym2').html("");
        gambarURI2 = "";
    }
});




function loadImageFileAsURL2()
{

    var iSize = 0;

    iSize = ($("#inputFileToLoad2")[0].files[0].size / 1024);
    console.log("iSize: " + iSize);
    console.log("iSize/1024: " + (iSize / 1024));
    var file = $("#inputFileToLoad2").val();
    ext = file.split('.').pop();
//        getBase64(file);
    var sizeSmall = false;

    if (iSize / 1024 > 1) {
        sizeSmall = false;

    } else {

        iSize = (Math.round(iSize * 100) / 100);

        sizeSmall = iSize <= 65535;

    }



    if (sizeSmall) {
        document.getElementById("dym2").innerHTML = '<div class="loader"></div>';
        var filesSelected = document.getElementById("inputFileToLoad2").files;
        if (filesSelected.length > 0)
        {
            var fileToLoad = filesSelected[0];

            var fileReader = new FileReader();

            fileReader.onload = function (fileLoadedEvent)
            {

                gambarURI2 = fileLoadedEvent.target.result;



                document.getElementById("dym2").innerHTML = '<img id="myImage2" class="img-responsive" width="300" height="300" />';

                document.getElementById("myImage2").src = gambarURI2;
            };

            fileReader.readAsDataURL(fileToLoad);
        }

    } else {

        alert("File size must not exceed 100kb");
        $('#inputFileToLoad2').val("");
        gambarURI2 = "";
        $('#dym2').html("");
    }
}



</script>

