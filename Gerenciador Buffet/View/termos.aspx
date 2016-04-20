<%@ Page Language="C#" AutoEventWireup="true" CodeFile="termos.aspx.cs" Inherits="termos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Buffet</title>
    <link rel="stylesheet" href="../css/bootstrap.css" />
    <link rel="stylesheet" href="../css/Style.css" />
    <script src="../js/bootstrap.js" type="text/javascript"></script>
    <link rel="shortcut icon" href="../img/icon.png" />
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    <div class="center-site">
       <div class="box-termo">
           <div class="box-termo-text">
            <iframe width="100%" height="450" src="termos.pdf"></iframe>
           </div><!--Fim da class box-termo-text-->
           <div class="btn-termo">
               <a href="cadastrardados.aspx" target="_parent"><input class="btn-cadastradados btn-lg btn-success" type="submit" value="Aceitar" /></a>
           </div>
       </div><!--Fim da class box-termo-->
    </div><!--Fim da class center-site-->
</body>
</html>