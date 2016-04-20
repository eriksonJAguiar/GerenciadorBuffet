<%@ Page Language="C#" AutoEventWireup="true" CodeFile="tipodefesta.aspx.cs" Inherits="View_tipodefesta" %>

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
            <div class="conteudo-festa">
                <h3>Casamentos</h3>
                <p>
                    Neste tipo de evento,abordamos temas mais sofisticado, com talheres e copos com requinte, para obter mais sofisticação em seu enlace matrimonial.
                </p>
                <img src="../img/img cas.jpg" />
                <h3>Aniversário</h3>
                <p>
                    Neste tipo de evento, abordamos temas mais infantis ou de carater debutante, visando em uma festa mais atrativa ao público jovem e infantil.
                </p>
                <img src="../img/img aniv.jpg" />
                <h3>Confraternização</h3>
                <p>
                    Neste tipo de evento, abordamos temas mais casuais, de carater rustico para melhor aproveitamento dos convidados em geral.
                </p>
                <img src="../img/img conf.jpg" />
                <br />
                <br />
            </div>
            <!--Fim da class conteudo-festa-->
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
