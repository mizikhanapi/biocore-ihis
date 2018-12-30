<%-- 
    Document   : stockFootLibrary
    Created on : Mar 10, 2017, 9:09:37 PM
    Author     : Shammugam
--%>
<%@page import="ADM_helper.MySession"%>
<!--<script src="libraries/js/jquery-ui.js" type="text/javascript"></script>-->
<script src="../assets/js/jquery-ui.js" type="text/javascript"></script>
<script src="libraries/js/bootstrap.min.js" type="text/javascript"></script>
<script src="libraries/js/bootbox.min.js" type="text/javascript"></script>
<script src="libraries/js/jquery.dataTables.min.js"></script>
<!--<script src="libraries/js/dataTables.bootstrap.min.js" type="text/javascript"></script>-->
<script src="../assets/datatables.min.js" type="text/javascript"></script>
<!--<script src="libraries/js/dataTables.buttons.min.js" type="text/javascript"></script>-->
<script src="../assets/Buttons-1.5.4/js/buttons.bootstrap.js" type="text/javascript"></script>
<script src="libraries/js/buttons.flash.min.js" type="text/javascript"></script>
<script src="libraries/js/jszip.min.js" type="text/javascript"></script>
<script src="libraries/js/pdfmake.min.js" type="text/javascript"></script>
<script src="libraries/js/vfs_fonts.js" type="text/javascript"></script>
<script src="libraries/js/buttons.html5.min.js" type="text/javascript"></script>
<script src="libraries/js/buttons.print.min.js" type="text/javascript"></script>
<script src="libraries/js/buttons.colVis.min.js" type="text/javascript"></script>
<script src="libraries/js/papaparse.min.js"></script>
<script src="libraries/js/jquery.multi-select.js" type="text/javascript"></script>
<script src="../assets/js/Chart.bundle.js"></script>
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.11.1/build/alertify.min.js"></script>
<script src="../assets/js/buttonActive.js" type="text/javascript"></script>
<script>
    
    function checkNumericOnly(e){
        // Allow: backspace, delete, tab, escape, enter and .
        if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110]) !== -1 ||
             // Allow: Ctrl+A, Command+A
            (e.keyCode === 65 && (e.ctrlKey === true || e.metaKey === true)) || 
             // Allow: home, end, left, right, down, up
            (e.keyCode >= 35 && e.keyCode <= 40)) {
                 // let it happen, don't do anything
                 return;
        }
        // Ensure that it is a number and stop the keypress
        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
            e.preventDefault();
        }
    }

    
    
    
</script>

