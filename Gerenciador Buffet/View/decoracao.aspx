<%@ Page Language="C#" AutoEventWireup="true" CodeFile="decoracao.aspx.cs" Inherits="View_decoracao" %>

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
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link rel="stylesheet" href="../fancybox/source/jquery.fancybox.css?v=2.1.5" type="text/css" media="screen" />
    <script type="text/javascript" src="../fancybox/source/jquery.fancybox.pack.js?v=2.1.5"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".fancybox").fancybox({
                maxWidth: 500,
                maxHeight: 500,
                autoSize : false
            });
        });
    </script>
</head>
<body>
    <form runat="server">
    <div class="center-site">
        <div class="banner">
            <div class="logo">
            </div>
            <!--Fim da class logo-->
        </div>
        <!--Fim da class banner-->

        <div class="menu navbar-default">
            <ul class="nav nav-tabs" role="tablist">
                <li role="presentation"><a href="index.aspx">Home</a></li>
                <li role="presentation"><a href="login.aspx">Login</a></li>
                <li role="presentation"><a href="cadastrar.aspx">Cadastra-se</a></li>
                <li role="presentation"><a href="contatos.aspx">Contatos</a></li>
                <li role="presentation"><a href="decoracao.aspx">Decoração</a></li>
                <li role="presentation"><a href="tipodecomida.aspx">Tipos de Comidas</a></li>
                <li role="presentation"><a href="tipodefesta.aspx">Tipos de Festas</a></li>
            </ul>
        </div>
        <!--Fim da class menu-->

        <div class="conteudo-geral">
            <div class="conteudo-decoracao">
                <a class="fancybox" rel="group" href="../img/04.jpg"><img src="../img/04.jpg" alt=""/></a>
                <a class="fancybox" rel="group" href="../img/05.jpg"><img src="../img/05.jpg" alt=""/></a>
                <a class="fancybox" rel="group" href="../img/06.jpg"><img src="../img/06.jpg" alt=""/></a>
                <a class="fancybox" rel="group" href="../img/07.jpg"><img src="../img/07.jpg" alt=""/></a>
                <a class="fancybox" rel="group" href="../img/08.jpg"><img src="../img/08.jpg" alt=""/></a>
                <br />
                <br />
            </div>
            <!--Fim da class conteudo-decoracao-->
        </div>
        <!--Fim da class conteudo-geral-->

        <div class="rodape navbar-default">
            <p>Copyright © 2015 Sistema de Buffet. Todos os direitos reservados.</p>
            <br />
            <br />
        </div>
        <!--Fim da class rodape-->

    </div>
    <!--Fim da class center-site-->
    </form>
</body>
</html>