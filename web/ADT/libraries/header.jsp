    <%@page import="Config.Config"%>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>eMedica | Login Screen</title>

    <!-- Bootstrap core CSS -->
    <link href="<%=Config.getBase_url(request) %>assets/css/bootstrap.min.css" rel="stylesheet">
	<link href="<%=Config.getBase_url(request) %>assets/css/style.css" rel="stylesheet">
	<link rel="stylesheet" href="<%=Config.getBase_url(request) %>assets/font-awesome/css/font-awesome.min.css">
    <!-- Custom styles for this template -->
    <link href="<%=Config.getBase_url(request) %>assets/css/dashboard.css" rel="stylesheet">
	<link href="<%=Config.getBase_url(request) %>assets/css/Line-tabs.css" rel="stylesheet">
	
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="./Dashboard_files/ie10-viewport-bug-workaround.css" rel="stylesheet">
<!--    <script src="js/jquery.min.js" type="text/javascript"></script>-->
  <style type="text/css">

.panel panel-default-small{
width:250px;
}
.panel-title{
font-size:14px;}
.list-group-item{
width:200px;
}
.fa-chevron-right{
color:#0088cc;}
.list-group-item{
    display:block;
    margin-left:40px;
}
.list-group-item librePanelListGroupItem{
    padding-left:30px;
}
</style>